# **SF-Gsyn-DBT-Paparao**  
### **Snowflake End-to-End Development**  

This project involves loading data from **AWS S3** to **Snowflake** and implementing **dbt (Data Build Tool)** for incremental transformations, data validation, and processing.  



## **Project Workflow**  

### **Step 1: AWS S3 Setup**  
- Created an **IAM Role**: `gsyn-sf-paparao`  
- Created an **S3 Bucket**: `gsyn-bkt-paparao`  
- Organized the bucket by adding two subfolders for structured file uploads  



### **Step 2: S3 Integration in Snowflake**  
- Established **S3 integration** in Snowflake to securely access data from S3  
- Updated **trust policies** for the IAM role to grant access to Snowflake  

**Path:** `SF-Gsyn-DBT-Paparao/Data Loading/s3_integration`  



### **Step 3: Stages and File Formats**  
- Created **external stages** separately for **dimension** and **fact** tables  
- Defined **file formats**:  
  - **Delimiter:** `|` (pipe-separated)  
  - **Compression:** `gzip`  
  - Two distinct file formats were created to maintain table-specific standards  

**Path:** `SF-Gsyn-DBT-Paparao/Data Loading/stages`  



### **Step 4: Table Structure Creation**  
- Designed **table structures** for dimensions and fact tables based on requirements  
- Implemented **key constraints**:  
  - **Primary keys**  
  - **Not null constraints**  

**Path:** `SF-Gsyn-DBT-Paparao/Data Loading/Ddls`  



### **Step 5: Data Loading into Snowflake**  
- Loaded data from **S3 to Snowflake** using `COPY INTO` commands  
- Separated **dimension** and **fact** table loads  

**Path:** `SF-Gsyn-DBT-Paparao/Data Loading/copying_data`  



### **Step 6: Data Quality and Validation Checks**  
Performed multiple validation checks to ensure data integrity:  
**Not Null Checks**  
**Duplicate Checks**  
**Foreign Key Reference Checks**  

**Path:** `SF-Gsyn-DBT-Paparao/Data Quality Checks`  



### **Step 7: Implementing `mview_weekly_sales` in dbt**  
- **Configured dbt connection** with Snowflake  
- **Built the `mview_weekly_sales` table** using an **incremental** load strategy  
- Followed dbt best practices:  
  - Defined **sources** in `gsyn_source.yml`  
  - Used **Jinja templating** for dynamic SQL logic  

**Path:** `SF-Gsyn-DBT-Paparao/dbt/models/mview_weekly_sales.sql`  



## **Project Completion**  
**End-to-end implementation successfully completed** for Snowflake & dbt-based data pipeline.  
