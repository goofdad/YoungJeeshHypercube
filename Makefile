# Copyright 2015 Elena Grandi
# This work is free. You can redistribute it and/or modify it under the
# terms of the Do What The Fuck You Want To Public License, Version 2,
# as published by Sam Hocevar. See http://www.wtfpl.net/ for more details.

STLDIR        = stl
GCODEDIR      = gcode
CONFDIR       = conf
SRCDIR        = src

SLIC3R        = myslic3r

VPATH         = $(SRCDIR):$(SRCDIR)/lib:$(BUILDDIR):

STL_TARGETS   = $(patsubst $(SRCDIR)/%.scad,$(STLDIR)/%.stl,$(wildcard $(SRCDIR)/*.scad))
GCODE_TARGETS = $(patsubst $(SRCDIR)/%.scad,$(GCODEDIR)/%.gcode,$(wildcard $(SRCDIR)/*.scad))

.PHONY: all gcode clean

include $(wildcard $(SRCDIR)/*.deps)

all: $(STL_TARGETS)

gcode: $(GCODE_TARGETS)

$(STLDIR):
	mkdir -p ${STLDIR}

$(GCODEDIR):
	mkdir -p ${GCODEDIR}

$(STLDIR)/%.stl: $(SRCDIR)/%.scad $(SRCDIR)/lib/* $(STLDIR)
	echo Match: $<
	openscad -o $@ -d $<.deps $<

$(GCODEDIR)/%.gcode: $(STLDIR)/%.stl ${CONFDIR}/basic.ini $(GCODEDIR)
	${SLIC3R} --load ${CONFDIR}/basic.ini $<

clean:
	rm -rf ${STLDIR} ${GCODEDIR}

