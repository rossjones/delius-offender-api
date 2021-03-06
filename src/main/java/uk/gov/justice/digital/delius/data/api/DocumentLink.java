package uk.gov.justice.digital.delius.data.api;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class DocumentLink {
    private String alfrescoId;
    private String alfrescoUser;
    private String probationAreaCode;
    private String documentName;
    private String crn;
    private String tableName;
    private Long entityId;
}
