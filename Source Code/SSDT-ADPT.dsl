/*
 * Designed for T440p -> See https://github.com/valnoxy/t440p-oc
 */

DefinitionBlock ("", "SSDT", 2, "T440P", "_ADPT", 0x00000000)
{
    External (_SB_.PCI0.LPC_.EC__.AC__, DeviceObj)

    Scope (\_SB.PCI0.LPC.EC.AC)
    {
        If (_OSI ("Darwin"))
        {
            Name (_PRW, Package (0x02)  // _PRW: Power Resources for Wake
            {
                0x18, 
                0x03
            })
        }
    }
}

