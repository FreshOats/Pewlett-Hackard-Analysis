# Pewlett Hackard _"Silver Tsunami"_ Analysis
**Evaluating the number of retirees in management positions at a major corporation via PostgreSQL**
#### by Justin R. Papreck
---

## Overview

As Baby-Boomers reach retirement age, the world's largest workforce population is likely to have a dramatic effect on companies as masses of people begin to retire. The greatest impact will be in the management-level posisions that require more than 1-3 weeks to onboard a standard employee. In a company with near a quarter of a million employees, such a dramatic loss of employees can have a massive detrimental impact on an organization if proper steps aren't taken to insure fidelity of work, proper onboarding, and maintaining the culture during the transition. For this reason, it is essential to know who is leaving within the next 5 years, and who will be ready to mentor new hirees upon the turnover of staff.

### Purpose
In addition to the exodus at hand, Pewlett Hackard has been organizing their information in a few different spreadsheets, so their ability to efficiently analyze this information was to be a daunting task. Establishing a database in PostgreSQL allowed for these tables to be efficiently analyzed to answer all of the important questions regarding the numbers of employees per department, those in management positions, and who those people are that will be leaving. 

---
## Results
### Deliverable 1: The Number of Employees Leaving by Title

  Initially, the 6 spreadsheets were created as tables in a database using pgAdmin. The first question needed to be addressed was the number of employees leaving by title. Before haphazardly adding them, an Entity Relationship Diagram was created to establish the connections between the tables, as shown below: 
  
  
  ![Updated_ERD](https://user-images.githubusercontent.com/33167541/177655282-0e1d3bc9-5c27-4806-ad94-b93d87ffd55e.png)


Using these connections, the tables had the appropriate connections to produce unique connections to link all of the tables together in an interpretable way. To get the retirees, intially the data were drawn from the employees and titles tables, using an inner join and filtering by only employees with birthdates between 1952 and the end of 1955. Since many of the employees have worked with Pewlett Hackard for many years, they have had more than one position, so in order remove the duplicates and only show the last position held, the DISTINCT ON() function was used ordering by the employee number and to_date, which represents the final date they held that position. This provided the following: 

![Deliverable_1_results](https://user-images.githubusercontent.com/33167541/177656186-4d0b64dd-3ca2-46aa-bbb3-4fae33a53195.png)

From the first 10 employees on this table, it is very clear that the company is going to be losing a lot of senior and management level staff members. The next step was determining the number of each of these positions that will have vacancies after the "silver tsunami" of senior retirees leaving the workforce by the end of the next 5 years. Pulling from the above table, the titles were counted and presented in the following table: 

![Seniors_Leaving_Total](https://user-images.githubusercontent.com/33167541/177656500-77255fe9-fbdb-429a-8ea9-bded22ec8eae.png)

Upon the initial count of total employees being approximately 240,000 employees at Pewlett Hackard, just the retiring Senior Staff and Senior Engineers make up 20% of the company, and with all retirees leaving, close to 30%! There was a suggestion to create a mentorship program from employees in similar positions that aren't bound for retirement for another 10 years, which will be examined next. But before diving into that, this isn't a complete crisis. There will be 30% turnover due to retirement over the next 5 years, but once a plan it put into place, the change will be more fluid. The number of employees who will retire this year is a much smaller number. The previous analysis was limited to those born in 1952: 

![Seniors_Leaving_This_Year](https://user-images.githubusercontent.com/33167541/177657687-79472185-0293-4734-acf5-fa87c5fcbb9d.png)

Considering this number makes up approximately 7% of the total staff, the situation isn't as dire! Regardless, putting some kind of system in place to begin hiring, onboarding, and mentoring new senior staff will ensure that the company smoothly transitions and maintains doing whatever it is that they do. 


### Deliverable 2: Employees Eligible for the Mentorship Program
To qualify for the mentorship program, Pewlett Hackard is looking at higher-level employees who will aim to retire in 10 years. A similary query was constructed as before, using DISTINCT ON() to find only their most recent position, as well as only looking at current employees born in 1965. Using this query, the head of the list is as shown: 

![Mentor_Names_This_Year](https://user-images.githubusercontent.com/33167541/177658748-af8c690a-ea4d-48c2-9835-7b998a04db44.png)

This at least gives the company an idea of whom to start the mentoring program with, as they bring in new hirees. One major question remains is how many positions are needed to be filled, and how many mentors will be ready to start training the new hires at this time, as the company is still losing 7% of its senior staff in the next year. 


![Mentors_Available_This_Year](https://user-images.githubusercontent.com/33167541/177658904-2d58431f-84bf-402e-9ab4-d79493ee0dd1.png)


The total number of mentors available, just drawing from the employees born in 1965 would require each of them to take on about 12 new hires to mentor just to fill the vacancies for seniors leaving over the first year. 

---
## Analysis 
The purpose of this analysis was to determine the number of employees retiring within the next five years. 
- There are a total of 240,142 current employees
- In the next four years, 72,496 employees will retire (30.2% of the total staff)
- In the next year, 18,537 employees will retire (7.7% of the total staff)

Additionally, the company would like to start a mentoring program, utilizing the staff who are at 10 years prior to retirement
- There are currently 1,549 employees who qualify for the mentorship program 
- If each of these employees were to mentor new hires to fill each of the positions for the current year retirees, each mentor would be working with 12 new hires on average

One additional finding...
- There are 0 employees who were born before 1952
- There are 72458 who were born from 1952 and 1955
- There are 167666 who were born from 1956 to 1965
- There are 0 employees born after 1965

---
## Summary
While losing 30% of the employees just due to retirement is going to have a massive impact on the company, the loss of the management staff in very specialized departments is going to be the most detrimental, as the training of these members requires much more time than a new lower-level hire. This loss of 30% is the next 4 years, and utilizing people who aren't on the verge of retirement to mentor new hires will prevent such a detrimental shift in the next few years. Fortunately, the impact within the next year will only be about a 7% turnover, which should be manageable with the mentorship program. The current number of available mentors will require each to work with 12 different new hires, which may not be ideal if they are not all centrally located. Unfortunately, these are the only staff left at the company. So if those employees born in 1965 are shifting to a part time role and the retirees are no longer working at full capacity, the company is completely shutting down. 
  Unless these data are outdated and missed out on any hires born after 1965, then the company isn't looking at only losing 30% of its employees over 4 years, but 100% of its current employees if those who qualify to cut back and start mentorship are the youngest employees the company has, who at this time are already 57 years of age. How did this happen? 
  
 Here is everyone:
 
 ![Everyone](https://user-images.githubusercontent.com/33167541/177667147-d5862ff4-de16-402c-8f7e-877bc0887149.png)

 Then anyone born after 1965:
  
 ![Where_are_the_young](https://user-images.githubusercontent.com/33167541/177666946-9ff5bedc-8df5-496b-a59e-d605e9680c78.png)
 
 Followed by those born between 1956 and 1965:
 
 ![Slim_pickings](https://user-images.githubusercontent.com/33167541/177666953-b4827454-1061-4d99-84a7-3ec6b6a1cfa5.png)

  And finally our retirees:
 
 ![the_elders](https://user-images.githubusercontent.com/33167541/177666960-4a6bfd54-7ecd-4952-a016-b87eea734bea.png)


Essentially, unless Pewlett Hackard does something drammatic, the silver tsunami that has started is going to wipe out most of the company. 
