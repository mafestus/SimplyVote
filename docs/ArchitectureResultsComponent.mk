@startuml
!include includes/C4_Component.puml

Container(resultsPortal,"Results Portal", "HTML/React", "Any user can view voting results")

Boundary(resultsController,"Results Controller"){
	Component(voteCheckController, "Single Vote Controller","")
	Component(voteTotalsController, "Vote Totals Controller","")
	Component(qrCodeService, "QR Code Service", "")
	Component(voteTotalsService, "Vote Aggregating Service", "")
	Component(resultsDbService, "Results DB Adapter", "")

	Rel_D(voteCheckController,qrCodeService, "")
	Rel_D(voteTotalsController,voteTotalsService, "")
	Rel_D(qrCodeService,resultsDbService, "")
	Rel_D(voteTotalsService,resultsDbService, "")
}

Container(tallyService, "Vote Tally Service", "")
ContainerDb(votesDb,"Votes Database", "NoSQL", "Database that contains all votes cast via voting machines")
ContainerDb(resultsDb,"Results Database", "NoSQL", "Database that is locked down once all votes are cast and polls are closed")
System_Ext(registrarMainframe,"Registrar Mainframe", "Existing database where voting results are stored")

Rel_D(resultsPortal, voteCheckController, "")
Rel_D(resultsPortal, voteTotalsController, "")
Rel_D(resultsDbService, resultsDb, "")
Rel_R(voteTotalsService, registrarMainframe, "")
Rel_R(votesDb, tallyService, "")
Rel_R(tallyService, resultsDb, "")

@enduml