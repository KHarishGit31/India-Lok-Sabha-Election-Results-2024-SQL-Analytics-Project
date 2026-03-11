--For the state of Uttar Pradesh, what are the total number of seats, total number of candidates, total number of parties, total votes (including EVM and postal), and the breakdown of EVM and postal votes?

Select 
COUNT(Distinct cr.Parliament_Constituency) as Total_NO_OF_Seats_UP,
COUNT(Distinct cd.Candidate) as Total_No_Of_Candidate,
COUNT(Distinct pr.Party) as Total_No_Of_Parties,
SUM(cd.EVM_Votes + cd.Postal_Votes) as Total_Votes,
Sum(cd.EVM_Votes) as Total_EVM_Votes,
Sum(cd.Postal_Votes) as Total_Postal_Votes

From constituencywise_details as cd
join constituencywise_results as cr
on cd.Constituency_ID = cr.Constituency_ID
join partywise_results as pr
on cr.Party_ID = pr.Party_ID
join statewise_results as sr
on sr.Parliament_Constituency = cr.Parliament_Constituency
join states as s
on sr.State_ID = s.State_ID
where s.State = 'Uttar Pradesh';
