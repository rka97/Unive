# README

# Admin functions
To-do:
Make an administrator able to do the following:
- [x] Manage the number and academic standing of students in various departments.
- [ ] Add or remove subjects, assign professors as well as teaching assistants to certain subjects in certain times, notify them and ask for their confirmation.
- [ ] Manage and alter the timetables, notify professors and students of it, ask for confirmation from professors as well as class representatives.
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
- [x] Admin can search users.
- [x] Admin can remove, edit, add students.
- [x] Admin can remove, edit, add enrollments.
- [x] Add teacher degrees to model.
- [x] Add teacher research interests to model.
- [x] Admin can remove, edit, add teachers.
- [x] Admin can remove, edit, add departments.
- [x] Add courses model.
- [x] Admin can remove, edit, add courses.
- [x] Add course enrollment model.
- [x] Admin can assign teachers to courses.
- [x] Admin can remove teachers from courses.
- [x] Admin can enroll students in course.
- [x] Admin can remove students from course.
- [x] Add coursework (بسلطاطة ببابا غنوجه).
- [x] Add student-coursework association.
- [x] Add course notes.
- [x] Add lectures.
- [x] Admin can manage number of lectures in a course.
- [x] Admin can assign teacher to a lecture.
- [ ] Add teams model.
- [ ] Admin can browse teams and associated team coursework.
- [ ] Make announcements model.
- [ ] Admin can announce things to students.
- [ ] Admin can ban students.
- [ ] Admin can browse friendships among users.
- [ ] Admin should be able to make any user into an admin.
- [ ] Admin can ask teacher to confirm lecture time/place.
- [ ] Admin can see students marks, can track which students are close to failing (or failed).
- [ ] Integrate chatroom.
- [ ] Clean up schema.

# if there's time
- [ ] Add course prerequisites.
- [ ] Add comments on course notes and lectures.
- [ ] Add file uploading on course notes.
- [ ] Add locations on campus.