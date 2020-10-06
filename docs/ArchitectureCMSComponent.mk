@startuml
!include includes/C4_Component.puml

Container(cmsPortal,"CMS Portal", "HTML/Angular", "Authorized users use this to manage ballot options")

Boundary(resultsController,"CMS API"){
	Component(oauthController, "OAuth Controller","")
	Component(adminController, "Admin Controller","")
	Component(regionController, "Region Controller","")
	Component(precinctController, "Precinct Controller","")
	Component(localController, "Local Controller","")


	Component(oauthService, "Authentication Service", "")

	Component(cmsService, "CMS API Service", "")
	Component(ballotDbService, "Ballot DB Adapter", "")

	Rel_D(oauthController,oauthService, "")
	Rel_D(adminController,cmsService, "")
	Rel_D(regionController,cmsService, "")
	Rel_D(precinctController,cmsService, "")
	Rel_D(localController,cmsService, "")
	Rel_D(cmsService,ballotDbService, "")
}

ContainerDb(ballotDb,"Ballot Database", "SQL", "Database that contains ballot information for an entire region")

Rel_D(cmsPortal, oauthController, "")
Rel_D(cmsPortal, adminController, "")
Rel_D(cmsPortal, precinctController, "")
Rel_D(cmsPortal, regionController, "")
Rel_D(cmsPortal, localController, "")
Rel_D(ballotDbService, ballotDb, "")

@enduml