require_relative '../models/address_book'

class MenuController
  attr_reader :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - View entry by #"
    puts "3 - Create an entry"
    puts "4 - Search for an entry"
    puts "5 - Import entries from a CSV"
    puts "6 - Exit"
    print "Enter your selection: "

    selection = gets.to_i

    case selection
    when 1 # view all entries
      system "clear"
      view_all_entries
      main_menu
    when 2 # view entry by #
      system "clear"
      view_entry_number
      main_menu
    when 3 # create an entry
      system "clear"
      create_entry
      main_menu
    when 4 # search for an entry
      system "clear"
      search_entries
      main_menu
    when 5 # import entries from CSV
      system "clear"
      read_csv
      main_menu
    when 6 # exit
      puts "Goodbye!"
      exit(0)
    else
      system "clear"
      puts "Sorry, that is not a valid input. Please try again."
      main_menu
    end
  end

  def view_all_entries
    address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      entry_submenu(entry) # see entry_submenu below
    end

    system "clear"
    puts "End of entries"
  end

  def view_entry_number
    puts "Enter '0' to exit to main menu"
    print "Entry #: "
    selection = gets.chomp.to_i

    case selection
    when 0
      system "clear"
      main_menu
    when 1..address_book.entries.length
      system "clear"
      i = selection - 1
      puts address_book.entries[i]
      puts "---------------"
      view_entry_number
    else
      system "clear"
      puts "Sorry, that is not a valid entry number.\nThere are only #{address_book.entries.count} entries.\nPlease try again."
      puts "---------------"
      view_entry_number
    end
  end

  def create_entry
    system "clear"
    puts "New AddressBloc Entry"
    print "Name: "
    name = gets.chomp
    print "Phone number: "
    phone = gets.chomp
    print "Email: "
    email = gets.chomp

    address_book.add_entry(name, phone, email)

    system "clear"
    puts "New entry created"
  end

  def search_entries
  end

  def read_csv
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection
    when "n" # next entry
    when "d" # delete entry
    when "e" # edit entry
    when "m" # return to main menu
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entry_submenu(entry)
    end
  end
end
