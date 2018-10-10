#Sample migration from null CE repo to target EE using multistages

FROM private/CE-repo/dockerimage  AS build-ce 

WORKDIR /app 
ADD . /app
RUN cd /aap && go build -o goapp

FROM  private/EE-DTR/newDockerimage 
WORKDIR /app
COPY --from=build-ce /app/goapp /app

EXPOSE 8080
ENTRYPOINT ./goapp