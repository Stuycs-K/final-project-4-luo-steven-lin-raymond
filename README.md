[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/syDSSnTt)
# APCS2 Final Project

## Group Info

Group Members: Raymond Lin, Steven Luo

Group Name: Upsilon Excavators

## Overview

This is a timed digging game in which the player must dig as far as possible, eventually reaching the other side of the world.

During each dig, the player can mine different ores. These ores can be used to buy bombs, upgrades to the player's timer, and upgrades to the player's digging distance.

During each dig, the player may also find "time ores" which temporarily gives more time to the player.

Although the player can dig in four cardinal directions, the player can only move sideways and down. However, if the player goes deep enough, they may eventually encounter a mole, which digs sideways and up. Moles allow the player to reach spots that they may have otherwise missed.

## Instructions

In the menu:
- Press the buttons displaying a modifier with a cost to buy that modifier.
  + If the button is red, then the player does not have enough resources to buy the modifier.
  + If the button is green, then the player has enough resources to buy the modifier.
  + If the button is gray, then the player can not buy any more modifiers of that type.
- Press "Begin Game" to begin the game.

In the game:
- Use the A, S, D (or their corresponding arrow keys) to move the player and dig in that direction.
- Use the W (or UP arrow key) to dig up. The player will not move.
- Use B to bomb a certain area. The player will automatically drop.
- Use Q to quit the current digging session.

## [Presentation] (https://drive.google.com/file/d/1-fUCNs1dRcO_qBYCj3-_hVbrl82_tGw4/view?usp=sharing)

## Bugs

- When the digging upgrades are applied, the player's movements lags a little bit.
- The mole may not work as intended if it is mined during map generation.
