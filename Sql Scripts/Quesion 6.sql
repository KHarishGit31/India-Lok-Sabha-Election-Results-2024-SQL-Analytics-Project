--Which party alliance (NDA, I.N.D.I.A, or OTHER) won the most seats across all states?
select Party_Type, SUM(Won) as Total_Seats_BY_Allianz 
from partywise_results
group by Party_Type
Order By Party_Type;
