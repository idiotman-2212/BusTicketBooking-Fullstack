package com.ticketbooking.repo;

import com.ticketbooking.model.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Predicate;
import jakarta.persistence.criteria.Root;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
@RequiredArgsConstructor
public class UtilRepo {

    private final EntityManager em;

    public <T> List<T> checkDuplicateByStringField(Class<T> objectClass, String mode, String idFieldName,
                                                   Object id, String field, String value) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<T> cq = cb.createQuery(objectClass);
        Root<T> root = cq.from(objectClass);

        List<Predicate> predicates = new ArrayList<>();

        if (mode.equalsIgnoreCase("ADD")) {
            predicates.add(cb.equal(root.get(field), value));
        } else {
            // mode == EDIT
            // find other object with duplicate field value
            predicates.add(cb.notEqual(root.get(idFieldName), id));
            predicates.add(cb.equal(root.get(field), value));
        }

        Predicate andPredicate = cb.and(predicates.toArray(new Predicate[0]));
        cq.select(root).where(andPredicate);

        TypedQuery<T> objectTypedQuery = em.createQuery(cq);
        return objectTypedQuery.getResultList();
    }
}
