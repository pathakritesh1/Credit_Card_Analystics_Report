-- creating database

create database crdb;
use crdb;

-- creating table for card details and customer detail and loading its data 

CREATE TABLE card_detail (
    Client_Num VARCHAR(20),  -- Changed to VARCHAR to avoid truncation issues
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
); 

ALTER TABLE card_detail MODIFY Client_Num VARCHAR(50);

LOAD DATA INFILE 'D:/Project/project_card/credit_card.csv'  
INTO TABLE card_detail  
FIELDS TERMINATED BY ','  
OPTIONALLY ENCLOSED BY '"'  
LINES TERMINATED BY '\n'  
IGNORE 1 ROWS
(Client_Num, Card_Category, Annual_Fees, Activation_30_Days, Customer_Acq_Cost,  
 @Week_Start_Date, Week_Num, Qtr, current_year, Credit_Limit, Total_Revolving_Bal,  
 Total_Trans_Amt, Total_Trans_Ct, Avg_Utilization_Ratio, Use_Chip, Exp_Type, Interest_Earned, Delinquent_Acc)
SET Week_Start_Date = STR_TO_DATE(@Week_Start_Date, '%d-%m-%Y');

ALTER TABLE cstmr_detail MODIFY Client_Num VARCHAR(50);
-- customer table
CREATE TABLE cstmr_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);


LOAD DATA INFILE 'D:\\Project\\project_card\\customer.csv'  
INTO TABLE cstmr_detail  
FIELDS TERMINATED BY ','  
IGNORE 1 ROWS;

SELECT * FROM card_detail LIMIT 5;

SELECT * FROM cstmr_detail;



LOAD DATA INFILE 'D:\\Project\\project_card\\cust_add.csv'  
INTO TABLE cstmr_detail  
FIELDS TERMINATED BY ','  
IGNORE 1 ROWS;


LOAD DATA INFILE 'D:/Project/project_card/credit_add.csv'  
INTO TABLE card_detail  
FIELDS TERMINATED BY ','  
OPTIONALLY ENCLOSED BY '"'  
LINES TERMINATED BY '\n'  
IGNORE 1 ROWS
(Client_Num, Card_Category, Annual_Fees, Activation_30_Days, Customer_Acq_Cost,  
 @Week_Start_Date, Week_Num, Qtr, current_year, Credit_Limit, Total_Revolving_Bal,  
 Total_Trans_Amt, Total_Trans_Ct, Avg_Utilization_Ratio, Use_Chip, Exp_Type, Interest_Earned, Delinquent_Acc)
SET Week_Start_Date = STR_TO_DATE(@Week_Start_Date, '%d-%m-%Y');

SELECT COUNT(*) FROM cstmr_detail; -- know about update data 

SELECT COUNT(*) FROM card_detail;
