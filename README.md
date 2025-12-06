# Minio Object Browser (Uncooked)

MinIO has really done a number on its own reputation. Month after month they’ve chipped away at the open-source stack, pushing everyone toward overpriced enterprise licences with almost no transparency. Long-term contributors didn’t get so much as a discount or a straight answer. It’s been a slow, steady withdrawal of goodwill from the very community that built them up.

At this point, anyone still using MinIO should start lining up alternatives — the way they’ve treated open source makes it clear they’re not interested in looking after the people who supported them. If you're stuck using Minio due to logistical reasons, I sincerely feel sorry for you.


## Docker Image

```SH
# If you have any respect for yourself or the open-source community, find an alternative to Minio.
docker pull eithan1231/minio-object-browser:latest
```

## Environment variables

- `CONSOLE_MINIO_SERVER`: Your minio cluster/instance
- `CONSOLE_SUBNET_PROXY`
- `CONSOLE_MINIO_REGION`
- `CONSOLE_HOSTNAME`
- `CONSOLE_PORT`
- `CONSOLE_TLS_PORT`
- `CONSOLE_SECURE_ALLOWED_HOSTS`
- `CONSOLE_SECURE_ALLOWED_HOSTS_ARE_REGEX`
- `CONSOLE_SECURE_FRAME_DENY`
- `CONSOLE_SECURE_CONTENT_TYPE_NO_SNIFF`
- `CONSOLE_SECURE_BROWSER_XSS_FILTER`
- `CONSOLE_SECURE_CONTENT_SECURITY_POLICY`
- `CONSOLE_SECURE_CONTENT_SECURITY_POLICY_REPORT_ONLY`
- `CONSOLE_SECURE_HOSTS_PROXY_HEADERS`
- `CONSOLE_SECURE_STS_SECONDS`
- `CONSOLE_SECURE_STS_INCLUDE_SUB_DOMAINS`
- `CONSOLE_SECURE_STS_PRELOAD`
- `CONSOLE_SECURE_TLS_REDIRECT`
- `CONSOLE_SECURE_TLS_HOST`
- `CONSOLE_SECURE_TLS_TEMPORARY_REDIRECT`
- `CONSOLE_SECURE_FORCE_STS_HEADER`
- `CONSOLE_SECURE_PUBLIC_KEY`
- `CONSOLE_SECURE_REFERRER_POLICY`
- `CONSOLE_SECURE_FEATURE_POLICY`
- `CONSOLE_SECURE_EXPECT_CT_HEADER`
- `CONSOLE_PROMETHEUS_URL`
- `CONSOLE_PROMETHEUS_AUTH_TOKEN`
- `CONSOLE_PROMETHEUS_JOB_ID`
- `CONSOLE_PROMETHEUS_EXTRA_LABELS`
- `CONSOLE_LOG_QUERY_URL`
- `CONSOLE_LOG_QUERY_AUTH_TOKEN`
- `CONSOLE_MAX_CONCURRENT_UPLOADS`
- `CONSOLE_MAX_CONCURRENT_DOWNLOADS`
- `CONSOLE_DEV_MODE`
- `CONSOLE_ANIMATED_LOGIN`
- `CONSOLE_BROWSER_REDIRECT_URL`
- `LOGSEARCH_QUERY_AUTH_TOKEN`

## Docker Compose

```YAML
networks:
  network-minio:
    driver: bridge

services:
  # FIND AN ALTERNATIVE. MINIO IS NO LONGER AN OPENSOURCE COMPANY. YOU LIKELY WILL NOT RECEIVE SECURITY PATCHES.
  minio-server:
    image: quay.io/minio/minio:RELEASE.2025-05-24T17-08-30Z
    container_name: minio-server
    restart: always
    environment:
      - MINIO_ROOT_USER=admin
      - MINIO_ROOT_PASSWORD=Password1!
    ports:
      - "9000:9000"
    volumes:
      - ./data/minio:/data
    networks:
      - network-minio
    command: server /data

  minio-console:
    image: eithan1231/minio-object-browser:latest
    container_name: minio-console
    restart: always
    environment:
      - CONSOLE_MINIO_SERVER=http://minio-server:9000/
    ports:
      - "9001:9090"
    networks:
      - network-minio
```

## Contributing

Do not contribute to this Repo. Minio does not deserve anyone in the open source community maintaining their garbage software.
