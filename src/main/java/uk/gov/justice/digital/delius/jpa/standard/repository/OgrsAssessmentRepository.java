package uk.gov.justice.digital.delius.jpa.standard.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import uk.gov.justice.digital.delius.jpa.standard.entity.OgrsAssessment;

import java.util.List;

public interface OgrsAssessmentRepository extends JpaRepository<OgrsAssessment, Long>  {
    @Query(value = "SELECT * FROM OGRS_ASSESSMENT WHERE EVENT_ID IN (SELECT EVENT_ID FROM EVENT WHERE OFFENDER_ID = ?1)", nativeQuery = true)
    List<OgrsAssessment> listOfOgrsAssessments(Long offenderId);
}
