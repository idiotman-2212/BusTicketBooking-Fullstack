import React, { useEffect, useState, useMemo } from "react";
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
import ChartDataLabels from "chartjs-plugin-datalabels";
import { useTranslation } from "react-i18next";
import {
  getMonthlyPointsReport,
  getWeeklyPointsReport,
  getYearlyPointsReport,
} from "../../queries/report/reportQueries";
import { useTheme } from "@mui/material/styles";

// Đăng ký các scale, plugin và thành phần cần thiết
ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend, ChartDataLabels);

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
        setError(t("Có lỗi xảy ra khi tải dữ liệu."));
      } finally {
        setLoading(false);
      }
    };

    fetchData();
  }, [timeFrame, t]);

  const chartData = useMemo(() => ({
    labels: reportData ? Object.keys(reportData) : [],
    datasets: [
      {
        label: t("Điểm Nhận Được"),
        data: reportData ? Object.values(reportData).map((item) => item["Points Earned"]) : [],
        fill: false,
        borderColor: "rgba(54, 162, 235, 1)", // Màu xanh lam
        backgroundColor: "rgba(54, 162, 235, 0.2)", // Màu nền xanh lam nhạt
        pointBackgroundColor: "rgba(54, 162, 235, 1)", // Màu của các điểm
        pointBorderColor: "#fff",
        pointRadius: 6, // Tăng kích thước điểm
        borderWidth: 3, // Tăng độ dày đường
        tension: 0.4, // Làm đường cong nhẹ
      },
      {
        label: t("Điểm Sử Dụng"),
        data: reportData ? Object.values(reportData).map((item) => item["Points Used"]) : [],
        fill: false,
        borderColor: "rgba(255, 99, 132, 1)", // Màu đỏ
        backgroundColor: "rgba(255, 99, 132, 0.2)", // Màu nền đỏ nhạt
        pointBackgroundColor: "rgba(255, 99, 132, 1)", // Màu của các điểm
        pointBorderColor: "#fff",
        pointRadius: 6,
        borderWidth: 3,
        tension: 0.4,
      },
    ],
  }), [reportData, t]);

  const chartOptions = {
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
      legend: {
        position: "top",
        labels: {
          font: {
            size: 14,
            family: "Arial, sans-serif",
          },
        },
      },
      tooltip: {
        callbacks: {
          afterBody: (tooltipItems) => {
            const earned = tooltipItems[0]?.raw || 0;
            const used = tooltipItems[1]?.raw || 0;
            const difference = earned - used;
            return `${t("Chênh Lệch")}: ${difference}`;
          },
        },
      },
      datalabels: {
        display: true,
        align: "top",
        color: "black",
        font: {
          size: 12,
        },
      },
    },
    scales: {
      x: {
        grid: {
          display: false,
        },
        title: {
          display: true,
          text: t("Thời Gian"),
          font: {
            size: 16,
            family: "Arial, sans-serif",
          },
        },
      },
      y: {
        grid: {
          color: "rgba(200, 200, 200, 0.2)",
        },
        title: {
          display: true,
          text: t("Điểm"),
          font: {
            size: 16,
            family: "Arial, sans-serif",
          },
        },
        ticks: {
          beginAtZero: true,
        },
      },
    },
  };

  return (
    <Box p={3} bgcolor="background.default" color="text.primary">
      <Paper elevation={3} sx={{ padding: isMobile ? 2 : 3, marginBottom: 2 }}>
        <Typography variant={isMobile ? "h5" : "h4"} fontWeight="bold" marginBottom={2}>
          {t("Báo Cáo Điểm Xu")}
        </Typography>
        {loading ? (
          <Box display="flex" flexDirection="column" alignItems="center">
            <CircularProgress />
            <Typography mt={2}>{t("Đang tải dữ liệu...")}</Typography>
          </Box>
        ) : error ? (
          <Box textAlign="center">
            <Typography color="error" marginBottom={2}>{error}</Typography>
            <Button variant="contained" color="primary" onClick={() => window.location.reload()}>
              {t("Thử Lại")}
            </Button>
          </Box>
        ) : (
          <Box>
            <Box height={isMobile ? 300 : 400}>
              <Line data={chartData} options={chartOptions} />
            </Box>
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
