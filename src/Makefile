CXX     	?= $(CROSS_COMPILE)g++
DEL_FILE	= rm -rf
CP_FILE		= cp -rf      
MKDIR		= mkdir -p

TARGET_PATH_LIB 	= $(libdir)
TARGET_PATH_INCLUDE 	= $(includedir)

# x11 flags
ifeq ($(EGL_FLAVOR),x11)

	APPNAME		= cubes_demo_x11
	CXXFLAGS  	= -D_LINUX -DEGL_USE_X11 -Wall -O2 -I.
	LDFLAGS  	= -lEGL -lGLESv2 -lpthread -lX11

# fb flags
else
	APPNAME		= cubes_demo_fb
	CXXFLAGS  	= -D_LINUX -DEGL_API_FB  -Wall -O2 -I.
	LDFLAGS  	= -lEGL -lGLESv2 -lpthread

endif

OBJECTS			= main.o glutils.o glcube.o

first: all

all: $(APPNAME)

$(APPNAME): $(OBJECTS)
	$(CXX) $(LDFLAGS) -o $(APPNAME) $(OBJECTS)

main.o: main.cpp
	$(CXX) $(CXXFLAGS) -c -o main.o main.cpp
glutils.o: glutils.cpp
	$(CXX) $(CXXFLAGS) -c -o glutils.o glutils.cpp
glcube.o: glcube.cpp
	$(CXX) $(CXXFLAGS) -c -o glcube.o glcube.cpp

clean:
	$(DEL_FILE) $(OBJECTS)
	$(DEL_FILE) *~ core *.core

distclean: clean
	$(DEL_FILE) $(APPNAME)

install: all
	$(MKDIR) $(DESTDIR) $(DESTDIR)/$(DATADIR)
	$(MKDIR) $(DESTDIR) $(DESTDIR)/$(BINDIR)
	$(CP_FILE) ../bin/images $(DESTDIR)/$(DATADIR)
	$(CP_FILE) $(APPNAME) $(DESTDIR)/$(BINDIR)
	$(DEL_FILE) $(APPNAME)
