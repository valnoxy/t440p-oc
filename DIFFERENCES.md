![macOS Big Sur running on the T440p](https://dl.exploitox.de/t440p-oc/Hackintosh_T440p_V3.png)

<h3 align="center">Lenovo ThinkPad T440p - OpenCore Configuation</h3>
<p align="center">
    Differences to the EFI folders
    <br />
    <a href="https://github.com/valnoxy/t440p-oc/"><strong>Go back »</strong></a>
    <br />
  </p>
</p>

![-----------------------------------------------------](https://dl.exploitox.de/t440p-oc/rainbow.png)

- **EFI - Monterey**
    + AirportItlwm.kext
        - Version for Big Sur
    + Config.plist
        + NVRAM
          - Uses more boot-args: ```-v -lilubeta -wegbeta -alcbeta```
        + PlatformInfo
          - Uses different model: ```MacBookPro12,1```
---
- **EFI - Big Sur**
    + AirportItlwm.kext
        - Kext supports only Big Sur

---
- **EFI - Catalina**
    + AirportItlwm.kext
        - Kext supports only Catalina

---
- **EFI - Heliport**
    + Itlwm.kext
        - Kext supports every macOS Version
        - Require Heliport app in order to use WiFi

> **Note**: In order to use Heliport with macOS Monterey, apply every changes mentioned above in ```EFI - Monterey -> Config.plist```