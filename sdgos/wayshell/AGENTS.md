# Wayshell Module System Agent Instructions

## Overview

This document provides instructions for the Wayshell Module System agent. The agent is responsible for managing the different module types and handling events.

## Module Types

### Zone Module

- **Initialization**: Initialize the Zone module by parsing the configuration files.
- **Event Handling**: Handle events for entering and exiting zones.

### Layout Module

- **Initialization**: Initialize the Layout module by parsing the configuration files.
- **Event Handling**: Handle events for activating and deactivating layouts.

### Focused Module

- **Initialization**: Initialize the Focused module by parsing the configuration files.
- **Event Handling**: Handle events for focusing and unfocusing clients.

## Configuration Files

- **wayshell.conf**: General configuration file.
- **wayshell.modules**: Defines the modules.

## Performance Optimization

- **Efficient Parsing**: Optimize the parsing of configuration files to minimize CPU usage.
- **Event Debouncing**: Implement debouncing for events to avoid unnecessary triggers.

## Testing

- **Unit Tests**: Write unit tests for each module type.
- **Integration Tests**: Write integration tests to ensure the modules work together correctly.
- **Performance Tests**: Conduct performance tests to ensure the system meets the CPU usage constraints.