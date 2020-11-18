# Soccer Database Model

This project base on soccer management system.It's structure to facilitate the soccer organization to manage soccer event. 

In this project have 18 tables:

**playing_position** 

**player_must**

**player_booked**

**soccer_team**

**soccer_country**

**player_in_out**

**soccer_city**

**soccer_venue**

**match_must**

**match_details**

**asst_refree_detail**

**refree_must**

**coach_must**

**team_coaches**

**match_captain**

**panelty_gk**

**panelty_shootout**

**goals_details**

A palyer is identified by its Id and has complete details of in this table name,age and team and it connected to match_must ,playing position
and player_booked.Match_Must is also identified by its Id and connected to player,refree,venue andgoals. Goal details is identified by its Id and it's connected to player,match_must and soccer country.

#Entity Relationship Diagram

![](soccer-database.png)
