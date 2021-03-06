# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.

def assignment_score(grade_hash, student, assignment_num)
    grade_hash[student][assignment_num -1]
end



# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.

def assignment_scores(grade_hash, assignment_num)
    grade_hash.values.map { |scores| scores[assignment_num -1] }
end

# .values

# test = [
#   [1,2,3],
#   [4,5,6],
#   [7,8,9]
# ]

# def col(grid, col_num)
#     output = []
#     grid.each do |row|
#     output.push(row[col_num])
#     end
#     output
# end

# def col(grid, col_num)
#     grid.map do |row|
#         return row[col_num]
#     end
# end

# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.

def assignment_average_score(grade_hash, assignment_num)
    scores = assignment_scores(grade_hash, assignment_num)
    scores.sum/ scores.length
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.
def averages(grade_hash)
    grade_hash.transform_values do |grades| grades.sum / grades.length 
    end
end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F

def letter_grade(score)
    if score>= 90
        "A"
    elsif score >= 80
        "B"
    elsif score >= 70
        "C"
    elsif score >= 60
        "D"
    else 
        "F"
    end
end


# Return a hash of students and their final letter grade, as determined
# by their average.

def final_letter_grades(grade_hash)
    averages(grade_hash).transform_values { |score| letter_grade(score) } 
end


# Return the average for the entire class.

def class_average(grade_hash)
    scores = averages(grade_hash).values
    scores.sum / scores.length
end


# Return an array of the top `number_of_students` students.

def top_students (grade_hash, number_of_students)
    averages(grade_hash)
    .transform_values.sort_by { |student| -student[1]}
    .map { |student| student[0]}
    .take(number_of_students)
end
