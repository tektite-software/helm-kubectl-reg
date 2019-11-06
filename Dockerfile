# Stage for building Go binaries
FROM golang:1.13.4-alpine3.10 AS gobuilder
RUN apk update
RUN apk add git
RUN go get github.com/genuinetools/reg

# Runner Stage with Kubectl and Helm
FROM dtzar/helm-kubectl AS runner
COPY --from=gobuilder /go/bin/reg /bin/
CMD bash
