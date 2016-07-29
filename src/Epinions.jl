export Epinions

"""
This is a who-trust-whom online social network of a a general consumer review site Epinions.com.
Members of the site can decide whether to ''trust'' each other. All the trust relationships interact
and form the Web of Trust which is then combined with review ratings to determine which reviews
are shown to the user.

This network has:
Vertices      : 75890
Edges         : 508837
Vertex Props  : -
Edge Props    : -
"""
abstract Epinions <: Dataset

function download(::Type{Epinions})
   dpath = filepath("Epinions.txt")
   tpath = "/tmp/soc-Epinions1.txt"

   if isfile(dpath)
      return dpath
   end

   if !isfile(tpath)
      download("http://snap.stanford.edu/data/soc-Epinions1.txt.gz", "/tmp/soc-Epinions1.txt.gz")
      run(`gzip -d /tmp/soc-Epinions1.txt.gz`)
   end

   Nv = 75890
   Ne = 508837

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
