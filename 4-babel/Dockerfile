FROM --platform=linux/amd64 busybox AS amd64
FROM --platform=linux/arm64 busybox AS arm64
FROM --platform=linux/arm/v7 busybox AS arm32
FROM --platform=linux/386 busybox AS ia32
FROM alpine
RUN apk add file
WORKDIR /root
COPY --from=amd64 /bin/busybox /root/amd64/busybox
COPY --from=arm64 /bin/busybox /root/arm64/busybox
COPY --from=arm32 /bin/busybox /root/arm32/busybox
COPY --from=ia32 /bin/busybox /root/ia32/busybox
CMD for A in *; do echo "$A => $($A/busybox uname -a)"; done
