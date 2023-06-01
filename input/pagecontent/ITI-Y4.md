This section corresponds to transaction [ITI-Y4] of the IHE Technical Framework. Transaction [ITI-Y4] is used by the Scheduling Client and Scheduling Server Actors. The Find Existing Appointments [ITI-Y4] transaction is used to search for existing appointments on the server.

### Scope

The Client [ITI-Y4] transaction requests a list of existing appointments from a Server.

### Actors Roles

**Table: Actor Roles**

|Actor | Role |
|-------------------+--------------------------|
| [Client](volume-1.html#client)    | Sends query to Server |
| [Server](volume-1.html#server) | Receives the query and responds |

### Referenced Standards

**FHIR-R4** [HL7 FHIR Release 4.0](http://www.hl7.org/FHIR/R4)

### Interactions

<div>
{%include ITI-Y1-seq.svg%}
</div>
<br clear="all">

**Figure: Find Potential Appointments Interactions**


#### Find Potential Appointments Query Message
This message uses the HTTP GET method on the target Server endpoint to search for Appointment resources for a particular patient.

##### Trigger Events

''TODO: define the triggers''

##### Message Semantics

''TODO: define the message -- usually with a StructureDefinition''

##### Expected Actions

''TODO: define expected actions''

#### Go Response Message

##### Trigger Events

''TODO: define the triggers''

##### Message Semantics

''TODO: define the message -- usually with a StructureDefinition''

##### Expected Actions

''TODO: define expected actions''


### CapabilityStatement Resource

Server implementing this transaction shall provide a CapabilityStatement Resource as described in ITI TF-2x: Appendix Z.3 indicating the transaction has been implemented. 
* Requirements CapabilityStatement for [Client](CapabilityStatement-IHE.Scheduling.client.html)
* Requirements CapabilityStatement for [Server](CapabilityStatement-IHE.Scheduling.server.html)

### Security Considerations

See [MHD Security Considerations](volume-1.html#security-considerations)

#### Security Audit Considerations

''TODO: The security audit criteria ''

##### Client Audit 

''TODO: the specifics''

##### Server Audit 

''TODO: the specifics''
