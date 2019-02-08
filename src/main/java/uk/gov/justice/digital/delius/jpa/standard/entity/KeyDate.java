package uk.gov.justice.digital.delius.jpa.standard.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Data
@Builder(toBuilder = true)
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "KEY_DATE")
public class KeyDate {
    @Id
    @Column(name = "KEY_DATE_ID")
    private Long keyDateId;
    @Column(name = "KEY_DATE")
    private LocalDate keyDate;
    @Column(name = "SOFT_DELETED")
    private Long softDeleted;
    @Column(name = "ROW_VERSION")
    private Long rowVersion;
    @Column(name = "CREATED_BY_USER_ID")
    private Long createdByUserId;
    @Column(name = "LAST_UPDATED_USER_ID")
    private Long lastUpdatedUserId;
    @Column(name = "CREATED_DATETIME")
    private LocalDateTime createdDatetime;
    @Column(name = "LAST_UPDATED_DATETIME")
    private LocalDateTime lastUpdatedDatetime;
    @OneToOne
    @JoinColumn(name = "KEY_DATE_TYPE_ID")
    private StandardReference keyDateType;
    @ManyToOne
    @JoinColumn(name = "CUSTODY_ID")
    private Custody custody;
}
