# Copyright (c) 2020 VEXXHOST, Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
# implied.
# See the License for the specific language governing permissions and
# limitations under the License.

FROM opendevorg/python-builder:3.8 as builder
COPY . /tmp/src
RUN assemble

FROM opendevorg/uwsgi-base:3.8 as lodgeit
COPY --from=builder /output/ /output
RUN /output/install-from-bindep

# Install mariadb connector for use by sqlalchmey if desired
RUN apt-get update \
  && apt-get install -y libmariadb3 libmariadb-dev \
  && pip install mariadb \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 9000
ENV LODGEIT_DBURI sqlite:////tmp/lodgeit.db
ENV LODGEIT_SECRET_KEY changeMe
ENV UWSGI_HTTP_SOCKET=:9000 UWSGI_WSGI_FILE=/usr/local/bin/lodgeit-wsgi
