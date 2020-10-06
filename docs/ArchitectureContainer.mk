@startuml
!include includes/C4_Container.puml

Person_Ext(internetUser,"Internet User","Any person connected to the internet")
Person_Ext(clerkUser,"Authorized User","A person authorized to change a ballot")
Person(votingMachine,"Voting Machine","A device running the voting app")
System_Ext(voterRoles,"External Voter Role System", "Existing system containing the current voter roles")
System_Ext(registrarMainframe,"Registrar Mainframe", "Existing database where voting results are stored")

System_Boundary(votingSystem,"Voting System"){
	Container_Boundary(ballotCMSSystem, "Ballot Management"){
		Container(cmsPortal,"CMS Portal", "HTML/Angular", "Authorized users use this to manage ballot options")
		Container(cmsAPI,"CMS API", "Go","API for any function to manage a ballot")
		ContainerDb(ballotDb,"Ballot Database", "SQL", "Database that contains ballot information for an entire region")
	}
	Container_Boundary(voteCastingSystem, "Vote Casting"){
		Container(votingController,"Vote API", "NodeJS", "API for the voting machines directly to retrieve ballots and submit votes")
		ContainerDb(votesDb,"Votes Database", "NoSQL", "Database that contains all votes cast via voting machines")
	}
	Container_Boundary(reportingSystem, "Results Reporting"){
		Container(resultsPortal,"Results Portal", "HTML/React", "Any user can view voting results")
		Container(resultsAPI,"Results Controller", "Go", "API for any functions to retrieve voting results")
		ContainerDb(resultsDb,"Results Database", "NoSQL", "Database that is locked down once all votes are cast and polls are closed")
	}
	'Lay_L(ballotCMSSystem,voteCastingSystem)
	'Lay_L(voteCastingSystem,reportingSystem)
}
'Layout Panels

Rel_D(cmsPortal,cmsAPI,"")
Rel_D(cmsAPI,ballotDb,"")
Rel(votingController,ballotDb,"")
Rel_D(resultsPortal,resultsAPI,"")
Rel(votingController,resultsDb,"")
Rel_D(resultsAPI,resultsDb,"")
Rel_D(votingController,votesDb,"")

Rel_D(internetUser,resultsPortal,"")
Rel_D(votingMachine,votingController,"")
Rel_D(clerkUser,cmsPortal,"")
Rel_L(resultsAPI,registrarMainframe,"")
Rel_R(votingController,voterRoles,"")

@enduml