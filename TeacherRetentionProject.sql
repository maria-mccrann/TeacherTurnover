
/* NYC Teacher Survey Data Exploration

Skills used: Joins, CTE's, Temp Tables, Aggregate Functions,

*/


SELECT * 
FROM PortfolioProject.dbo.TeacherTurnover

SELECT * 
FROM PortfolioProject.dbo.TeacherSurveyResults


-- Create temp table SurveyResultElements 
-- Averaging survey questions based on corresponding element

SELECT District_Name, avg(((Question_1 + 
	Question_2 + Question_3 + Question_4 + 
	Question_5 + Question_6 + Question_7 + 
	Question_8 + Question_9 + Question_10 + 
	Question_11 + Question_12 + Question_13 + 
	Question_14 + Question_15 + Question_21 + 
	Question_22 + Question_29 + Question_46 + 
	Question_49 + Question_50 + Question_57 + 
	Question_58 + Question_59 + Question_60)/25) *100) as Collaborative_Teachers,

	avg(((Question_47 + 
	Question_48 + Question_55 + Question_61 + 
	Question_62 + Question_63 + Question_64 + 
	Question_65 + Question_66 + Question_67 + 
	Question_68 + Question_69 + Question_70 + 
	Question_71 + Question_72 + Question_73 + 
	Question_74)/17) *100) as Effective_School_Leadership,

	avg(((Question_52 + Question_53 + Question_54 + 
	Question_56)/4) *100) as Strong_Family_Community_Ties,

	avg(((Question_45 + 
	Question_140 + Question_141 + Question_143 + 
	Question_145 + Question_146 + Question_147 + 
	Question_149 + Question_150 + Question_151 + 
	Question_152 + Question_153 + Question_154 + 
	Question_155 + Question_156 + Question_157 + 
	Question_165 + Question_166 + Question_167 + 
	Question_168 + Question_169 + 
	Question_170)/22) *100) as Supportive_Environment,

	avg(((Question_23 + 
	Question_24 + Question_26 + Question_27 + 
	Question_28 + Question_30 + Question_31 + 
	Question_32 + Question_33 + Question_34 + 
	Question_35 + Question_36 + Question_37 + 
	Question_38)/14) *100) as Trust

INTO SurveyResultElements
FROM PortfolioProject.dbo.TeacherSurveyResults
GROUP by District_Name
order by District_Name

SELECT * 
FROM SurveyResultElements

--Create temp table SurveyResultElementsTurnover
--JOIN Turnover Rate column from TeacherTurnover table to SurveyResultElements table
--Ordering by highest to lowest % turnover

SELECT SurveyResultElements.*, PortfolioProject.dbo.TeacherTurnover.PER_TURN_ALL
INTO SurveyResultElementsTurnover
FROM SurveyResultElements
INNER JOIN PortfolioProject.dbo.TeacherTurnover
ON SurveyResultElements.District_Name = TeacherTurnover.District_Name

SELECT *
FROM SurveyResultElementsTurnover
ORDER BY PER_TURN_ALL DESC 


--Seeing which districts had the lowest average rating in each element category for funsies

SELECT *
FROM SurveyResultElementsTurnover
ORDER BY Collaborative_Teachers DESC 

SELECT *
FROM SurveyResultElementsTurnover
ORDER BY Effective_School_Leadership DESC 

SELECT *
FROM SurveyResultElementsTurnover
ORDER BY Strong_Family_Community_Ties DESC 

SELECT *
FROM SurveyResultElementsTurnover
ORDER BY Supportive_Environment DESC 

SELECT *
FROM SurveyResultElementsTurnover
ORDER BY Trust DESC 

--What exactly is ineffective about school leadership in District 3?
--Finding the average of each question within the Effective School Leadership element
--Seeing which questions had the lowest average rating

SELECT District_Name, avg(Question_48)*100 as avg_q48, 
					  avg(Question_55)*100 as avg_q55,
					  avg(Question_61)*100 as avg_q61,
					  avg(Question_62)*100 as avg_q62,
					  avg(Question_63)*100 as avg_q63,
					  avg(Question_64)*100 as avg_q64,
					  avg(Question_65)*100 as avg_q65,
					  avg(Question_65)*100 as avg_q66,
					  avg(Question_67)*100 as avg_q67,
					  avg(Question_68)*100 as avg_q68,
					  avg(Question_69)*100 as avg_q69,
					  avg(Question_70)*100 as avg_q70,
					  avg(Question_71)*100 as avg_q71,
					  avg(Question_72)*100 as avg_q72,
					  avg(Question_73)*100 as avg_q73,
					  avg(Question_74)*100 as avg_q74
FROM PortfolioProject.dbo.TeacherSurveyResults
WHERE District_Name = 'NYC GEOG DIST 03'
GROUP BY District_Name

--In what ways are teachers not collaborative in District 3?
--Finding the average of each question within the Collaborative Teachers element
--Seeing which questions had the lowest average rating

SELECT District_Name, avg(Question_1)*100 as avg_q1, 
					  avg(Question_2)*100 as avg_q2,
					  avg(Question_3)*100 as avg_q3,
					  avg(Question_4)*100 as avg_q4,
					  avg(Question_5)*100 as avg_q5,
					  avg(Question_6)*100 as avg_q6,
					  avg(Question_7)*100 as avg_q7,
					  avg(Question_8)*100 as avg_q8,
					  avg(Question_9)*100 as avg_q9,
					  avg(Question_10)*100 as avg_q10,
					  avg(Question_11)*100 as avg_q11,
					  avg(Question_12)*100 as avg_q12,
					  avg(Question_13)*100 as avg_q13,
					  avg(Question_14)*100 as avg_q14,
					  avg(Question_15)*100 as avg_q15,
					  avg(Question_21)*100 as avg_q21,
					  avg(Question_22)*100 as avg_q22,
					  avg(Question_29)*100 as avg_q29,
					  avg(Question_46)*100 as avg_q46,
					  avg(Question_49)*100 as avg_q49,
					  avg(Question_50)*100 as avg_q50,
					  avg(Question_57)*100 as avg_q57,
					  avg(Question_58)*100 as avg_q58,
					  avg(Question_59)*100 as avg_q59,
					  avg(Question_60)*100 as avg_q60
FROM PortfolioProject.dbo.TeacherSurveyResults
WHERE District_Name = 'NYC GEOG DIST 03'
GROUP BY District_Name


--What is not trusted in District 3?
--Finding the average of each question within the Trust element
--Seeing which questions had the lowest average rating

SELECT District_Name, avg(Question_23)*100 as avg_q23, 
					  avg(Question_24)*100 as avg_q24,
					  avg(Question_26)*100 as avg_q26,
					  avg(Question_27)*100 as avg_q27,
					  avg(Question_28)*100 as avg_q28,
					  avg(Question_30)*100 as avg_q30,
					  avg(Question_31)*100 as avg_q31,
					  avg(Question_32)*100 as avg_q32,
					  avg(Question_33)*100 as avg_q33,
					  avg(Question_34)*100 as avg_q34,
					  avg(Question_35)*100 as avg_q35,
					  avg(Question_36)*100 as avg_q36,
					  avg(Question_37)*100 as avg_q37,
					  avg(Question_38)*100 as avg_q38
FROM PortfolioProject.dbo.TeacherSurveyResults
WHERE District_Name = 'NYC GEOG DIST 03'
GROUP BY District_Name

--What makes the school environment unsupportive in District 3?
--Finding the average of each question within the Supportive Environment element
--Seeing which questions had the lowest average rating

SELECT District_Name, avg(Question_45)*100 as avg_q45, 
					  avg(Question_140)*100 as avg_q140,
					  avg(Question_141)*100 as avg_q141,
					  avg(Question_143)*100 as avg_q143,
					  avg(Question_145)*100 as avg_q145,
					  avg(Question_146)*100 as avg_q146,
					  avg(Question_147)*100 as avg_q147,
					  avg(Question_149)*100 as avg_q149,
					  avg(Question_150)*100 as avg_q150,
					  avg(Question_151)*100 as avg_q151,
					  avg(Question_152)*100 as avg_q152,
					  avg(Question_153)*100 as avg_q153,
					  avg(Question_154)*100 as avg_q154,
					  avg(Question_155)*100 as avg_q155,
					  avg(Question_156)*100 as avg_q156,
					  avg(Question_157)*100 as avg_q157,
					  avg(Question_165)*100 as avg_q165,
					  avg(Question_166)*100 as avg_q166,
					  avg(Question_167)*100 as avg_q167,
					  avg(Question_168)*100 as avg_q168,
					  avg(Question_169)*100 as avg_q169,
					  avg(Question_170)*100 as avg_q170
FROM PortfolioProject.dbo.TeacherSurveyResults
WHERE District_Name = 'NYC GEOG DIST 03'
GROUP BY District_Name

--What exactly is ineffective about school leadership in District 5?
--Finding the average of each question within the Effective School Leadership element
--Seeing which questions had the lowest average rating

SELECT District_Name, avg(Question_48)*100 as avg_q48, 
					  avg(Question_55)*100 as avg_q55,
					  avg(Question_61)*100 as avg_q61,
					  avg(Question_62)*100 as avg_q62,
					  avg(Question_63)*100 as avg_q63,
					  avg(Question_64)*100 as avg_q64,
					  avg(Question_65)*100 as avg_q65,
					  avg(Question_65)*100 as avg_q66,
					  avg(Question_67)*100 as avg_q67,
					  avg(Question_68)*100 as avg_q68,
					  avg(Question_69)*100 as avg_q69,
					  avg(Question_70)*100 as avg_q70,
					  avg(Question_71)*100 as avg_q71,
					  avg(Question_72)*100 as avg_q72,
					  avg(Question_73)*100 as avg_q73,
					  avg(Question_74)*100 as avg_q74
FROM PortfolioProject.dbo.TeacherSurveyResults
WHERE District_Name = 'NYC GEOG DIST 05'
GROUP BY District_Name

--In what ways are teachers not collaborative in District 5?
--Finding the average of each question within the Collaborative Teachers element
--Seeing which questions had the lowest average rating

SELECT District_Name, avg(Question_1)*100 as avg_q1, 
					  avg(Question_2)*100 as avg_q2,
					  avg(Question_3)*100 as avg_q3,
					  avg(Question_4)*100 as avg_q4,
					  avg(Question_5)*100 as avg_q5,
					  avg(Question_6)*100 as avg_q6,
					  avg(Question_7)*100 as avg_q7,
					  avg(Question_8)*100 as avg_q8,
					  avg(Question_9)*100 as avg_q9,
					  avg(Question_10)*100 as avg_q10,
					  avg(Question_11)*100 as avg_q11,
					  avg(Question_12)*100 as avg_q12,
					  avg(Question_13)*100 as avg_q13,
					  avg(Question_14)*100 as avg_q14,
					  avg(Question_15)*100 as avg_q15,
					  avg(Question_21)*100 as avg_q21,
					  avg(Question_22)*100 as avg_q22,
					  avg(Question_29)*100 as avg_q29,
					  avg(Question_46)*100 as avg_q46,
					  avg(Question_49)*100 as avg_q49,
					  avg(Question_50)*100 as avg_q50,
					  avg(Question_57)*100 as avg_q57,
					  avg(Question_58)*100 as avg_q58,
					  avg(Question_59)*100 as avg_q59,
					  avg(Question_60)*100 as avg_q60
FROM PortfolioProject.dbo.TeacherSurveyResults
WHERE District_Name = 'NYC GEOG DIST 05'
GROUP BY District_Name


--What is not trusted in District 5?
--Finding the average of each question within the Trust element
--Seeing which questions had the lowest average rating

SELECT District_Name, avg(Question_23)*100 as avg_q23, 
					  avg(Question_24)*100 as avg_q24,
					  avg(Question_26)*100 as avg_q26,
					  avg(Question_27)*100 as avg_q27,
					  avg(Question_28)*100 as avg_q28,
					  avg(Question_30)*100 as avg_q30,
					  avg(Question_31)*100 as avg_q31,
					  avg(Question_32)*100 as avg_q32,
					  avg(Question_33)*100 as avg_q33,
					  avg(Question_34)*100 as avg_q34,
					  avg(Question_35)*100 as avg_q35,
					  avg(Question_36)*100 as avg_q36,
					  avg(Question_37)*100 as avg_q37,
					  avg(Question_38)*100 as avg_q38
FROM PortfolioProject.dbo.TeacherSurveyResults
WHERE District_Name = 'NYC GEOG DIST 05'
GROUP BY District_Name

--What makes the school environment unsupportive in District 5?
--Finding the average of each question within the Supportive Environment element
--Seeing which questions had the lowest average rating

SELECT District_Name, avg(Question_45)*100 as avg_q45, 
					  avg(Question_140)*100 as avg_q140,
					  avg(Question_141)*100 as avg_q141,
					  avg(Question_143)*100 as avg_q143,
					  avg(Question_145)*100 as avg_q145,
					  avg(Question_146)*100 as avg_q146,
					  avg(Question_147)*100 as avg_q147,
					  avg(Question_149)*100 as avg_q149,
					  avg(Question_150)*100 as avg_q150,
					  avg(Question_151)*100 as avg_q151,
					  avg(Question_152)*100 as avg_q152,
					  avg(Question_153)*100 as avg_q153,
					  avg(Question_154)*100 as avg_q154,
					  avg(Question_155)*100 as avg_q155,
					  avg(Question_156)*100 as avg_q156,
					  avg(Question_157)*100 as avg_q157,
					  avg(Question_165)*100 as avg_q165,
					  avg(Question_166)*100 as avg_q166,
					  avg(Question_167)*100 as avg_q167,
					  avg(Question_168)*100 as avg_q168,
					  avg(Question_169)*100 as avg_q169,
					  avg(Question_170)*100 as avg_q170
FROM PortfolioProject.dbo.TeacherSurveyResults
WHERE District_Name = 'NYC GEOG DIST 05'
GROUP BY District_Name