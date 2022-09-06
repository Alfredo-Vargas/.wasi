# Useful commands

## Installing Android Studio in `DWM`

```console
export _JAVA_AWT_WM_NONREPARENTING=1
```

## Enable your mobile to be used as `AVD` (Android Virtual Device)

For Samsung Galaxy go to: `settings -> About Device -> Software Info -> Build (tap 7 times)`
The Developer tools should appear in a previous step of your phone.

## Install `ADB` (Android Debug Bridge)

On Arch Linux

```
console
sudo pacman -S scrcpy
```

## Check if your android device is plugged via USB:

```
console
adb devices
```

# Theory

## Difference between var and val

Declarations using var can be reassigned to other values, unlike val variable declarations that can only be used to changes its properties.

## Units

1. **`px`** correspond to actual pixels on the screen.
2. **`in`** physical inches on the screen.
3. **`pt`** points are 1/76 of an inch.
4. **`dp`** or **`dip`** density independent pixels, 1 `dp` is 1 pixel on 160 dpi screen.
5. **`sp`** scalable independent pixel, used for fonts.

## Database

1. Tables are denoted by: `@Entity`.
2. `Dao` are the **database access object** that defines the methods that access the given Entity.
3. Database itself which contains a database holder.
4. Repository, class that abstract access to multiple data sources (for code separation and clean architecture)
5. `ViewModel` provides data to the UI and survive configuration changes. A `ViewModel` acts as a communication center between the Repository and the UI.

### Tips:

- Is bad practice to launch the database from the main thread, instead using a background thread.
