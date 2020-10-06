@startuml

hide circle
skinparam linetype ortho

entity User {
    * 64_id: text <<generated>>
    --
    role: Role
    firstName: text
    lastName: text
    email: text
    token: OAuth Token
}

entity Role {
    * 64_id: text <<generated>>
    --
    control: enum <<admin|region|precinct>>
    precinct: Precinct
    region: Region
}

entity Option {
    * 64_id: text <<generated>>
    --
    * label: text
    description: text
    partyAffiliation: text
}

entity OptionGroup {
    * 64_id: text
    --
    * name: text
    description: text
    * type: enum <<ranked|checked>>
    numOfChoices: int
}

entity Precinct {
    * 64_id: text
    --
    * name: text
    boundary: GeoJSON Object
}

entity Region {
    * 64_id: text
    --
    * name: text
    boundary: GeoJSON Shape
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
    * addressLine1: text
    addressLine2: text
    addressLine2: text
    * addressCity: text
    * addressState: text
    * addressPostalCode: text
    * precinct: Precinct
    location: GeoJSON Coord
}

Option }|--o| OptionGroup
OptionGroup }|--o| Precinct
Precinct }|--o| Region
Role }o--o{ Precinct
Role ||--|| Region
Voter ||--|| Precinct
Voter }o--|| Address
Address }|--o| Precinct

@enduml