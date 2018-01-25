package uk.gov.justice.digital.delius.jpa.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "R_LIC_COND_TYPE_MAIN_CAT")
public class LicenceConditionTypeMainCat {
    @Id
    @Column(name = "LIC_COND_TYPE_MAIN_CAT_ID")
    private long licenceConditionTypeMainCatId;

    @Column(name = "CODE")
    private String code;

    @Column(name = "DESCRIPTION")
    private String description;
}