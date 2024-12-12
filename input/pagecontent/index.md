{%include intro-desc.md%}

<div markdown="1" class="stu-note">

| [Significant Changes, Open and Closed Issues](issues.html) |
{: .grid}

</div>

### Organization of This Guide
This guide is organized into the following sections:

1. Volume 1:
   1. [Introduction](volume-1.html)
   1. [Actors and Transactions](volume-1.html#actors-and-transactions)
   1. [Actor Options](volume-1.html#actor-options)
   1. [Required Actor Groupings](volume-1.html#required-groupings)
   1. [Overview](volume-1.html#overview)
   1. [Security Considerations](volume-1.html#security-considerations)
   1. [Cross Profile Considerations](volume-1.html#other-grouping)

2. Volume 2: Transaction Detail
   1. [Find Potential Appointments \[ITI-115\]](ITI-115.html)
   1. [Hold Appointment \[ITI-116\]](ITI-116.html)
   1. [Book Appointment \[ITI-117\]](ITI-117.html)
   1. [Find Existing Appointments \[ITI-118\]](ITI-118.html)

3. Other
   1. [Changes to Other IHE Specifications](other.html)
   1. [Download and Analysis](download.html)
   1. [Test Plan](testplan.html)


See also the [Table of Contents](toc.html) and the index of [Artifacts](artifacts.html) defined as part of this implementation guide.


### Conformance Expectations

IHE uses the normative words: “REQUIRED”, “REQUIRED NOT”, “REQUIRED”, “SHALL”, “SHALL NOT”, “SHOULD”, “SHOULD NOT”, “recommended”, “MAY”, and “OPTIONAL” according to [standards conventions](https://profiles.ihe.net/GeneralIntro/ch-E.html).

#### Required Support

The use of ```RequiredSupport``` in StructureDefinition profiles equivalent to the IHE use of **R2** as defined in [Appendix Z](https://profiles.ihe.net/ITI/TF/Volume2/ch-Z.html#z.10-profiling-conventions-for-constraints-on-fhir).

RequiredSupport of true - only has a meaning on items that are minimal cardinality of zero (0), and applies only to the source actor populating the data. The source actor SHALL populate the elements marked with RequiredSupport, if the concept is supported by the actor, a value exists, and security and consent rules permit. 
The consuming actors SHOULD handle these elements being populated or being absent/empty. 
Note that sometimes RequiredSupport will appear on elements with a minimal cardinality greater than zero (0), this is due to inheritance from a less constrained profile.
