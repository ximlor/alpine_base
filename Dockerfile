FROM alpine:3.8

RUN echo "http://mirrors.aliyun.com/alpine/$(cat /etc/alpine-release | awk -F. {'printf "v%s.%s",$1,$2'})/main/" > /etc/apk/repositories

RUN apk update \
    && apk add ca-certificates \
    && apk add tzdata \
    && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone
