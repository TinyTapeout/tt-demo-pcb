# TinyTapeout Demo Board

## Documentation

## Proposed RP2040 IO table

### Inputs

| TTO Input | RP2040 GPIO | I2C      | SPI      | UART     | ADC  |
| --------- | ----------- | -------- | -------- | -------- | ---- |
| 0         | GPIO14      | I2C1.sda | SPI1.sck |          |      |
| 1         | GPIO15      | I2C1.scl | SPI1.tx  |          |      |
| 2         | GPIO16      | I2C0.sda | SPI0.rx  | UART0.tx |      |
| 3         | GPIO17      | I2C0.scl | SPI0.rx  | UART0.rx |      |
| 4         | GPIO18      | I2C1.sda | SPI0.sck |          |      |
| 5         | GPIO19      | I2C1.scl | SPI0.tx  |          |      |
| 6         | GPIO20      | I2C0.sda |          |          |      |
| 7         | GPIO21      | I2C0.scl |          |          |      |

### Outputs

| TTO Output | RP2040 GPIO | I2C      | SPI      | UART     | ADC  |
| ---------- | ----------- | -------- | -------- | -------- | ---- |
| 0          | GPIO9       | I2C0.scl | SPI1.cs  | UART1.rx |      |
| 1          | GPIO8       | I2C0.sda | SPI1.rx  | UART1.tx |      |
| 2          | GPIO7       | I2C1.scl | SPI0.tx  |          |      |
| 3          | GPIO6       | I2C1.sda | SPI0.sck |          |      |
| 4          | GPIO22      |          |          |          |      |
| 5          | GPIO26      | I2C1.sda |          |          | ADC0 |
| 6          | GPIO27      | I2C1.scl |          |          | ADC1 |
| 7          | GPIO28      |          |          |          | ADC2 |
