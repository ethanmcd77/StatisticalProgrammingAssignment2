# StatisticalProgrammingAssignment2 C18424952 Ethan McCormack-Davey
This is my Assignment 2 for the Statistical Programming Module.

I began from lines 6-10 installing needed packages for the project ahead.

On line 11 I simply set the working directory to the folder holding the data.


From lines 16-20 I imported all the relevant and needed CSV files as tibbles
so later I could transform, manipulate and join data from different sources.


Lines 25-38, Renaming.
-
  In order to allow for a smooth join among data through tibbles I needed to make sure there were related column names within each CSV that I planned to join.
  This resulted in the "ID" column being relablled to "advertiser_id" within the Advertiser tibble.
  Which later, resulted in the "ID" column being relabelled to "id" within the Click, Conversion and Impression tibbles in order to avoid confusion.
  Similarly the next 9 lines were changing the "time", "timezone" and "date" column names to suit their particular CSV in order to eliminate any duplicate column names.

Lines 44-59, Joining/Viewing.
-
  The most critical part of the data manipulation process was joining the data. Using inner joins I created 4 tables (Full-Table, Impressions_Table, Conversions_Table, Clicks_Table) to take all information and analysis from.
  
  I then checked that they were all correct and indvidually matched up samples within the CSV to ensure the integrity of the data.
  
  
Lines 64-80, Important Graphs.
-
When we run these we can see:

  For the first graph (lines 64-65) I created a simple chart showcasing the amount of impressions per advertiser with extra aesthetics.
  As we can see Ninetendo (13) led the way with Coco Cola a close second (11) and Lever Bros with (10). Bobos cannot be seen.
  
  In the second graph (lines 67-68) I created a chart showcasing the total clicks received per campaign again with extra pleasing aesthetics.
  We can see from this chart Q4 Performance received the most clicks (6) with Run of Network and Christmas Cheer receiving 4 each.
  
  In the third graph (lines 70-71) we can showcase the budget related to the specific Advertisers.
  Lever Brows destroys competition here with a budget of ~250,000 from the graph and both Coco Cola and Ninetendo having a budget of <25,001
  
  In the fourth graph (lines 73-74) I show a jitter plot comparing Impressions seen with each dates the impression was on with the specific advertisers.
  
  In the fifth graph (lines 76-77) I show a plot containing conversions that have taken place, the specific time of the conversion and the advertiser who received the             conversion.
  
  In the final graph (lines 79-80) again we see a jitter plot, this time containing clicks received per campaign within a certain timezone and the Campaign who received the       click.
  As we can see the Run of Network campaign dominated within the UTC -8:00 region.

Lines 82-110, Extra Practice Graphs.
-

When we withdraw asterisks within the code we can see:

  These are all extra graphs which I believe are somewhat relevant to the project but I did not believe fit in the best handful available. There are certainly takeaways which     can be analysed but they were similar to past plots with different variables.

  
