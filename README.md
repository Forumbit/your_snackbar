### Your SnackBar
Flutter customizable SnackBar

## Usage

Add function "showYourSnackbar" for show customizable snackbar

```dart
onPressed: () => showYourSnackbar(
                context,
                height: 80,
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.airplane_ticket, color: Colors.white),
                    SizedBox(width: 20),
                    Text(
                      'Ticket Added',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
```

![Video Frame](https://github.com/Forumbit/your_snackbar/blob/master/assets/video/how-work.gif)

## [MIT License](https://opensource.org/licenses/MIT)