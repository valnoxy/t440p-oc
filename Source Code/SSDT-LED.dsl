// Fix LED and Power Button blink after wake from sleep for Lenovo Thinkpads:
// X240, T440, T440P, T440S, T540P, L450, T450 etc
// Credits: Rehabman, vit9696, Sniki

#ifndef NO_DEFINITIONBLOCK
DefinitionBlock("", "SSDT", 2, "T440", "_LED", 0)
{
#endif
    External(ZWAK, MethodObj)
    External(_SI._SST, MethodObj)

    // In DSDT, native _WAK is renamed ZWAK
    // As a result, calls to this method land here.
    Method(_WAK, 1)
    {
        If (Arg0 = 3)
        {
            \_SI._SST(One)
        }
        // call into original _WAK method
        Return (ZWAK(Arg0))
    }
#ifndef NO_DEFINITIONBLOCK
}
#endif