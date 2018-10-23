package uk.gov.justice.digital.delius.transformers;

import org.springframework.stereotype.Component;
import uk.gov.justice.digital.delius.data.api.OgrsAssessment;

@Component
public class OgrsTransformer {

    public OgrsAssessment ogrsAssessmentOf(uk.gov.justice.digital.delius.jpa.standard.entity.OgrsAssessment ogrsAssessment) {
        return OgrsAssessment.builder()
            .assessmentDate(ogrsAssessment.getAssessmentDate())
            .eventId(ogrsAssessment.getEventId())
            .ogrs2Score(ogrsAssessment.getOgrs2Score())
            .ogrs3Score1(ogrsAssessment.getOgrs3Score1())
            .ogrs3Score2(ogrsAssessment.getOgrs3Score2())
            .ogrsAssessmentId(ogrsAssessment.getOgrsAssessmentId())
            .build();
    }

}
