import React, { useEffect, useState } from "react";
import {
  Box,
  Paper,
  Typography,
  CircularProgress,
  Button,
  Select,
  MenuItem,
  FormControl,
  InputLabel,
  useMediaQuery,
  Skeleton,
} from "@mui/material";
import { Line } from "react-chartjs-2";
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
} from "chart.js";
import { useTranslation } from "react-i18next";
import {
  getMonthlyPointsReport,
  getWeeklyPointsReport,
  getYearlyPointsReport,
} from "../../queries/report/reportQueries";
import { useTheme } from "@mui/material/styles";

// Đăng ký các scale và các thành phần cần thiết
ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend);

const Report = () => {
  const { t } = useTranslation();
  const theme = useTheme();
  const isMobile = useMediaQuery(theme.breakpoints.down("sm")); // Kiểm tra màn hình nhỏ
  const [loading, setLoading] = useState(true);
  const [reportData, setReportData] = useState(null);
  const [error, setError] = useState(null);
  const [timeFrame, setTimeFrame] = useState("monthly");

  useEffect(() => {
    const fetchData = async () => {
      setLoading(true);
      setError(null);
      try {
        let data;
        if (timeFrame === "monthly") {
          data = await getMonthlyPointsReport();
        } else if (timeFrame === "weekly") {
          data = await getWeeklyPointsReport();
        } else {
          data = await getYearlyPointsReport();
        }
        setReportData(data.reportData);
      } catch (err) {
        setError("Có lỗi xảy ra khi tải dữ liệu.");
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [timeFrame]);

  const chartData = {
    labels: reportData ? Object.keys(reportData) : [],
    datasets: [
      {
        label: t("Điểm Nhận Được"),
        data: reportData ? Object.values(reportData).map(item => item["Points Earned"]) : [],
        fill: false,
        borderColor: "rgba(75, 192, 192, 1)",
        tension: 0.1,
      },
      {
        label: t("Điểm Sử Dụng"),
        data: reportData ? Object.values(reportData).map(item => item["Points Used"]) : [],
        fill: false,
        borderColor: "rgba(255, 99, 132, 1)",
        tension: 0.1,
      },
    ],
  };

  return (
    <Box p={3} bgcolor="background.default" color="text.primary">
      <Paper elevation={3} sx={{ padding: isMobile ? 2 : 3, marginBottom: 2 }}>
        <Typography variant={isMobile ? "h5" : "h4"} fontWeight="bold" marginBottom={2}>
          {t("Báo Cáo Điểm Xu")}
        </Typography>
        {loading ? (
          <Box display="flex" justifyContent="center" alignItems="center">
            <Skeleton variant="rectangular" width="100%" height={300} />
          </Box>
        ) : error ? (
          <Typography color="error">{error}</Typography>
        ) : (
          <Box>
            <Line data={chartData} />
            <Box mt={2} display="flex" justifyContent="space-between" alignItems="center" flexDirection={isMobile ? "column" : "row"}>
              <FormControl variant="outlined" sx={{ minWidth: 120, mb: isMobile ? 2 : 0 }}>
                <InputLabel id="time-frame-select-label">{t("Chọn Thời Gian")}</InputLabel>
                <Select
                  labelId="time-frame-select-label"
                  value={timeFrame}
                  onChange={(e) => setTimeFrame(e.target.value)}
                  label={t("Chọn Thời Gian")}
                >
                  <MenuItem value="weekly">{t("Báo Cáo Theo Tuần")}</MenuItem>
                  <MenuItem value="monthly">{t("Báo Cáo Theo Tháng")}</MenuItem>
                  <MenuItem value="yearly">{t("Báo Cáo Theo Năm")}</MenuItem>
                </Select>
              </FormControl>
              <Button
                variant="contained"
                color="primary"
                onClick={() => window.history.back()}
                sx={{
                  padding: isMobile ? "8px 16px" : "10px 20px",
                  fontSize: isMobile ? "14px" : "16px",
                  fontWeight: "bold",
                  borderRadius: "8px",
                }}
              >
                {t("Quay Lại")}
              </Button>
            </Box>
          </Box>
        )}
      </Paper>
    </Box>
  );
};

export default Report;
