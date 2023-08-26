FROM golang:alpine as build

RUN apk add bash

WORKDIR /app
COPY . .
RUN ls -la

RUN TF_DEV=1 ./scripts/build.sh


FROM scratch as runtime

COPY --from=build /app/bin/terraform /bin/terraform

ENTRYPOINT ["terraform"]
