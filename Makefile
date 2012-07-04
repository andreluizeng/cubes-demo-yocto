APPNAME			= cubes_demo
SRCDIR			= src
CD			= cd
MAKE			= make

all: $(APPNAME)

$(APPNAME): 
	$(MAKE) -C src

install:
	$(MAKE) -C src install

clean:
	$(MAKE) -C src clean

distclean: clean
	$(MAKE) -C src distclean
