# Generics

[TOC]

## References

- Liang: Chp. 19, pgs. 752 - 771
- Bloch: pgs. 117 - 138
- https://docs.oracle.com/javase/tutorial/java/generics/index.html

## Synopsis

- Generics let you parametrize types
  - This means you can define a class or method with a generic type
  - The compiler can replace the generic type with a concrete type when used
- Originally created to address some problems with collections
- Refers to the technique of writing code for a class without specifying the data type(s) that the class works on
- Allows you to define **type-safe** data structures without committing to actual data types

## Benefits

- Stronger type checks at compile time
  - Fixing compile-time errors is easier than fixing runtime errors
- Elimination of casts, which improves peformance
  - Casting only happens at runtime
- Enables implementation of generic solutions that can be reused for multiple purposes
- Futureproofing for the data types of tomorrow

## Examples

### Collection without generics

```java
List listNames = new ArrayList();
listNames.add("Tom");
listNames.add("Mary");
listNames.add("Peter");

String name2 = (String) listNames.get(1);

Date startDate = new Date();
listNames.add(startDate);

String name2 = (String) listNames.get(3);
```

This will yield no compile error, but will cause a runtime exception:
```text
java.lang.ClassCastException: java.util.Date cannot be cast to java.lang.String
```

### Collection with generics

```java
List<String> listNames = new ArrayList<String>();
listNames.add("Tom");
listNames.add("Mary");
listNames.add("Peter");

Date startDate = new Date();
listNames.add(startDate);
```

Yields a compiler error:

```text
cannot find symbol
symbol  : method add(java.util.Date)
location: interface java.util.List<java.lang.String>
```

This list, listNames, is supposed to store String objects
Here, the cast to String is needed because the get() method returns an object of type Object.
Basically, you can add anything to this list as long as its an object -
otherwise they would have had to create a bunch of different types.
This kind of problem would produce unsafe code with potential bugs as the type
of the objects added to the collection cannot be verified by the compiler and compile time.

Casting only happens at runtime and we don't want a class that can only be used for
Strings - StringList, AppleList, DoubleList, etc.

## Defining Generic Classes and Interfaces

- A generic type can be defined for a class or an interface
- A concrete type must be specified when using the class to create an object
- A concrete type must be specified when using the class or interface to declare a reference variable
- You can define a class or an interface as a subtype of a generic class or interface
  - For example, the String class implements the Comparable interface in the Java API
- A generic class may have more than one parameter in angular brackets
  - AKA diamond brackets/diamonds
  - They are seperated by commas

## 