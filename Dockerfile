#Sample migration from null CE repo to target EE using multistages

FROM private/CE-repo/dockerimage:1.0  AS build-ce 
WORKDIR /app 
COPY . /app
WORKDIR /app
RUN go build -o goapp

FROM  private/EE-DTR/newDockerimage:1.0
WORKDIR /app
COPY --from=build-ce /app/goapp /app

EXPOSE 8080
ENTRYPOINT ["go run, ./goapp"]
