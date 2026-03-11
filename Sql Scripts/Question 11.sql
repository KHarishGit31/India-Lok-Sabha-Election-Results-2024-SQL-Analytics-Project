--Which candidate received the highest number of EVM votes in each constituency (Top 10)?

with ctc as (
	select cr.Constituency_Name,cr.Constituency_ID,cd.Candidate,cd.EVM_Votes
	from constituencywise_details as cd
	join constituencywise_results as cr
	on cd.Constituency_ID = cr.Constituency_ID
	)
select top 10
*
from ctc

order by EVM_Votes desc;
