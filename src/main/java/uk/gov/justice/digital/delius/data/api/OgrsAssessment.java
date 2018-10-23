package uk.gov.justice.digital.delius.data.api;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDateTime;

@Data
@Builder(toBuilder = true)
public class OgrsAssessment {
    private Long ogrsAssessmentId;
    private LocalDateTime assessmentDate;
    private Long eventId;
    private Long ogrs2Score;
    private Long ogrs3Score1;
    private Long ogrs3Score2;
}
