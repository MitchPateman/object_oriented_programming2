class Person
attr_accessor :name

	def name
		@name
	end

 def greeting
	 puts "Hi my name is #{@name}"
 end
end

	class Student < Person
		def learn()
			puts "I get it!"
		end
	end

	class Instructor < Person
		def teach()
			puts "Everything in Ruby is an Object"
		end
	end

	instructor = Instructor.new
	instructor.name = "Chris"
	puts instructor.greeting

	student = Student.new
	student.name = "Christina"
	puts student.greeting

	instructor.teach
	student.learn

christina.teach ### Wont work because christina is in student/learn class not instructor/teach
