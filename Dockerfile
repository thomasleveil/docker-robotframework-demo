FROM python:2
RUN pip install robotframework
	
RUN git clone https://bitbucket.org/robotframework/robotdemo.git /demo

VOLUME /reports
WORKDIR /demo
CMD ["pybot", "--name", "Robot", "--loglevel", "DEBUG", "--outputdir", "/reports", "*.txt"]