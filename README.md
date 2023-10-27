# About Countdown Timer on 14-Segment Indicators
This project models the operation of a countdown timer on 14-segment indicators. There are 8 modes for switching using an eight-position key. The working circuit was developed in the Multisim simulation program and the corresponding program was written in Assembler in the Keil development IDE.
# Work details
The block diagram of the countdown timer (Fig. 1.1) consists of three systems (blocks): external control periphery, data processing system, and information output system.
The external control peripheral system consists of an eight-position key that switches the number of minutes from which the countdown starts.
The data processing system consists of three types of components: a multiplexer, a microcontroller, and two decoders. The task of the multiplexer is to provide information about the position of the key. The microcontroller, according to the information received from the multiplexer, decides how and for how long to form an algorithm for the countdown. The decoder, in its turn, decides in which registers of the indicators to write the characters set by the microprocessor.
The information output system consists of registers and their corresponding 14-segment indicators. The registers receive data from the decoders and transmit it to the indicators, which in turn display a digit or letter according to the code written in the microcontroller program.
To start the countdown timer device, it is enough to connect a quartz resonator to it and apply 5 V. Then, depending on which position from one to eight the key is in, the countdown will start from the corresponding minute. For example, if you turn the key to the 3rd position, the countdown will start from the 3rd minute.
# Requirements
- Windows 7+ Operating System
- NI Multisim
- Keil uVision
# License
- GNU General Public License v3.0
