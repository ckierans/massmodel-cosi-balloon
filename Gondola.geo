#NCT '14 Gondola!
#I've rounded most of the components up to the nearest half centimeter or so.

#Positive x is defined as the direction the front of the gondola (ie. the sun direction)

##should include panels that surround the electronics bay?
#The gondola mass from Solidworks is 366 lbs.

Include Intro.geo
Include Radiator.geo

Constant GondolaBeam_HalfWidth {7.62/2}
Constant Beam_Thickness {0.5} 
#Made thicker to take into account threaded inserts
Constant GondolaHorizontalBeam_HalfLength {134.5/2}
Constant DetPositionWithinGondola 76.91

Volume Gondola
Gondola.Visibility 0
Gondola.Virtual True
Gondola.Material Vacuum
Gondola.Shape BRIK 75 75 110

Include TwelveCardCages.geo
TwelveCardCages.Mother Gondola
TwelveCardCages.Position 0 0 {DetPositionWithinGondola - 10.49 - CC_halfheight}

Volume Gondola_VerticalBeam
Gondola_VerticalBeam.Visibility 1
Gondola_VerticalBeam.Material al6061
Gondola_VerticalBeam.Shape BRIK GondolaBeam_HalfWidth GondolaBeam_HalfWidth {216/2}

Volume Gondola_VerticalBeamInside
Gondola_VerticalBeamInside.Visibility 0
Gondola_VerticalBeamInside.Material Vacuum
Gondola_VerticalBeamInside.Shape BRIK {GondolaBeam_HalfWidth-Beam_Thickness} {GondolaBeam_HalfWidth-Beam_Thickness} {216/2}
Gondola_VerticalBeamInside.Mother Gondola_VerticalBeam
Gondola_VerticalBeamInside.Position 0 0 0

Volume Gondola_HorizontalBeam
Gondola_HorizontalBeam.Visibility 1
Gondola_HorizontalBeam.Material al6061
Gondola_HorizontalBeam.Shape BRIK GondolaHorizontalBeam_HalfLength GondolaBeam_HalfWidth GondolaBeam_HalfWidth

Volume Gondola_HorizontalBeamInside
Gondola_HorizontalBeamInside.Visibility 0
Gondola_HorizontalBeamInside.Material Vacuum
Gondola_HorizontalBeamInside.Shape BRIK GondolaHorizontalBeam_HalfLength {GondolaBeam_HalfWidth-Beam_Thickness} {GondolaBeam_HalfWidth-Beam_Thickness}
Gondola_HorizontalBeamInside.Mother Gondola_HorizontalBeam
Gondola_HorizontalBeamInside.Position 0 0 0


Volume Gondola_4_BeamBase
Gondola_4_BeamBase.Visibility 0
Gondola_4_BeamBase.Virtual True
Gondola_4_BeamBase.Material Vacuum
Gondola_4_BeamBase.Shape BRIK 75 75 5

Gondola_HorizontalBeam.Copy Gondola_HorizontalBeam_1
Gondola_HorizontalBeam_1.Position 0 {GondolaHorizontalBeam_HalfLength+GondolaBeam_HalfWidth} 0
Gondola_HorizontalBeam_1.Rotation 0 0 0
Gondola_HorizontalBeam_1.Mother Gondola_4_BeamBase

Gondola_HorizontalBeam.Copy Gondola_HorizontalBeam_2
Gondola_HorizontalBeam_2.Position 0 {-GondolaHorizontalBeam_HalfLength-GondolaBeam_HalfWidth} 0
Gondola_HorizontalBeam_2.Rotation 0 0 0
Gondola_HorizontalBeam_2.Mother Gondola_4_BeamBase

Gondola_HorizontalBeam.Copy Gondola_HorizontalBeam_3
Gondola_HorizontalBeam_3.Position {GondolaHorizontalBeam_HalfLength+GondolaBeam_HalfWidth} 0 0
Gondola_HorizontalBeam_3.Rotation 0 0 90
Gondola_HorizontalBeam_3.Mother Gondola_4_BeamBase

Gondola_HorizontalBeam.Copy Gondola_HorizontalBeam_4
Gondola_HorizontalBeam_4.Position {-GondolaHorizontalBeam_HalfLength-GondolaBeam_HalfWidth} 0 0
Gondola_HorizontalBeam_4.Rotation 0 0 90
Gondola_HorizontalBeam_4.Mother Gondola_4_BeamBase

For X 2 {-GondolaHorizontalBeam_HalfLength - GondolaBeam_HalfWidth} {2*(GondolaHorizontalBeam_HalfLength+GondolaBeam_HalfWidth)}
  For Y 2 {-GondolaHorizontalBeam_HalfLength-GondolaBeam_HalfWidth} {2*(GondolaHorizontalBeam_HalfLength+GondolaBeam_HalfWidth)}
    Gondola_VerticalBeam.Copy Gondola_VerticalBeam_%X%Y
    Gondola_VerticalBeam_%X%Y.Position $X $Y 0
    Gondola_VerticalBeam_%X%Y.Mother Gondola
  Done
Done

Gondola_4_BeamBase.Copy Gondola_4_BeamBase_1
Gondola_4_BeamBase_1.Position 0 0 104.19
Gondola_4_BeamBase_1.Mother Gondola

##This second layer is where the DetectorHead Attaches
Gondola_4_BeamBase.Copy Gondola_4_BeamBase_2
Gondola_4_BeamBase_2.Position 0 0 {DetPositionWithinGondola - GondolaBeam_HalfWidth}
Gondola_4_BeamBase_2.Mother Gondola

Gondola_4_BeamBase.Copy Gondola_4_BeamBase_3
Gondola_4_BeamBase_3.Position 0 0 -22.8
Gondola_4_BeamBase_3.Mother Gondola

Gondola_4_BeamBase.Copy Gondola_4_BeamBase_4
Gondola_4_BeamBase_4.Position 0 0 -104.19
Gondola_4_BeamBase_4.Mother Gondola


#Extra support beams...

For X 2 {-14.8} {14.8*2}
  Gondola_HorizontalBeam.Copy Gondola_HorizontalBeam_CSBFSupport_%X
  Gondola_HorizontalBeam_CSBFSupport_%X.Position $X 0 -104.19
  Gondola_HorizontalBeam_CSBFSupport_%X.Rotation 0 0 90
  Gondola_HorizontalBeam_CSBFSupport_%X.Mother Gondola
Done

For Y 2 {-25.85} {25.85*2}
  Gondola_HorizontalBeam.Copy Gondola_HorizontalBeam_ElectronicsSupport_%Y
  Gondola_HorizontalBeam_ElectronicsSupport_%Y.Position 0 $Y -22.8
  Gondola_HorizontalBeam_ElectronicsSupport_%Y.Mother Gondola
Done

For Y 2 {-28.71} {28.71*2}
  Gondola_HorizontalBeam.Copy Gondola_HorizontalBeam_DetSupport_%Y
  Gondola_HorizontalBeam_DetSupport_%Y.Position 0 $Y {DetPositionWithinGondola - GondolaBeam_HalfWidth}
  Gondola_HorizontalBeam_DetSupport_%Y.Mother Gondola
Done



#Include Electronics in the Electronics Bay
Include ElectronicsBay.geo
EBay.Position 0 0 {-22.8 + EBayHalfHeight + GondolaBeam_HalfWidth}
EBay.Mother Gondola



Include GPSAntennaSupport.geo
GPSAntennaSupport.Mother Gondola
#GPSAntennaSupport.Position {GondolaHorizontalBeam_HalfLength + GondolaBeam_HalfWidth*2 - 274.3/2} 0 {104.19 + GondolaBeam_HalfWidth - 12.319}
GPSAntennaSupport.Position {GondolaHorizontalBeam_HalfLength + GondolaBeam_HalfWidth*2 - 274.3/2} 0 {104.19 + GondolaBeam_HalfWidth - 16.1188} 

Volume CSBFAntennaBoom
CSBFAntennaBoom.Visibility 1
CSBFAntennaBoom.Material al6061
CSBFAntennaBoom.Shape BRIK {GondolaBeam_HalfWidth} {609/2} {GondolaBeam_HalfWidth}
CSBFAntennaBoom.Mother Gondola
CSBFAntennaBoom.Position {-GondolaHorizontalBeam_HalfLength-GondolaBeam_HalfWidth-8.57} 0 104.19

Volume CSBFAntennaBoom_Inside
CSBFAntennaBoom_Inside.Visibility 0
CSBFAntennaBoom_Inside.Material Vacuum
CSBFAntennaBoom_Inside.Shape BRIK {GondolaBeam_HalfWidth - Beam_Thickness} {609/2} {GondolaBeam_HalfWidth - Beam_Thickness}
CSBFAntennaBoom_Inside.Mother CSBFAntennaBoom
CSBFAntennaBoom_Inside.Position 0 0 0


Volume DivingBoard
DivingBoard.Visibility 1
DivingBoard.Color 3
DivingBoard.Material al6061
DivingBoard.Shape BRIK {50/2} {20/2} {0.5/2}
DivingBoard.Position {-GondolaHorizontalBeam_HalfLength - GondolaBeam_HalfWidth*2 - 50/2} 0 {DetPositionWithinGondola}
DivingBoard.Mother Gondola

Volume PanTiltCamera_Mount
PanTiltCamera_Mount.Visibility 1
PanTiltCamera_Mount.Color 3
PanTiltCamera_Mount.Material al6061
PanTiltCamera_Mount.Shape TUBE 0 {6.4/2} {52/2} 0 360 
PanTiltCamera_Mount.Position {-GondolaHorizontalBeam_HalfLength - GondolaBeam_HalfWidth*2 - 50 + 10} 0 {DetPositionWithinGondola + 52/2 + 0.5}
PanTiltCamera_Mount.Mother Gondola

Volume PanTiltCamera_Top
PanTiltCamera_Top.Visibility 1
PanTiltCamera_Top.Color 3
PanTiltCamera_Top.Material mCamera
PanTiltCamera_Top.Shape TUBE {6/2} {13.4/2} {38/2} 60 300 
PanTiltCamera_Top.Position {-GondolaHorizontalBeam_HalfLength - GondolaBeam_HalfWidth*2 - 50 + 10} 0 {DetPositionWithinGondola + 52 + 3}
PanTiltCamera_Top.Rotation 0 90 0
PanTiltCamera_Top.Mother Gondola



#Volume to represent SIP
Volume SIP
SIP.Visibility 1
SIP.Color 3
SIP.Material mSIP
SIP.Shape BRIK {130/2} {60/2} {60/2}
SIP.Position 0 0 {-22.8 - GondolaBeam_HalfWidth - 60/2}
SIP.Mother Gondola


Include Radiator.geo
Radiator.Mother Gondola
Radiator.Position {-GondolaHorizontalBeam_HalfLength-GondolaBeam_HalfWidth} 0 {104.19+6}
Radiator.Rotation 0 0 90

Volume RadiatorReservoir
RadiatorReservoir.Shape TUBS {8.8/2} {9.91/2} {27.9/2} 0 360
RadiatorReservoir.Material al6061
RadiatorReservoir.Position {-GondolaHorizontalBeam_HalfLength-GondolaBeam_HalfWidth + 15+6} {30} {104.19 + 6 + 27/2}
RadiatorReservoir.Color 3
RadiatorReservoir.Mother Gondola



