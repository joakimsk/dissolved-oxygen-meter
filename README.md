# Dissolved Oxygen Meter

## Hardware
- Arduino Uno
- LCD 16x02 Keypad Shield
- OxyGuard DO Probe
- LM124N Operational amplifier (Or any other LMX24N) [datasheet](https://www.ti.com/lit/ds/symlink/lm324-n.pdf)

## Dissolved Oxygen probe
The OxyGuard is a galvanic cell. Figure out your model [here](https://www.oxyguard.dk/wp-content/uploads/2020/07/D02-Standard-Probe-brochure-GB-2020-07.pdf)

The one I have is a 4-wire with brown and blue for + and - from the galvanic cell. The NTC is between yellow and black, but not used for now. The output seems to be internally temperature compensated, so the NTC is not necessarily strictly needed. I believe my model is D0234C for mg/l and % saturation measurements.

A membrane keeps water out of the electrolyte solution, this membrane can be replaced.

See patent [4 495 051](https://patentimages.storage.googleapis.com/b0/aa/33/e8c414c19d55d3/US4495051.pdf) for a description of galvanic cell oxygen sensor.

## Circuit

The output is of a few millivolt, proportional to oxygen saturation. We use non-inverting op amp to amplify.

2.5 to 5 mV per mg/L of O2 dissolved should give us for sea water, up to 10 mg/L, or up to 50 mV output. We should probably assume that the value can end up at 80 mV under normal conditions.

Vin to Arduino is 5v, so our gain should be max 5000/80 = 62.5

I think we can say a gain of 50 is fine, so we do not max out the ADC.

The amplification of LMx24 is based on Rf = 1M and Rin = 8.4k, gain = 119.05
Output voltage = Input voltage * 119.05

![schematic](img/schematic.png)

Turns out the LM124N cannot take input above Vin-1.5v. We make gain 50 by using a 20.4k and a 1M resistor.

At 30 mV output, that is 1.5v to the ADC. ADC value around 307 with 10 bit and 5v supply voltage.

## Operation of software

We use the Select button to set calibration point at 100% DO2. You need to make 100% DO2 water. Take two buckets, and move seawater in between them maybe 30 times. Water should now have 100% DO2, sort of.

Samples are averaged, 16 samples at 50 ms intervals.

## Ref
[YSI Handbook](fondriest.com/pdf/ysi_do_handbook.pdf)