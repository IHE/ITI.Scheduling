Instance: IHE.Scheduling.client
InstanceOf: CapabilityStatement
Usage: #definition
* url = "https://profiles.ihe.net/ITI/Scheduling/CapabilityStatement/IHE.Scheduling.client"
* version = "1.0.0"
* name = "IHE_Scheduling_Client"
* title = "IHE Scheduling Client"
* status = #active
* experimental = false
* date = "2024-12-12"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].name = "IHE IT Infrastructure Technical Committee"
* contact[=].telecom.system = #url
* contact[=].telecom.value = "https://www.ihe.net/ihe_domains/it_infrastructure/"
* jurisdiction = http://unstats.un.org/unsd/methods/m49/m49.htm#001 "World"
* description = "CapabilityStatement for Client Actor in the IHE IT Infrastructure Technical Framework Supplement IHE FHIR Scheduling. See https://profiles.ihe.net/ITI/TF/Volume1/ch-38.html."
* copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #SHALL
* format[+] = #application/fhir+json
* format[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #SHOULD
/*
* implementationGuide[0] = "http://hl7.org/fhir/smart-app-launch/ImplementationGuide/hl7.fhir.uv.smart-app-launch"
* implementationGuide[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension.valueCode = #SHOULD
* implementationGuide[+] = "http://hl7.org/fhir/uv/ipa/ImplementationGuide/hl7.fhir.uv.ipa"
* implementationGuide[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension.valueCode = #SHOULD
*/
* implementationGuide[+] = "https://profiles.ihe.net/ITI/BALP/ImplementationGuide/ihe.iti.balp"
* implementationGuide[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension.valueCode = #SHOULD
* rest.mode = #client
* rest.documentation = "IHE Scheduling client will 
1. query for Patient resources matching the Patient resource query parameters, 
1. query for Appointment resources matching the IHE Scheduling Appointment resource query parameters,
1. use the operations defined for the Appointment resource"
* rest.security.cors = false
* rest.security.description = "None mandated by IHE, encouraged IHE-IUA or SMART-on-FHIR"
* rest.resource[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "date"
* rest.resource[=].extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].type = #Appointment
* rest.resource[=].profile = "https://profiles.ihe.net/ITI/Scheduling/StructureDefinition/ihe-sched-appt"
* rest.resource[=].profile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension.valueCode = #SHALL
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "_id"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Logical id of this artifact"
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-identifier"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide both the system and code values."
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Appointment-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The patient, or one of the patients, for whom this apointement exists"
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "date"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "The date, or date range, for the appointments being searched."
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "specialty"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Appointment-specialty"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The specialty for which the appointments being searched is."
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "appointment-type"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Appointment-appointment-type"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "practitioner"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Appointment-practitioner"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The provider, or one of the providers, with whom this apointement is scheduled"
* rest.resource[=].operation[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].operation[=].extension.valueCode = #SHALL
* rest.resource[=].operation[=].name = "find"
* rest.resource[=].operation[=].definition = "https://profiles.ihe.net/ITI/Scheduling/OperationDefinition/appointment-find"
* rest.resource[=].operation[=].documentation = "Document the find operation"
* rest.resource[=].operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].operation[=].extension.valueCode = #SHALL
* rest.resource[=].operation[=].name = "book"
* rest.resource[=].operation[=].definition = "https://profiles.ihe.net/ITI/Scheduling/OperationDefinition/appointment-book"
* rest.resource[=].operation[=].documentation = "Document the book operation"
* rest.resource[=].operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].operation[=].extension.valueCode = #SHOULD
* rest.resource[=].operation[=].name = "hold"
* rest.resource[=].operation[=].definition = "https://profiles.ihe.net/ITI/Scheduling/OperationDefinition/appointment-hold"
* rest.resource[=].operation[=].documentation = "Document the hold operation"
* rest.interaction.code = #search-system

Instance: IHE.Scheduling.server
InstanceOf: CapabilityStatement
Usage: #definition
* url = "https://profiles.ihe.net/ITI/Scheduling/CapabilityStatement/IHE.Scheduling.server"
* version = "1.0.0"
* name = "IHE_Scheduling_Server"
* title = "IHE Scheduling Server"
* status = #active
* experimental = false
* date = "2024-12-12"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].name = "IHE IT Infrastructure Technical Committee"
* contact[=].telecom.system = #url
* contact[=].telecom.value = "https://www.ihe.net/ihe_domains/it_infrastructure/"
* description = "CapabilityStatement for Server Actor in the IHE IT Infrastructure Technical Framework Supplement IHE FHIR Scheduling. See https://profiles.ihe.net/ITI/TF/Volume1/ch-38.html."
* copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #SHALL
* format[+] = #application/fhir+json
* format[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #SHALL
/*
* implementationGuide[0] = "http://hl7.org/fhir/smart-app-launch/ImplementationGuide/hl7.fhir.uv.smart-app-launch"
* implementationGuide[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension.valueCode = #SHOULD
* implementationGuide[+] = "http://hl7.org/fhir/uv/ipa/ImplementationGuide/hl7.fhir.uv.ipa"
* implementationGuide[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension.valueCode = #SHOULD
*/
* implementationGuide[+] = "https://profiles.ihe.net/ITI/BALP/ImplementationGuide/ihe.iti.balp"
* implementationGuide[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension.valueCode = #SHOULD
* rest.mode = #server
* rest.documentation = "Scheduling server provides capability to query for Patient resources matching a sub-set of the FHIR core Patient resource query parameters"
* rest.security.cors = false
* rest.security.description = "None mandated by IHE, encouraged IHE-IUA or SMART-on-FHIR"
* rest.resource[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "patient"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "date"
* rest.resource[=].extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].type = #Appointment
* rest.resource[=].profile = "https://profiles.ihe.net/ITI/Scheduling/StructureDefinition/ihe-sched-appt"
* rest.resource[=].profile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension.valueCode = #SHALL
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "_id"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Logical id of this artifact"
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-identifier"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide both the system and code values."
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Appointment-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The patient, or one of the patients, for whom this apointement exists"
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "date"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "The date, or date range, for the appointments being searched."
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "specialty"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Appointment-specialty"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The specialty for which the appointments being searched is."
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "appointment-type"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Appointment-appointment-type"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "practitioner"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Appointment-practitioner"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The provider, or one of the providers, with whom this apointement is scheduled"
* rest.resource[=].operation[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].operation[=].extension.valueCode = #SHALL
* rest.resource[=].operation[=].name = "find"
* rest.resource[=].operation[=].definition = "https://profiles.ihe.net/ITI/Scheduling/OperationDefinition/appointment-find"
* rest.resource[=].operation[=].documentation = "Document the find operation"
* rest.resource[=].operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].operation[=].extension.valueCode = #SHALL
* rest.resource[=].operation[=].name = "book"
* rest.resource[=].operation[=].definition = "https://profiles.ihe.net/ITI/Scheduling/OperationDefinition/appointment-book"
* rest.resource[=].operation[=].documentation = "Document the book operation"
* rest.resource[=].operation[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].operation[=].extension.valueCode = #SHOULD
* rest.resource[=].operation[=].name = "hold"
* rest.resource[=].operation[=].definition = "https://profiles.ihe.net/ITI/Scheduling/OperationDefinition/appointment-hold"
* rest.resource[=].operation[=].documentation = "Document the hold operation"
* rest.resource[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].type = #Bundle
* rest.resource[=].profile = "https://profiles.ihe.net/ITI/Scheduling/StructureDefinition/ihe-sched-avail-bundle"
* rest.resource[=].profile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension.valueCode = #SHALL
* rest.interaction.code = #search-system