module StudentsHelper
    def degree_abbreviation(degree)
        if (degree.include? "Bachelor")
            if (degree.include? "Science")
                return "BSc"
            elsif (degree.include? "Art")
                return "BA"
            else
                return "Bac"
            end 
        elsif degree.include? "Master"
            if (degree.include? "Science")
                return "MSc"
            elsif (degree.include? "Art")
                return "MA"
            else
                return "Mas"
            end
        elsif degree.include? "Doctorate"
            return "PhD"
        else
            return degree
        end
    end
end
