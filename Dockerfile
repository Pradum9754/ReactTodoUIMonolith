# Stage-1

FROM node AS build
WORKDIR /todo
COPY . .
RUN npm install && npm run build

# Stage-2

FROM nginx:alpine
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /todo/build /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
