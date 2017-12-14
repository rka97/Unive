# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a few departments.
Department.create!(id: 1, name: "Computer")
Department.create!(id: 2, name: "Electronics")
Department.create!(id: 3, name: "Mathematics")

# Create a single administrator employee and his user.
Employee.create!(id: 1, name: "Admin", position: "Admin", hiring_date: Date.parse("2017-12-14"), department_id: 1)
User.create!(name:  "Admin",
email: "admin@admin.net",
password:              "password",
password_confirmation: "password",
admin: true,
student: false,
profile_owner_type: "Employee",
profile_owner_id: 1)

# Generate a few random students and their profiles
99.times do |n|
  name  = Faker::Name.name
  bench_number = n%10;
  section_number = (n - (n % 10))/10
  gender = "NA"
  degree = "Bachelor's of Science"
  year = Faker::Number.between(2013, 2018) # I am not exactly sure what "year" means.
  phone_number = Faker::Number.number(8) # a 14-digit number
  address = Faker::Address.street_address 
  #birth_date = Date.parse(Faker::Date.birthday(17, 25))
  birth_date = Faker::Date.birthday(17,25)

  Student.create!(id: n+101, name: name, section_number: section_number, bench_number: bench_number, gender: gender, degree: degree, year: year, phone_number: phone_number, address: address, birth_date: birth_date)

  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password,
    admin: false,
    student: true,
    profile_owner_type: "Student",
    profile_owner_id: n+101)
end


# Generate a few random teachers and their profiles
99.times do |n|
  name  = Faker::Name.name
  title = "Professor"
  hiring_date = Faker::Date.between(5.year.ago, Date.today)
  department_id = Faker::Number.between(1, 3)
  Teacher.create!(id: n+101, name: name, title: title, hiring_date: hiring_date, department_id: department_id)

  email = "example-#{n+1}@teacher.org"
  password = "password"
  User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password,
    admin: false,
    student: false,
    profile_owner_type: "Teacher",
    profile_owner_id: n+101)
end