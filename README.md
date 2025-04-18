# h‑racing

h‑racing is a Swift/UIKit mobile application for horse racing sumulation

## Features

1. **Race Simulation**
    - **Race Screen**: Displays five horses running side by side.
    - **Controls**: “Start” and “Restart” buttons implemented with `UIAction` closures.

2. **History**
    - **History Screen**: Shows a list of completed races.
    - **Race Entry**: Each record includes:
        - Date and time of the race
        - Finish order of the horses

3. **Persistence**
    - **Realm Integration**: Local data storage powered by the `RealmSwift` library.
    - **Model**: `RealmRaceResult` with persisted properties `date` and `order` (`List<Int>`).

4. **Architecture**
    - **MVP Pattern**: Business logic resides in Presenters; `ViewController`s handle only UI updates.

## Requirements

- iOS 15.6 or later
