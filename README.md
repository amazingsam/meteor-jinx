
# meteor-jinx
A simple toolbox for Meteor, made in CoffeeScript, containing:

- **a command line interface** (CLI)
- **Atom.io integration**

This is not an official Meteor supported package. But this package surely supports [Meteor](https://www.meteor.com). Jinx toolbox needs Meteor to be installed.

## Usage

The generator tool works with recipes and structure, using the following syntax
````
$ jinx <task|generator> <recipe> <identifier> <target> <options>
````
Don't worry, shorthands are in there too:
````
$ jinx <t|g> <r> <identifier> # using default settings
````

## About
The Jinx toolbox is merely something that can ease you into development in Meteor if you come from the world of generators and being lazy. Its current version is **0.0.9**, so don't think it will marvel you (at all).

In fact, currently **it partially works**.

The difference between other available CLI and toolboxes is that it is aimed to generate CoffeeScript output, has some lazy options to save time -- or better said effort. Another philosophy is that it easily to customize. You don't need to be a superior codeninja to change package structures; basic understanding of CoffeeScript and JSON is more than enough to get you there.

Because of the CoffeeScript output, it will have a build tool too. Also, because its intention to use for industrial solutions, it works with testing strategies, various stages of deployment and auto documentation.


## Installation
It is not even close to try yet. This section is for the future.

####OSX
````
$ git clone https://github.com/amazingsam/meteor-jinx.git
````

####Linux
````
$ install nothing
````

####Windows
````
> install nothing
````

## Quick Start

A decent story here anyone can understand.

## Examples

Initialize a Jinx Workspace with the default structure

````
$ cd meteor-jinx
$ node lib/jinx.js create workspace <yourappname>
````

Generate an useless Blaze template (won't write to disk - yet)

````
$ cd meteor-jinx
$ node lib/jinx.js generate blaze <templatename>
````
