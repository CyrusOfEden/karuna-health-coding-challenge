# `Brainfuck` Execution Visualizer

> [`Brainfuck`](https://en.wikipedia.org/wiki/Brainfuck) is an esoteric programming language created in 1993 by Urban Müller, and notable for its extreme minimalism.

> The language consists of only eight simple commands and an instruction pointer. While it is fully Turing complete, it is not intended for practical use, but to challenge and amuse programmers. Brainfuck simply requires one to break commands into microscopic steps.

You do not need any background context on compilers or the `Brainfuck` language to complete this challenge.

We want to build an _execution visualizer_, which is a web app that executes a program step by step, and can show at any given time where we are in the program's execution (which line is being run currently), and what our memory currently looks like. An example of an execution visualizer can be found [here](https://goo.gl/nDth8B). We recommend you play with this example for a bit to get familiar with what we are trying to build.

We will provide an API implementing a `Brainfuck` interpreter that will execute a program one step at a time, and return after each step a dump of the current memory.

Build a functional, standalone React app that takes in a Brainfuck script (e.g. in a text field), shows the parsed script being executed, intelligently displays the parts of the data array which are not empty (including the string representations of the cell contents, if possible), and indicates where the instruction and data pointers are. There should be a visual indication (animations, colours, etc.) when any of these change.

This assignment is intentionally open-ended; build whatever you think is appropriate to help someone understand the execution of a Brainfuck script.

To help with this assignment, we provide an API which parses and executes a given script. Initially, you might want to avoid scripts that require input. If you have time, you can add support for providing input via the endpoint below.

#### `POST /brainfuck`

This endpoint takes one mandatory parameter, `script`, which is a string containing the Brainfuck script to be executed. It also takes an optional `input` parameter, which is used to buffer some input characters before execution begins.

The response is a representation of the state of a Brainfuck execution environment. This state contains an ID which you need to step through the execution of the script. It also contains an array representing the parsed script, and another showing the data array (this will be quite long).

```json
{
  "id": "3fd24c3b-973d-47d6-8e47-b90f7e9a4bb3",
  "done": false,
  "instruction_pointer": 0,
  "data_pointer": 0,
  "input": "",
  "output": "",
  "script": [
    "+",
    "+"
  ],
  "data": [
    0,
    0
  ]
}
```

#### `POST /brainfuck/<id>/step`

This endpoint takes an optional `input` parameter: a string to be concatenated to the input buffer.

This endpoint also takes an optional `count` parameter: the number of steps to take (defaults to 1).

After processing any additional input, this endpoint steps the Brainfuck interpreter forward by one instruction, and returns the state. Any output thus far can be found in the state, as well as the current values for the instruction and data pointers.
