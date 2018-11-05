package uk.gov.justice.digital.delius.data.api;

import lombok.Builder;
import lombok.Data;

import java.time.LocalDate;

@Data
@Builder
public class Conviction {
    private Long convictionId;
    private Boolean active;
    private LocalDate convictionDate;
}
