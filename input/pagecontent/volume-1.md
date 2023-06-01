
# 1:55 FHIR Scheduling

The IHE FHIR Scheduling profile is a vendor agnostic specification providing FHIR APIs and guidance for access to and booking of appointments for patients by both patient and practitioner end users, including cross-organizational workflows. This specification is based on [FHIR Version 4.0.1](http://hl7.org/fhir/R4/), and references the [Schedule](http://hl7.org/fhir/R4/schedule.html), [Slot](http://hl7.org/fhir/R4/slot.html), and [Appointment](http://hl7.org/fhir/R4/appointment.html) resources.

This workflow profile defines transactions that allow a scheduling client to obtain information about possible appointment opportunities based on specific parameters, and, based on that information, allow the client to book an appointment.

**TODO: Provide an end-user friendly overview of what the profile does for them. Keep it brief (a paragraph or two, up to a page). If extensive detail is needed, it should be included in Section 55.4- Use Cases.**

**TODO: Explicitly state whether this is a Workflow, Transport, or Content Module (or combination) profile. See the IHE Technical Frameworks General Introduction for definitions of these profile types. The IHE Technical Frameworks [General Introduction](https://profiles.ihe.net/GeneralIntro/).**

## 1:X.1 FHIR Scheduling Actors and Transactions <a name="actors-and-transactions"> </a>

* Actors

  - [Scheduling Client](#client)
  - [Scheduling Server](#server)

* Transactions

  - [114 Find Potential Appointments](ITI-114.html)
  - [115 Hold Appointment](ITI-115.html)
  - [116 Book Appointment](ITI-116.html)
  - [117 Find Existing Appointments](ITI-117.html)


The figure below shows the actors directly involved in the ITI Scheduling Profile and the relevant transactions between them.

<div>
{%include ActorsAndTransactions.svg%}
</div>
<br clear="all">

**Figure 55.1-1: Scheduling Actor Diagram** <a name="actor-diagram"> </a>

Table 55.1-1: Profile Acronym Profile - Actors and Transactions

| Actors            | Transactions               | Initiator or Responder | Optionality     | Reference      |
|-------------------|----------------------------|------------------------|-----------------|----------------|
| Scheduling Client | Find Appointments [ITI-114] | Initiator              | R               | ITI TF-2: 3.114 |
|                   | Hold Appointment [ITI-115]  | Initiator              | O               | ITI TF-2: 3.115 |
|                   | Book Appointment [ITI-116]  | Initiator              | R               | ITI TF-2: 3.116 |
| Scheduling Server | Find Appointments [ITI-114] | Responder              | R               | ITI TF-2: 3.114 |
|                   | Hold Appointment [ITI-115]  | Responder              | O               | ITI TF-2: 3.115 |
|                   | Book Appointment [ITI-116]  | Responder              | R               | ITI TF-2: 3.116 |
{: .grid}

### 55.1.1 Actors
The actors in this profile are described in more detail in the sections below.

#### 55.1.1.1 Scheduling Client <a name="client"> </a>

The Scheduling Client determines an appropriate slot based on the parameters it supplies to the Scheduling Server, and then books an appointment for a given patient. The following points apply to the Scheduling Client:

- The client needs a mechanism to properly identify the patient. The details of this capability is out of scope for this profile.
- The client needs to determine FHIR Capability Statement for [Client](CapabilityStatement-IHE.Scheduling.client.html)

#### 55.1.1.2 Scheduling Server <a name="server"> </a>

The Scheduling Server provides services for providing a list of available appointments, and for booking an appointment. The following points apply to the Scheduling Server:

- The server expects that the Patient and Provider/ProviderRole resources are properly identified. The exact mechanisms for making sure that the client has this correct information is out of scope for this profile.
- The server can chose to implement one of the options for obtaining available slots or appointments, or chose to implement both. Implementing both options on the server can increase interoperability for scheduling clients, however, the types of appointments for a particular server may be better served by one or the other option. Depending on the supported use cases, implementing only one of the Find Appointments or the Pre-fetch Slots options can be a better solution.
- The server may chose to implement the Hold Appointment transaction, if the supported use cases have such a need.

FHIR Capability Statement for [Server](CapabilityStatement-IHE.Scheduling.server.html)

### 55.1.2 Transaction Descriptions <a name="transactions"> </a>
The transactions in this profile are summarized in the sections below.

#### 55.1.2.1 Find Potential Appointments [ITI-114]

This transaction searches for availability for a future appointment(s) using the Find Appointments operation.
{%include FindAppointments-note.md%}

For more details see the detailed [transaction description](ITI-114.html)

#### 55.1.2.2 Hold Appointment [ITI-115]

Request for a hold on a selected Appointment in order for the user to complete entering data for booking an appointment. This operation precedes the booking and follows the determination of appointment availability using the Find Appointments operation.
{%include HoldAppointment-note.md%}

For more details see the detailed [transaction description](ITI-115.html)
#### 55.1.2.3 Book Appointment [ITI-116]

This operation books an appointment following the determination of appointment availability using the Find Appointments operation. Using different combination of parameters, this operation can book a new appointment, cancel an already existing appointment, or reschedule an existing appointment.
{%include BookAppointment-note.md%}

For more details see the detailed [transaction description](ITI-116.html)

#### 55.1.2.4 Find Existing Appointments [ITI-117]

This transaction searches for existing appointments for the patient using [FHIR Search](http://hl7.org/fhir/R4/search.html) against the [Appointment resource](StructureDefinition-ihe-sched-appt.html).
{%include ExistingAppointments-note.md%}

For more details see the detailed [transaction description](ITI-117.html)

## 55.2 Scheduling Actor Options <a name="actor-options"> </a>

There are currently no options for these actors.

## 55.3 Scheduling Required Actor Groupings <a name="required-groupings"> </a>
There are no required groupings for this profile.

## 55.4 FHIR Scheduling Overview <a name="overview"> </a>

This section shows how the transactions of the profile are combined to address the use cases.

### 55.4.1 Concepts

The FHIR specification defines several resources to describe scheduling-related information. The  [Schedule](http://hl7.org/fhir/R4/schedule.html), [Slot](http://hl7.org/fhir/R4/slot.html), and [Appointment](http://hl7.org/fhir/R4/appointment.html) resources are intended to be compatible with the [iCalendar specification](https://datatracker.ietf.org/doc/html/rfc5545). A survey of existing implementations, however, showed that there is very little commonality among existing FHIR server implementations, which suggests that an operation-based specification will improve interoperability in this area.

The overall functionality covered by this profile is as follows:
1. The Scheduling Client identifies the patient or patients for whom the appointment will be scheduled
2. The Scheduling Client determines the available parameters for requesting a list of available appointments
3. The Find Appointments transaction is completed.
4. (Optionally) The Hold Appointment transaction is completed.
5. The Book Appointment Transaction is completed.


### 55.4.2 Use Cases

#### 55.4.2.1 Use Case \#1: Provider-facing scheduling client


##### 55.4.2.1.1 Post-discharge PCP Visit

##### 55.4.2.1.2 Specialty Visit Scheduling
###### 55.4.2.1.2.1 Specialty Visit Scheduling Use Case Description
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

###### 55.4.2.1.2.2 Provider-facing scheduling client Process Flow

<div>
{%include uc1-flow.svg%}
</div>
<br clear="all">

Figure 55.4.2.1-1: Provider-facing scheduling client Process Flow


#### 55.4.2.2 Use Case \#2: Patient-facing scheduling client

##### 55.4.2.2.1 Foreign Visitor Urgent Visit
###### 55.4.2.2.1.1 Use Case Description

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

###### 55.4.2.2.1.2 Foreign Visitor Urgent Visitor Process Flow

<div>
{%include uc2-flow.svg%}
</div>
<br clear="all">

Figure 55.4.2.2-1: Patient-facing scheduling client Process Flow

## 55.5 FHIR Scheduling Security Considerations <a name="security-considerations"> </a>

Actors are expected to follow the recommendations and requirements found in [Appendix Z.8 “Mobile Security Considerations”](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations).

The resources exchanged in this profile may contain information which pose a privacy risk, or in some cases, a safety risk, to providers and other personnel, as well as patients. For example, practitioner or patient phone numbers and home addresses may be conveyed. Implementers should determine what data will be exposed by the system and what level of public access there will be if any.

Implementers should consider this when determining the access policies for these Resources. System administrators for the underlying host systems must follow industry best practices for authentication, authorization, auditing, timely application of software patches, etc.

There are many reasonable methods of security for interoperability transactions which can be implemented without modifying the characteristics of the transactions in the FHIR Scheduling Profile. The use of TLS is encouraged, specifically the use of the ATNA Profile (see [ITI TF-1: 9](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html)).

User authentication on mobile devices and browsers is typically handled by more lightweight authentication schemes such as HTTP Authentication, OAuth 2.0, or OpenID Connect. IHE has a set of profiles for user authentication including Internet User Authentication (IUA) for REST-based authentication. Implementers should implement the [SMART on FHIR IG](http://hl7.org/fhir/smart-app-launch/) for the corresponding use cases (patient-facing or provider-facing). The network communication security and user authentication are layered in the HTTP transport layer.

## 55.6 FHIR Scheduling Cross-Profile Considerations <a name="other-grouping"> </a>
The FHIR Scheduling Profile is intended to be used in varied settings and to satisfy multiple use cases. Some of these uses will benefit from using FHIR Scheduling together with other IHE profiles. The following cross-profile  descriptions are not exclusive or exhaustive, and the list can be update in the future.

### 55.6.1 mCSD - Mobile Care Services Discovery
When a patient needs to schedule an appointment outside their usual care providing environment, they may need to initially find the endpoint of the healthcare or service provider where an appointment can be requested. The [ITI-90 Find Matching Care Services](https://profiles.ihe.net/ITI/mCSD/ITI-90.html) transaction from the mCSD profile can be used for endpoint discovery prior to the use of the Find Appointments transaction.

### 55.6.2 360X - 360 Exchange Closed Loop Referral
The [360X Profile](https://www.ihe.net/uploadedFiles/Documents/PCC/IHE_PCC_Suppl_360X.pdf) describes cross-organizations referral workflows, and it has a scheduling option, which is not required. The FHIR Scheduling profile can be used instead of the 360X scheduling option when there are appropriate business agreements that allow cross-organizational scheduling. The referral and patient identifiers used in the 360X transactions must be used in the corresponding parameters of the Find Appointments transaction in order to provide the necessary link between the appointment and the referral.
