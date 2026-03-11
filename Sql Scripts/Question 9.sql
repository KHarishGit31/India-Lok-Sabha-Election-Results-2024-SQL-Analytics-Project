--Which parties won the most seats in s State, and how many seats did each party win?

Select pr.Party ,COUNT(pr.party) as Most_Seats
from constituencywise_results as cr
join partywise_results as pr
on cr.Party_ID = pr.Party_ID
join statewise_results as sr
on cr.Parliament_Constituency = sr.Parliament_Constituency
join states
on states.State_ID = sr.State_ID
where states.State = 'Uttar Pradesh'
group by pr.Party
order by COUNT(pr.Party) DESC;
