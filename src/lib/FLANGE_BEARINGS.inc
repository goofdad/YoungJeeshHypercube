// Flange Bearing Types
F608ZZ = 1;
F623ZZ = 2;


// Bearing dimensions
wFlangeBearingF608ZZ = 7.0;
tFlangeBearingF608ZZ = 1.5;
rFlangeBearingOuterF608ZZ = 22.0/2;
rFlangeBearingInnerF608ZZ = 8.0/2;
rFlangeBearingF608ZZ = 25.5/2;
rFlangeBearingWasherOuterF608ZZ = 15.7/2;
rFlangeBearingWasherInnerF608ZZ = 8.4/2;
tFlangeBearingWasherF608ZZ = 1.9;
rFlangeBearingNutF608ZZ = 14.6/2;
tFlangeBearingNutF608ZZ = 6.3;

wFlangeBearingF623ZZ = 4.0;
tFlangeBearingF623ZZ = 1.0;
rFlangeBearingOuterF623ZZ = 10.0/2;
rFlangeBearingInnerF623ZZ = 3.0/2;
rFlangeBearingF623ZZ = 11.5/2;
rFlangeBearingWasherOuterF623ZZ = 5.7/2;
rFlangeBearingWasherInnerF623ZZ = 3.3/2;
tFlangeBearingWasherF623ZZ = 0.5;
rFlangeBearingNutF623ZZ = 6.1/2;
tFlangeBearingNutF623ZZ = 2.3;


function getWFlangeBearing(prmBearingType) = (prmBearingType==F608ZZ)?wFlangeBearingF608ZZ:wFlangeBearingF623ZZ;

function getTFlangeBearing(prmBearingType) = (prmBearingType==F608ZZ)?tFlangeBearingF608ZZ:tFlangeBearingF623ZZ;

function getRFlangeBearingOuter(prmBearingType) = (prmBearingType==F608ZZ)?rFlangeBearingOuterF608ZZ:rFlangeBearingOuterF623ZZ;

function getRFlangeBearingInner(prmBearingType) = (prmBearingType==F608ZZ)?rFlangeBearingInnerF608ZZ:rFlangeBearingInnerF623ZZ;

function getRFlangeBearing(prmBearingType) = (prmBearingType==F608ZZ)?rFlangeBearingF608ZZ:rFlangeBearingF623ZZ;

function getRFlangeBearingWasherOuter(prmBearingType) = (prmBearingType==F608ZZ)?rFlangeBearingWasherOuterF608ZZ:rFlangeBearingWasherOuterF623ZZ;

function getRFlangeBearingWasherInner(prmBearingType) = (prmBearingType==F608ZZ)?rFlangeBearingWasherInnerF608ZZ:rFlangeBearingWasherInnerF623ZZ;

function getTFlangeBearingWasher(prmBearingType) = (prmBearingType==F608ZZ)?tFlangeBearingWasherF608ZZ:tFlangeBearingWasherF623ZZ;

function getHeightFlangeBearing(prmBearingType) = 2*getWFlangeBearing(prmBearingType) + 2*getTFlangeBearingWasher(prmBearingType);

function getRFlangeBearingNut(prmBearingType) = (prmBearingType==F608ZZ)?rFlangeBearingNutF608ZZ:rFlangeBearingNutF623ZZ;

function getTFlangeBearingNut(prmBearingType) = (prmBearingType==F608ZZ)?tFlangeBearingNutF608ZZ:tFlangeBearingNutF623ZZ;