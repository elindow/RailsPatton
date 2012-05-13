Fabricator(:player) do
	fname { Fabricate.sequence(:fname) { |i| "Fname #{i}" } }
	lname { Fabricate.sequence(:lname) { |i| "Lname #{i}" } }
end	