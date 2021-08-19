#puts __FILE__
#puts File.dirname(__FILE__)
#puts File.basename(__FILE__)
#myCode = File.read(__FILE__)

student_count = 11

students = [
    {name: "Dr. Hannibal Lecter", cohort: "June", hobbies: "coding, basketball", country_of_birth: "England"},
    {name: "Darth Vader", cohort: :november, hobbies: "coding, cricket", country_of_birth: "England"},
    {name: "Nurse Ratched", cohort: :november, hobbies: "coding, football", country_of_birth: "England"},
    {name: "Michael Corleone", cohort: :november, hobbies: "coding, basketball", country_of_birth: "England"},
    {name: "Alex DeLarge", cohort: :november, hobbies: "coding, football", country_of_birth: "England"},
    {name: "The Wicked Witch of the West", cohort: :november, hobbies: "coding, basketball", country_of_birth: "England"},
    {name: "Terminator", cohort: :november, hobbies: "coding, basketball", country_of_birth: "Ireland"},
    {name: "Freddy Krueger", cohort: :november, hobbies: "coding, basketball", country_of_birth: "Australia"},
    {name: "The Joker", cohort: :november, hobbies: "coding, football", country_of_birth: "New Zealand"},
    {name: "Joffrey Baratheon", cohort: :november, hobbies: "coding, basketball", country_of_birth: "South Africa"},
    {name: "Norman Bates", cohort: "June", hobbies: "coding, knitting", country_of_birth: "Germany"}
  ]

#puts "There are this many #{students.count}"

@students = []

def group_by_cohorts(students,cohort_month)
    grouped_cohorts = students.group_by { |student, cohort| student[:cohort].itself }
    #puts grouped_cohorts
    puts grouped_cohorts[cohort_month]
end

def print_students_hobbies(students)
  students.each_with_index do |student,i|
    puts "#{i}: #{student[:hobbies]}, from #{student[:country_of_birth]}".center(8)
    puts student[:name][0].center(15,"*")
    end
end 

def print_students_with_numbers(students)
#reduce_list =  students.select { |student| student[:name][0] == "D" }
students.each_with_index do |student,i|
    puts "#{i}: #{student[:name]}"
    #puts student[:name][0]
    end
end 

def print_students_beggining_with(students,letter)
    reduce_list =  students.select { |student| student[:name][0] == letter }
    reduce_list.each_with_index do |student,i|
        puts "#{i}: #{student[:name]}"
        #puts student[:name][0]
        end
    end

def print_students_shorter_than(students)
    reduce_list =  students.select { |student| student[:name].length <= 12 }
    reduce_list.each_with_index do |student,i|
        puts "#{i}: #{student[:name]}"
        puts student[:name].length
        #puts student[:name][0]
    end
end


def input_students
    puts "Please enter the names of the Students"
    puts "To Finish, just hit return twice"
    name = STDIN.gets.chomp
    
    while !name.empty? do
        
        puts "Which cohort?"
        cohort = STDIN.gets.chomp

        if cohort.empty?
            cohort = "December"
        end
        
        @students << {name: name, cohort: cohort}
        
        number_of_students = @students.count
        if number_of_students == 1
            puts "Now we have 1 Student"
        else
            puts "Now we have #{@students.count} students"
        end

        puts "Another Student?"

        name = STDIN.gets.chomp
        
    end
    
    @students
end

# def save_students
#     puts "Saving Students.csv...."
#     # open the file for writing
#     file = File.open("students.csv", "w")

#     # iterate over the array of students
#     @students.each do |student|
#       student_data = [student[:name], student[:cohort]]
#       csv_line = student_data.join(",")
#       file.puts csv_line
#     end

#     file.close
# end

def save_students
    find_student_files
    puts "Please enter the name of the File or create a new one"
    
    filename = STDIN.gets.chomp
    #puts "Saving Students.csv...."
    # open the file for writing
    file = File.open(filename, "w")

    # iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      
      #student_data = student_data.uniq{|student| [student[:name], student[:cohort]]} 
      
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    puts "Saving Students.csv...."
    file.close
end

def load_students(filename = "students.csv")
    find_student_files
    puts "Please enter the name of the File or create a new one"    
    filename = STDIN.gets.chomp

    puts "Student File being loaded....."
    file = File.open(filename, "r")
    file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
      @students << {name: name, cohort: cohort.to_sym}
    end
    file.close
end

def try_load_students
    filename = ARGV.first # first argument from the command line
    return if filename.nil? # get out of the method if it isn't given
    if File.exists?(filename) # if it exists
        load_students(filename)
        puts "Loaded #{@students.count} students from #{filename}"
        puts "---------------------"
    else
        puts "Sorry, #{filename} doesn't exist."
        exit
    end
end

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end
  
def print_student_list
    @students.each do |student|
        puts "#{student[:name]} (#{student[:cohort]}) cohort"
    end
end
  
def print_footer
    puts "Overall, we have #{@students.count} great students"
    puts "-----"
end

def find_student_files
    basedir = "."
    files = Dir.glob("*.csv")
    puts "List of Files in the Directory"
    puts files
    puts "-----"
end

def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the List to file"
    puts "4. Load Students from the Directory"
    puts "9. Exit" 
end

def show_students
    print_header
    print_student_list
    print_footer
end

def process(selection)
    case selection
      when "1"
        input_students
      when "2"
        show_students
      when "3"
        save_students
      when "4"
        load_students
      when "9"
        exit
      else
        puts "I don't know what you mean, try again"
    end
end

def interactive_menu
    loop do
      print_menu
      process(STDIN.gets.chomp)
    end
end

#find_student_files

try_load_students
interactive_menu

