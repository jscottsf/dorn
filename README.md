# dorn

No, not Michael Dorn, but rather a simple wrapper around [sunrise](https://github.com/keep94/sunrise) to call `DayOrNight`. Perfect for determining if it's light or dark outside for various IoT projects.

Completely thrown together. Makefile included for building a Raspberry Pi executable. Bash friendly. Have fun!


## Usage

```
# Day or night in Los Angeles for current local time
dorn --lat 34.05 --lon -118.25 && echo "day" || echo "night"

# With minute offset (6 hours from now)
dorn --lat 34.05 --lon -118.25 --mm 360 && echo "day" || echo "night"
```
