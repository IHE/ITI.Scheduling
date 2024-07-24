<div markdown="1" class="stu-note">
This section contains modifications to other IHE publications and profiles and is not a part of the ITI Scheduling Profile. The content here will be incorporated into the target narrative at a future time, usually when ITI Scheduling goes final text.
</div>

## IHE Technical Frameworks General Introduction Appendix A – Actor Summary Definitions

|------------------------------------------------|
| Editor, add the following new or modified actors to the [IHE Technical Frameworks General Introduction Appendix A](https://profiles.ihe.net/GeneralIntro/ch-A.html): |
{:.grid .bg-info}

| Actor                         | Definition                                                                                |
| ----------------------------- | ------------------------------------------------------------------------------------------|
| Scheduling Client | A system which can request information about existing appointments, about potential appointments, and can request the creation, modification or cancellation of an appointment |
| Scheduling Server | A system which manages existing appointments, and provides an API for clients to query, create, modify, of cancel an appointment |
{:.grid .table-striped}


## IHE Technical Frameworks General Introduction Appendix B – Transaction Summary Definitions

|------------------------------------------------|
| Editor, add the following new or modified transactions to the [IHE Technical Frameworks General Introduction Appendix B](https://profiles.ihe.net/GeneralIntro/ch-B.html): |
{:.grid .bg-info}


| Transaction                              | Definition                                                                              |
| ---------------------------------------- | --------------------------------------------------------------------------------------- |
| Find Potential Appointments \[ITI-115\]   | Performs a query against a patient demographics supplier using HTTP, REST, and JSON/XML message encoding. 
| Hold Appointment \[ITI-116\] | Requests that a patient demographics supplier using the FHIR $match operation.|
| Book Appointment \[ITI-117\] |  |
| Find Existing Appointments \[ITI-118\] |  |
{:.grid .table-striped}


