test changes

--------- Context ------

code permet le deploiment d'une Infra aws :
- VPC , IGW , RT , NACL , SG , SUBNET (public / private)
- private EC2
- launch configuration + auto scaling group
- Classic load balancer
- RDS
- S3
- DynamoDB
- backend terraform 

--------- Prerequis ----

- installation aws cli sur la vm terraform : pip install awscli --upgrade
- console aws : creation d'un utilisateur avec droit programmation 
- machine terraform : configuration du profil aws a utiliser
      		      => aws configure --profile nom_profile
		           ---> secret key , access key , region

NB. 
il faut commenter le contenu de fichier backend.tf, lancer terraform apply
par la suite decommenter le contenu de fichier backend.tf, lancer la commande terraform init
ca permet de reconfigurer le backend et copier le fichier tfstate au niveau du backet S3 crée, et le loc du fichier sera gerer par DynamoDb dejé crer ( backend_infra.tf)



--------- Files --------

- provider.tf
	=> fichier contenant la declaration du provider a utilisé ( aws , profil crée, region a utiliser) 
- infra.tf 
	=> VPC + IGW + RT 	
- network.tf 
	=> NACL / association avec Subnet 
	=> SG 
- subnet.tf 
	=> subnet et association avec RT 
- ec2.tf 
	=> EC2 et association avec SG
- asg.tf
	=> lanch configuration / association avec security group / user data pour installer apache2 ( script install_httpd.sh)
	=> auto scaling group / association avec CLB
- ELB.tf
	=> SG pour ELB (autorise HTTP seulment)
	=> CLB / association subnet / association SG / health_check / listner
- rds.tf
	=> creation subnet groupe
        => creation mysql db = multi az
- backend_infra.tf
	=> creation du S3 et DynamoDB table
- backend.tf
	=> configuration du backend 
- output.tf
	=> fichier contenant l'affichage de tout les ressources crée
- variable.tf
	=> fichier contenant la declaration des variables utilisées
- terraform.tfvars
	=> fichier contenant la valeur des variables declarées
	
