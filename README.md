# Address Bloc

Address Bloc is a command line address book app for creating, reading, updating and deleting contact information. This project was built for [Bloc's Web Development Program](https://www.bloc.io/web-developer-career-track)

## Getting started
1. Download all files or clone this repository
2. In your command line, `cd` to the `address-bloc` directory
3. Run the program by typing `ruby address_bloc.rb` in your command line

## Usage examples
Address Bloc allows you to choose from a menu of options.  
```
Welcome to AddressBloc!
Main Menu - 15 entries
1 - View all entries
2 - View entry by #
3 - Create an entry
4 - Search for an entry
5 - Import entries from a CSV
6 - Demolish all entries
7 - Exit
Enter your selection:
```

**1 - View all entries:** This option allows you to browse through all the entries in your address book one by one. With each entry, you can also edit the information or delete the entire entry. Return to the main menu at any time.
```
Name: Jane Doe
Phone Number: 123-456-7890
Email: jane@blocmail.com
n - next entry
d - delete entry
e - edit this entry
m - return to main menu
```

**2 - View entry by #:** If you know where in your address book someone is saved, this option will let you go directly to their entry. For example, if want Jane Doe's contact information and you know she is the second entry, you can type "2" and hit enter to be taken directly to her entry.
```
Enter '0' to exit to main menu
Entry #: ____
```

**3 - Create an entry:** This option will let you add a new entry to your address book. You will be prompted for a name, phone number and email address.
```
New AddressBloc Entry
Name: John Doe
Phone number: 987-654-3210
Email: john@blocmail.com
```

After you enter the information, you'll be taken back to the main menu, where you'll receive a confirmation message and see your new total number of entries increase by one.
```
New entry created
Main Menu - 16 entries
```

**4 - Search for an entry:** If you want to search for a specific person, this option will let you find that person's contact information by searching for them by name.
```
Search by name: __________________
```

**5 - Import entries from a CSV:** With this option, you can import data directly from a CSV file by typing its relative path. For example, if you have a file called `entries.csv` saved in the `address-bloc` directory, you can simply type the file name, like so:
```
Enter CSV file to import: entries.csv
```

For the data to be imported correctly, your CSV must be formatted like this:
```
name,phone_number,email
Bill,555-555-1234,bill@blocmail.com
Bob,555-555-2345,bob@blocmail.com
Sally,555-555-3456,sally@blocmail.com
Susie,555-555-4567,susie@blocmail.com
```

Just as with creating an entry, you'll be taken back to the main menu, where you'll receive a confirmation message and see your new total number of entries increase by the number of entries in your CSV.
```
4 new entries added from entries.csv
Main Menu - 20 entries
```

**6 - Demolish all entries:** If you want to completely destroy all of the entries in your address book, this option will take care of it for you in one fell swoop.
```
Are you sure you want to demolish all entries?
1 - Yes, demolish all entries.
2 - No, do not demolish anything.
```

**7 - Exit:** To exit the program, choose this option.
```
Goodbye!
```
