Profile:        AuditSchedulingClient
Parent:         AuditEvent
Id:             IHE.Scheduling.Book.Audit.Recipient
Title:          "Audit Event for the Book Appointment Transaction at Recipient"
Description:    "Defines constraints on the AuditEvent Resource to record when a Book Appointment Transaction happens at the Recipient.
- Import event
- shall have source of itself
- shall have a document source agent
- shall have a document recipient agent
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a submission set identity entity"
* modifierExtension 0..0
* type = DCM#110107 "Import"
* action = #C
* subtype ^slicing.discriminator.type = #value
* subtype ^slicing.discriminator.path = "$this"
* subtype ^slicing.rules = #open // allow other codes
* subtype 1..
* subtype contains iti117 1..1
* subtype[iti117] = urn:ihe:event-type-code#ITI-117 "Book Appointment"
// * severity in R5
* recorded 1..1 // already required
* outcome 1..1
* outcomeDesc MS // encouraged
// source is already required, see invariant val-audit-source use
* agent 2..*
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent ^slicing.description = "source, recipient, and possibly the user who participated"
* agent contains 
	schedulingServer 1..1 and
	schedulingClient 1..1 
	// may be many including app identity, user identity, etc
* agent[schedulingServer].type = DCM#110153 "Source Role ID"
* agent[schedulingServer].who 1..1
* agent[schedulingServer].network 1..1
* agent[schedulingClient].type = DCM#110152 "Destination Role ID"
* agent[schedulingClient].who 1..1
* agent[schedulingClient] obeys val-audit-source
* agent[schedulingClient].network 1..1
* agent[schedulingServer] ^short = "Scheduling Server"
* agent[schedulingClient] ^short = "Scheduling Client"
* entity 2..
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #open
* entity ^slicing.description = "patient and submission set involved"
* entity contains
	patient 1..1 and
	appointment 1..1
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[appointment].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[appointment].role = http://terminology.hl7.org/CodeSystem/object-role#20 "Job"
* entity[appointment].what 1..1
* entity[appointment].what only Reference(List) 
* entity[patient] ^short = "Patient"
* entity[appointment] ^short = "Appointment"

Invariant: val-audit-source
Description: "The Audit Source is this agent too."
Expression: "$this.who = %resource.source.observer"
Severity: #error

Profile:        AuditSchedulingServer
Parent:         AuditEvent
Id:             IHE.MHD.ProvideBundle.Audit.Source
Title:          "Audit Event for the Book Appointment Transaction at Source"
Description:    "Defines constraints on the AuditEvent Resource to record when a Book Appointment Transaction happens at the Source.
- Export event
- shall have source of itself
- shall have a document source agent
- shall have a document recipient agent
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have a submission set identity entity"
* modifierExtension 0..0
* type = DCM#110106 "Export"
* action = #R
* subtype ^slicing.discriminator.type = #value
* subtype ^slicing.discriminator.path = "$this"
* subtype ^slicing.rules = #open // allow other codes
* subtype 1..
* subtype contains iti117 1..1
* subtype[iti117] = urn:ihe:event-type-code#ITI-65 "Book Appointment Bundle"
// * severity in R5
* recorded 1..1 // already required
* outcome 1..1
* outcomeDesc MS // encouraged
// source is already required, see invariant val-audit-source use
* agent 2..*
* agent ^slicing.discriminator.type = #pattern
* agent ^slicing.discriminator.path = "type"
* agent ^slicing.rules = #open
* agent ^slicing.description = "source, recipient, and possibly the user who participated"
* agent contains 
	schedulingServer 1..1 and
	schedulingClient 1..1 
	// may be many including app identity, user identity, etc
* agent[schedulingServer].type = DCM#110153 "Source Role ID"
* agent[schedulingServer].who 1..1
* agent[schedulingServer] obeys val-audit-source
* agent[schedulingServer].network 1..1
* agent[schedulingClient].type = DCM#110152 "Destination Role ID"
* agent[schedulingClient].who 1..1
* agent[schedulingClient].network 1..1
* agent[schedulingServer] ^short = "Scheduling Server"
* agent[schedulingClient] ^short = "Scheduling Client"
* entity 2..
* entity ^slicing.discriminator.type = #pattern
* entity ^slicing.discriminator.path = "type"
* entity ^slicing.rules = #open
* entity ^slicing.description = "patient and appointment involved"
* entity contains
	patient 1..1 and
	appointment 1..1
* entity[patient].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#1 "Person"
* entity[patient].role = http://terminology.hl7.org/CodeSystem/object-role#1 "Patient"
* entity[patient].what 1..1
* entity[patient].what only Reference(Patient)
* entity[appointment].type = http://terminology.hl7.org/CodeSystem/audit-entity-type#2 "System Object"
* entity[appointment].role = http://terminology.hl7.org/CodeSystem/object-role#20 "Job"
* entity[appointment].what 1..1
* entity[appointment].what only Reference(List) 
* entity[patient] ^short = "Patient"
* entity[appointment] ^short = "SubmissionSet"
