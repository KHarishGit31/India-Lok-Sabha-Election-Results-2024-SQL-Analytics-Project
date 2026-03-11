
--What is the total number of seats won by each party alliance (NDA, I.N.D.I.A, and OTHER) in each state for the India Elections 2024

select states.State,
sum(case when pr.Party_Type = 'NDA' Then 1 Else 0 END ) as NDA,
sum(case when pr.Party_Type = 'INDIA' Then 1 Else 0 END ) as INDIA,
sum(case when pr.Party_Type = 'Others' Then 1 Else 0 END ) as OTHERS
from partywise_results as pr
join constituencywise_results as cr
on pr.Party_ID = cr.Party_ID
join statewise_results as sr
on cr.Parliament_Constituency = sr.Parliament_Constituency
join states
on sr.State_ID = states.State_ID
group by states.State;
