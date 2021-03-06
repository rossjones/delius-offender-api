package uk.gov.justice.digital.delius.jwt;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import uk.gov.justice.digital.delius.user.UserData;

import java.util.Date;
import java.util.Optional;

@Component
public class Jwt {

    public static final String UID = "uid";
    public static final String PROBATION_AREA_CODES = "probationAreaCodes";

    private final String secret;
    private final int lifetimeSeconds;

    public Jwt(@Value("${jwt.secret}") String secret,
               @Value("${jwt.lifetimeSeconds:300}") int lifetimeSeconds) {
        this.secret = secret;
        this.lifetimeSeconds = lifetimeSeconds;
    }

    public Optional<Claims> parseToken(String bearerToken) {

        return Optional.ofNullable(Jwts.parser()
                .setSigningKey(secret)
                .parseClaimsJws(bearerToken)
                .getBody());

    }

    public Optional<Claims> parseAuthorizationHeader(String authorizationHeader) {
        return parseToken(authorizationHeader.replace("Bearer ", "").replace("bearer ", ""));
    }

    public String buildToken(UserData userData) {

        Claims claims = Jwts.claims().setSubject(userData.getDistinguishedName());
        claims.put(UID, userData.getUid());
        claims.put(PROBATION_AREA_CODES, userData.getProbationAreaCodes());

        return Jwts.builder()
                .setClaims(claims)
                .setExpiration(Date.from(java.time.ZonedDateTime.now().plusSeconds(lifetimeSeconds).toInstant()))
                .signWith(SignatureAlgorithm.HS512, secret)
                .compact();
    }

}
