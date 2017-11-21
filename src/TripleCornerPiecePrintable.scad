include <lib/HyperQbert.inc>
for (i=[0:7]) {
    translate([50*(i%4),i>3?0:55,0]) drawTripleCornerPiecePrintable();
    }

