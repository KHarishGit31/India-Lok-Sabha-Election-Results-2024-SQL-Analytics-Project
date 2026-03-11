--What is the total number of seats available for elections in each state

Select st.State,COUNT(constituency_ID) as Total_No_Seats from constituencywise_results cr
join statewise_results as sr
on cr.Parliament_Constituency = sr.Parliament_Constituency
join states as st
on sr.State_ID = st.State_ID
group	by st.State
order  by st.State;
