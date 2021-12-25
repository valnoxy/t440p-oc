/*
 * Designed for T440p -> See https://github.com/valnoxy/t440p-oc
 */
 
DefinitionBlock ("", "SSDT", 2, "T440P", "_DEHCI", 0x00001000)
{
    Scope (\)
    {
        OperationRegion (RCRG, SystemMemory, 0xFED1F418, One)
        Field (RCRG, DWordAcc, Lock, Preserve)
        {
                ,   13, 
            EH2D,   1, 
                ,   1, 
            EH1D,   1
        }

        Method (_INI, 0, NotSerialized)  // _INI: Initialize
        {
            If (_OSI ("Darwin"))
            {
                EH1D = One
                EH2D = One
            }
        }
    }
}

