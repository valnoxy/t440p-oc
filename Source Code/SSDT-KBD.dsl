/*
 * Designed for T440p -> See https://github.com/valnoxy/t440p-oc
 */

DefinitionBlock ("", "SSDT", 2, "T440P", "_KBD", 0x00000000)
{
    External (_SB_.PCI0.LPC_.EC__, DeviceObj)
    External (_SB_.PCI0.LPC_.EC__.HKEY.MLCS, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPC_.EC__.HKEY.MMTS, MethodObj)    // 1 Arguments
    External (_SB_.PCI0.LPC_.EC__.XQ14, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.XQ15, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.XQ16, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.XQ1F, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.XQ64, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.XQ66, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.XQ67, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.XQ68, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.XQ69, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.EC__.XQ6A, MethodObj)    // 0 Arguments
    External (_SB_.PCI0.LPC_.KBD_, DeviceObj)

    Scope (_SB.PCI0.LPC.EC)
    {
        Method (_Q14, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x0406)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ14 ()
            }
        }

        Method (_Q15, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x0405)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ15 ()
            }
        }

        Name (LED1, Zero)
        Method (_Q6A, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                If ((LED1 == Zero))
                {
                    Notify (\_SB.PCI0.LPC.KBD, 0x0136)
                    Notify (\_SB.PCI0.LPC.KBD, 0x036B)
                    Notify (\_SB.PCI0.LPC.KBD, 0x01B6)
                    \_SB.PCI0.LPC.EC.HKEY.MMTS (0x02)
                    LED1 = One
                }
                Else
                {
                    Notify (\_SB.PCI0.LPC.KBD, 0x012A)
                    Notify (\_SB.PCI0.LPC.KBD, 0x036B)
                    Notify (\_SB.PCI0.LPC.KBD, 0x01AA)
                    \_SB.PCI0.LPC.EC.HKEY.MMTS (Zero)
                    LED1 = Zero
                }
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ6A ()
            }
        }

        Method (_Q16, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x0367)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ16 ()
            }
        }

        Method (_Q64, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x0368)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ64 ()
            }
        }

        Method (_Q66, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (KBD, 0x0369)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ66 ()
            }
        }

        Method (_Q67, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPC.KBD, 0x0138)
                Notify (\_SB.PCI0.LPC.KBD, 0x0339)
                Notify (\_SB.PCI0.LPC.KBD, 0x01B8)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ67 ()
            }
        }

        Method (_Q68, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPC.KBD, 0x011D)
                Notify (\_SB.PCI0.LPC.KBD, 0x0448)
                Notify (\_SB.PCI0.LPC.KBD, 0x019D)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ68 ()
            }
        }

        Method (_Q69, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                Notify (\_SB.PCI0.LPC.KBD, 0x036A)
            }
            Else
            {
                \_SB.PCI0.LPC.EC.XQ69 ()
            }
        }

        Name (LED2, Zero)
        Method (_Q1F, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
        {
            If (_OSI ("Darwin"))
            {
                If ((LED2 == Zero))
                {
                    Notify (\_SB.PCI0.LPC.KBD, 0x0136)
                    Notify (\_SB.PCI0.LPC.KBD, 0x0367)
                    Notify (\_SB.PCI0.LPC.KBD, 0x01B6)
                    \_SB.PCI0.LPC.EC.HKEY.MLCS (One)
                    LED2 = One
                }
                ElseIf ((LED2 == One))
                {
                    Notify (\_SB.PCI0.LPC.KBD, 0x012A)
                    Notify (\_SB.PCI0.LPC.KBD, 0x036A)
                    Notify (\_SB.PCI0.LPC.KBD, 0x01AA)
                    \_SB.PCI0.LPC.EC.HKEY.MLCS (0x02)
                    LED2 = 0x02
                }
                ElseIf ((LED2 == 0x02))
                {
                    Notify (\_SB.PCI0.LPC.KBD, 0x012A)
                    Notify (\_SB.PCI0.LPC.KBD, 0x0367)
                    Notify (\_SB.PCI0.LPC.KBD, 0x01AA)
                    \_SB.PCI0.LPC.EC.HKEY.MLCS (Zero)
                    LED2 = Zero
                }
                Else
                {
                    \_SB.PCI0.LPC.EC.XQ1F ()
                }
            }
        }
    }

    Scope (_SB.PCI0.LPC.KBD)
    {
        Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
        {
            If (!Arg2)
            {
                Return (Buffer (One)
                {
                     0x03                                             // .
                })
            }

            Return (Package (0x04)
            {
                "RM,oem-id", 
                "LENOVO", 
                "RM,oem-table-id", 
                "Thinkpad_Clickpad"
            })
        }

        Name (RMCF, Package (0x04)
        {
            "Synaptics TouchPad", 
            Package (0x26)
            {
                "BogusDeltaThreshX", 
                0x0320, 
                "BogusDeltaThreshY", 
                0x0320, 
                "Clicking", 
                ">y", 
                "DragLockTempMask", 
                0x00040004, 
                "DynamicEWMode", 
                ">n", 
                "FakeMiddleButton", 
                ">n", 
                "HWResetOnStart", 
                ">y", 
                "PalmNoAction When Typing", 
                ">y", 
                "ScrollResolution", 
                0x0320, 
                "SmoothInput", 
                ">y", 
                "UnsmoothInput", 
                ">y", 
                "Thinkpad", 
                ">y", 
                "EdgeBottom", 
                Zero, 
                "FingerZ", 
                0x1E, 
                "MaxTapTime", 
                0x05F5E100, 
                "MouseMultiplierX", 
                0x02, 
                "MouseMultiplierY", 
                0x02, 
                "MouseScrollMultiplierX", 
                0x02, 
                "MouseScrollMultiplierY", 
                0x02
            }, 

            "Keyboard", 
            Package (0x02)
            {
                "Custom PS2 Map", 
                Package (0x02)
                {
                    Package (0x00){}, 
                    "e037=64"
                }
            }
        })
    }
}

