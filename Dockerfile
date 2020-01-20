FROM docker.pkg.github.com/bdldev/build_environment/build_environment:master AS builder
ENV repo=https://github.com/BDLDev/bdlauncher.git
ENV bds_version=1.14.1.4
ARG bdl_lang=EN
ADD ./build.sh .
RUN bash ./build.sh

FROM scratch
COPY --from=builder /build /
