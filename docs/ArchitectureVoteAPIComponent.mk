@startuml
!include includes/C4_Component.puml

Person(votingMachine,"Voting Machine","A device running the voting app")

Boundary(resultsController,"Vote API"){
	Component(ballotRetrievalController, "Ballot Retrieval Controller","")
	Component(voteCastingController, "Vote Casting Controller","")

	Component(authenticationController, "Authentication Controller", "")
	Component(voterAuthenticationService, "Authentication Service", "")

	Component(ballotDbService, "Ballot DB Adapter", "")
	Component(voteDbService, "Vote DB Adapter", "")

	Rel_D(voteCastingController,voteDbService, "")
	Rel_D(authenticationController,voterAuthenticationService, "")
	Rel_D(ballotRetrievalController,ballotDbService, "")
}

System_Ext(voterRoles,"External Voter Role System", "Existing system containing the current voter roles")
ContainerDb(ballotDb,"Ballot Database", "SQL", "Database that contains ballot information for an entire region")
ContainerDb(votesDb,"Votes Database", "NoSQL", "Database that contains all votes cast via voting machines")

Rel_D(votingMachine, authenticationController, "")
Rel_D(votingMachine, ballotRetrievalController, "")
Rel_D(votingMachine, voteCastingController, "")
Rel_D(ballotDbService, ballotDb, "")
Rel_D(voteDbService, votesDb, "")

Rel_R(voterAuthenticationService, voterRoles, "")

@enduml