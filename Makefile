compiler=processing-java

all :
	$(compiler) --force --run --sketch=$(shell pwd)/space_invaders --output=bin

clean :
	rm -rf bin
