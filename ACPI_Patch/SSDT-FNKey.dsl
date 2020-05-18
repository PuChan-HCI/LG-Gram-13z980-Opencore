/*
 * Intel ACPI Component Architecture
 * AML/ASL+ Disassembler version 20200110 (64-bit version)
 * Copyright (c) 2000 - 2020 Intel Corporation
 * 
 * Disassembling to symbolic ASL+ operators
 *
 * Disassembly of iASLrpyTPt.aml, Sun Apr 19 02:35:55 2020
 *
 * Original Table Header:
 *     Signature        "SSDT"
 *     Length           0x00000155 (341)
 *     Revision         0x02
 *     Checksum         0xDB
 *     OEM ID           "OCLT"
 *     OEM Table ID     "FNKey"
 *     OEM Revision     0x00000000 (0)
 *     Compiler ID      "INTL"
 *     Compiler Version 0x20200110 (538968336)
 */
DefinitionBlock ("", "SSDT", 2, "OCLT", "FNKey", 0x00000000)
{
    External (_SB.SLPB, DeviceObj)
    External (_SB.PCI0.LPCB.H_EC, DeviceObj)
    External (_SB.PCI0.LPCB.H_EC.LID0, DeviceObj)
    External (_SB.PCI0.LPCB.H_EC.XQ34, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ36, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ37, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ40, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQ72, MethodObj)
    External (_SB.PCI0.LPCB.H_EC.XQFF, MethodObj)
    External (_SB.PCI0.LPCB.PS2K, DeviceObj)
    External (_SB.PCI9.FNOK, IntObj)
    External (_SB.PCI9.MODE, IntObj)
    External (RMDT.P1__, MethodObj) 
    External (RMDT.P2__, MethodObj)
    External (_SB.PCI9.TPTS, IntObj)
    External (_SB.PCI9.TWAK, IntObj)
    External (LGEC, IntObj)
    External (\_SB.PCI0.LPCB.H_EC.LBRI, FieldUnitObj)
    External (PRM0, FieldUnitObj)
    External (PRM1, FieldUnitObj)
    External (GPEN, FieldUnitObj)
    External (_SB.PCI0.LPCB.H_EC.MAP1.TLED, MethodObj)

    Scope (_SB.PCI0.LPCB.H_EC)
    {        
        Method (_Q36, 0, NotSerialized)
        {
            \RMDT.P1 ("KEYBOARD-Q36")
            \_SB.PCI0.LPCB.H_EC.XQ36()
        }
        Method (_Q37, 0, NotSerialized)
        {
            \RMDT.P1 ("KEYBOARD-Q37")
            \_SB.PCI0.LPCB.H_EC.XQ37()
        }
        
        Method (_Q40, 0, NotSerialized)
        {
            \RMDT.P1 ("KEYBOARD-Q40")
            If (_OSI ("Darwin"))
            {
                Store(\_SB.PCI0.LPCB.H_EC.LBRI, Local0)
                Store(PRM0, Local1)
                Store(PRM1, Local2)
                
                \RMDT.P2("KEYBOARD-Q40-Local0", Local0)
                \RMDT.P2("KEYBOARD-Q40-Local1", Local1)
                \RMDT.P2("KEYBOARD-Q40-Local2", Local2)
                                
                If(LEqual(Local0,Local1)){
                    If(LEqual(Local0, 0x80))
                    {
                        Store(0x20,Local2)
                    }
                    Else
                    {
                        If(LEqual(Local0, 0x88))
                        {
                            Store(0x10,Local2)
                        }
                    }
                }Else{
                    If(LGreater(Local0,Local1)){                    
                        Store(0x10,Local2)
                    }Else{
                        Store(0x20,Local2)                
                    }
                }   
                             
                Store(Local0,PRM0)
                Store(Local2,PRM1)
                
                If(LEqual(Local2, 0x20))
                {
                    Notify(\_SB.PCI0.LPCB.PS2K, 0x0405)
                    //Notify(\_SB.PCI0.LPCB.PS2K, 0x20)
                }
                ElseIf(LEqual(Local2, 0x10))
                {
                    Notify(\_SB.PCI0.LPCB.PS2K, 0x0406)
                    //Notify(\_SB.PCI0.LPCB.PS2K, 0x10)
                }      
                \RMDT.P2 ("KEYBOARD-Q40-Local2", Local2)   
            }
            Else
            {
                \_SB.PCI0.LPCB.H_EC.XQ40()
            }
        }
                
        Method (_Q72, 0, NotSerialized)
        {
            \RMDT.P1 ("KEYBOARD-Q72")
            \_SB.PCI0.LPCB.H_EC.XQ72()
        }
        Method (_QFF, 0, NotSerialized)
        {
            \RMDT.P1 ("KEYBOARD-QFF")
            If (_OSI ("Darwin"))
            {
                If (GPEN == 1)
                {
                    GPEN = 0
                }
                ElseIf (GPEN == 0)
                {
                    GPEN = 1
                }
                \_SB.PCI0.LPCB.H_EC.MAP1.TLED(GPEN)
                Notify(\_SB.PCI0.LPCB.PS2K, 0x041e) // e01e
            }
            Else
            {
                \_SB.PCI0.LPCB.H_EC.XQFF()
            }
        }  
    }
}
