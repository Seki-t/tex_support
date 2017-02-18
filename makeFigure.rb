# -*- coding: utf-8 -*-
#!/usr/bin/env ruby

require "csv"


class Table
	attr_accessor :values

	def initialize(file_name)
		@f_name = file_name
		@f_head = deleteExtention(file_name)
		@values = CSV.read(file_name)
	end

	def output(file)

		file.print """\\begin{table}[H]
	\\centering
	\\includegraphics[width=100mm,clip]{"""
		file.print "#{@vf_name}"
		file.print """}
	\\flushright
	\\vspace{-5pt}
	\\caption{<++>}
	\\label{"""
		file.print "#{@f_head}"
		file.print """}
\\end{figure}
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
