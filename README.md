## Introduction
This is a simple CLI warehouse application. The user can (re)initialize the application with a new store, with specific dimensions. 
In the store crates that contain products of a specific type can be kept.  
After the initialization, the user is able to add crates to the store, locate crates, remove crates and view the store.

## Architecture
The application is divided in the two following modules:
* The ```Commands``` module
* The ```Store``` module

##### *The commands module* 
The *commands* module encapsulates the logic and the execution of the commands. Each command is implemented in a separate class, that derives from the class *Command*. 

In order to take advantage of [duck typing](https://en.wikipedia.org/wiki/Duck_typing), a common interface between all commands has been enforced.
Every command class should implement the *execute* method, that will be called when a command is given by the user.

##### *The store module*
The *store* module encapsulates the business logic of the warehouse. In this module the store class that represents a store of the warehouse is implemented.
The store should be initialized with the following two attributes:
* The *width* of the store.
* The *height* of the store.
  
In the store the crates are kept. The crate object should be initialized with the following three attributes:
* The *starts_at* attribute, which is an object of the *position* class, that represents the bottom-left corner of the crate.
* The *ends_at* attribute, which is an object of the *position* class, that represents the top-right corner of the crate.
* The *product_code* attribute, that represents the type of the products that are inside the crate.

## Usage
To use the simple CLI warehouse application you should have installed the *ruby-2.3.1*.

To start the application, type:
```
ruby runner.rb
``` 

##### *The commands*

###### help
The *help* command prints information about the usage of each command.

###### init
The *init* command (re)initializes the warehouse with a new store. It receives two arguments that represent the dimensions of the store.
If the arguments are not correct an error will be displayed.

Example: 
```
init 30 20
```
The previous command will (re)initialize the warehouse with a new store. The new store's *width* will be 30 units and the *height* will be 20 units.

###### store
The *store* command adds a new crate in the store. Before adding the new crate, it checks if the crate overlaps with another, or if the new crate fits in the given position. 
The *store* command receives 5 arguments.
* The first two arguments represent the starting position of the crate which is the bottom-left corner.
* The next two represent the width and the height of the crate.
* The last one represents the type of the products that are included in the crate.

If the arguments are not correct an error will be displayed.

Example:
```
store 0 1 5 6 T
``` 
In the previous example, a new crate will be added to the store in the position 0,1. The width of the crate will be 5 units and the height 6 units. The product will be of type T.  

###### remove
The *remove* command drops a crate from the store. The command is clever enough to recognize a crate by any point of its slot.
It receives two arguments which represent a position in the store.

If the arguments are not correct an error will be displayed.

Example:

```
remove 2,2
```

The previous command removes the crate that includes the given position.

###### view
The *view* command paints the current state of the store.

Example: 
```
view
```

###### locate
The *locate* command prints the starting (bottom-left corner) and ending (top-right corner) points of all the crates that include a specific type of product.
It receives one argument that represents the type of the product of interest.

Example: 
```
locate
```

###### exit
The *exit* command terminates the application.

Example:
```
exit
```

You can easily add a new command to the application, by creating a new class in the module *commands* and implementing its execute method.
You also have to extend the *find* class method of the Commands::Command class.

## Testing
The application is fully unit tested, using Rspec. To run the test suite type in your terminal:

```
rspec spec
```

## License

The application is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
