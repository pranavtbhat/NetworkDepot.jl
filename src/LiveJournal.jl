export LiveJournal

"""
LiveJournal is a free on-line community with almost 10 million members; a significant
fraction of these members are highly active. (For example, roughly 300,000 update their
content in any given 24-hour period.) LiveJournal allows members to maintain journals,
individual and group blogs, and it allows people to declare which other members are their
friends they belong.

This network has:
Vertices      : 4847571
Edges         : 68993773
Vertex Props  : -
Edge Props    : -
"""
abstract LiveJournal <: Dataset

function download(::Type{LiveJournal})
   dpath = filepath("LiveJournal.txt")
   tpath = "/tmp/soc-LiveJournal1.txt"

   if isfile(dpath)
      return dpath
   end

   if !isfile(tpath)
      download("http://snap.stanford.edu/data/soc-LiveJournal1.txt.gz", "/tmp/soc-LiveJournal1.txt")
      run(`gzip -cd /tmp/soc-LiveJournal1.txt.gz`)
   end

   Nv = 4847571
   Ne = 68993773

   fin = open(tpath)
   vs  = readdlm(fin, Int)
   close(fin)

   fout = open(dpath, "w")
   write(fout, "$Nv,$Ne\n")
   write(fout, "\n")
   write(fout, "\n")
   write(fout, "\n")
   write(fout, "\n")
   writedlm(fout, collect(0:(Nv-1)))
   writecsv(fout, vs)
   close(fout)

   dpath
end
