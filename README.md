<img align="left" src="https://dl.exploitox.de/t440p-oc/Hackintosh_T440p_V4.jpg" alt="macOS Monterey running on the T440p" width="430">

<h3 align="center">Lenovo ThinkPad T440p - OpenCore Configuation</h3>
<p align="center">
   <strong>Status: Maintained</strong>
   <br />
   <strong>Version: </strong>1.7.1
   <br />
   <a href="https://github.com/valnoxy/t440p-oc/releases"><strong>Download now »</strong></a>
   <br />
   <br />
   <a href="https://github.com/valnoxy/t440p-oc/issues">Report Bug</a>
   ·
   <a href="https://github.com/valnoxy/t440p-oc/blob/main/CHANGELOG.md">View Changelog</a>
   ·
   <a href="https://www.youtube.com/watch?v=6Uz63UQiApQ">YouTube Video</a>
  </p>
</p>

<br />

[![OpenCore](https://img.shields.io/badge/OpenCore-0.7.7-blue.svg)](https://github.com/acidanthera/OpenCorePkg)
![macOS-Stable](https://img.shields.io/badge/macOS-Monterey-brightgreen.svg)
![macOS-Stable](https://img.shields.io/badge/macOS-BigSur-brightgreen.svg)
![macOS-Stable](https://img.shields.io/badge/macOS-Catalina-brightgreen.svg)

![-----------------------------------------------------](https://dl.exploitox.de/t440p-oc/rainbow.png)

## ⚠️ Disclaimer
This guide is only for the Lenovo ThinkPad T440p. I am NOT responsible for any harm you cause to your device. This guide is provided "as-is" and all steps taken are done at your own risk.

<a href="https://github.com/valnoxy/t440p-oc/tree/develop"><strong>
Switch to develop branch »</strong></a>

## ℹ️ Information
<details> 
<summary><strong>Table of contents</strong></summary>

   * [Introduction](#-introduction)
      * [Migrate to Version 1.7.0 and higher](#migrate-to-version-170-and-higher)
      * [EFI folders](#efi-folders)
   * [Features](#-features)
   * [Usage](#-usage)
      * [Requirements](#-requirements)
      * [Preperation](#%EF%B8%8F-preperation)
        * [Create the install media](#create-the-install-media)
        * [Configure and install OpenCore](#configure-and-install-opencore)
   * [Installation](#-installation)
      * [Prepare BIOS](#prepare-bios)
      * [Install macOS](#install-macos)
   * [Post-Install](#-post-install)
      * [Install EFI](#install-efi)
      * [Fix Audio Jack noise](#fix-audio-jack-noise)
      * [Create a offline install media (Optional)](#create-a-offline-install-media-optional)
   * [Upgrade macOS / Switch or update EFI](#%EF%B8%8F-upgrade-macos--switch-efi)

> Note: See the wiki for more tweaks etc.
</details> 
<details>
<summary><strong>Hardware</strong></summary>
<br>

These are the Hardware component I use. But this OpenCore configuation **should still work** with your device, even if the components are not equal.

| Category  | Component                            |
| --------- | ------------------------------------ |
| CPU       | Intel Core i7-4800MQ                 |
| GPU       | Intel HD Graphics 4600               |
| SSD       | SanDisk SSD PLUS 480GB               |
| Memory    | 8GB DDR3 1600Mhz                     |
| Camera    | 720p Camera                          |
| WiFi & BT | Intel Wireless-N 7260                |

</details>  

## 🔔 Introduction


### Migrate to Version 1.7.0 and higher
The Version 1.7.0 changes the model from ```MacBookPro12,1``` to ```MacBookPro11,4```. You need to generate a new SMBIOS for the new model with [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS).

### EFI folders
This repo includes multiple EFI configuations for different macOS Versions.

| EFI               | Description                                              | Type      |
| ----------------- | -------------------------------------------------------- | --------- |
| `EFI - Catalina`  | Supports only macOS Catalina                             | `Stable`  |
| `EFI - Big Sur`   | Supports only macOS Big Sur                              | `Stable`  |
| `EFI - Monterey`  | Supports only macOS Monterey                             | `Stable`  |
| `EFI - HeliPort`  | Supports every macOS Version, Require HeliPort app       | `Stable`  |


<a href="https://github.com/valnoxy/t440p-oc/blob/main/DIFFERENCES.md"><strong>
Differences to the EFI folders »</strong></a> <br/> <a href="https://github.com/OpenIntelWireless/HeliPort/releases"><strong>
Download HeliPort app »</strong></a>

## ✨ Features

### What works
- Intel WiFi & Bluetooth (thanks to [itlwn](https://github.com/OpenIntelWireless/itlwm))
- Brightness / Volume Control
- Battery Information
- Audio (Audio Jack & Speaker)
- USB Ports & Built-in Camera
- Graphics Acceleration
- Trackpoint / Touchpad
- Power management / Sleep
- FaceTime / iMessage (iServices)
- DisplayPort
- Automatic OS updates
- DVD Drive
- Dock USB / Display
- Handoff / Universal Clipboard
- Sidecar / AirPlay to Mac

### Not working
- AirDrop & Continuity
- VGA

### Known issues
- **Intel Bluetooth**: When using WiFi, the audio gets stutters or choppy frequently. (AirPods mainly affected)
   - Workaround: Use ```Ethernet``` instead of WiFI.
- **CPU Temperature**: The device might have some heat issues.
   - Workaround: Install ```YogaSMC``` app.
- **DRM**: Safari can't play DRM-protected media. (ex. Netflix)
   - Workaround: Use ```Firefox``` or ```Chrome```.

# 📖 Usage

## 📝 Requirements
You must have the following stuff:
- Lenovo ThinkPad T440p (Obviously 😁).
- Access to a working Windows machine with Python installed.
- A pendrive with more than 4 GB (Keep in mind, during the preperation we will format the disk to create the install media).
- an Internet connection via Ethernet.
- 1-2 hours of your time.

## ⚙️ Preperation

>   **Note**: If you want to install macOS Monterey, you need to upgrade from Big Sur, or create an **offline** install media (see down below).

### Create the install media

First of all, you will need the install media of macOS. I will use [macrecovery](https://github.com/acidanthera/OpenCorePkg) to download and create the macOS Install media.

With macrecovery, the process is the following:
- Download [OpenCorePkg](https://github.com/acidanthera/OpenCorePkg) as a ZIP.
- Extract the OpenCorePkg-master.zip file.
- Open ```cmd.exe``` with Administrator privileges and change the directory to OpenCorePkg-master\Utilities\macrecovery.
- Enter the following command to download macOS:
```
# Catalina (10.15)
python macrecovery.py -b Mac-00BE6ED71E35EB86 -m 00000000000000000 download

# Big Sur (11)
python macrecovery.py -b Mac-42FD25EABCABB274 -m 00000000000000000 download

# Monterey (12)
python macrecovery.py -b Mac-E43C1C25D4880AD6 -m 00000000000000000 download
```
- After the download succeeded, type ```diskpart``` and wait until you see ```DISKPART>```

- Plug-in your pendrive and type ```list disk``` to see your disk id.

- Select your pendrive by typing ```select disk <diskid>```

- Now we are gonna clean the pendrive and convert it to GPT. First, type ```clean``` and then ```convert gpt```.

>  **Note**: If an error occurred, try to convert again by typing ```convert gpt```.

- After the pendrive is clean and converted, we will create a new partition where we can put our files on. First, type ```create partition primary```, then select the new partition with ```select partition 1``` and format it ```format fs=fat32 quick```.

- Finally, mount your pendrive by typing ```assign letter=J```

- Now, close the Command Prompt and create the folder ```com.apple.recovery.boot``` on the pendrive. Copy ```OpenCorePkg-master\Utilities\macrecovery\BaseSystem.dmg``` and ```Basesystem.chunklist``` into that folder.

>  **Note**: If you can't find BaseSystem.dmg, use RecoveryImage.dmg and RecoveryImage.chunklist instead.

After the install media was created, we need to make the USB drive bootable.

### Configure and install OpenCore
Download the EFI folder from this repo, you will find the latest files under the release tab or just download the repo as it is. Move the folder to the root of your pendrive (e.g. J:\) and rename the folder to ```EFI```.

#### GenSMBIOS
We need a script, called [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS), to create fake serial number, UUID and MLB numbers. **This step is essential to have working iMessage, so do not skip it!**

The process is the following:

- Download GenSMBIOS as a ZIP, then extract it.
- Start GenSMBIOS.bat and use option 1 to download MacSerial.
- Choose option 2, to select the path of the config.plist file. It will be located in EFI -> OC folder.
- Choose option 3, and enter ```MacBookPro11,4``` as the machine type.
- Press Q to quit. Your config now should contain the requied serials.

#### Enter the proper ROM value
After adding serials to your config.plist, you have to add the computer's MAC address to the config.plist file. **This step is also essential to have a working iMessage, so do not skip it.** We need a Plist editior, to write the MAC address into the config.plist file. I used [ProperTree](https://github.com/corpnewt/ProperTree), since it works on Windows too. You have to change the MAC address value in the config.plist at

```PlatformInfo -> Generic -> ROM```

Delete the generic ```112233445566``` value, and enter your MAC address into the field, without any colons. Save the Plist file, and it is now ready to be written out to the EFI partition of your install media.

#### Default keyboard layout and language
The default keyboard layout and language is ```German```. To change the language, edit the value of ```NVRAM -> Add -> 7C436110-AB2A-4BBB-A880-FE41995C9F82 -> prev-lang:kbd``` to the value of your language. If your value contains an underscore ```_```, replace it with a hyphen ```-```. The value for English would be ```en-US:0```. You can find a list of all language values [here](https://github.com/acidanthera/OpenCorePkg/blob/master/Utilities/AppleKeyboardLayouts/AppleKeyboardLayouts.txt).

### Install OpenCore
After you've finished with the neccesary tweaks, you have to copy the EFI folder to the EFI partition of your pendrive.

## 🚚 Installation

### Prepare BIOS
The bios must be properly configured prior to installing macOS.
In Security menu, set the following settings:

-  `Security > Security Chip`: must be **Disabled**
-  `Memory Protection > Execution Prevention`: must be **Enabled**
-  `Internal Device Access > Bottom Cover Tamper Detection`: must be **Disabled**
-  `Anti-Theft > Current Setting`: must be **Disabled**
-  `Anti-Theft > Computrace > Current Setting`: must be **Disabled**
-  `Secure Boot > Secure Boot`: must be **Disabled**

In Startup menu, set the following options:

  
-  `UEFI/Legacy Boot`: **Both**
-  `UEFI/Legacy Priority`: **UEFI First**
-  `CSM Support`: **Yes**

Now you can go through the install.

### Install macOS
1. Boot from USB, press ```SPACE``` and select the USB drive inside of OpenCore ```"NO NAME (DMG)" or similar```.
>  **Note:** The first boot may take up to 20 minutes.
2. Wait for the macOS Utilities screen.
3. Select Disk Utility, select your disk and click erase. Give a name and choose **APFS** with **GUID Partition Map**.
4. After erasing, go back and select **Reinstall macOS** and follow the steps on your screen. The installation make take up to **2 hours**.
>  **Note:** Your PC will restart multiple times. Just boot from USB and select your disk inside of OpenCore. (named macOS Installer or the disk name).
5. Once you see the `Region selection` screen, you are good to proceed.
6. Create your user accound and everything else.

## 🚚 Post-Install

### Install EFI
1. Press `WIN + SPACE` and open terminal. Type `sudo diskutil mountDisk disk0s1` (where disk0s1 corresponds to the EFI partition of the main disk)
2. Open Finder and copy the EFI folder of your USB device to the main disk's EFI partition.
3. Unplug the USB device and reboot your laptop. Now you can boot macOS without your USB device.

### Fix Audio Jack noise
1. Copy `ALCPlugFix` to your desktop.
2. Press `WIN + SPACE` and open terminal. Type the following commands: 
```bash
sudo spctl --master-disable
sudo mkdir /usr/local/bin/
cd Desktop/ALCPlugFix
./install.sh
```
3. After that, type `hda-verb 0x1a SET_PIN_WIDGET_CONTROL 0x24`.

### Create a offline install media (Optional)

In case of reinstalling macOS, a offline install media can save some time. You also don't need an Ethernet connection for the installation.
To create a offline install media, you need the following stuff: 

- macOS Installer from the App Store.
- A 16 GB pendrive (Keep in mind, during the preperation we will format the disk to create the install media).

Press `WIN + SPACE` and open Disk utility. Select your USB device and click erase. Name it `MyUSB` and choose **Mac OS Extended** with **GUID Partition Map**. After erasing the USB device, close Disk utility.

Now press `WIN + SPACE` and open terminal. Type the following command:

Big Sur:
```sudo /Applications/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/MyUSB --downloadassets```

Catalina:
```sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/MyUSB --downloadassets```

Monterey:
```sudo /Applications/Install\ macOS\ Monterey.app/Contents/Resources/createinstallmedia --volume /Volumes/MyUSB --downloadassets```

After creating the install media, copy your EFI folder to the EFI partition of your USB device.

## ♻️ Upgrade macOS / Switch EFI

If you plan to upgrade your macOS (or updating the EFI / switching to HeliPort), you'll need a different OpenCore configuation (EFI). Please follow these steps:

> Note: Download the desired macOS version in the Settings before following these steps, if you are connected via WiFi.

1. Download the newest release & [ProperTree](https://github.com/corpnewt/ProperTree) and extract it.
2. Start ProperTree and load the ```Config.plist``` on your EFI partition. (File -> Open)
> Note: You can mount your EFI partition by pressing ```WIN + SPACE```, typing Terminal and enter the following command: ```sudo diskutil mountDisk disk0s1```.
3. Now also load the new configuration file from the repo for the desired macOS installation (or HeliPort config). 
4. You should now have 2 ProperTree-windows open on your screen.
5. Go in both windows to ```Root -> PlatformInfo -> Generic```. Transfer ```MLB, ROM, SystemProductName, SystemSerialNumber and SystemUUID``` to the new config. 
6. Save the new config (File -> Save) and close both windows.
7. Now delete your existing EFI folder from the EFI partition and copy the new one to it. (Make sure that the Directorys ```Boot and OC``` are in ```EFI```).

If you want to upgrade macOS, download the desired macOS version in the Settings app and perform the upgrade like on a real Mac.

## ⭐️ Feedback
Did you find any bugs or just have some questions? Feel free to provide your feedback using the Discussions tab.

## 📜 License

This repo is licensed under the [MIT License](https://github.com/valnoxy/t440p-oc/blob/main/LICENSE).

The following files are licensed under the [MIT License](https://github.com/valnoxy/t440p-oc/blob/main/LICENSE):
- SSDT-ADPT ```(Power Resources for Wake)```
- SSDT-ALS0 ```(Fake ambient light sensor)```
- SSDT-BATX ```(Battery driver)```
- SSDT-DEHCI ```(Disable EHCI controller)```
- SSDT-ECRW ```(ACPI driver for OEM hardware (YogaSMC))```
- SSDT-HPET ```(IRQ Conflicts fix (Needs _CRS to XCRS Rename))```
- SSDT-KBD ```(Brightness patch)```
- SSDT-LED ```(LED and Power Button blink patch)```
- SSDT-MCHC ```(AppleSMBus fix)```
- SSDT-PLUG ```(Plugin type to 1 for CPU0/PR00)```
- SSDT-PNLF ```(PNLF device for WhateverGreen)```
- SSDT-PWRB ```(Power button)```
- SSDT-SMBUS ```(Injects missing DVL0 device)```
- SSDT-THINK ```(ThinkVPC (YogaSMC))```
- USBMap.kext (USB Mapping for ```MacBookPro11,1```, ```MacBookPro11,4``` and ```MacBookPro12,1```)

OpenCore is licensed under the [BSD 3-Clause License](https://github.com/acidanthera/OpenCorePkg/blob/master/LICENSE.txt).

You can feely use these files for your projects, but please mention me.

---
```Copyright (c) 2018 - 2022 valnoxy. By Jonas G. <jonas@exploitox.de>```
