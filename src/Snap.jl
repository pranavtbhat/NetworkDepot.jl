module NetworkDepot

import Base: download

export
# Abstract Dataset
Dataset

abstract Dataset


const DDIR = joinpath(Pkg.dir(), "NetworkDepot", "downloads")

function filepath(x::String)
   joinpath(DDIR, x)
end



include("Epinions.jl")
include("LiveJournal.jl")

end # module
