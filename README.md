## tex_support

# makeTable.rb

・example

FileName.csv

	1,2,3
	4,5,6


ruby makeTable.rb FileName.csv

・result

	\begin{table}[H]
		\centering
		\begin{tabular}{|c|c|c|}\hline
			1 & 2 & 3 \\ \hline
			4 & 5 & 6 \\ \hline
			\\ \hline
			\end{tabular}
		\caption{<++>}
		\label{FileName}
	\end{table}


