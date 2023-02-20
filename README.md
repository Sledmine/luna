# luna
Minimalistic, simple and easy module to extend and load util functions for Lua.

## Introduction
Luna provides a set of functions to extend the Lua language and make it more powerful and handier
to use, it provides a set of functions that are useful in most of the cases, it replicates some
of the features of other languages like JavaScript and Python. It follows one simple rule:
"Keep it simple, stupid", by encouraging the use of functional programming, EmmyLua like
annotations, no dependencies, no globals and no monkey patching.

## Why Luna?
Lua is a great language, but it lacks some features that are present in other languages out of the
box. You may be tempted to add your own home made functions to your Lua project to try fill the
gap, but that's not optimal all the time. Luna defines a natural way to extend Lua and make it
more powerful by "including some batteries" while providing compatibility with your IDE and the Lua
API.

## Rules
Luna follows a set of simple rules to make it easy to use and understand:
- Lua like API, short lower case, one or two word names
- Functional programming
- EmmyLua annotations
- No side effects
- No discardable values
- No globals
- No monkey patching
- No dependencies
- No iterators
- No metatables
