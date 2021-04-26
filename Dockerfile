FROM rmkn/centos7
LABEL maintainer "rmkn"

RUN yum -y install iproute bind-utils yum-plugin-priorities

WORKDIR /etc/yum.repos.d/
RUN curl -O https://repo.powerdns.com/repo-files/centos-auth-44.repo
RUN yum -y install pdns pdns-backend-sqlite

COPY entrypoint.sh /
COPY init.sh /tmp/
RUN /tmp/init.sh

EXPOSE 53 53/udp

CMD ["/usr/sbin/pdns_server"]

ENTRYPOINT ["/entrypoint.sh"]

