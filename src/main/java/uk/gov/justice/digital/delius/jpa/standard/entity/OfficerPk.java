package uk.gov.justice.digital.delius.jpa.standard.entity;

import lombok.EqualsAndHashCode;

import javax.persistence.Column;
import javax.persistence.Id;
import java.io.Serializable;

@EqualsAndHashCode
public class OfficerPk implements Serializable {
    @Id
    @Column(name = "TRUST_PROVIDER_FLAG")
    private Long trustProviderFlag;

    @Id
    @Column(name = "STAFF_EMPLOYEE_ID")
    private Long staffEmployeeId;
}
