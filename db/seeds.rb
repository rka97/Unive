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
Employee.create!(id: 2, name: "Alaa Fawzy", position: "Manager", hiring_date: Date.parse("2012-2-16"), department_id: 1)
User.create!(name:  "Admin",
email: "admin@admin.net",
password:              "password",
password_confirmation: "password",
admin: true,
student: false,
profile_owner_type: "Employee",
profile_owner_id: 1)

Employee.create!(id: 2, name: "Adam", position: "Secretary", hiring_date: Date.parse("2017-12-14"), department_id: 1)
User.create!(name:  "Adam", email: "adam@manager.net", password: "password", password_confirmation: "password", admin: false, student: false, profile_owner_type: "Employee", profile_owner_id: 2)
Employee.create!(id: 3, name: "Zakaria", position: "Manager", hiring_date: Date.parse("2012-2-16"), department_id: 1)

# Make a few courses
3.times do |i|
  20.times do |j|
    department_id = 1
    code = Department.find(department_id).abbreviation + (Faker::Number.number(3)).to_s
    title = "Fundamentals of " + Faker::Ancient.hero
    credit_hours = Faker::Number.between(1, 3)
    total_mark = Faker::Number.between(1, 3) * 100
    course_parameters = { id:i*100 + j, code: code, title: title, credit_hours: credit_hours, total_mark: total_mark, department_id: department_id }
    course = Course.create!(course_parameters)
    4.times do |n|
      date_assigned = Faker::Date.between(1.month.ago, Date.today)
      date_due = date_assigned + 3.days;
      currAssignmentNum = (n+1).to_s
      currAssignmentName = "Assignment " + currAssignmentNum
      Coursework.create!(id: i* 100 + j + n * 1000, date_due: date_due, date_assigned: date_assigned, description: currAssignmentName, title: currAssignmentName, total_mark: Faker::Number.between(1, 10) * 10, course_id: course.id, weight: 0.25)
    end
  end
end

# Generate a few random students and their profiles
15.times do |n|
  name  = Faker::Name.name
  bench_number = n%10;
  section_number = (n - (n % 10))/10
  gender = "NA"
  degree = "Bachelor's of Science"
  year = Faker::Number.between(2013, 2018) # I am not exactly sure what "year" means.
  phone_number = Faker::Number.number(8) # a 14-digit number
  address = Faker::Address.street_address 
  birth_date = Faker::Date.birthday(17,25)
  department_id = 1 #Faker::Number.between(1, 3)
  student_parameters = { id: n+101, name: name, section_number: section_number, bench_number: bench_number, phone_number: phone_number, gender: gender, year: year, birth_date: birth_date, address: address, enrollments_attributes: {0 => {degree: degree, department_id: department_id}} }

  st = Student.create!(student_parameters)

  # Make a few course enrollments
  1.times do |j|
    course_enrollment_params = { course_id: 100 + n + j, student_id: n+101, status: (Faker::Boolean.boolean) ? 'Enrolled' : 'Passed' }
    ste = StudentCourseEnrollment.create!(course_enrollment_params)
    st.course_enrollments << ste
  end
  Faker::Number.unique.clear

  email = "s#{n+1}@student.org"
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
15.times do |n|
  name  = Faker::Name.name
  title = "Professor"
  hiring_date = Faker::Date.between(5.year.ago, Date.today)
  department_id = 1
  teacher_parameters = { id: n+2000, name: name, title: title, hiring_date: hiring_date, department_id: department_id, degrees_attributes: {0 => {title: "Doctorate", date_awarded: "12-12-2017", university: "Sky", field: "Computer Science"}}, interests_attributes: {0 => {field: "Pattern Recognition"}}}

  t = Teacher.create!(teacher_parameters)

  # Make him teach a few courses
  4.times do |j|
    courses_taught_params = { course_id: 100 + n + j, teacher_id: t.id, date_taught: Faker::Date.between(5.year.ago, Date.today) }
    tc = TeacherCourse.create!(courses_taught_params)
    t.teacher_courses << tc
  end
  Faker::Number.unique.clear

  email = "t#{n+1}@teacher.org"
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

15.times do |n|
  numId = 101+n
  st = Student.find(numId)
  sc = st.works
  4.times do |j|
    currCourse = st.courses.first
    currAssignment = (currCourse.courseworks.to_a)[j]
    caid = currAssignment.id
    scw_params = { date_handed: currAssignment.date_due - j.days, mark: Faker::Number.between(0, currAssignment.total_mark), student_id: 101+n, coursework_id: caid }
    scw = StudentCoursework.create!(scw_params)
    sc << scw
    puts sc.mark
  end
end