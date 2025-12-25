package com.ticketbooking.config;

import com.ticketbooking.jwt.JwtAuthFilter;
import com.ticketbooking.service.UserService;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.logout.LogoutHandler;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.i18n.LocaleChangeInterceptor;

import java.util.List;

@Configuration
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled = true, securedEnabled = true, jsr250Enabled = true)
@RequiredArgsConstructor
public class SecurityConfig {

    private final JwtAuthFilter jwtAuthFilter;
    private final UserService userService;
    private final LogoutHandler logoutHandler;
    private final PasswordEncoder passwordEncoder;

    @Bean
    UserDetailsService userDetailsService() {
        return username -> {
            try {
                return userService.findByUsername(username);
            } catch (Exception ex) {
                // Spring Security expects UsernameNotFoundException for missing users.
                // Avoid leaking internal exceptions from auth filter chain.
                throw new UsernameNotFoundException("User not found: " + username, ex);
            }
        };
    }

    // CORS Configuration
    @Bean
    WebMvcConfigurer webMvcConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/api/v1/**")
                        .allowedHeaders("*")
                        .allowedOrigins(
                                "http://103.77.240.219:3000",
                                "http://103.77.240.219",
                                "http://103.77.240.219:3001",
                                "http://103.77.240.219:8080",
                                "http://localhost:8080",
                                "http://localhost:3000",
                                "http://localhost:3001",
                                "http://admin.chauhuydien.id.vn",
                                "http://chauhuydien.id.vn"
                        )
                        .allowedMethods("*");
            }

            public void addResourceHandlers(ResourceHandlerRegistry registry) {
                registry.addResourceHandler("uploads/**")
                        .addResourceLocations("file:uploads/");
            }

            // Locale Change Interceptor for internationalization
            @Override
            public void addInterceptors(InterceptorRegistry registry) {
                LocaleChangeInterceptor localeChangeInterceptor = new LocaleChangeInterceptor();
                localeChangeInterceptor.setParamName("lang");  // Parameter to switch language
                localeChangeInterceptor.setIgnoreInvalidLocale(true);
                registry.addInterceptor(localeChangeInterceptor);
            }
        };
    }

    // Configure CORS for Spring Security
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        CorsConfiguration configuration = new CorsConfiguration();
        configuration.setAllowedOrigins(List.of(
                "http://103.77.240.219:3000",
                "http://103.77.240.219",
                "http://103.77.240.219:8080",
                "http://103.77.240.219:3001",
                "http://localhost:3000",
                "http://localhost:8080",
                "http://localhost:3001",
                "http://chauhuydien.id.vn",
                "http://admin.chauhuydien.id.vn"
        ));
        configuration.setAllowedMethods(List.of("GET", "POST", "PUT", "DELETE", "OPTIONS", "PATCH"));
        configuration.setAllowedHeaders(List.of("*"));
        configuration.setAllowCredentials(true); // Set this to true if you need credentials like cookies or JWT

        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/api/v1/**", configuration);
        return source;
    }

    // Security Filter Chain
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
                .cors(cors -> cors.configurationSource(corsConfigurationSource())) // Enable CORS using the defined configuration
                .csrf(csrf -> csrf.disable()) // Disable CSRF for API
                .authorizeHttpRequests(authz -> authz
                        .requestMatchers(HttpMethod.OPTIONS, "/**").permitAll() // Allow OPTIONS request for CORS pre-flight
                .requestMatchers("/error").permitAll()
                        .requestMatchers(
                                "/api/v1/auth/**",
                                "/api/v1/provinces/**",
                                "/api/v1/bookings/**",
                                "/api/v1/trips/**",
                                "/api/v1/language/**",
                                "/api/v1/vnpay/**",
                                "/api/v1/locations/**"
                        ).permitAll()
                        .requestMatchers("/api/v1/trips/recommend").permitAll()// Public API endpoints
                        .requestMatchers("/api/v1/notifications/**").authenticated()
                        .requestMatchers("/swagger-ui/**", "/v3/api-docs/**").permitAll() // Swagger and API documentation
                        .anyRequest().authenticated() // All other requests require authentication
                )
                .sessionManagement(ssm -> ssm
                        .sessionCreationPolicy(SessionCreationPolicy.STATELESS) // No session management, API is stateless
                )
                .authenticationProvider(authenticationProvider()) // Use custom authentication provider
                .addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class) // Add JWT filter before username/password authentication
                .logout(logout -> logout
                        .logoutUrl("/api/v1/auth/logout")
                        .permitAll()
                        .addLogoutHandler(logoutHandler)
                        .logoutSuccessHandler((request, response, authentication) -> {
                            SecurityContextHolder.clearContext();
                            response.setStatus(HttpServletResponse.SC_OK);
                            response.setHeader("Access-Control-Allow-Origin", "*");
                        })
                );
        return http.build();
    }

    // Authentication Provider with Password Encoder
    @Bean
    public AuthenticationProvider authenticationProvider() {
        DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
        daoAuthenticationProvider.setUserDetailsService(userDetailsService());
        daoAuthenticationProvider.setPasswordEncoder(passwordEncoder);
        return daoAuthenticationProvider;
    }

    // Authentication Manager Bean
    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authConfig) throws Exception {
        return authConfig.getAuthenticationManager();
    }
}
