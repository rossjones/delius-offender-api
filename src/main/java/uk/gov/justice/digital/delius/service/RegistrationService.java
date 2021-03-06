package uk.gov.justice.digital.delius.service;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import uk.gov.justice.digital.delius.data.api.Registration;
import uk.gov.justice.digital.delius.jpa.standard.repository.RegistrationRepository;
import uk.gov.justice.digital.delius.transformers.RegistrationTransformer;

import java.util.Comparator;
import java.util.List;

import static java.util.stream.Collectors.toList;
import static uk.gov.justice.digital.delius.transformers.TypesTransformer.convertToBoolean;

@Service
@Slf4j
public class RegistrationService {
    private final RegistrationRepository registrationRepository;
    private final RegistrationTransformer registrationTransformer;

    @Autowired
    public RegistrationService(RegistrationRepository registrationRepository, RegistrationTransformer registrationTransformer) {
        this.registrationRepository = registrationRepository;
        this.registrationTransformer = registrationTransformer;
    }

    public List<Registration> registrationsFor(Long offenderId) {
        List<uk.gov.justice.digital.delius.jpa.standard.entity.Registration> registrations = registrationRepository.findByOffenderId(offenderId);
        return registrations
                .stream()
                .filter(registration -> !convertToBoolean(registration.getSoftDeleted()))
                .sorted(Comparator.comparing(uk.gov.justice.digital.delius.jpa.standard.entity.Registration::getRegistrationDate).reversed())
                .map(registrationTransformer::registrationOf)
                .collect(toList());
    }
}
