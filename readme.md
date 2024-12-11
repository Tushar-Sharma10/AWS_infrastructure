  # **Automating AWS Infrastructure Deployment with Terraform**

## Introduction
  
This project demonstrates how to use Terraform, a popular Infrastructure as Code (IaC) tool, to automate the provisioning and management of cloud resources on AWS. By leveraging Terraform, we deploy a scalable, secure, and cost-effective infrastructure that includes a Virtual Private Cloud (VPC), an EC2 instance, and an S3 bucket. This project highlights the simplicity and efficiency of managing cloud infrastructure with code, which can be versioned, shared, and reused.

## Objective
  
To showcase the implementation of Infrastructure as Code (IaC) principles using Terraform to:

1.) Automate the creation of a secure AWS infrastructure.

2.) Simplify resource management for scalability and maintenance.

3.) Provide a reusable, version-controlled deployment process.

## Prerequisites
  
**Tools Required:**

Terraform (latest version).

AWS CLI configured with appropriate credentials.

GitHub repository to store code.

## Knowledge:

Basics of AWS services (VPC, EC2, S3).

Terraform syntax and configuration.

### Terraform Commands

Run the following commands in your terminal:

1.) Initialize Terraform -> 
    terraform init: Initializes the working directory containing the Terraform configuration files. This command downloads the necessary provider plugins and prepares Terraform for execution.

2.) View the Execution Plan -> 
    terraform plan: Generates an execution plan, showing what Terraform intends to do (create, modify, or destroy resources) based on the current configuration.

3.) Apply the Configuration -> 
    terraform apply: Applies the configuration and provisions the resources on AWS. Terraform will ask for confirmation before making changes.

## Results and Observations

After running the commands, the following resources are created:

1.) A VPC with a CIDR block of 10.0.0.0/16.

2.) An EC2 instance with the name web.

3.) An S3 bucket named "myarchitecturebucket2024-1".
