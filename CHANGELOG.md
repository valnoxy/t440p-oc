![macOS Monterey running on the T440p](https://dl.exploitox.de/t440p-oc/Hackintosh_T440p_V4.jpg)

<h3 align="center">Lenovo ThinkPad T440p - OpenCore Configuation</h3>
<p align="center">
    <a href="https://github.com/valnoxy/t440p-oc/"><strong>Go back »</strong></a>
    <br />
  </p>
</p>

![-----------------------------------------------------](https://dl.exploitox.de/t440p-oc/rainbow.png)

### Version 1.7.0-dev (Last update: 20.12.2021)
- Kext Changes
  - New / Updated
    - AppleALC to ```1.6.7```
    - HibernationFixup to ```1.4.5```
    - Lilu to ```1.5.8```
    - VirtualSMC to ```1.2.8```
    - WhateverGreen to ```1.5.5```
    - Added RealtekCardReader
    - Added RealtekCardReaderFriend.kext
    - USBMap to ```1.0.1```
- Config Changes
  - New Model: ```MacBookPro12,1``` to ```MacBookPro11,4```

### Version 1.6.0 (25.10.2021)
- OpenCore to ```0.7.4```
- SSDT Changes
  - New / Updated 
    - SSDT-PLUG ```(source code included)```
    - SSDT-PNLF ```(source code included)```
    - SSDT-GPI0 ```(source code included)```
- Kext Changes
  - New / Updated
    - AppleALC to ```1.6.5```
    - CpuTscSync (new - syncing TSC, can improve performance)
    - HibernationFix (new)
    - Lilu to ```1.5.6```
    - VirtualSMC to ```1.2.7```
    - WhateverGreen to ```1.5.4```

### Version 1.5.2 (15.08.2021)
- Update Airportitlwm / itlwm to ```2.0.0```
- Update AppleALC to ```1.6.3```
- Update FeatureUnlock to ```1.0.3```
- Update IntelBluetooth to ```2.0.0```
- Update VirtualSMC to ```1.2.6```
- Update WhateverGreen to ```1.5.2```
- Remove Tools
- Remove SSDT-BAT (YogaSMC should work now)

### Version 1.5.1 (25.07.2021)
- Update Bluetooth kexts
- Add YogaSMC
- Support Sidecar and AirPlay for Mac
- Fix Audio & Microphone

### Version 1.5.0 (17.07.2021)
- Update OpenCore to ```0.7.1```
- Update USBPort.kext
- Change model to ```MacBookPro12,1```
- Add Tool (TpmInfo.efi)
- Remove Theme ([BsxDarkFencePinkPurple1](https://github.com/blackosx/BsxDarkFencePinkPurple1_))
- Remove Tool (ResetSystem.efi)

### Version 1.4.0 (30.06.2021)
- Update Kexts
- Update README
- Add multiple EFI's for different macOS Versions
- Add Heliport Version (Compatible with all macOS Versions)

### Version 1.3.0 (08.06.2021)
- Support macOS Monterey (Beta)

### Version 1.2.1 (03.06.2021)
- Fix Headphones buzzing noise

### Version 1.2.0 (02.06.2021)
- Add UltrabayHDD support
- Add Intel Bluetooth kext
- Add AppleALC kext
- Remove VoodooHDA kext

### Version 1.1.0 (21.04.2021)
- Add new Theme [BsxDarkFencePinkPurple1](https://github.com/blackosx/BsxDarkFencePinkPurple1_) (you can enable it by changing the value of ```PickerVariant``` to ```BsxDarkFencePinkPurple1_```)
- Add Tool (ResetSystem.efi)
- Update Kexts and drivers
- Update OpenCore (REL-069-2021-04-21)

### Version 1.0.1 (20.03.2021)
- Remove Tools
- Update Introduction

### Version 1.0.1 (14.11.2020)
- Fix Audio Jack

### Version 1.0 (14.11.2020)
- Initial Release
