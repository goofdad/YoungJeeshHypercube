// Bearing Types
LM8UU = 0;
LM10UU = 1;
LM12UU = 2;
LM8LUU = 3;
LM10LUU = 4;
LM12LUU = 5;	

// Bearing dimensions
lBearingLM8UU = 24.0;
lBearingLM8LUU = 45.0;
rBearingOuterLM8UU = 15.0/2;
rBearingInnerLM8UU = 8.0/2;

lBearingLM10UU = 29.0;
lBearingLM10LUU = 55.0;
rBearingOuterLM10UU = 19.0/2;
rBearingInnerLM10UU = 10.0/2;

lBearingLM12UU = 30.0;
lBearingLM12LUU = 57.0;
rBearingOuterLM12UU = 21.0/2;
rBearingInnerLM12UU = 12.0/2;


function getLBearing(prmBearingType) =
  (prmBearingType==LM8UU)?
    lBearingLM8UU
  :(prmBearingType==LM10UU)?
    lBearingLM10UU
  :(prmBearingType==LM12UU)?
    lBearingLM12UU
  :(prmBearingType==LM8LUU)?
    lBearingLM8LUU
  :(prmBearingType==LM10LUU)?
    lBearingLM10LUU
  :lBearingLM12LUU;

function getRBearingOuter(prmBearingTypeIn) = let (prmBearingType=prmBearingTypeIn % 3) (prmBearingType==LM8UU)?rBearingOuterLM8UU:(prmBearingType==LM10UU)?rBearingOuterLM10UU:rBearingOuterLM12UU;

function getRBearingInner(prmBearingTypeIn) = let (prmBearingType=prmBearingTypeIn % 3) (prmBearingType==LM8UU)?rBearingInnerLM8UU:(prmBearingType==LM10UU)?rBearingInnerLM10UU:rBearingInnerLM12UU;

function getRBearingRodMask(prmBearingType) = getRBearingInner(prmBearingType) + 1.0;


