package uk.gov.justice.digital.delius.jpa.standard.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDate;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "EVENT")
public class Event {

    @Id
    @Column(name = "EVENT_ID")
    private Long eventId;

    @Column(name = "IN_BREACH")
    private Long inBreach;

    @Column(name = "NOTES")
    private String notes;

    @Column(name = "ACTIVE_FLAG")
    private Long activeFlag;

    @Column(name = "CONVICTION_DATE")
    private LocalDate convictionDate;

    @Column(name = "SOFT_DELETED")
    private Long softDeleted;
}
