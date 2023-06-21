FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

# copy a file from another phase
# then specify what phase is that, in this case, the builder phase up
# then specify where to copy the file inside the nginx that we are putting together
# some comment
COPY --from=builder /app/build /usr/share/nginx/html