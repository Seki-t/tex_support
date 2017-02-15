# -*- coding: utf-8 -*-
#!/usr/bin/env ruby

require "csv"


class Table
	attr_accessor :values

	def initialize(file_name)
		@f_name = file_name
		@values = CSV.read(file_name)
	end

	def output(file)

		file.print """\\begin{table}[H]
	\\centering
	"""
		file.print "\\begin{tabular}{"
		i = 0
		while (i < @values.length) do
			file.print ("|c")
			i+=1
		end
	
		file.print """|}\\hline
		"""
		i = 0
		while i < @values.length do
			j = 0
			while j < @values[i].length do
				file.print "#{@values[i][j]} "
				j+=1
				if j != @values[i].length 
					file.print"& "
				end
			end
			file.print """\\\\ \\hline
		"""
			i+=1
		end

		file.print """\\end{tabular}
	"""
		file.print """\\caption{<++>}
	\\label{"""+ deleteExtention(@f_name) + """}
\\end{table}
"""
	end
end

def deleteExtention(file_name)
	i = file_name.length - 1
	while i >= 0
		if file_name[i] =="."
			return file_name[0..i-1]
		end
		i-=1
	end
	return file_name
end





if __FILE__==$0

	table = Table.new(ARGV[0])
	
	file_name = deleteExtention(ARGV[0])

	file = File.open("#{file_name}.tex","w")
	table.output(file)
	file.close
end
