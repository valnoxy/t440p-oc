# Lenovo ThinkPad T440p Hackintosh (OC)

![macOS Big Sur running on the T440p](https://dl.exploitox.de/t440p-oc/Hackintosh_T440p_Proof.png)

## Information
This guide is only for the ThinkPad T440p. 

I am NOT responsible for any harm you cause to your device. This guide is provided "as-is" and all steps taken are done at your own risk.

### What works:

 -   WiFi & Bluetooth (Intel)
 -   Brightness/Volume Control
 -   Battery Information
 -   Audio (Audio Jack & Speaker)
 -   USB Ports, Built-in Camera
 -   Graphics Acceleration
 -   Trackpoint/Touchpad
 -   Power management/sleep
 -   FaceTime/iMessage

### Not tested yet:

 - DisplayPort & VGA
 - Automatic OS updates
 - Dock USB ports
 - Dock HDMI, DisplayPort, DVI and VGA
 - DVD Drive

## Changelog

### Version 1.0 (14.11.2020)
Initial Release.

# Installation Guide
## Requirements

 You must have the following stuff:
 - Lenovo ThinkPad T440p (Obviously :D).
 - Access to a working Windows machine.
 - A 16 GB pendrive (Keep in mind, during the preperation we will format the disk to create the install media).
 - a Internet connection over LAN.
 - 1-2 hours of your time.

## Preperation
### Creating the install media
First of all, you will need the install media of macOS. I will use [gibMacOS](https://github.com/corpnewt/gibMacOS) to download and create the macOS Install media.

With gibMacOS script, the process is the following:

 - Download gibMacOS as a ZIP.
 - Extract the gibMacOS-master folder.
 - Run gibMacOS.bat, and choose the macOS Version that you want to install.
> Note: If you want to install macOS Big Sur, download and create a macOS Catalina install media. We will upgrade to macOS Big Sur later.
 - After the download succeeded, launch MakeInstall.bat, plug in your pendrive and type the device number. After formatting your pendrive, enter the path of the previously downloaded files. Wait until this process ends, it will take a while.

After the install media was created, we need to make the USB drive bootable by PCs.

### Configuring and installing OpenCore
Download the EFI folder from this repo, you will find the latest files under the releases or just download the repo as it is.

We will now configuring the OpenCore config.

#### GenSMBIOS
We need a script, called [GenSMBIOS](https://github.com/corpnewt/GenSMBIOS), to create fake serial number, UUID and MLB numbers. **This step is essential to have working iMessage, so do not skip it!**

The process is the following:

 - Download GenSMBIOS as a ZIP,  then extract it.
 - Start GenSMBIOS.bat and use option 1 to download MacSerial.
 - Choose option 2, to select the path of the config.plist file. It will be located in EFI -> OC folder.
 - Choose option 3, and enter MacBookPro11,1 as the machine type.
 - Press Q to quit. Your config now should contain the requied serials.


#### Enter the proper ROM value

After adding serials to your config.plist, you have to add the computer's MAC address to the config.plist file. **This step is also essential to have a working iMessage, so do not skip it.** We need a Plist editior, to write the MAC address into the config.plist file. I used [ProperTree](https://github.com/corpnewt/ProperTree), since it works on Windows too. You have to change the MAC address value in the config.plist at 

    PlatformInfo -> Generic -> ROM

Delete the generic 112233445566 value, and enter your MAC address into the field, without any colons. Save the Plist file, and it is now ready to be written out to the EFI partition of your install media.

### Install OpenCore
After you've finished with the neccesary tweaks, you have to copy the EFI folder the EFI partition of your pendrive. 

## Installation
### Prepare BIOS

The bios must be properly configured prior to installing MacOS.

In Security menu, set the following settings:

-   `Security > Security Chip`: must be  **Disabled**
-   `Memory Protection > Execution Prevention`: must be  **Enabled**
-   `Internal Device Access > Bottom Cover Tamper Detection`: must be  **Disabled**
-   `Anti-Theft > Current Setting`: must be  **Disabled**
-   `Anti-Theft > Computrace > Current Setting`: must be  **Disabled**
-   `Secure Boot > Secure Boot`: must be  **Disabled**

In Startup menu, set the following options:

-   `UEFI/Legacy Boot`:  **Both**
-   `UEFI/Legacy Priority`:  **UEFI First**
-   `CSM Support`:  **Yes**

Now you can go through the install.

### Install macOS

 1. Boot from USB and select the USB drive inside of OpenCore.
	 - **Note:**  The first boot may take up to 20 minutes.
 2. Wait for the macOS Utilities screen.
 3. Select Disk Utility, select your disk and click erase. Give a name and choose **APFS** with **GUID Partition Map**. 
 4. After erasing, go back and select **Reinstall macOS** and follow the steps on your screen. The installation make take up to **2 hours**.
      - **Note:** Your PC will restart multiple times. Just boot from USB and select your disk inside of OpenCore. (named macOS Installer or the disk name).
 5. Once you see the `Region selection` screen, you are good to proceed.
 6. Create your user accound and everything else.
 7. After you've booted, press `ALT + SPACE` and open terminal. Type `sudo diskutil mountDisk disk0s1` (where disk0s1 corresponds to the EFI partition of the main disk)
 8. Open Finder and copy the EFI folder of your USB device to the main disk's EFI partition.
 9. Unplug the USB device and reboot your laptop. Now you can enjoy your working installation.

### Upgrading macOS to Big Sur
If you want to install macOS Big Sur, you need to upgrade your macOS installation. After installing macOS Catalina, download the macOS Big Sur Installer from the App Store. Then start the installer and follow the steps on your screen. This process can take up to **1-2 hours**.

## (Optional) Creating a offline install media
In case of reinstalling macOS, a offline install media can save some time. You also don't need a Ethernet connection for the installation. 

To create a offline install media, you need the following stuff:

 - macOS Installer from the App Store.
 - A 16 GB pendrive (Keep in mind, during the preperation we will format the disk to create the install media).
 
 Press `ALT + SPACE` and open Disk utility. Select your USB device and click erase. Name it `MyUSB` and choose **Mac OS Extended** with **GUID Partition Map**. After erasing the USB device, close Disk utility. 

Now press `ALT + SPACE` and open terminal. Type the following command:

Big Sur:

   ```sudo /Applications/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/MyUSB --downloadassets```

Catalina:
```sudo /Applications/Install\ macOS\ Catalina.app/Contents/Resources/createinstallmedia --volume /Volumes/MyUSB --downloadassets```

After creating the install media, copy your EFI folder to the EFI partition of your USB device.

## Feedback
Did you find any bugs or just have some questions? Feel free to provide your feedback using the Issues tab on GitHub or send me a mail to `hey@exploitox.de`.