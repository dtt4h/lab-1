import axios from "axios";

// URL бекенда можно передать через переменную окружения или прописать явно
export default axios.create({
  baseURL: import.meta.env.VITE_API_URL || "http://localhost:3001",
});
