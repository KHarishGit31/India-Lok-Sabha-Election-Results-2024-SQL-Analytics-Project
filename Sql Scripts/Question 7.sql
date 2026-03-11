--Winning candidate's name, their party name, total votes, and the margin of victory for a specific state and constituency?

select cr.Winning_Candidate,pr.Party,cr.Total_Votes,cr.Margin,states.State,cr.Constituency_Name
from constituencywise_results as cr
join partywise_results as pr
on cr.Party_ID = pr.Party_ID
join statewise_results as sr
on cr.Parliament_Constituency = sr.Parliament_Constituency
join states 
on sr.State_ID = States.State_ID
where states.State  = 'Delhi' And cr.Constituency_Name = 'WESTDELHI';
