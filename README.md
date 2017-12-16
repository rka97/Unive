# README

To-do:
Make an administrator able to do the following:
- [ ] Manage the number and academic standing of students in various classes.
- [ ] Add or remove subjects, assign professors as well as teaching assistants to certain subjects in certain times, notify them and ask for their confirmation.
- [ ] Manage and alter the timetables, notify professors and students of it, ask for confirmation from professors as well as class representatives.
- [ ] See a list of assigned textbooks, their availability in the library. Add and remove textbooks from the library, keep track of arrivals.
- [ ] Add notifications of trips and other social occasions, manage the number of attendees, the payment needed, keep track of who paid and who didn’t, and notify those who don’t.
- [ ] Track which students are failing and require extra intervention or notification, as well which students have overdue fees or not enough class attendance.
- [ ] Ban or discipline students for certain periods of time. Delete messages from the chat room.

Changelog:
- [x] Make a Student database table and the corresponding model (won't add much functionality yet).
- [x] Make a Department database table and the corresponding model.
- [x] Make a Teacher database table and the corresponding model (empty controller).
- [x] Make an Employee database table and the corresponding model.
- [x] Link User to Student\Staff\Employee. (Model / View).
- [x] Make a seeding script for the database that initializes a few students, a few teachers, a few users, and an administrator.
- [x] Make a student-department association (Enrollment model).
- [x] Admin can search students.
- [x] Admin can remove, edit, add students.
- [ ] Admin can remove, edit, add teachers.
- [ ] Admin can remove, edit, add departments.
- [ ] Admin can remove, edit, add enrollments.
- [ ] Add courses model.
- [ ] Add course enrollment model.
- [ ] Admin can remove, edit, add courses.