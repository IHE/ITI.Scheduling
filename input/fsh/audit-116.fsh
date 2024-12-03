Profile:        AuditSchedulingHoldServer
Parent:         IHE.BasicAudit.PatientCreate
Id:             IHE.Scheduling.Hold.Audit.Recipient
Title:          "Audit Event for the Hold Appointment Transaction at Recipient"
Description:    """
Defines constraints on the AuditEvent Resource to record when a hold Appointment \[ITI-116\] Transaction happens at the Recipient.
- Build off of the IHE Basic Audit Patient Create event
- add the ITI-116 as a subtype
- client is the Scheduling Client
- Server is the Scheduling Server
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have an appointment identity entity
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti116 1..1
* subtype[iti116] = urn:ihe:event-type-code#ITI-116 "Hold Appointment"
* agent[server] obeys val-audit-source
* agent[client] ^short = "Scheduling Client"
* agent[server] ^short = "Scheduling Server"
* entity[patient] ^short = "Patient"
* entity[data] ^short = "Appointment"
* entity[data].what only Reference(Appointment)


Profile:        AuditSchedulingHoldClient
Parent:         IHE.BasicAudit.PatientCreate
Id:             IHE.Scheduling.Hold.Audit.Source
Title:          "Audit Event for the Hold Appointment Transaction at Source"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Hold Appointment \[ITI-116\] Transaction happens at the Source.
- Build off of the IHE Basic Audit Patient Create event
- add the ITI-116 as a subtype
- client is the Scheduling Client
- Server is the Scheduling Server
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have an appointment identity entity
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti116 1..1
* subtype[iti116] = urn:ihe:event-type-code#ITI-116 "Hold Appointment"
* agent[client] obeys val-audit-source
* agent[client] ^short = "Scheduling Client"
* agent[server] ^short = "Scheduling Server"
* entity[patient] ^short = "Patient"
* entity[data] ^short = "Appointment"
* entity[data].what only Reference(Appointment)
