Profile:        AuditSchedulingFindPotentialServer
Parent:         IHE.BasicAudit.PatientCreate
Id:             IHE.Scheduling.FindPotential.Audit.Recipient
Title:          "Audit Event for the Find Potential Appointments Transaction at Recipient"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Find Potential Appointments \[ITI-115\] Transaction happens at the Recipient, and the transaction contains a Patient resource.
- Build off of the IHE Basic Audit Patient Create event
- add the ITI-115 as a subtype
- client is the Scheduling Client
- Server is the Scheduling Server
- may have user, app, organization agent(s)
- shall have a patient entity
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti115 1..1
* subtype[iti115] = urn:ihe:event-type-code#ITI-115 "Find Potential Appointments"
* agent[server] obeys val-audit-source
* agent[client] ^short = "Scheduling Client"
* agent[server] ^short = "Scheduling Server"
* entity[patient] ^short = "Patient"


Invariant: val-audit-source
Description: "The Audit Source is this agent too."
Expression: "$this.who = %resource.source.observer"
Severity: #error


Profile:        AuditSchedulingFindPotentialClient
Parent:         IHE.BasicAudit.PatientCreate
Id:             IHE.Scheduling.FindPotential.Audit.Source
Title:          "Audit Event for the Find Potential Appointments Transaction at Source"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Find Potential Appointments \[ITI-115\] Transaction happens at the Source.
- Build off of the IHE Basic Audit Patient Create event
- add the ITI-115 as a subtype
- client is the Scheduling Client
- Server is the Scheduling Server
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have an appointment identity entity
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti115 1..1
* subtype[iti115] = urn:ihe:event-type-code#ITI-115 "Find Potential Appointments"
* agent[client] obeys val-audit-source
* agent[client] ^short = "Scheduling Client"
* agent[server] ^short = "Scheduling Server"
* entity[patient] ^short = "Patient"
* entity[data] ^short = "Appointment"
* entity[data].what only Reference(Appointment)
