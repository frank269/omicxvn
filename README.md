# omicxvn

Omicx VN Mobile App


# Architecture

![#fff](https://miro.medium.com/max/1250/1*t-iY-K6Hk796RrrRfCg66Q.png)

# File Structure

```
lib
  ├── components                # Components
  |
  ├── models                    # Model classes
  |
  ├── notifiers                 # Notifier Classes             
  |
  ├── screens                   # screens
  |
  ├── interfaces                # interfaces
  |
  ├── services                  # services
  |
  └── main.dart              
```

# get_it + injectable + injectable_generator

Script to auto generate injection after save
```
flutter packages pub run build_runner watch
```