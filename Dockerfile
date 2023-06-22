FROM node:16-alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx

# nothing to do with the developers based on my understanding...
EXPOSE 80
# copy a file from another phase
# then specify what phase is that, in this case, the builder phase up
# then specify where to copy the file inside the nginx that we are putting together
# some comment
# some small changes
COPY --from=builder /app/build /usr/share/nginx/html