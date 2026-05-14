# Этап 1: Сборка React приложения
FROM node:20-alpine AS builder

WORKDIR /app

# Копируем package.json и устанавливаем зависимости
COPY package*.json ./
RUN npm ci

# Копируем весь проект и собираем
COPY . .
RUN npm run build

# Этап 2: Prod-образ с Nginx
FROM nginx:alpine

# Копируем собранное приложение и конфиг Nginx
COPY --from=builder /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
