# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Create a few departments.
Department.create!(id: 1, name: "Computer", abbreviation: "CMP")
Department.create!(id: 2, name: "Electronics", abbreviation: "ELC")
Department.create!(id: 3, name: "Mathematics", abbreviation: "MTH")

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

Employee.create!(id: 2, name: "Adam", position: "Secretary", hiring_date: Date.parse("2017-12-14"), department_id: 1)


begin
class Coursework < ApplicationRecord
  belongs_to :course, optional: false
  has_many :student_courseworks, dependent: :delete_all, class_name: 'StudentCoursework', foreign_key: 'coursework_id'
  has_many :students, through: :student_courseworks
  alias_attribute :cw_id, :id
  alias_attribute :cw_title, :title
end

create_table "courseworks", force: :cascade do |t|
  t.date "date_due", null: false
  t.date "date_assigned", null: false
  t.string "description", null: false
  t.float "weight", null: false
  t.integer "total_mark", null: false
  t.string "title", null: false
  t.integer "course_id"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["course_id"], name: "index_courseworks_on_course_id"
end
=end


# Make a few courses
3.times do |i|
  40.times do |j|
    department_id = i+1
    code = Department.find(department_id).abbreviation + (Faker::Number.number(3)).to_s
    title = "Fundamentals of " + Faker::Ancient.hero
    credit_hours = Faker::Number.between(1, 3)
    total_mark = Faker::Number.between(1, 3) * 100
    course_parameters = { code: code, title: title, credit_hours: credit_hours, total_mark: total_mark, department_id: department_id }
    course = Course.create!(course_parameters)
    Coursework.create!(date_due: "20-10-2017", date_assigned: "10-10-2017", description: "WHY", weight: 0.5, total_mark: 20,
                       title: "SHUT UP", course_id: course.id)
  end
end

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
  birth_date = Faker::Date.birthday(17,25)
  department_id = Faker::Number.between(1, 3)
  
  student_parameters = { id: n+101, name: name, section_number: section_number, bench_number: bench_number, phone_number: phone_number, gender: gender, year: year, birth_date: birth_date, address: address, enrollments_attributes: {0 => {degree: degree, department_id: department_id}} }

  st = Student.create!(student_parameters)

  # Make a few course enrollments
  15.times do |j|
    course_enrollment_params = { course_id: Faker::Number.unique.between(1, 40), student_id: n+101, status: (Faker::Boolean.boolean) ? 'Enrolled' : 'Passed' }
    ste = StudentCourseEnrollment.create!(course_enrollment_params)
    st.course_enrollments << ste
  end
  Faker::Number.unique.clear

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
  #Teacher.create!(id: n+1010, name: name, title: title, hiring_date: hiring_date, department_id: department_id})
  #teacher_parameters = { name: "Kallin", title: "Professor", hiring_date: "11-11-2016", department_id: 1, degrees_attributes: {0 => {title: "Doctorate", date_awarded: "12-12-2017", university: "Sky University", field: "Computer Science"}}, interests_attributes: {0 => {field: "Pattern Recognition"}}}

  teacher_parameters = { id: n+2000, name: name, title: title, hiring_date: hiring_date, department_id: department_id, degrees_attributes: {0 => {title: "Doctorate", date_awarded: "12-12-2017", university: "Sky", field: "Computer Science"}}, interests_attributes: {0 => {field: "Pattern Recognition"}}}

  t = Teacher.create!(teacher_parameters)

  # Make him teach a few courses
  15.times do |j|
    courses_taught_params = { course_id: Faker::Number.unique.between(1, 119), teacher_id: t.id, date_taught: Faker::Date.between(5.year.ago, Date.today) }
    tc = TeacherCourse.create!(courses_taught_params)
    t.teacher_courses << tc
  end
  Faker::Number.unique.clear

  email = "example-#{n+1}@teacher.org"
  password = "password"
  User.create!(name:  name,
    email: email,
    password:              password,
    password_confirmation: password,
    admin: false,
    student: false,
    profile_owner_type: "Teacher",
    profile_owner_id: n+2000)
end
