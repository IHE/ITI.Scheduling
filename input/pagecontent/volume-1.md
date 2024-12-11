
The Scheduling Profile is a vendor agnostic specification providing FHIR APIs and guidance for access to, and booking of, appointments for patients by both patient and practitioner end users, including cross-organizational workflows. This specification is based on [FHIR Version 4.0.1](https://hl7.org/fhir/R4/), and references the [Schedule]({{site.data.fhir.path}}schedule.html), [Slot]({{site.data.fhir.path}}slot.html), and [Appointment]({{site.data.fhir.path}}appointment.html) resources.

This workflow profile defines transactions that allow a scheduling client to obtain information about possible appointment opportunities based on specific parameters and based on that information, allow the client to book an appointment.

<blockquote class="impl-note">
<p><strong>History and Acknowledgment:</strong></p>
<p>
This IHE profile is based on the <a href="https://fhir.org/guides/argonaut/scheduling/release1/" target="_blank">Argonaut Scheduling Implementation Guide</a>. The following are some of the major differences from the Argonaut IG:
</p>
<ul>
    <li>The IHE Profile is based on FHIR R4</li>
    <li>The IHE Profile is intended for international use, and it does not have required bindings or any dependencies to national profiles</li>
    <li>The operations described are $find, $hold, and $book</li>
    <li>A separate transaction describes the use of FHIR Search for the Appointment resource</li>
    <li>The operation parameters use explicit data types, and support only POST transactions</li>
</ul>
</blockquote>

<a name="actors-and-transactions"> </a>

## 1:55.1 Scheduling Actors, Transactions and Content Modules

This section defines the actors, transactions, and/or content modules in this profile. General
definitions of actors are given in the Technical Frameworks General Introduction [Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html).
IHE Transactions can be found in the Technical Frameworks General Introduction [Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html).
Both appendices are located at <https://profiles.ihe.net/GeneralIntro/>.

- Actors
  - [Scheduling Client](#client)
  - [Scheduling Server](#server)
- Transactions
  - Find Potential Appointments [\[ITI-115\]](ITI-115.html)
  - Hold Appointment [\[ITI-116\]](ITI-116.html)
  - Book Appointment [\[ITI-117\]](ITI-117.html)
  - Find Existing Appointments [\[ITI-118\]](ITI-118.html)

The figure below shows the actors directly involved in the Scheduling Profile and the relevant transactions between them.

<figure>
{%include ActorsAndTransactions.svg%}
<figcaption><strong>Figure 1:55.1-1: Scheduling Actor Diagram</strong></figcaption>
</figure>
<br clear="all">

<p id ="t1:55.1-1" class="tableTitle"><strong>Table 1:55.1-1: Scheduling Profile - Actors and Transactions</strong></p>

| Actors            | Transactions               | Initiator or Responder | Optionality     | Reference      |
|-------------------|----------------------------|------------------------|-----------------|----------------|
| Scheduling Client | Find Potential Appointments [\[ITI-115\]](ITI-115.html) | Initiator              | R               | ITI TF-2: 3.115 |
|                   | Hold Appointment [\[ITI-116\]](ITI-116.html)  | Initiator              | O               | ITI TF-2: 3.116 |
|                   | Book Appointment [\[ITI-117\]](ITI-117.html)  | Initiator              | R               | ITI TF-2: 3.117 |
|                   | Find Existing Appointment [\[ITI-118\]](ITI-118.html)  | Initiator              | O               | ITI TF-2: 3.118 |
| Scheduling Server | Find Appointments [\[ITI-115\]](ITI-115.html) | Responder              | R               | ITI TF-2: 3.115 |
|                   | Hold Appointment [\[ITI-116\]](ITI-116.html)  | Responder              | O               | ITI TF-2: 3.116 |
|                   | Book Appointment [\[ITI-117\]](ITI-117.html)  | Responder              | R               | ITI TF-2: 3.117 |
|                   | Find Existing Appointment [\[ITI-118\]](ITI-118.html)  | Responder              | O               | ITI TF-2: 3.118 |
{: .grid}

### 1:55.1.1 Actors

The actors in this profile are described in more detail in the sections below.

<a name="client"> </a>

#### 1:55.1.1.1 Scheduling Client 

The Scheduling Client determines an appropriate potential appointment based on the parameters it supplies to the Scheduling Server, and then books an appointment for a given patient. The following points apply to the Scheduling Client:

- The client needs a mechanism to properly identify the patient. Although the details of this capability is out of scope for this profile, it is recommended that the Scheduling Client is grouped with the Patient Demographics Consumer from the [IHE PDQm](https://profiles.ihe.net/ITI/PDQm/index.html) Profile.
- The client SHOULD determine the FHIR Capability Statement for the [Server](CapabilityStatement-IHE.Scheduling.server.html).

Please see the FHIR Capability Statement for the [Client](CapabilityStatement-IHE.Scheduling.client.html).

<a name="server"> </a>

#### 1:55.1.1.2 Scheduling Server

The Scheduling Server provides services for providing a list of available appointments, and for booking an appointment. The following points apply to the Scheduling Server:

- The server expects that the Patient and Provider/ProviderRole resources are properly identified. The exact mechanisms for making sure that the client has this correct information is out of scope for this profile. In the case that the Scheduling Client is grouped with a Patient Demographics Consumer actor from the [IHE PDQm](https://profiles.ihe.net/ITI/PDQm/index.html) Profile, it is recommended that the Scheduling Server is grouped the Patient Demographics Supplier from the same profile. 
- The server decides on the types of appointments that are possible to make using the transactions of this profile. Such business rules are specific to the type of appointment, and other contexts surrounding the provision of care.
- The server MAY chose to implement the Hold Appointment transaction, if the supported use cases have such a need.

Please see the FHIR Capability Statement for [Server](CapabilityStatement-IHE.Scheduling.server.html).

### 1:55.1.2 Transaction Descriptions 

The transactions in this profile are summarized in the sections below.

#### 1:55.1.2.1 Find Potential Appointments [ITI-115]

This transaction searches for availability for one or more future appointments using the Find Appointments operation.

For more details see the [transaction description](ITI-115.html) and the corresponding [operation definition](./OperationDefinition-appointment-find.html).

#### 1:55.1.2.2 Hold Appointment [ITI-116]

Request for a hold on a selected Appointment in order for the user to complete entering data for booking an appointment. This operation precedes the booking and follows the determination of appointment availability using the Find Appointments operation.
{%include HoldAppointment-note.md%}

For more details see the detailed [transaction description](ITI-116.html).

#### 1:55.1.2.3 Book Appointment [ITI-117]

This operation books an appointment following the determination of appointment availability using the Find Appointments operation. Using different combination of parameters, this operation can book a new appointment, cancel an already existing appointment, or reschedule an existing appointment.
{%include BookAppointment-note.md%}

For more details see the detailed [transaction description](ITI-117.html).

#### 1:55.1.2.4 Find Existing Appointments [ITI-118]

This transaction searches for existing appointments for the patient using [FHIR Search]({{site.data.fhir.path}}search.html) against the [Appointment resource](StructureDefinition-ihe-sched-appt.html).
{%include ExistingAppointments-note.md%}

For more details see the detailed [transaction description](ITI-118.html).

<a name="actor-options"> </a>

## 1:55.2 Scheduling Actor Options

There are currently no options for these actors.

<a name="required-groupings"> </a>

## 1:55.3 Scheduling Required Actor Groupings

There are no required groupings for this profile.

<a name="overview"> </a>

## 1:55.4 Scheduling Overview

This profile is intended to address use cases for cross-organizational or patient initiated scheduling of healthcare appointments.

The following subsections show how the transactions of the profile are combined to address the use cases.

### 1:55.4.1 Concepts

The FHIR specification defines several resources to describe scheduling-related information. The  [Schedule]({{site.data.fhir.path}}schedule.html), [Slot]({{site.data.fhir.path}}slot.html), and [Appointment]({{site.data.fhir.path}}appointment.html) resources are intended to be compatible with the [iCalendar specification](https://datatracker.ietf.org/doc/html/rfc5545). A survey of existing implementations, however, showed that there is very little commonality among existing FHIR server implementations, which suggests that an operation-based specification will improve interoperability in this area.

#### 1:55.4.1.1 Scope

There is wide variety of appointments that pertain to the healthcare domain. A core assumption of this profile is that the Scheduling Server actor is responsible for all the business logic for determining the type, duration, sequencing, and all other attributes an appointment may have. This is the reason that the response to the search for potential appointments only contains Appointment resources. The management of Schedule and Slot resources is out of scope for this profile.

For example, the Scheduling server may modify existing appointments in order to free up time for an urgent appointment. While this may change the existing `Schedule` and `Slot` resources on the server, the Scheduling Client that is attempting to book the urgent appointment only needs to know that a new appointment can be booked. Any changes to existing appointments can be detected using the [\[ITI-118\]](./ITI-118.html) transaction, or, if the ITI Scheduling profile is implemented in an environment with an existing FHIR Subscription infrastructure, via a `SubscriptionNotification` for the changed appointment(s).

The overall functionality covered by this profile is as follows:

1. The Scheduling Client identifies the patient or patients for whom the appointment will be scheduled
2. The Scheduling Client determines the available parameters for requesting a list of available appointments
3. The Find Appointments transaction is completed
4. (Optionally) The Hold Appointment transaction is completed
5. The Book Appointment Transaction is completed

### 1:55.4.2 Use Cases

#### 1:55.4.2.1 Use Case \#1: Provider-facing Scheduling Client

##### 1:55.4.2.1.1 Post-discharge PCP Visit

###### 1:55.4.2.1.1.1 Post-discharge PCP Visit Use Case Description

Ms. Philips is being discharged from Green Valley General Hospital. One of the steps of the discharge process includes scheduling a follow-up appointment with Dr. Spears, Ms. Philip's primary care provider. Dr. Spears' practice is part of a different healthcare organization, which necessitates cross-organizational scheduling of the follow-up appointment.

Without the availability of the ITI Scheduling functionality, the hospital staff would have to contact Dr. Spears' practice to negotiate an appointment for the patient, or leave it to Ms. Philips to schedule the appointment by herself. This makes it likely that the follow-up appointment may not occur in a timely manner, or at all.

The ITI Scheduling profile would allow the two systems to communicate the request for an appointment, get a list of possible times, coordinate with the patient the best time for the appointment, and book the appointment with Dr. Spears. This will ensure the follow-up visit will happen on time, and that Ms. Philips will get the proper care.

###### 1:55.4.2.1.1.2 Specialty Visit Scheduling Process Flow

<figure>
{%include uc1-flow.svg%}
<figcaption><strong>1:55.4.2.1.2 Specialty Visit Scheduling</strong></figcaption>
</figure>
<br clear="all">

###### 1:55.4.2.1.2.1 Specialty Visit Scheduling Use Case Description

Dr. Brown detects that a radiology examination is recommended to proceed with the
treatment of her Patient Mr. White. Dr. Brown opens the radiology examination
scheduling in her clinical information systems and selects a radiology facility
for the examination. She asks the system to show the existing appointments for the patient and then asks for potential appointment slots for the radiology procedure.

From the list of available time slots presented in the clinical information system, Dr. Brown selects an appropriate time slot for the
examination of Mr. White. Dr. Brown records the booking details
(e.g., Mr. White demographics, treatment, body part to examine, etc.) in the
booking details dialog of the clinical information system. Dr. Brown confirms
the records and books the examination in the confirm dialog in her clinical
information system.

###### 1:55.4.2.1.2.2 Specialty Visit Scheduling Process Flow

<figure>
{%include uc2-flow.svg%}
<figcaption><strong>Figure 1:55.4.2.1-1: Specialty Visit Scheduling Process Flow</strong></figcaption>
</figure>
<br clear="all">

#### 1:55.4.2.2 Use Case \#2: Patient-facing Scheduling Client

##### 1:55.4.2.2.1 Foreign Visitor Urgent Visit

###### 1:55.4.2.2.1.1 Use Case Description

Mr. White feels sick on holiday in a foreign country and wants to visit
a healthcare provider for an examination. Mr. White opens the local patient portal
and searches for a healthcare provider using search criteria
(e.g., distance, opening hours, supported languages).
Mr. White selects Dr. Brown's practice as the healthcare provider and opens the
appointments view in the patient portal.

From the list of available time slots presented in the patient portal, Mr. White
selects an appropriate time slot for the visit. Mr. White records the booking details
(e.g., demographics, symptoms, etc.) in the booking details dialog in the patient
portal. Mr. White confirms the records and books the examination in the confirm
dialog of the patient portal.

###### 1:55.4.2.2.1.2 Foreign Visitor Urgent Visitor Process Flow

<figure>
{%include uc3-flow.svg%}
<figcaption><strong>Figure 1:55.4.2.2-1: Patient-facing scheduling client Process Flow</strong></figcaption>
</figure>
<br clear="all">

<a name="security-considerations"> </a>

## 1:55.5 Scheduling Security Considerations

Actors are expected to follow the recommendations and requirements found in [Appendix Z.8 “Mobile Security Considerations”](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.8-mobile-security-considerations).

The resources exchanged in this profile could contain information which pose a privacy risk, or in some cases, a safety risk, to providers and other personnel, as well as patients. For example, practitioner or patient phone numbers and home addresses could be conveyed. Implementers need to determine what data will be exposed by the system and what level of public access there will be if any. Therefore the [Audit Trails and Node Authentication (ATNA)](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) Profile is required. This mandates Access Controls, Secure Communications, and an Audit Trail capability. The use of [Basic Audit Log Patterns](https://profiles.ihe.net/ITI/BALP/index.html) is foundational to the AuditEvent profiles defined in this Implementation Guide.

Implementers need to consider Privacy and Security when determining the access policies for these Resources. System administrators for the underlying host systems must follow industry best practices for authentication, authorization, auditing, timely application of software patches, etc.

There are many reasonable methods of security for interoperability transactions which can be implemented without modifying the characteristics of the transactions in the Scheduling Profile. The use of TLS is encouraged, specifically the use of the ATNA Profile (see [ITI TF-1: 9](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html)).

User authentication on mobile devices and browsers is typically handled by more lightweight authentication schemes such as HTTP Authentication, OAuth 2.0, or OpenID Connect. IHE has a set of profiles for user authentication including [Internet User Authentication (IUA)](https://profiles.ihe.net/ITI/TF/Volume1/ch-34.html) for REST-based authentication with [ATNA](https://profiles.ihe.net/ITI/TF/Volume1/ch-9.html) "STX: HTTPS IUA Option" that uses OAuth for client authentication while using TLS server authentication. Implementers SHOULD implement the [SMART on FHIR IG](http://hl7.org/fhir/smart-app-launch/) for the corresponding use cases (patient-facing or provider-facing). The network communication security and user authentication are layered in the HTTP transport layer.

<a name="other-grouping"> </a>

## 1:55.6 Scheduling Cross-Profile Considerations

The Scheduling Profile is intended to be used in varied settings and to satisfy multiple use cases. Some of these uses will benefit from using the Scheduling Profile together with other IHE profiles. The following cross-profile descriptions are not exclusive or exhaustive, and the list can be updated in the future.

### 1:55.6.1 mCSD - Mobile Care Services Discovery

When a patient needs to schedule an appointment outside their usual care providing environment, they could need to initially find the endpoint of the healthcare or service provider where an appointment can be requested. The [Find Matching Care Services [ITI-117\]](https://profiles.ihe.net/ITI/mCSD/ITI-90.html) transaction from the mCSD profile can be used for endpoint discovery prior to the use of the Find Appointments transaction.

### 1:55.6.2 360X - 360 Exchange Closed Loop Referral

The [360X Profile](https://www.ihe.net/uploadedFiles/Documents/PCC/IHE_PCC_Suppl_360X.pdf) describes cross-organizations referral workflows, and it has a scheduling option, which is not required. The ITI Scheduling Profile can be used instead of the 360X Scheduling Option when there are appropriate business agreements that allow cross-organizational scheduling. The referral and patient identifiers used in the 360X transactions must be used in the corresponding parameters of the Find Appointments transaction in order to provide the necessary link between the appointment and the referral.
