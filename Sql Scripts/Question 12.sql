--Which candidate won and which candidate was the runner-up in each constituency of State for the 2024 elections?

with rankctc as (
select cd.Constituency_ID,cr.Parliament_Constituency,cr.Constituency_Name,(cd.EVM_Votes + cd.Postal_Votes ) as Total_Votes,cd.Candidate,
ROW_NUMBER() OVER(PARTITION BY cd.Constituency_ID
					Order By (cd.EVM_Votes + cd.Postal_Votes) desc ) as RankNum
from constituencywise_details as cd
join constituencywise_results as cr
on cd.Constituency_ID = cr.Constituency_ID

)
select 
rankctc.Constituency_Name,
Max(Case when rankctc.RankNum = 1 then rankctc.Candidate END) as Wining_Candidate,
MAX(case when rankctc.RankNum = 2 then rankctc.Candidate END) as RunnerUp
from rankctc
join statewise_results as sr
on rankctc.Parliament_Constituency = sr.Parliament_Constituency
join states as s
on sr.State_ID = s.State_ID
where s.State = 'Delhi'
group by rankctc.Constituency_Name;

