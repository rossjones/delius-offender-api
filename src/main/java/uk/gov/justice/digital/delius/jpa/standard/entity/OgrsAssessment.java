package uk.gov.justice.digital.delius.jpa.standard.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;

@Data
@Builder
@Entity
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "OGRS_ASSESSMENT")
public class OgrsAssessment {
    @Id
    @Column(name = "OGRS_ASSESSMENT_ID")
    private Long ogrsAssessmentId;

    @Column(name = "ASSESSMENT_DATE")
    private LocalDateTime assessmentDate;

    @Column(name = "EVENT_ID")
    private Long eventId;

    @Column(name = "OGRS2_SCORE")
    private Long ogrs2Score;

    @Column(name = "SOFT_DELETED")
    private Long softDeleted;

    @Column(name = "OGRS3_SCORE_1")
    private Long ogrs3Score1;

    @Column(name = "PARTITION_AREA_ID")
    private Long partitionAreaId;

    @Column(name = "OGRS3_SCORE_2")
    private Long ogrs3Score2;

    @Column(name = "ROW_VERSION")
    private Long rowVersion;

    @Column(name = "TRAINING_SESSION_ID")
    private Long trainingSessionId;
}
