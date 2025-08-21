Include Gondola.geo

Constant EBayHalfHeight {27}

#Electronics Baseplate
Volume EBay
EBay.Visibility 0
EBay.Color 2
EBay.Material Vacuum
EBay.Shape BRIK {GondolaHorizontalBeam_HalfLength} {GondolaHorizontalBeam_HalfLength} EBayHalfHeight

Volume EBay_Baseplate
EBay_Baseplate.Visibility 1
EBay_Baseplate.Material al6061
EBay_Baseplate.Shape BRIK GondolaHorizontalBeam_HalfLength GondolaHorizontalBeam_HalfLength {0.5/2}
EBay_Baseplate.Color 3
#EBay_Baseplate.Mother EBay
EBay_Baseplate.Position 0 0 {-EBayHalfHeight + 0.5/2} 

Volume ChargeController
ChargeController.Visibility 1
ChargeController.Color 3
ChargeController.Material al6061
ChargeController.Shape BRIK {21/2} {56/2} {46/2}
ChargeController.Position {-GondolaHorizontalBeam_HalfLength +21/2} 0 {-EBayHalfHeight + 46/2 + 0.5} 
ChargeController.Mother EBay

Volume ChargeController_Inside
ChargeController_Inside.Visibility 0
ChargeController_Inside.Material Vacuum
ChargeController_Inside.Shape BRIK {19/2} {54/2} {43/2}
ChargeController_Inside.Position 0 0 0
ChargeController_Inside.Mother ChargeController

Volume BatteryBox
BatteryBox.Visibility 1
BatteryBox.Color 3
BatteryBox.Material al6061
BatteryBox.Shape BRIK {33/2} {108/2} {32/2}

Volume BatteryBox_Inside
BatteryBox_Inside.Visibility 1
BatteryBox_Inside.Color 3
BatteryBox_Inside.Material Vacuum
BatteryBox_Inside.Shape BRIK {32/2} {107.1/2} {31.1/2}
BatteryBox_Inside.Position 0 0 0
BatteryBox_Inside.Mother BatteryBox

Volume Batteries
Batteries.Visibility 0
Batteries.Material LeadAcid
Batteries.Shape BRIK {32/2} {107/2} {31/2}
Batteries.Position 0 0 0
Batteries.Mother BatteryBox_Inside 

BatteryBox.Copy BatteryBox1
BatteryBox1.Position {GondolaHorizontalBeam_HalfLength - 33/2} 0 {-EBayHalfHeight + 32/2 + 0.5}
BatteryBox1.Mother EBay

BatteryBox.Copy BatteryBox2
BatteryBox2.Position {-25} 0 {-EBayHalfHeight + 32/2 + 0.5}
BatteryBox2.Mother EBay


