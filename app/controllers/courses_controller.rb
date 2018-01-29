class CoursesController < ApplicationController
    before_action :redirect_if_not_admin, only: [:destroy] 
    

    def randomScalingFactor
        return rand(0..100)
      end
  
    def show
        @course = Course.find(params[:id])
        @q = @course.students.ransack(params[:q])
        @students = @q.result(distinct: true).paginate(page: params[:students_page], per_page: 5)
        @ts = (@course.teachers).ransack(params[:q])
        @teachers = @ts.result(distinct: true).paginate(page: params[:teachers_page], per_page: 5)
        @cws = (@course.courseworks).ransack(params[:q])
        @courseworks = @cws.result(distinct: true).paginate(page: params[:courseworks_page], per_page: 5)
        @cns = (@course.course_notes).ransack(params[:q])
        @coursenotes = @cns.result(distinct: true).paginate(page: params[:coursenotes_page], per_page: 5)
        @lcs = (@course.lectures).ransack(params[:q])
        @lectures = @lcs.result(distinct: true).paginate(page: params[:lectures_page], per_page: 5)

        numAssignment = @course.courseworks.size - 1
        gradeDistribution = Hash.new 0
        cwrks = @course.courseworks
        myGrade = Hash.new
        @totalMark = 0
        @coursetotalMark = 0
        @current_rank = 1
        if current_user.student?
            (0..numAssignment).each do |t|
                current_cw = cwrks[t]
                mycw = current_cw.student_courseworks.find_by(student_id: current_user.profile_owner_id)
                if !mycw.nil?
                    @totalMark += mycw.mark * current_cw.weight
                end
                @coursetotalMark += current_cw.total_mark * current_cw.weight
            end
            course_students = @course.students
            course_students.each do |student|
                currTotalMark = 0
                (0..numAssignment).each do |t|
                    current_cw = cwrks[t]
                    mycw = current_cw.student_courseworks.find_by(student_id: student.id)
                    if !mycw.nil?
                        currTotalMark += mycw.mark * current_cw.weight
                    end
                end
                puts 'cTM = ' + currTotalMark.to_s
                diff = currTotalMark - @totalMark
                if diff > 0
                    @current_rank += 1
                end
            end
        end

        (0..numAssignment).each do |t|
            current_cw = cwrks[t]
            if !current_user.student?
                gradeDistribution[t] = current_cw.student_courseworks.average(:mark)
            else
                scw = current_cw.student_courseworks.find_by(student_id: current_user.profile_owner_id)
                if scw.nil?
                    gradeDistribution[t] = 0
                else
                    gradeDistribution[t] = scw.mark / current_cw.total_mark
                end
            end
        end
        gradesHashMap = Hash.new(Hash.new)
        (0..numAssignment).each do |t|
            gradesHashMap[t] = { label: (t+1).to_s, value: gradeDistribution[t]}
        end
        arr = Array.new
        (0..numAssignment).each do |t|
            arr << gradesHashMap[t][:value]
            puts arr
        end
        dSMap = {
            label: "Grade Distribution",
            fillColor: "rgba(220,220,220,0.2)",
            strokeColor: "rgba(220,220,220,1)",
            pointColor: "rgba(0,0,0,1)",
            pointStrokeColor: "#fff",
            pointHighlightFill: "#fff",
            pointHighlightStroke: "rgba(220,220,220,1)",
            data: arr
        }
        markLabels = []
        (0..numAssignment).each do |t|
            markLabels << gradesHashMap[t][:label]
        end
        @chartData = { labels: markLabels, datasets: [dSMap] }.to_json
        @chartSize = { width: 500, height: 500 }
        
        colors = [ "#F7464A", "#46BFBD", "#FDB45C", "#949FB1", "#4D5360" ]
        @pieCharData = Array.new {}
        (0..numAssignment).each do |t|
            charData = Hash.new
            current_cw = cwrks[t]
            charData[:value] = current_cw.weight * 100
            tnorm = t%5
            charData[:color] = colors[tnorm]
            charData[:highlight] = "#FF5A5E"
            charData[:label] = current_cw.title
            @pieCharData << charData
        end
        puts @pieCharData[0]
        @pieCharData = @pieCharData.to_json
    end
    
    def new
        @course = Course.new
    end
    
    def create
        @course = Course.new(course_params)
        if @course.save
            flash[:success] = "Course Added."
            redirect_to @course
        else
            render 'new'
        end
    end
    
    def index()
        courses = Course.all
        if !current_user.admin? 
            courses = current_user.profile_owner.courses
        end
        @q = courses.ransack(params[:q])
        @courses = @q.result(distinct: true).paginate(page: params[:page])
    end
    
    def edit
        @course = Course.find(params[:id])
    end
    
    def update
        @course = Course.find(params[:id])
        if @course.update_attributes(course_params)
            flash[:success] = "Course data updated"
            redirect_to @course
        else
            render 'edit'
        end
        end
    
    def destroy
        Course.find(params[:id]).destroy
        flash[:success] = "Course deleted"
        redirect_to courses_url
    end
    
    private
    def course_params
        params.require(:course).permit(:id, :code, :title, :credit_hours, :total_mark, :department_id)
    end
end
