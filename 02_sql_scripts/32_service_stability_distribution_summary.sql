USE gtfs_berlin;
SELECT
    SUM(
        CASE
            WHEN sos.service_stability_level = 'Limited' THEN 1
            ELSE 0
        END
    ) AS number_of_services_with_Limited_level,
    ROUND(
        SUM(
            CASE
                WHEN sos.service_stability_level = 'Limited' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS percentage_of_services_with_Limited_level,
    SUM(
        CASE
            WHEN sos.service_stability_level = 'Stable' THEN 1
            ELSE 0
        END
    ) AS number_of_services_with_Stable_level,
    ROUND(
        SUM(
            CASE
                WHEN sos.service_stability_level = 'Stable' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS percentage_of_services_with_Stable_level,
    SUM(
        CASE
            WHEN sos.service_stability_level = 'Robust' THEN 1
            ELSE 0
        END
    ) AS number_of_services_with_Robust_level,
    ROUND(
        SUM(
            CASE
                WHEN sos.service_stability_level = 'Robust' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS percentage_of_services_with_Robust_level,
    SUM(
        CASE
            WHEN sos.service_stability_level = 'Unstable' THEN 1
            ELSE 0
        END
    ) AS number_of_services_with_Unstable_level,
    ROUND(
        SUM(
            CASE
                WHEN sos.service_stability_level = 'Unstable' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS percentage_of_services_with_Unstable_level
FROM service_operational_summary sos;