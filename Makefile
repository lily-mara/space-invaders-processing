compiler=/home/nate/Downloads/processing/processing-2.2.1/processing-java

all :
	$(compiler) --force --run --sketch=$(shell pwd)/space_invaders --output=bin

clean :
	rm -rf bin
