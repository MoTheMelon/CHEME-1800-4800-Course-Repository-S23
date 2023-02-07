# Step 1: implement the student object in Types.jl
# ...


    """
    varnerism:
    Stduent
Student is a muatble struct that holds two fields:
    sid::Int64 is the stduent id
    netid::String is the netid
    """

mutable struct Student 
    sid::Int64
    netid::String

    Student() = new()
end

