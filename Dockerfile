FROM ghcr.io/ecofighter/uplatex-container:latest

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]