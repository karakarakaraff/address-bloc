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
    puts "6 - Demolish all entries"
    puts "7 - Exit"
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
    when 6 # delete all entries
      system "clear"
      demolish_entries
      # main_menu
    when 7 # exit
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

  def delete_entry(entry)
    address_book.entries.delete(entry)
    puts "#{entry.name} has been deleted"
  end

  def edit_entry(entry)
    print "Updated name: "
    name = gets.chomp
    print "Updated phone number: "
    phone_number = gets.chomp
    print "Updated email: "
    email = gets.chomp
    entry.name = name if !name.empty?
    entry.phone_number = phone_number if !phone_number.empty?
    entry.email = email if !email.empty?
    system "clear"
    puts "Updated entry:"
    puts entry
  end

  def search_entries
    print "Search by name: "
    name = gets.chomp
    match = address_book.binary_search(name)
    system "clear"
    if match
      puts match.to_s
      search_submenu(match)
    else
      puts "No match found for #{name}"
    end
  end

  def read_csv
    print "Enter CSV file to import: "
    file_name = gets.chomp
    if file_name.empty?
      system "clear"
      puts "No CSV file read"
      main_menu
    end

    begin
      entry_count = address_book.import_from_csv(file_name).count
      system "clear"
      puts "#{entry_count} new entries added from #{file_name}"
    rescue
      puts "#{file_name} is not a valid CSV file, please enter the name of a valid CSV file"
      read_csv
    end
  end

  def demolish_entries
    puts "Are you sure you want to demolish all entries?"
    puts "1 - Yes, demolish all entries."
    puts "2 - No, do not demolish anything."
    answer = gets.chomp.to_i
    case answer
    when 1
      address_book.entries.clear
      system "clear"
      puts "All entries have been demolished."
      main_menu
    when 2
      system "clear"
      puts "No entries have been demolished."
      main_menu
    else
      system "clear"
      puts "Sorry, that is not an answer."
      demolish_entries
    end
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
      delete_entry(entry)
    when "e" # edit entry
      edit_entry(entry)
      entry_submenu(entry)
    when "m" # return to main menu
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      entry_submenu(entry)
    end
  end

  def search_submenu(entry)
    puts "\nd - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    selection = gets.chomp
    case selection
      when "d"
        system "clear"
        delete_entry(entry)
        main_menu
      when "e"
        edit_entry(entry)
        system "clear"
        main_menu
      when "m"
        system "clear"
        main_menu
      else
        system "clear"
        puts "#{selection} is not a valid input"
        puts entry.to_s
        search_submenu(entry)
    end
  end
end
