--South Africa Criminal Database - 30 SQL Questions (Questions Only)

--1. Display all records from the CriminalCases table.
	SELECT 
	* FROM south_africa_criminal_info

--2. Count the total number of cases in the table.
							SELECT COUNT(*)
							AS TOTAL_NUMBER_OF_CASES 
							FROM south_africa_criminal_info

--3. Count the number of cases in each province.
	SELECT PROVINCE ,count(CaseNumber)
	AS TOTAL_CASES_PER_PROVINCE 
	FROM south_africa_criminal_info
	GROUP BY PROVINCE
	ORDER BY PROVINCE DESC;


--4. Retrieve all cases where the crime type is Fraud.
		SELECT CrimeType,RecordID,FirstName,LastName,Age,Gender,Country,Province
		from south_africa_criminal_info
		Where CrimeType ='Fraud';
					
--5. Count the number of cases for each crime type.
						SELECT DISTINCT CrimeType 
						from south_africa_criminal_info
						
						--here I found out which type of crimes are in the Table
						SELECT CrimeType,COUNT(CrimeType)
						As Number_of_cases_per_CrimeType
						from south_africa_criminal_info
						Group by CrimeType
						


		
--6. Display all cases classified as High or Critical risk.
	SELECT RISKLEVEL
	FROM south_africa_criminal_info
	WHERE RISKLEVEL ='CRITICAL'

					--For high risk
						SELECT RISKLEVEL
							FROM south_africa_criminal_info
							WHERE RISKLEVEL ='high'

		

	-----I'm trying to find a way of getting all it together with a single code
				SELECT RISKLEVEL,RecordID,FirstName,LastName,FullName
	FROM south_africa_criminal_info
	WHERE RISKLEVEL IN ('High', 'Critical')
	Order by RISKLEVEL DESC
	
		

--7. Calculate the average Financial Score of all suspects.
		SELECT Avg(financialScore)
		as Average_FinacialScore
		from south_africa_criminal_info
		
--8. Find the highest Estimated Fraud Amount recorded.
									SELECT TOP 1 EstimatedFraudAmount_ZAR,RecordID,FirstName,LastName,FullName,RecordID,FirstName,LastName
									AS HIGHEST_FRAUD_RECORDED
									from south_africa_criminal_info
									ORDER BY  EstimatedFraudAmount_ZAR DESC;

	
		
--9. Retrieve the top 10 cases with the highest Estimated Fraud Amount.

	SELECT TOP 10 EstimatedFraudAmount_ZAR,RecordID,FirstName,LastName,FullName
	AS TOP_10_HIGHEST_FRAUD_RECORDED
	from south_africa_criminal_info
	ORDER BY  EstimatedFraudAmount_ZAR DESC;

--10. Display all cases where the suspect was arrested.
										SELECT Arrested,RecordID,FirstName,LastName,FullName
										AS SUSPECTS_ARRESTED
										from south_africa_criminal_info
										WHERE Arrested ='Yes'
--11. Count how many suspects were arrested versus not arrested.
SELECT Arrested,COUNT(*)
AS NUMBER_OF_SUSPECTS_ARRESTED_VS_NOT_ARRESTED
from south_africa_criminal_info
Group by Arrested

--12. Count the number of cases associated with each bank.
			SELECT COUNT(BankInvolved)
			as number_of_cases_associated_with_each_bank
			from south_africa_criminal_info

					--- let's try second step 
					SELECT BankInvolved, count(BankInvolved)
					as number_of_cases_associated_with_each_bank
					from south_africa_criminal_info
					group by BankInvolved
											--2nd step worked, we were able to get good results


--13. Calculate the total Estimated Fraud Amount per province.
																SELECT PROVINCE, SUM(EstimatedFraudAmount_Zar)
																as Fraud_amount_per_province
																from  south_africa_criminal_info
																group by PROVINCE
		


--14. Retrieve all suspects older than 50 years.
			SELECT AGE,Firstname,fullname,SouthAfricanID,CrimeType
			as Suspects_older_than_50
			FROM  south_africa_criminal_info
			WHERE AGE >= 50;

	


--15. Calculate the average age of suspects per province.
				SELECT PROVINCE, AVG(AGE)
				as AVG_age_of_suspect_per_province
				from south_africa_criminal_info
				Group by Province
				


--16. Display all cases recorded from 2020 onwards.
		SELECT CrimeDate
											as Cases_recorded_from_2020_onwards
											from south_africa_criminal_info
											Where Year(CrimeDate) >= 2020
											Group by CrimeDate;

--17. Count how many cases resulted in a Convicted status.
				SELECT Count(Casestatus)
				as Cases_Resultant_in_a_Convicted_Status
				From south_africa_criminal_info
				WHERE CaseStatus = 'Convicted'
			

--18. Retrieve all suspects with more than three previous offenses.
	SELECT PreviousOffenses,FirstName,LastName,Gender,SouthAfricanID
	from south_africa_criminal_info
	AS suspect_with_morethan_3_previous_offenses
	Where PreviousOffenses >=3
			

--19. Show the distribution of cases by Risk Level.
			SELECT RISKLEVEL,CrimeType 
			FROM south_africa_criminal_info
			WHERE RISKLEVEL IN ('HIGH','LOW','CRITICAL')
			ORDER BY RISKLEVEL ASC;
														-------2nd method WHICH THIS ONE CORRECT
														SELECT RISKLEVEL,Count(Risklevel)
														AS CASES_BY_RISK_LEVEL
														FROM south_africa_criminal_info
														group by RISKLEVEL
															
--20. Calculate the total Estimated Fraud Amount across all cases.
					SELECT SUM(CAST(EstimatedFraudAmount_Zar AS bigint))
					AS Total_Estimated_Fraud_Amount
					FROM south_africa_criminal_info



--21. Identify the province with the highest number of cases.
															SELECT TOP 1 PROVINCE ,COUNT(*)
																AS PROVINCE_WITH_HIGHEST_NUMBER_OF_CASES
															FROM south_africa_criminal_info
															
															GROUP BY PROVINCE
															ORDER by PROVINCE DESC;
													

--22. Retrieve the youngest suspect in the dataset.
					SELECT AGE,FirstName,LastName,FullName,SouthAfricanID
					AS YOUNGEST_SUSPECT_AGE
FROM south_africa_criminal_info
WHERE AGE <(
    SELECT AVG(AGE)
    FROM south_africa_criminal_info );

--23. Retrieve the oldest suspect in the dataset.
								SELECT AGE,FirstName,LastName,FullName,SouthAfricanID
					AS OLDEST_SUSPECT_AGE
FROM south_africa_criminal_info
WHERE AGE >(
    SELECT AVG(AGE)
    FROM south_africa_criminal_info );

--24. Count the number of cases handled by each investigating officer.
				SELECT InvestigatingOfficer , Count(CrimeType)
				as Number_of_cases_handled_by_each_investigating_Officer
				from south_africa_criminal_info 
				group by InvestigatingOfficer



--25. Calculate the average Estimated Fraud Amount per crime type.
			SELECT CrimeType, AVG(EstimatedFraudAmount_Zar)
				AS Average_EstimatedFraudAmount_per_crime
				from south_africa_criminal_info 
				group by CrimeType


--26. Display all cases occurring in Gauteng province.

----ASSIST 
	SELECT CrimeType, count(crimeType)
	as Number_of_Cases_Occuring_in_Gauteng
	from south_africa_criminal_info 
	WHERE PROVINCE = 'GAUTENG'
	GROUP BY CrimeType

	------
	SELECT *
FROM south_africa_criminal_info
WHERE Province = 'Gauteng';


--27. Retrieve all Fraud cases classified as High risk.
		SELECT
		*FROM south_africa_criminal_info 
		WHERE CrimeType = 'FRAUD'
		AND RiskLevel ='HIGH'

--28. Count the number of cases per year based on CrimeDate.
--29. Display all suspects with a Financial Score below 500.
--30. Identify the most common Crime Type in the dataset.
