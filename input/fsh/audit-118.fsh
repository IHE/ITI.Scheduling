Profile:        AuditSchedulingServer
Parent:         IHE.BasicAudit.PatientCreate
Id:             IHE.Scheduling.FindExisting.Audit.Recipient
Title:          "Audit Event for the Find Existing Appointments Transaction at Recipient"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Find Existing Appointments \[ITI-118\] Transaction happens at the Recipient.
- Build off of the IHE Basic Audit Patient Create event
- add the ITI-118 as a subtype
- client is the Scheduling Client
- Server is the Scheduling Server
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have an appointment identity entity
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti118 1..1
* subtype[iti118] = urn:ihe:event-type-code#ITI-118 "Find Existing Appointments"
* agent[server] obeys val-audit-source
* agent[client] ^short = "Scheduling Client"
* agent[server] ^short = "Scheduling Server"
* entity[patient] ^short = "Patient"
* entity[data] ^short = "Appointment"
* entity[data].what only Reference(Appointment)


Profile:        AuditSchedulingClient
Parent:         IHE.BasicAudit.PatientCreate
Id:             IHE.Scheduling.FindExisting.Audit.Source
Title:          "Audit Event for the Find Existing Appointments Transaction at Source"
Description:    """
Defines constraints on the AuditEvent Resource to record when a Find Existing Appointments \[ITI-118\] Transaction happens at the Source.
- Build off of the IHE Basic Audit Patient Create event
- add the ITI-118 as a subtype
- client is the Scheduling Client
- Server is the Scheduling Server
- may have user, app, organization agent(s)
- shall have a patient entity
- shall have an appointment identity entity
"""
* modifierExtension 0..0
* subtype 2..
* subtype contains iti118 1..1
* subtype[iti118] = urn:ihe:event-type-code#ITI-118 "Find Existing Appointments"
* agent[client] obeys val-audit-source
* agent[client] ^short = "Scheduling Client"
* agent[server] ^short = "Scheduling Server"
* entity[patient] ^short = "Patient"
* entity[data] ^short = "Appointment"
* entity[data].what only Reference(Appointment)
