package uk.gov.justice.digital.delius.jpa.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import uk.gov.justice.digital.delius.jpa.entity.Document;

@Repository
public interface DocumentRepository extends JpaRepository<Document, Long> {

    @Query(value = "SELECT probation_area_id FROM probation_area WHERE code = ?1", nativeQuery = true)
    Long lookupProbationArea(String code);

    @Query(value = "SELECT PKG_USER_SUPPORT.getSPGInboundUserID(?2,?1) FROM dual", nativeQuery = true)
    Long lookupUser(Long probationAreaId, String alfrescoUser);

}
