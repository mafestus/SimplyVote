@startuml
!include includes/C4_Context.puml

Person_Ext(internetUser,"Internet User","Any person connected to the internet")
Person_Ext(clerkUser,"Authorized User","A person authorized to change a ballot")
Person(votingMachine,"Voting Machine","A device running the voting app")
System_Ext(voterRoles,"External Voter Role System", "Existing system containing the current voter roles")
System_Ext(registrarMainframe,"Registrar Mainframe", "Existing database where voting results are stored")
System(votingSystem,"Voting System","Set of services to allow for CMS and electronic voting")

Rel(internetUser, votingSystem, "Can view results","http/https")
Rel(clerkUser, votingSystem, "Creates and manages ballot options","https")
Rel(votingMachine, votingSystem, "Reads ballot and posts selections", "https/blockchain")
Rel(votingSystem, voterRoles, "Access voter roles for precinct information")
Rel(votingSystem, registrarMainframe, "Sends results to government mainframe")

@enduml 5197124