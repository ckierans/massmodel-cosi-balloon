#Mass of Al frame = 24 kg each, Mass of each panel which is photovoltaic cells with wood backing = 2 lbs
#Approximated the frame structure just as the peripheral and modified the thickness of the frame to match the measured mass

Volume SolarPanels_Frame
SolarPanels_Frame.Visibility 1
SolarPanels_Frame.Color 3
SolarPanels_Frame.Shape BRIK {250/2} {214/2} {2.54/2}
SolarPanels_Frame.Material Aluminium

Volume SolarPanels_Frame_Inside
SolarPanels_Frame_Inside.Visibility 1
SolarPanels_Frame_Inside.Color 3
SolarPanels_Frame_Inside.Shape BRIK {245/2} {209/2} {2.54/2}
SolarPanels_Frame_Inside.Material Vacuum
SolarPanels_Frame_Inside.Position 0 0 0
SolarPanels_Frame_Inside.Mother SolarPanels_Frame

Volume SolarArray
SolarArray.Visibility 0
SolarArray.Shape BRIK {245/2} {209/2} {0.01}
SolarArray.Material Silicon
SolarArray.Position 0 0 {2.54/2 - 0.01}
SolarArray.Mother SolarPanels_Frame_Inside

Volume SolarArray_Back
SolarArray_Back.Visibility 0
SolarArray_Back.Shape BRIK {245/2} {209/2} {0.1}
SolarArray_Back.Material Wood
SolarArray_Back.Position 0 0 0
SolarArray_Back.Mother SolarPanels_Frame_Inside


