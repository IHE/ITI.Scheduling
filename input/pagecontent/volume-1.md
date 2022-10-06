
# 1:XX FHIR Scheduling

The IHE FHIR Scheduling profile is a vendor agnostic specification providing FHIR APIs and guidance for access to and booking of appointments for patients by both patient and practitioner end users, including cross-organizational workflows. This specification is based on [FHIR Version 4.0.1](http://hl7.org/fhir/R4/), and references the [Schedule](http://hl7.org/fhir/R4/schedule.html), [Slot](http://hl7.org/fhir/R4/slot.html), and [Appointment](http://hl7.org/fhir/R4/appointment.html) resources.

This workflow profile defines transactions that allow a scheduling client to obtain information about possible appointment opportunities based on specific parameters, and, based on that information, allow the client to book an appointment.

**TODO: Provide an end-user friendly overview of what the profile does for them. Keep it brief (a paragraph or two, up to a page). If extensive detail is needed, it should be included in Section XX.4- Use Cases.**

**TODO: Explicitly state whether this is a Workflow, Transport, or Content Module (or combination) profile. See the IHE Technical Frameworks General Introduction for definitions of these profile types. The IHE Technical Frameworks [General Introduction](https://profiles.ihe.net/GeneralIntro/).**

## 1:X.1 FHIR Scheduling Actors and Transactions <a name="actors-and-transactions"> </a>

* Actors

  - [Scheduling Client](#client)
  - [Scheduling Server](#server)

* Transactions

  - [Y1 Find Appointments](ITI-Y1.html)
  - [Y2 Hold Appointment](ITI-Y2.html)
  - [Y3 Book Appointment](ITI-Y3.html)


The figure below shows the actors directly involved in the ITI Scheduling Profile and the relevant transactions between them.

<div>
{%include ActorsAndTransactions.svg%}
</div>
<br clear="all">

**Figure XX.1-1: Scheduling Actor Diagram** <a name="actor-diagram"> </a>

Table XX.1-1: Profile Acronym Profile - Actors and Transactions

| Actors            | Transactions               | Initiator or Responder | Optionality     | Reference      |
|-------------------|----------------------------|------------------------|-----------------|----------------|
| Scheduling Client | Find Appointments [ITI-Y1] | Initiator              | R               | ITI TF-2: 3.Y1 |
|                   | Hold Appointment [ITI-Y2]  | Initiator              | O               | ITI TF-2: 3.Y3 |
|                   | Book Appointment [ITI-Y3]  | Initiator              | R               | ITI TF-2: 3.Y4 |
| Scheduling Server | Find Appointments [ITI-Y1] | Responder              | R               | ITI TF-2: 3.Y1 |
|                   | Hold Appointment [ITI-Y2]  | Responder              | O               | ITI TF-2: 3.Y3 |
|                   | Book Appointment [ITI-Y3]  | Responder              | R               | ITI TF-2: 3.Y4 |
{: .grid}

### XX.1.1 Actors
The actors in this profile are described in more detail in the sections below.

#### XX.1.1.1 Scheduling Client <a name="client"> </a>

The Scheduling Client determines an appropriate slot based on the parameters it supplies to the Scheduling Server, and then books an appointment for a given patient. The following points apply to the Scheduling Client:

- The client needs a mechanism to properly identify the patient. The details of this capability is out of scope for this profile.
- The client needs to determine FHIR Capability Statement for [Client](CapabilityStatement-IHE.Scheduling.client.html)

#### XX.1.1.2 Scheduling Server <a name="server"> </a>

The Scheduling Server provides services for providing a list of available appointments, and for booking an appointment. The following points apply to the Scheduling Server:

- The server expects that the Patient and Provider/ProviderRole resources are properly identified. The exact mechanisms for making sure that the client has this correct information is out of scope for this profile.
- The server can chose to implement one of the options for obtaining available slots or appointments, or chose to implement both. Implementing both options on the server can increase interoperability for scheduling clients, however, the types of appointments for a particular server may be better served by one or the other option. Depending on the supported use cases, implementing only one of the Find Appointments or the Pre-fetch Slots options can be a better solution.
- The server may chose to implement the Hold Appointment transaction, if the supported use cases have such a need.

FHIR Capability Statement for [Server](CapabilityStatement-IHE.Scheduling.server.html)

### XX.1.2 Transaction Descriptions <a name="transactions"> </a>
The transactions in this profile are summarized in the sections below.

#### XX.1.2.1 Find Appointments [ITI-Y1]

This transaction searches for availability for a future appointment(s) using the Find Appointments operation.
{%include FindAppointments-note.md%}

For more details see the detailed [transaction description](ITI-Y1.html)

#### XX.1.2.2 Hold Appointment [ITI-Y2]

Request for a hold on a selected Appointment in order for the user to complete entering data for booking an appointment. This operation precedes the booking and follows the determination of appointment availability using the Find Appointments operation.
{%include HoldAppointment-note.md%}

For more details see the detailed [transaction description](ITI-Y2.html)
#### XX.1.2.3 Book Appointment [ITI-Y3]

This operation books an appointment following the determination of appointment availability using the Find Appointments operation. Using different combination of parameters, this operation can book a new appointment, cancel an already existing appointment, or reschedule an existing appointment.
{%include BookAppointment-note.md%}

For more details see the detailed [transaction description](ITI-Y3.html)

## XX.2 Scheduling Actor Options <a name="actor-options"> </a>

There are currently no options for these actors.

## XX.3 Scheduling Required Actor Groupings <a name="required-groupings"> </a>
There are no required groupings for this profile.

## XX.4 FHIR Scheduling Overview <a name="overview"> </a>

This section shows how the transactions of the profile are combined to address the use cases.

### XX.4.1 Concepts

The FHIR specification defines several resources to describe scheduling-related information. The  [Schedule](http://hl7.org/fhir/R4/schedule.html), [Slot](http://hl7.org/fhir/R4/slot.html), and [Appointment](http://hl7.org/fhir/R4/appointment.html) resources are intended to be compatible with the [iCalendar specification](https://datatracker.ietf.org/doc/html/rfc5545). A survey of existing implementations, however, showed that there is very little commonality among existing FHIR server implementations, which suggests that an operation-based specification will improve interoperability in this area.

The overall functionality covered by this profile is as follows:
1. The Scheduling Client identifies the patient or patients for whom the appointment will be scheduled
2. The Scheduling Client determines the available parameters for requesting a list of available appointments
3. The Find Appointments transaction is completed.
4. (Optionally) The Hold Appointment transaction is completed.
5. The Book Appointment Transaction is completed.


### XX.4.2 Use Cases

#### XX.4.2.1 Use Case \#1: Provider-facing scheduling client


##### XX.4.2.1.1 Post-discharge PCP Visit

##### XX.4.2.1.2 Specialty Visit Scheduling
###### XX.4.2.1.2.1 Specialty Visit Scheduling Use Case Description
Dr. Brown detects that a radiology examination is recommended to proceed the
treatment of her Patient Mr. White. Dr. Brown opens the radiology examination
scheduling in her clinical information systems and selects a radiology facility
for the examination.

From the list of available time slots presented in the clinical information system Dr. Brown selects an appropriate time slot for the
examination of Mr. White. Dr. Brown records the booking details
(e.g., Mr. White demographics, treatment, body part to examine, etc.) in the
booking details dialog of the clinical information system. Dr. Brown confirms
the records and books the examination in the confirm dialog in her clinical
information system.

###### XX.4.2.1.2.2 Provider-facing scheduling client Process Flow

<div>
{%include uc1-flow.svg%}
</div>
<br clear="all">

Figure XX.4.2.1-1: Provider-facing scheduling client Process Flow


#### XX.4.2.2 Use Case \#2: Patient-facing scheduling client

##### XX.4.2.2.1 Foreign Visitor Urgent Visit
###### XX.4.2.2.1.1 Use Case Description

Mr. White feels sick on holidays in a foreign country and wants to visit
a healthcare provider for an examination. Mr. White opens the local patient portal
and searches for a healthcare provider using search criteria
(e.g., distance, opening hours, supported languages).
Mr. White selects a Dr. Browns paractise as healthcare provider and opens the
appointments view in the patient portal.

From the list of available time slots presented in the patient portal Mr. White
selects an appropriate time slot for the visit. Mr. White records the booking details
(e.g., demographics, symptoms, etc.) in the booking details dialog in the patient
portal. Mr. White confirms the records and books the examination in the confirm
dialog of the patient portal.

###### XX.4.2.2.1.2 Foreign Visitor Urgent Visitor Process Flow

<div>
{%include uc2-flow.svg%}
</div>
<br clear="all">

Figure XX.4.2.2-1: Patient-facing scheduling client Process Flow

## XX.5 FooBar Security Considerations <a name="security-considerations"> </a>

See ITI TF-2x: [Appendix Z.8 “Mobile Security Considerations”](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations)

The following is instructions to the editor and this text is not to be included in a publication.
The material initially from [RFC 3552 "Security Considerations Guidelines" July 2003](https://tools.ietf.org/html/rfc3552).

This section should address downstream design considerations, specifically for: Privacy, Security, and Safety. These might need to be individual header sections if they are significant or need to be referenced.

The editor needs to understand Security and Privacy fundamentals.
General [Security and Privacy guidance](http://hl7.org/fhir/secpriv-module.html) is provided in the FHIR Specification.
The FHIR core specification should be leveraged where possible to inform the reader of your specification.

IHE FHIR based profiles should reference the [ITI Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html) section 8 Mobile Security and Privacy Considerations base when appropriate.

IHE Document Content profiles can reference the security and privacy provided by the Document Sharing infrastructure as directly grouped or possibly to be grouped.

   While it is not a requirement that any given specification or system be
   immune to all forms of attack, it is still necessary for authors of specifications to
   consider as many forms as possible.  Part of the purpose of the
   Security and Privacy Considerations section is to explain what attacks have been
   considered and what countermeasures can be applied to defend against them.

   There should be a clear description of the kinds of threats on the
   described specification.  This should be approached as an
   effort to perform "due diligence" in describing all known or
   foreseeable risks and threats to potential implementers and users.

Authors MUST describe:
* which attacks have been considered and addressed in the specification
* which attacks have been considered but not addressed in the specification
* what could be done in system design, system deployment, or user training


   At least the following forms of attack MUST be considered:
   eavesdropping, replay, message insertion, deletion, modification, and
   man-in-the-middle.  Potential denial of service attacks MUST be
   identified as well.  If the specification incorporates cryptographic
   protection mechanisms, it should be clearly indicated which portions
   of the data are protected and what the protections are (i.e.,
   integrity only, confidentiality, and/or endpoint authentication,
   etc.).  Some indication should also be given to what sorts of attacks
   the cryptographic protection is susceptible.  Data which should be
   held secret (keying material, random seeds, etc.) should be clearly
   labeled.

   If the specification involves authentication, particularly user-host
   authentication, the security of the authentication method MUST be
   clearly specified.  That is, authors MUST document the assumptions
   that the security of this authentication method is predicated upon.

   The threat environment addressed by the Security and Privacy Considerations
   section MUST at a minimum include deployment across the global
   Internet across multiple administrative boundaries without assuming
   that firewalls are in place, even if only to provide justification
   for why such consideration is out of scope for the protocol.  It is
   not acceptable to only discuss threats applicable to LANs and ignore
   the broader threat environment.  In
   some cases, there might be an Applicability Statement discouraging
   use of a technology or protocol in a particular environment.
   Nonetheless, the security issues of broader deployment should be
   discussed in the document.

   There should be a clear description of the residual risk to the user
   or operator of that specification after threat mitigation has been
   deployed.  Such risks might arise from compromise in a related
   specification (e.g., IPsec is useless if key management has been
   compromised), from incorrect implementation, compromise of the
   security technology used for risk reduction (e.g., a cipher with a
   40-bit key), or there might be risks that are not addressed by the
   specification (e.g., denial of service attacks on an
   underlying link protocol).  Particular care should be taken in
   situations where the compromise of a single system would compromise
   an entire protocol.  For instance, in general specification designers
   assume that end-systems are inviolate and don't worry about physical
   attack.  However, in cases (such as a certificate authority) where
   compromise of a single system could lead to widespread compromises,
   it is appropriate to consider systems and physical security as well.

   There should also be some discussion of potential security risks
   arising from potential misapplications of the specification or technology
   described in the specification.  

This section also include specific considerations regarding Digital Signatures, Provenance, Audit Logging, and De-Identification.

Where audit logging is specified, a StructureDefinition profile(s) should be included, and Examples of those logs might be included.

## XX.6 FooBar Cross-Profile Considerations <a name="other-grouping"> </a>

This section is informative, not normative. It is intended to put
this profile in context with other profiles. Any required groupings
should have already been described above. Brief descriptions can go
directly into this section; lengthy descriptions should go into an
appendix. Examples of this material include ITI Cross Community Access
(XCA) Grouping Rules (Section 18.2.3), the Radiology associated profiles
listed at wiki.ihe.net, or ITI Volume 1 Appendix E “Cross Profile
Considerations”, and the “See Also” sections Radiology Profile
descriptions on the wiki such as
<http://wiki.ihe.net/index.php/Scheduled_Workflow#See_Also>. If this
section is left blank, add “Not applicable.”

Consider using a format such as the following:

other profile acronym - other profile name

A other profile actor name in other profile name might
be grouped with a this profile actor name to describe
benefit/what is accomplished by grouping.
