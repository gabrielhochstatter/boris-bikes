# User stories

## Nouns
* Person
* Bike
* Station

## Verbs
* Use
* Docking
* Release
* See
* Working



### USER STORY 1

| Objects       | Messages      |
| ------------- | ------------- |
| Person        | req_bike      |
| Station       | release_bike  |

### USER STORY 2

| Objects       | Messages      |
| ------------- | ------------- |
| Person        |               |
| Bike          | is_working?   |  
| Station       | check_bike    |

### Diagram

```
Person =req_bike=> Station

Station =check_bike=> Bike (is the bike working?)
Bike =is_working?=> Station (true / false)

(if is_working? is true)

Station =release_bike=> Person


```
