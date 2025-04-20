# Data-Pipeline-for-E-commerce-Customer-Segmentation
The Data Pipeline for E-Commerce Customer Segmentation project is the final project of the Data Engineering Zoomcamp organized by DataTalksClub.  
In this project, the TheLook E-Commerce dataset from BigQuery public datasets was used.

[TheLook E-commerce Dataset](https://console.cloud.google.com/marketplace/product/bigquery-public-data/thelook-ecommerce?project=tamr-internal-data-products)

## Problem Definition

The problem can be defined as identifying customer segments and gaining insights into segmented customers to improve sales and marketing activities. A popular method for customer segmentation, RFM analysis, was used. This analysis segments customers based on three factors: **Recency**, which represents the time since their last purchase; **Frequency**, indicating how often they make purchases; and **Monetary**, which measures the total amount they have spent.

## Tools used in the Data Pipeline:

- **Terraform:** Infrastructure as Code (IaC)
- **Google Cloud Platform:** Cloud
- **Google Cloud Storage:** Data Lake
- **Kestra:** Workflow Orchestrator
- **BigQuery:** Data Warehouse
- **dbt:** Data Transformation
- **PowerBI:** Data Visualisation

## Data Pipeline Architecture
![Data Pipeline Architecture](https://github.com/mrvneslihan/Data-Pipeline-for-E-commerce-Customer-Segmentation/blob/main/architecture.png?raw=true)

## How to Set Up and Reproduce the Data Pipeline

1. **Create a Google Cloud Platform Account**  
   Set up a Google Cloud Platform (GCP) account and create service accounts to connect Terraform, Kestra, and dbt to the cloud. Assign the necessary roles: BigQuery Admin, Compute Admin, and Storage Admin for Terraform; BigQuery Admin and Storage Admin for Kestra; and BigQuery Admin for dbt. While you can use a single service account for all applications, using separate accounts is a better approach for better control and proper role distribution.

2. **Set Up Terraform**  
   Generate JSON credentials for the service account and store them securely without pushing them to GitHub. Use the Terraform files provided in the repository to create your own main.tf and variables.tf files.Additionally, prepare a variables file containing the necessary values for Terraform, ensuring it is not pushed to GitHub. Run the following commands to initialize and apply Terraform:
```bash
   terraform init
   terraform plan
   terraform apply
```

3. **Set Up Kestra**  
Use the Docker Compose file in the repository to deploy Kestra locally on localhost:8080 or 8081. Start the Kestra host by running:
```bash
   docker compose up
```After setting up the service, connect Kestra to the cloud service account and execute the Kestra flows available in the repository.

4. **Prepare Data in BigQuery**  
Run the provided SQL queries to clean the data in BigQuery. This step will prepare the data for transformation in dbt. The queries will clean and structure the data to ensure it is ready for further processing.

5. **Execute dbt Project for Data Transformation**  
Apply the dbt project from the repository to transform the data using the Kimball dimensional modeling approach. This includes creating the necessary tables, such as mart_users and fact_sales. To activate and run the dbt project, use the following commands:

```bash
dbt init # initialize your project
dbt run  # run the dbt project
```
![dbt Lineage](https://github.com/mrvneslihan/Data-Pipeline-for-E-commerce-Customer-Segmentation/blob/main/lineage.png?raw=true)

6. **Visualize Data in Power BI**  
Once the data transformation is complete, open the mart_users and fact_sales tables in Power BI to visualize the segmented customers and analyze sales performance. This step will allow you to create meaningful insights based on customer segmentation and sales data.

## Costumer Segmentation Dashboard
![Customer Segmentation Dashboard](https://github.com/mrvneslihan/Data-Pipeline-for-E-commerce-Customer-Segmentation/blob/main/dashboard.png?raw=true)


### Contact Information

For any questions, suggestions, or feedback, feel free to reach out:

- **Email:** merveneslihan08@gmail.com
- **LinkedIn:** [My LinkedIn Profile](www.linkedin.com/in/merveneslihanokcu)
- **GitHub:** [My GitHub Profile](https://github.com/mrvneslihan)
