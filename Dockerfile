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

FROM opendevorg/python-builder as builder
COPY . /tmp/src
RUN assemble

FROM opendevorg/python-base as lodgeit
COPY --from=builder /output/ /output
RUN /output/install-from-bindep

USER nobody
EXPOSE 9000
ENV LODGEIT_DBURI sqlite:////tmp/lodgeit.db
ENV LODGEIT_SECRET_KEY changeMe
CMD ["uwsgi", "--master", \
              "--processes", "4", \
              "--http-socket", "0.0.0.0:9000", \
              "--wsgi-file", "/usr/local/bin/lodgeit-wsgi"]
