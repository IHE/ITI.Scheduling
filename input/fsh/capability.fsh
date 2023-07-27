Instance: IHE.Scheduling.client
InstanceOf: CapabilityStatement
Usage: #definition
* text.status = "extensions"
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\"><h2 id=\"title\">IHE Scheduling Server</h2><ul><li>Implementation Guide Version: 0.1.0-current</li><li>FHIR Version: 4.0.1</li><li>Supported Formats: <code>application/fhir+xml</code>, <code>application/fhir+json</code></li><li>Supported Patch Formats: </li><li>Published on: Fri Jul 05 00:00:00 CDT 2019</li><li>Published by: IHE IT Infrastructure Technical Committee</li></ul><blockquote class=\"impl-note\"><p><strong>Note to Implementers: FHIR Capabilities</strong></p><p>Any FHIR capability may be 'allowed' by the system unless explicitly marked as &quot;SHALL NOT&quot;. A few items are marked as MAY in the Implementation Guide to highlight their potential relevance to the use case.</p></blockquote><h2 id=\"rest\">FHIR RESTful Capabilities</h2><div class=\"panel panel-default\"><div class=\"panel-heading\"><h3 id=\"mode1\" class=\"panel-title\">Mode: <code>server</code></h3></div><div class=\"panel-body\"><div><p>FooBar server provides capability to query for Patient resources matching a sub-set of the FHIR core Patient resource query parameters</p>\n</div><div class=\"lead\"><em>Security</em></div><blockquote><div><p>None mandated by IHE, encouraged IHE-IUA or SMART-on-FHIR</p>\n</div></blockquote><div class=\"lead\"><em>Summary of System-wide Interactions</em></div><ul><li>Supports the <code>search-system</code> interaction.</li></ul></div></div><h3 id=\"resourcesCap1\">Capabilities by Resource/Profile</h3><h4 id=\"resourcesSummary1\">Summary</h4><p>The summary table lists the resources that are part of this configuration, and for each resource it lists:</p><ul><li>The relevant profiles (if any)</li><li>The interactions supported by each resource (<b><span class=\"bg-info\">R</span></b>ead, <b><span class=\"bg-info\">S</span></b>earch, <b><span class=\"bg-info\">U</span></b>pdate, and <b><span class=\"bg-info\">C</span></b>reate, are always shown, while <b><span class=\"bg-info\">VR</span></b>ead, <b><span class=\"bg-info\">P</span></b>atch, <b><span class=\"bg-info\">D</span></b>elete, <b><span class=\"bg-info\">H</span></b>istory on <b><span class=\"bg-info\">I</span></b>nstance, or <b><span class=\"bg-info\">H</span></b>istory on <b><span class=\"bg-info\">T</span></b>ype are only present if at least one of the resources has support for them.</li><li><span>The required, recommended, and some optional search parameters (if any). </span></li><li>The linked resources enabled for <code>_include</code></li><li>The other resources enabled for <code>_revinclude</code></li><li>The operations on the resource (if any)</li></ul><div class=\"table-responsive\"><table class=\"table table-condensed table-hover\"><thead><tr><th><b>Resource Type</b></th><th><b>Profile</b></th><th class=\"text-center\"><b title=\"GET a resource (read interaction)\">R</b></th><th class=\"text-center\"><b title=\"GET all set of resources of the type (search interaction)\">S</b></th><th class=\"text-center\"><b title=\"PUT a new resource version (update interaction)\">U</b></th><th class=\"text-center\"><b title=\"POST a new resource (create interaction)\">C</b></th><th><b title=\"Required and recommended search parameters\">Searches</b></th><th><code><b>_include</b></code></th><th><code><b>_revinclude</b></code></th><th><b>Operations</b></th></tr></thead><tbody><tr><td><a href=\"#Patient1-1\">Patient</a></td><td><a href=\"http://hl7.org/fhir/uv/ipa/STU1/StructureDefinition-ipa-patient.html\">http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-patient</a></td><td>y</td><td class=\"text-center\">y</td><td class=\"text-center\"></td><td class=\"text-center\"></td><td>_id, idenitfier, birthdate, family, gender, given, name, family+gender, birthdate+family, birthdate+name, gender+name</td><td/><td/><td/></tr><tr><td><a href=\"#Appointment1-2\">Appointment</a></td><td><a href=\"StructureDefinition-ihe-sched-appt.html\">https://profiles.ihe.net/ITI/Scheduling/StructureDefinition/ihe-sched-appt</a></td><td>y</td><td class=\"text-center\">y</td><td class=\"text-center\"></td><td class=\"text-center\"></td><td>_id, patient, date</td><td/><td/><td/></tr></tbody></table></div><hr/><div class=\"panel panel-default\"><div class=\"panel-heading\"><h4 id=\"Patient1-1\" class=\"panel-title\"><span style=\"float: right;\">Resource Conformance: SHALL</span>Patient</h4></div><div class=\"panel-body\"><div class=\"container\"><div class=\"row\"><div class=\"col-lg-6\"><span class=\"lead\">Base System Profile</span><br/><a href=\"http://hl7.org/fhir/uv/ipa/STU1/StructureDefinition-ipa-patient.html\">http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-patient</a></div><div class=\"col-lg-3\"><span class=\"lead\">Profile Conformance</span><br/><b>SHALL</b></div><div class=\"col-lg-3\"><span class=\"lead\">Reference Policy</span><br/></div></div><p/><div class=\"row\"><div class=\"col-lg-6\"><span class=\"lead\">Interaction summary</span><br/><ul><li>Supports <code>read</code>, <code>search-type</code>.</li></ul></div></div><p/><div class=\"row\"><div class=\"col-lg-7\"><span class=\"lead\">Search Parameters</span><table class=\"table table-condensed table-hover\"><thead><tr><th>Conformance</th><th>Parameter</th><th>Type</th><th>Documentation</th></tr></thead><tbody><tr><td><b>SHALL</b></td><td><a href=\"http://hl7.org/fhir/R4/resource.html#search\">_id</a></td><td><code>token</code></td><td><div><p>Logical id of this artifact</p>\n</div></td></tr><tr><td><b>SHALL</b></td><td><a href=\"http://hl7.org/fhir/R4/patient.html#search\">idenitfier</a></td><td><code>token</code></td><td><div><p>The client <strong>SHALL</strong> provide both the system and code values.</p>\n<p>The server <em>SHALL NOT</em> support only code values.</p>\n</div></td></tr><tr><td><b>SHOULD</b></td><td><a href=\"http://hl7.org/fhir/R4/patient.html#search\">birthdate</a></td><td><code>date</code></td><td><div><p>The patient's date of birth</p>\n</div></td></tr><tr><td><b>SHOULD</b></td><td><a href=\"http://hl7.org/fhir/R4/patient.html#search\">family</a></td><td><code>string</code></td><td><div><p>A portion of the family name of the patient</p>\n</div></td></tr><tr><td><b>SHOULD</b></td><td><a href=\"http://hl7.org/fhir/R4/patient.html#search\">gender</a></td><td><code>token</code></td><td><div><p>Gender of the patient</p>\n</div></td></tr><tr><td><b>SHOULD</b></td><td><a href=\"http://hl7.org/fhir/R4/patient.html#search\">given</a></td><td><code>string</code></td><td><div><p>A portion of the given name of the patient</p>\n</div></td></tr><tr><td><b>SHOULD</b></td><td><a href=\"http://hl7.org/fhir/R4/patient.html#search\">name</a></td><td><code>string</code></td><td><div><p>The full name of the patient or part of it</p>\n</div></td></tr></tbody></table></div><div class=\"col-lg-5\"><span class=\"lead\">Combined Search Parameters</span><table class=\"table table-condensed table-hover\"><thead><tr><th>Conformance</th><th>Parameters</th><th>Types</th></tr></thead><tbody><tr><td><b>SHOULD</b></td><td><a href=\"http://hl7.org/fhir/R4/patient.html#search\">family</a>+<a href=\"http://hl7.org/fhir/R4/patient.html#search\">gender</a></td><td><code>string</code>+<code>token</code></td></tr><tr><td><b>SHOULD</b></td><td><a href=\"http://hl7.org/fhir/R4/patient.html#search\">birthdate</a>+<a href=\"http://hl7.org/fhir/R4/patient.html#search\">family</a></td><td><code>date</code>+<code>string</code></td></tr><tr><td><b>SHOULD</b></td><td><a href=\"http://hl7.org/fhir/R4/patient.html#search\">birthdate</a>+<a href=\"http://hl7.org/fhir/R4/patient.html#search\">name</a></td><td><code>date</code>+<code>string</code></td></tr><tr><td><b>SHOULD</b></td><td><a href=\"http://hl7.org/fhir/R4/patient.html#search\">gender</a>+<a href=\"http://hl7.org/fhir/R4/patient.html#search\">name</a></td><td><code>token</code>+<code>string</code></td></tr></tbody></table></div></div></div></div></div><div class=\"panel panel-default\"><div class=\"panel-heading\"><h4 id=\"Appointment1-2\" class=\"panel-title\"><span style=\"float: right;\">Resource Conformance: supported</span>Appointment</h4></div><div class=\"panel-body\"><div class=\"container\"><div class=\"row\"><div class=\"col-lg-6\"><span class=\"lead\">Base System Profile</span><br/><a href=\"StructureDefinition-ihe-sched-appt.html\">https://profiles.ihe.net/ITI/Scheduling/StructureDefinition/ihe-sched-appt</a></div><div class=\"col-lg-3\"><span class=\"lead\">Profile Conformance</span><br/><b>SHALL</b></div><div class=\"col-lg-3\"><span class=\"lead\">Reference Policy</span><br/></div></div><p/><div class=\"row\"><div class=\"col-lg-6\"><span class=\"lead\">Interaction summary</span><br/><ul><li>Supports <code>read</code>, <code>search-type</code>.</li></ul></div></div><p/><div class=\"row\"><div class=\"col-lg-7\"><span class=\"lead\">Search Parameters</span><table class=\"table table-condensed table-hover\"><thead><tr><th>Conformance</th><th>Parameter</th><th>Type</th><th>Documentation</th></tr></thead><tbody><tr><td><b>SHALL</b></td><td><a href=\"http://hl7.org/fhir/R4/resource.html#search\">_id</a></td><td><code>token</code></td><td><div><p>Logical id of this artifact</p>\n</div></td></tr><tr><td><b>SHALL</b></td><td><a href=\"http://hl7.org/fhir/R4/appointment.html#search\">patient</a></td><td><code>reference</code></td><td><div><p>The patient, or one of the patients, for whom this apointement exists</p>\n</div></td></tr><tr><td><b>SHALL</b></td><td><a href=\"http://hl7.org/fhir/R4/appointment.html#search\">date</a></td><td><code>date</code></td><td><div><p>The date, or date range, for the appointments being searched.</p>\n</div></td></tr></tbody></table></div><div class=\"col-lg-5\">\u00a0</div></div></div></div></div></div>"
* url = "https://profiles.ihe.net/ITI/Scheduling/CapabilityStatement/IHE.Scheduling.client"
* version = "0.1.0"
* name = "IHE_Scheduling_client"
* title = "IHE Scheduling client"
* status = #active
* experimental = false
* date = "2023-01-13"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].name = "IHE"
* contact[=].telecom.system = #url
* contact[=].telecom.value = "http://ihe.net"
* contact[+].name = "John Moehrke"
* contact[=].telecom.system = #email
* contact[=].telecom.value = "JohnMoehrke@gmail.com"
* jurisdiction = http://unstats.un.org/unsd/methods/m49/m49.htm#001 "World"
* description = "CapabilityStatement for Client Actor in the IHE IT Infrastructure Technical Framework Supplement IHE FHIR Scheduling. See https://profiles.ihe.net/ITI/TF/Volume1/ch-38.html. The IHE Profile text is Normative, this conformance resource is Informative."
* copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #SHALL
* format[+] = #application/fhir+json
* format[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* format[=].extension.valueCode = #SHOULD
* implementationGuide[0] = "http://hl7.org/fhir/smart-app-launch/ImplementationGuide/hl7.fhir.uv.smart-app-launch"
* implementationGuide[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension.valueCode = #SHOULD
* implementationGuide[+] = "http://hl7.org/fhir/uv/ipa/ImplementationGuide/hl7.fhir.uv.ipa"
* implementationGuide[=].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* implementationGuide[=].extension.valueCode = #SHOULD
* rest.mode = #client
* rest.documentation = "IHE Scheduling client will 
1. query for Patient resources matching the IPA Patient resource query parameters, 
1. query for Appointment resources matching the IHE Scheduling Appointment resource query parameters,
1. use the operations defined for the Appointment resource"
* rest.security.cors = false
* rest.security.description = "None mandated by IHE, encouraged IHE-IUA or SMART-on-FHIR"
* rest.resource[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHOULD
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "family"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "gender"
* rest.resource[=].extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHOULD
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "birthdate"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "family"
* rest.resource[=].extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHOULD
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "birthdate"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "name"
* rest.resource[=].extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHOULD
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "gender"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "name"
* rest.resource[=].extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].type = #Patient
* rest.resource[=].profile = "http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-patient"
* rest.resource[=].profile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension.valueCode = #SHALL
* rest.resource[=].documentation = "Client applications SHALL be able to access the patient record using the following API call:\n\n`GET [url]/Patient/[id]`\n\nClient application MAY use these search parameters that servers are required to support to access the patient record:\n\n - `_id`\n - `identifier`\n\nServers are not required to support any additional search parameters, and clients SHOULD not expect servers to do so.\n\nAdditional rules and guidance for supporting `Patient.link`:\n\n- The server:\n    - SHALL have no more than one Patient with a status of active = \"true\" *from the server being queried* \n    - MAY include inactive patients on the *same server*\n    - MAY include inactive or active patients from a *different server*\n    - When returning a [search Bundle](http://hl7.org/fhir/bundle.html) that contains more than one Patient record for the same patient, the Patient record(s) SHALL use the `Patient.link` attribute to cross-link the Patient resources.\n- The client:\n    - SHALL be able to follow the link(s) to the other Patient resource(s) and understand the direction of the link (in other words, which Patient is linked to which other Patient)\n    - SHALL understand the `Patient.link.type` code which defines the type of link between this Patient resource and another Patient resource\n    - SHALL be aware of the linked Patient `active` flag and that inactive patients may have relevant information"
* rest.resource[=].interaction[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #read
* rest.resource[=].interaction[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].interaction[=].extension.valueCode = #SHALL
* rest.resource[=].interaction[=].code = #search-type
* rest.resource[=].updateCreate = false
* rest.resource[=].conditionalCreate = false
* rest.resource[=].conditionalUpdate = false
* rest.resource[=].conditionalDelete = #not-supported
* rest.resource[=].referencePolicy = #resolves
* rest.resource[=].searchRevInclude = "Provenance:target"
* rest.resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "_id"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "birthdate"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-birthdate"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "A client **SHALL** provide a value precise to the *day*. A server **SHALL** support a value precise to the *day*."
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "family"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-family"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "gender"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-gender"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide at least a code value and **MAY** provide both the system and code values. The server **SHALL** support both."
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "given"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-given"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "identifier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Patient-identifier"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide both the system and code values. The server **SHALL NOT** support only code values."
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "name"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Patient-name"
* rest.resource[=].searchParam[=].type = #string
* rest.interaction.code = #search-system

Instance: IHE.Scheduling.server
InstanceOf: CapabilityStatement
Usage: #definition
* url = "https://profiles.ihe.net/ITI/Scheduling/CapabilityStatement/IHE.Scheduling.server"
* name = "IHE_Scheduling_Server"
* title = "IHE Scheduling Server"
* status = #active
* experimental = false
* date = "2019-07-05"
* publisher = "Integrating the Healthcare Enterprise (IHE)"
* contact[0].name = "IHE"
* contact[=].telecom.system = #url
* contact[=].telecom.value = "http://ihe.net"
* contact[+].name = "John Moehrke"
* contact[=].telecom.system = #email
* contact[=].telecom.value = "JohnMoehrke@gmail.com"
* description = "CapabilityStatement for Server Actor in the IHE IT Infrastructure Technical Framework Supplement IHE FHIR Scheduling. See https://profiles.ihe.net/ITI/TF/Volume1/ch-38.html. The IHE Profile text is Normative, this conformance resource is Informative."
* copyright = "IHE http://www.ihe.net/Governance/#Intellectual_Property"
* kind = #requirements
* fhirVersion = #4.0.1
* format[0] = #application/fhir+xml
* format[+] = #application/fhir+json
* rest.mode = #server
* rest.documentation = "FooBar server provides capability to query for Patient resources matching a sub-set of the FHIR core Patient resource query parameters"
* rest.security.cors = false
* rest.security.description = "None mandated by IHE, encouraged IHE-IUA or SMART-on-FHIR"
* rest.resource[0].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].valueCode = #SHALL
* rest.resource[=].extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHOULD
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "family"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "gender"
* rest.resource[=].extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHOULD
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "birthdate"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "family"
* rest.resource[=].extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHOULD
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "birthdate"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "name"
* rest.resource[=].extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].extension[+].extension[0].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].extension[=].extension[=].valueCode = #SHOULD
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "gender"
* rest.resource[=].extension[=].extension[+].url = "required"
* rest.resource[=].extension[=].extension[=].valueString = "name"
* rest.resource[=].extension[=].url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-search-parameter-combination"
* rest.resource[=].type = #Patient
* rest.resource[=].profile = "http://hl7.org/fhir/uv/ipa/StructureDefinition/ipa-patient"
* rest.resource[=].profile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension.valueCode = #SHALL
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].searchParam[0].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "_id"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Logical id of this artifact"
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHALL
* rest.resource[=].searchParam[=].name = "idenitfier"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Patient-identifier"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "The client **SHALL** provide both the system and code values.\n\nThe server *SHALL NOT* support only code values."
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "birthdate"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-birthdate"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "The patient's date of birth"
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "family"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-family"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "A portion of the family name of the patient"
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "gender"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-gender"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Gender of the patient"
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "given"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/individual-given"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "A portion of the given name of the patient"
* rest.resource[=].searchParam[+].extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].searchParam[=].extension.valueCode = #SHOULD
* rest.resource[=].searchParam[=].name = "name"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Patient-name"
* rest.resource[=].searchParam[=].type = #string
* rest.resource[=].searchParam[=].documentation = "The full name of the patient or part of it"
* rest.resource[+].type = #Appointment
* rest.resource[=].profile = "https://profiles.ihe.net/ITI/Scheduling/StructureDefinition/ihe-sched-appt"
* rest.resource[=].profile.extension.url = "http://hl7.org/fhir/StructureDefinition/capabilitystatement-expectation"
* rest.resource[=].profile.extension.valueCode = #SHALL
* rest.resource[=].interaction[0].code = #read
* rest.resource[=].interaction[+].code = #search-type
* rest.resource[=].searchParam[0].name = "_id"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Resource-id"
* rest.resource[=].searchParam[=].type = #token
* rest.resource[=].searchParam[=].documentation = "Logical id of this artifact"
* rest.resource[=].searchParam[+].name = "patient"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/Appointment-patient"
* rest.resource[=].searchParam[=].type = #reference
* rest.resource[=].searchParam[=].documentation = "The patient, or one of the patients, for whom this apointement exists"
* rest.resource[=].searchParam[+].name = "date"
* rest.resource[=].searchParam[=].definition = "http://hl7.org/fhir/SearchParameter/clinical-date"
* rest.resource[=].searchParam[=].type = #date
* rest.resource[=].searchParam[=].documentation = "The date, or date range, for the appointments being searched."
* rest.interaction.code = #search-system