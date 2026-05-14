import axios from "axios";

export default axios.create({
  baseURL: "http://backend:3001",
});
