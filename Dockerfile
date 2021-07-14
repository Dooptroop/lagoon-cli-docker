FROM ubuntu as builder

WORKDIR /bin

RUN  apt-get update -y && apt-get install openssh-client -y

FROM amazeeio/lagoon-cli

WORKDIR /

COPY --from=builder /bin/ssh /bin/ssh
COPY --from=builder /bin/ssh-add /bin/ssh-add
COPY --from=builder /bin/ssh-agent /bin/ssh-agent
COPY --from=builder /bin/ssh-argv0 /bin/ssh-argv0
COPY --from=builder /bin/ssh-copy-id /bin/ssh-copy-id
COPY --from=builder /bin/ssh-keygen /bin/ssh-keygen
COPY --from=builder /bin/ssh-keyscan /bin/ssh-keyscan

ENTRYPOINT ["/"]