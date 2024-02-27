FROM alpine:3.15.0
RUN apk add --no-cache openssl curl py3-pip gettext git docker jq bash > /dev/null
RUN pip install awscli > /dev/null
RUN curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
RUN install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
RUN curl https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | sh
RUN helm plugin install https://github.com/databus23/helm-diff
