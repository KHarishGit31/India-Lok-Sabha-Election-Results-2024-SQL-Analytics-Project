
--What is the distribution of EVM votes versus postal votes for candidates in a specific constituency?
select  cd.Party,cd.Candidate,
		cd.EVM_Votes,
		cd.Postal_Votes,
		cd.Total_Votes,
		cr.Constituency_Name
from constituencywise_details as cd
join constituencywise_results as cr
on cd.Constituency_ID = cr.Constituency_ID
where cr.Constituency_Name = 'WESTDELHI';
