# App

Installation instructions:

Prerequisites: 
Make sure input values are provided in terraform.tfvars

**Important**: Access_key and secret_key should not be added in terraform.tfvars for security reasons.

Hence input those values as prompted while executing terraform plan and apply commands.


Deployment Instructions:

- git clone https://github.com/RahulThammu/App.git <br />
- Make sure your in folder App <br />
- Run command: terraform init <br />
- Run command: terraform plan -var-file="terraform.tfvars" <br />
- Run command: terraform apply -var-file="terraform.tfvars" --auto-approve <br />

Steps and Explanation:

1. Create the provider file (This deployment doesn’t have tfstate file stored anywhere, however, AWS S3 or Azure Blob is a recommended  storage option. Create a difference VPC and store the tfstate file in S3 if possible. Provide the details in provider.tf)
	
	Filename: provider.tf

2. Create VPC for the deployment 
    
    Filename: vpc.tf

   <img src="./Screenshots/step2.png" alt="VPC created" />


