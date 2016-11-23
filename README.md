# Job

## A Cuberite Job Plugin

Simple Job system plugin that will reward with Coin.  Requires Coin plugin.

### Jobs

Current jobs supported in the system.  To set the values of blocks or to add blocks update the values.ini file.  Remember to `/reload` or restart the server.

* builder - The builder is rewarded for placing blocks set in the values.ini file.
* crafter - Get Coin based on crafted items.
* fisherman - Make Coin for fishing.
* gatherer - To get rewards gather items.
* miner - Mine blocks to gain Coin.
* woodcutter - Get rewards for cutting trees.

### Values

To set the values for different blocks and jobs update the `values.ini` file located in the root of the plugin folder.  For a list of possible blocks please reference the `items.ini` file.  For ids of blocks [http://api-docs.cuberite.org/Globals.html#constants](http://api-docs.cuberite.org/Globals.html#constants).  Will start with `E_BLOCK` or `E_ITEM` on the site but have been removed for readability in the `ini` files.

__If a block label and id are not defined in the `items.ini` file then it will not work if added in `values.ini`.__

### TODO
* Job experience points and levels maybe.
* Add `brewer` job to system.
* Add `baker` job to system.
* Add hacking or cheating prevention for things like:
  - placing a block and breaking it within a certain amount of time
  - being in creative mode and performing jobs

### Contribute
* 2 spaces for indention
* Recommendations welcome

### License
MIT License

Copyright (c) 2016 Dustin Engle

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
