# TinyTapeout Demo Board

Demo board for TinyTapeout 4 and beyond.

![Demoboard PCB](https://raw.githubusercontent.com/TinyTapeout/tt-demo-pcb/main/doc/img/tt4-demoboard-preview.png)

This demonstration PCB allows you to interact with [TinyTapeout](https://tinytapeout.com/) projects in 3 ways:

  * directly, using the input DIP switches and 7-segment display;
  * via breadboard or extension boards through PMODs; or
  * by interacting through the on-board RP2040
  
This is a preliminary release: I'm having the PCBs fabbed and will be doing assembly, testing and tweaking.  Feedback and discussion are welcome on the [Discord #pcb channel](https://discord.gg/qZHPrPsmt6), specific issues should be posted here on github.

## Documentation

The full schematic is available as a [PDF](https://raw.githubusercontent.com/TinyTapeout/tt-demo-pcb/main/doc/demoboard-prelim-v1-0-3.pdf) but the gist of it is:

![Demoboard schematic](https://raw.githubusercontent.com/TinyTapeout/tt-demo-pcb/main/doc/img/tt4-schematic-preview.png)

The RP2040 is responsible for selecting projects, using the [multiplexer](https://github.com/TinyTapeout/tt-multiplexer/blob/main/docs/INFO.md) and under most circumstances providing the clock for the projects. It may, thereafter, interact with the design via it's connections to the input, output and bidirectional pins.

Another option is to use the various PMOD and pin headers to tie external circuitry to the design.  PMODs are provided in two varieties: straightforward I/O (where one PMOD is dedicated to each of in/out/bidir pins) and "standard" PMODs, that are mapped (mostly) according to specs to allow for SPI, I2C and UART extension boards to be plugged in (this assumes the project has been designed with this in mind, with I/O tasked accordingly). 

## RP2040 Pinout

| TT Pin    | RP2040 Pin | I2C      | SPI      | UART     |
| --------- | ---------- | -------- | -------- | -------- |
| ui_in[0]  | GPIO9      |          | SPI1.cs  |          |
| ui_in[1]  | GPIO10     |          | SPI1.sck |          |
| ui_in[2]  | GPIO11     |          | SPI1.tx  |          |
| ui_in[3]  | GPIO12     |          |          | UART0.tx |
| ui_in[4]  | GPIO17     |          | SPI0.cs  |          |
| ui_in[5]  | GPIO18     |          | SPI0.sck |          |
| ui_in[6]  | GPIO19     |          | SPI0.tx  | UART0.rts|
| ui_in[7]  | GPIO20     |          |          | UART1.tx |
| uo_out[0] | GPIO3 \*   |          |          |          |
| uo_out[1] | GPIO4 \*   |          |          |          |
| uo_out[2] | GPIO7 \*   |          |          |          |
| uo_out[3] | GPIO8 \*   |          | SPI1.rx  |          |
| uo_out[4] | GPIO13     |          |          | UART0.rx |
| uo_out[5] | GPIO14     |          |          | UART0.cts|
| uo_out[6] | GPIO15     |          |          |          |
| uo_out[7] | GPIO16     |          | SPI0.rx  |          |
| uio[0]    | GPIO21     |          | SPI0.cs  | UART1.rx |
| uio[1]    | GPIO22     | I2C1.sda | SPI0.sck | UART1.cts|
| uio[2]    | GPIO23     | I2C1.scl | SPI0.tx  | UART1.rts|
| uio[3]    | GPIO24     | I2C0.sda | SPI1.rx  | UART1.tx |
| uio[4]    | GPIO25     | I2C0.scl | SPI1.cs  | UART1.rx |
| uio[5]    | GPIO26     | I2C1.sda | SPI1.sck | UART1.cts|
| uio[6]    | GPIO27     | I2C1.scl | SPI1.tx  | UART1.rts|
| uio[7]    | GPIO28     |          |          |          |

\* These pins are multiplexed. They are connected to the RP2040 when GPIO1 is high.
