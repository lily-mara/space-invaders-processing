all :
	/home/nate/Downloads/processing/processing-2.2.1/processing-java --force --run --sketch=$(shell pwd)/space_invaders --output=bin
	rm -rf bin
