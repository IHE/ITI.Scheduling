Profile:        AuditSchedulingServer
Parent:         IHE.BasicAudit.PatientCreate
Id:             IHE.Scheduling.Book.Audit.Recipient
Title:          "Audit Event for the Book Appointment Transaction at Recipient"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Book Appointment \[ITI-117\] Transaction happens at the Recipient.
- Build off of the IHE Basic Audit Patient Create event
- add the ITI-117 as a subtype
- client is the Scheduling Client
- Server is the Scheduling Server
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have an appointment identity entity
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti117 1..1
* subtype[iti117] = urn:ihe:event-type-code#ITI-117 "Book Appointment"
* agent[server] obeys val-audit-source
* agent[client] ^short = "Scheduling Client"
* agent[server] ^short = "Scheduling Server"
* entity[patient] ^short = "Patient"
* entity[data] ^short = "Appointment"
* entity[data].what only Reference(Appointment)


Invariant: val-audit-source
Description: "The Audit Source is this agent too."
Expression: "$this.who = %resource.source.observer"
Severity: #error


Profile:        AuditSchedulingClient
Parent:         IHE.BasicAudit.PatientCreate
Id:             IHE.Scheduling.Book.Audit.Source
Title:          "Audit Event for the Book Appointment Transaction at Source"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Book Appointment \[ITI-117\] Transaction happens at the Source.
- Build off of the IHE Basic Audit Patient Create event
- add the ITI-117 as a subtype
- client is the Schedulking Client
- Server is the Scheduling Server
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have an appointment identity entity
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti117 1..1
* subtype[iti117] = urn:ihe:event-type-code#ITI-117 "Book Appointment"
* agent[client] obeys val-audit-source
* agent[client] ^short = "Scheduling Client"
* agent[server] ^short = "Scheduling Server"
* entity[patient] ^short = "Patient"
* entity[data] ^short = "Appointment"
* entity[data].what only Reference(Appointment)
