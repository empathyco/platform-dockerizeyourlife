FROM golang:1.7.3
WORKDIR /go/src/github.com/empathy/dockerize/
COPY . .
RUN go get
RUN go test
RUN go get -d -v golang.org/x/net/html \
  && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

CMD ["/go/src/github.com/empathy/dockerize/app"]
