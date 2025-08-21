
# Added in May 2025

Volume Radiator
Radiator.Shape BRIK {138/2} {30.48/2} {2.54/2 + 0.25/2}
Radiator.Color 1
Radiator.Material Vacuum


Volume RadiatorCopperTop
RadiatorCopperTop.Shape BRIK {127/2} {30.48/2} {0.25/2}
RadiatorCopperTop.Material Copper
RadiatorCopperTop.Color 3
RadiatorCopperTop.Position 0 0 {2.54/2}
RadiatorCopperTop.Mother Radiator

Volume RadiatorFrontBracket
RadiatorFrontBracket.Shape BRIK {138/2} {2.54/2} {2.54/2}
RadiatorFrontBracket.Material al6061
RadiatorFrontBracket.Position 0 {-30.48/2+2.54/2} {-0.25/2}
RadiatorFrontBracket.Color 3
RadiatorFrontBracket.Mother Radiator 

