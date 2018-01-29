class CourseworksController < ApplicationController
    before_action only: [:index, :edit, :update, :destroy] do
        cw = Coursework.find(params[:id])
        if !(current_user.admin? || current_user.profile_owner_type == "Teacher" && current_user.profile_owner.courses.exists?(cw.course.id))
            redirect_back fallback_location: courses_url
        end
    end

    def new
        @coursework = Coursework.new
        @course = Course.find(params[:course])
    end

    def index
        #@coureswork= Courseworks.ransack(params[:id])
    end

    def randomScalingFactor
      return rand(0..100)
    end

    def show
        @coursework = Coursework.find(params[:id])
        @q = @coursework.student_courseworks.ransack(params[:q])
        @student_courseworks = @q.result(distinct: true).paginate(page: params[:student_cws_page], per_page: 5)
        @chartSize = { width: 500, height: 500 }
        total_mark = @coursework.total_mark
        total_mark = total_mark
        gradeDistribution = Hash.new 0
        (1..total_mark).each do |t|
            gradeDistribution[t] = 0
        end
        @coursework.students.each do |s|
            scw = s.works.find_by(coursework_id: @coursework.id)
            mark = 0
            if (scw != nil)
                mark = (scw.mark).floor
            end
            gradeDistribution[mark] += 1
            puts gradeDistribution[mark]
        end
        puts 'Now the array'
        arr = Array.new
        (1..total_mark).each do |t|
            arr << gradeDistribution[t]
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
        (1..total_mark).each do |t|
            markLabels << t.to_s
        end
        @chartData = { labels: markLabels, datasets: [dSMap] }.to_json
    end

    def create
        @coursework = Coursework.new(coursework_params)
        if @coursework.save
            flash[:success] = @coursework.title + " added to " + @coursework.course.code
            redirect_back fallback_location: courses_url
        else
            redirect_back fallback_location: courses_url
        end
    end
    
    def edit
        @coursework = Coursework.find(params[:id])
        @course = @coursework.course
    end

    def update
        @coursework = Coursework.find(params[:id])
        if @coursework.update_attributes(coursework_params)
            flash[:success] = "Coursework data updated"
            redirect_back fallback_location: courses_url
        else
            render 'edit'
        end
    end

    def destroy
        Coursework.find(params[:id]).destroy
        flash[:success] = "Coursework removed from course"
        redirect_back fallback_location: courses_url
    end

    
    private
    def coursework_params
        params.require(:coursework).permit(:id, :date_due, :date_assigned, :description, :weight, :total_mark, :title, :course_id)
    end
end
