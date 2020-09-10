# MOJO game

<p align="center"> 

<a href="https://github.com/zackteo/MOJO-game/blob/readme/Images/Poster/team3-4_50002_1D_Poster.pdf"><img src="https://github.com/zackteo/MOJO-game/blob/readme/Images/Poster/team3-4_50002_1D_Poster.png"></a>
</p>


## Introduction
Having learnt about the inner workings of a Computer in 50.002 Computation Structures, our group was tasked to design and build an Electronic Game, based on the principles we have learnt.

Keeping the Beta Architecture in mind, we had to design our game’s architecture based on a similar model, ie having registers to keep track of data, having various control signals to control and modify the data path; centered around an ALU to do arithmetic and logical operations, et cetera. 

We also were to use an FSM to keep track of the various states of our game, helping us to modify control signals according to those states. 

Building the game, we had to use an FPGA known as Mojo to emulate the hardware architecture we designed.

## Design
Cal-Q-Laner is an educational game involving simple mathematical operations such as addition, subtraction and multiplication. It is a two-player competitive game, where the goal is to capture more lanes than your opponent. In other words, reaching mores flags (the centre of each lane) first. To advance in the lane, the player has to reach the current goal number faster than his/her opponent. This is done using the mathematical operations provided effectively. Players are also given a clear button to reset their number back to zero.

We took inspiration from Calculords, a turn-based tower defence game that one of our members had been playing. Its core mechanic revolves around using mathematical operations to fulfil a unit’s specific summoning cost (to summon that unit). 
