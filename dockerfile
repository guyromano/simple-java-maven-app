FROM maven:latest AS maven

COPY . .

RUN mvn clean install

FROM openjdk:23-slim-bullseye AS run

ARG VERSION
ENV TARGET=/my-app-$VERSION.jar

COPY --from=maven /target/ .
CMD java -jar $TARGET



