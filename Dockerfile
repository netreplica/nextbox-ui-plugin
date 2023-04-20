ARG FROM_IMAGE=netboxcommunity/netbox
ARG FROM_TAG=v3.4-2.4.0
ARG FROM=${FROM_IMAGE}:${FROM_TAG}
FROM ${FROM}

ENV VIRTUAL_ENV=/opt/netbox/venv
ENV PATH="$VIRTUAL_ENV/bin:$PATH"
COPY ./nextbox_ui_plugin /source/nextbox-ui-plugin/nextbox_ui_plugin/
COPY ./setup.py /source/nextbox-ui-plugin/
COPY ./MANIFEST.in /source/nextbox-ui-plugin/
COPY ./README.md /source/nextbox-ui-plugin/
COPY --chown=1000:1000 --chmod=644 ./nextbox_ui_plugin/static/nextbox_ui_plugin /opt/netbox/netbox/static/nextbox_ui_plugin
RUN pip3 install --no-cache-dir nextbox-ui-plugin
