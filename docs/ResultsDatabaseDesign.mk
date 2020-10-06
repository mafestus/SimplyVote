@startuml

hide circle
skinparam linetype ortho

entity Role {
    * 64_id: text <<generated>>
    --
    role: enum <<admin|region|precinct>>
    precinct: Precinct
    region: Region
}

entity Option {
    * 64_id: text <<generated>>
    --
    label: text
    description: text
}

entity OptionGroup {
    * 64_id: text
    --
    name: text
    description: text
    type: enum <<ranked|checked>>
    numOfChoices: int
}

entity Precinct {
    * 64_id: text
    --
    name: text
    boundary: GeoJSON Object
}

entity Region {
    * 64_id: text
    --
    name: text
    boundary: GeoJSON Object
}

entity Voter {
    * 64_id: text
    --
    * firstName: text
    * lastName: text
    * address: Address
    * code: text <<QRCode Value>>
}

entity Address {
    * 64_id: text
    --
    * streetAddress: text
    * precinct: Precinct
}

Option }|--o| OptionGroup
OptionGroup }|--o| Precinct
Precinct }|--o| Region
Role }o--o{ Precinct
Role ||--|| Region
Voter ||--|| Precinct
Voter ||--|| Address
Address }|--o| Precinct

@enduml