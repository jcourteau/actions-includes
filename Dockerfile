FROM python:slim-buster

# Update and install the python3-yaml package.
RUN \
	apt update -qq \
	&& apt-get -y install git

RUN \
	python --version \
	&& pip --version

# Install the actions-includes tool
COPY . /action-includes
RUN \
	cd /action-includes \
	&& pip install . --progress-bar off

# Check the installed actions-includes tool
RUN \
	cd /action-includes \
	&& python -m actions_includes tests/workflows/local.yml -


ENTRYPOINT ["python3", "-m", "actions_includes.check"]
CMD ["--help"]
