# Project Documentation: Periodic Table Database Query Script
### Overview:
- [Introduction](#introduction)
- [Database Information](#datbase-information)
- [Project Script](#project-script)
- [Usage](#usage)
- [Code Structure](#code-structure)

## Introduction

This project involves a command-line script designed to interact with a PostgreSQL database containing information about chemical elements. The script takes user input in the form of element symbols, element names, or atomic numbers and retrieves relevant information about the corresponding chemical elements from the database. The project is aimed at providing users with quick access to key data about chemical elements.

## Database Information

The PostgreSQL database used in this project is named "periodic_table." It contains three tables: "elements," "properties," and "types."

- **Elements Table:** Contains information about chemical elements, including their atomic number, symbol, and name.
- **Properties Table:** Stores various properties of chemical elements, such as atomic mass, melting point, boiling point, and a reference to the element's type.
- **Types Table:** Describes the type of each chemical element (e.g., nonmetal, metal, or metalloid).

## Project Script

The script is implemented as a Bash shell script and is designed to work with the PostgreSQL database using the `psql` utility.

## Usage

The script allows users to query the database for information about chemical elements by providing one of the following as a command-line argument:

1. **Element Symbol:** If a single or two-character string is provided as an argument, the script checks if it matches a known element symbol in the database. If a match is found, the script retrieves and displays information about the element.

2. **Atomic Number:** If a numerical value is provided as an argument, the script checks if it matches a known atomic number in the database. If a match is found, the script retrieves and displays information about the corresponding element.

3. **Element Name:** If an alphabetic string is provided as an argument, the script checks if it matches a known element name in the database. If a match is found, the script retrieves and displays information about the element.

The script performs the following actions:

- Connects to the "periodic_table" database using the PostgreSQL username "freecodecamp."
- Queries the appropriate table to retrieve information about the requested element.
- Displays information such as the element's name, symbol, atomic number, type, atomic mass, melting point, and boiling point.

## Code Structure

The script uses conditional statements to determine the type of input provided by the user (symbol, atomic number, or name). It then constructs SQL queries based on the user's input and sends these queries to the PostgreSQL database.
