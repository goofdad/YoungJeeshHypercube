                   .:                     :,                                          
,:::::::: ::`      :::                   :::                                          
,:::::::: ::`      :::                   :::                                          
.,,:::,,, ::`.:,   ... .. .:,     .:. ..`... ..`   ..   .:,    .. ::  .::,     .:,`   
   ,::    :::::::  ::, :::::::  `:::::::.,:: :::  ::: .::::::  ::::: ::::::  .::::::  
   ,::    :::::::: ::, :::::::: ::::::::.,:: :::  ::: :::,:::, ::::: ::::::, :::::::: 
   ,::    :::  ::: ::, :::  :::`::.  :::.,::  ::,`::`:::   ::: :::  `::,`   :::   ::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  :::::: ::::::::: ::`   :::::: ::::::::: 
   ,::    ::.  ::: ::, ::`  :::.::    ::.,::  .::::: ::::::::: ::`    ::::::::::::::: 
   ,::    ::.  ::: ::, ::`  ::: ::: `:::.,::   ::::  :::`  ,,, ::`  .::  :::.::.  ,,, 
   ,::    ::.  ::: ::, ::`  ::: ::::::::.,::   ::::   :::::::` ::`   ::::::: :::::::. 
   ,::    ::.  ::: ::, ::`  :::  :::::::`,::    ::.    :::::`  ::`   ::::::   :::::.  
                                ::,  ,::                               ``             
                                ::::::::                                              
                                 ::::::                                               
                                  `,,`


https://www.thingiverse.com/thing:2175956
Radial Fan Fang by Lion4H is licensed under the Creative Commons - Attribution - Share Alike license.
http://creativecommons.org/licenses/by-sa/3.0/

# Summary

Does your layer fan make a **sphere of air** focused on the sweet spot?
checkout the video test below (using radial fan 4020) for aerodynamic and then test yours to see if you are using all air output, or just part of it.

There is an interesting video for high speed printing test to compare four fanduct models including this one done by ruiraptor:
https://www.youtube.com/watch?v=c0llj3pBltA 

Source code included (blender files, .obj).

Support:
-----------
**Hotends:**
- E3D
- E3D Titan
- Tevo Stock (chimera single nozzle)

**Radial Fans:**
- 4020
- 5015

**Sensors:**
- No sensor
- LJC18A3 (Set X: +49mm, Y: -19mm)
- LJ12A3 (Set X: +49mm, Y: -19mm), it'll fit in LJC18A3 18mm hole, the nuts is bigger
- BLTouch (Set X: +39mm, Y: -21mm)
- SN04 (Set X: 39mm, Y: -8mm)

Features:
-------------
- Fang design, **you can see** whats going on while printing, **you can reach** and remove oozing before they ruin the print.
- Very **efficient air blow**, minimal curves , no hard angles... to avoid air colliding (air current eliminating) 
- SPHERE air concentrating!!! all air blowing focused on nozzle tip, then get reflected to all directions (see the video).
- **Adjustable height**, so it fit best for your own configuration.
- **Balanced air distribution**, blow from 2 sides against each other, the air escape from other 2 side, no pushing from one side only, Also Radial fan gives more air at one side of it's output hole, perpendicularly plugging design will split the air current equally for each tube.
- Compatible with E3D, Tevo Stock hotend and many others (please comment if yours fit too)
- Support both 4020 and 5015 Radial fan models
- LED holder, very recommended, huge lighting focus, even for dark


###Help:
**Which file you should print**
There are two main models, Radial Fan 4020 (40 X 20 mm) and Radial Fan 5015 (50 X 15 mm).
each model has 4 versions to support all sensors.
which identified by file name as: Radial Fan Fang [Size] [Sensor].stl
Example: if you have radial fan 5015 and LJC18A3 sensor, then you should print:
Radial_Fan_Fang_5015_LJC18A3.stl

**Printing Tips**
- you can add brim support if the first layer did not stick will.
- you need to add printing support for **sensors edition**, select the proper support type so you don't add support inside, 40% infill is recommended, because of sensor mount.
- if you don't have layer fan before and you couldn't print without one, you can make a quick temporary setup for your radial fan (cardboard & duck tape), to get the first print with poor quality, then install it and print a better one.

**Installing**
- you should adjust the height to make the hangs tips higher than the nozzle tip by 2 to 3mm.
- if you are using sensor edition, update your firmware to set sensor offset.
- for tevo stock hotend: if you get rapid click sound, you need to add washers between hotend fan and the model, because you got pop up tips while printing (I'm working on solution for that)


**Adding LED light**
- buy LED strip
- cut the first 3 led's (cut on line)
- connect wires to hotend fan, red to red and black to black (it'll be always on)
- stick it under hotend fan using silicon bar or super glow, on the fan duct tip, it'll be tilted to direct light to nozzle tip

# Print Settings

Rafts: Doesn't Matter
Supports: Doesn't Matter
Resolution: 0.2
Infill: 25%

# Post-Printing

<iframe src="//www.youtube.com/embed/Ne7hcn2nK5w" frameborder="0" allowfullscreen></iframe>

# How I Designed This

![Alt text](https://cdn.thingiverse.com/assets/8b/76/51/c3/ce/modify.gif)

## How to adjust it to make your own edition

Follow this steps as shown in the animation above:
- download and open blend file using blender (get it free from www.blender.org)
- press 3 on num pad, to go to front view
- right click on the fang, to select
- press tab key, to enter edit mode
- press z key, to show all points
- press and hold ctrl + left mouse key, to select points
- press z key, to go back to solid view
- drag axis, to make the wanted adjustment
- press tab key, to exit edit mode
- select all parts by right click & hold shift
- File > Export > .stl, then check "selection Only" then Export STL