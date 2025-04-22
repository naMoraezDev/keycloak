FROM quay.io/keycloak/keycloak:24.0.1 as builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Build Keycloak com Quarkus (modo "production")
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:24.0.1

COPY --from=builder /opt/keycloak/ /opt/keycloak/

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]
CMD ["start"]
