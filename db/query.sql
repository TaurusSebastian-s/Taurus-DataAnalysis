-- Columns Query
SELECT
    COUNT(DISTINCT CASE WHEN s_QuoteNumber IS NOT NULL THEN s_QuoteNumber END) AS "# Quotes",
    COUNT(DISTINCT CASE WHEN s_QuoteNumber IS NOT NULL AND d_BookingDate IS NOT NULL THEN s_QuoteNumber END) AS "# Quote NB",
    (COUNT(DISTINCT CASE WHEN d_BookingDate IS NOT NULL THEN s_QuoteNumber END) /
     COUNT(DISTINCT CASE WHEN s_QuoteNumber IS NOT NULL THEN s_QuoteNumber END)) * 100 AS "Quote Conversion %",
    SUM(CASE WHEN d_BookingDate IS NOT NULL THEN n_CitizenTotalPremium END) AS "Quote NB Premium",
    AVG(CASE WHEN d_BookingDate IS NOT NULL THEN n_CitizenTotalPremium END) AS "Average NB Premium",
    COUNT(CASE WHEN s_PolicyStatusCode != 'CANCELLED' THEN 1 END) AS "# PIF",
    COUNT(CASE WHEN d_InceptionDate < CURDATE() THEN 1 END) AS "Expired Policies",
    SUM(CASE WHEN d_InceptionDate < CURDATE() THEN n_CitizenTotalPremium END) AS "Expired Premium",
    (COUNT(DISTINCT CASE WHEN s_RenewalTypeCode IS NOT NULL AND d_InceptionDate < CURDATE() THEN n_PolicyNoId_PK END) /
     COUNT(DISTINCT CASE WHEN d_InceptionDate < CURDATE() THEN n_PolicyNoId_PK END)) * 100 AS "Retention %"
FROM tb_policies;

-- Grouping by Tenent
SELECT
    hc.s_HoldingCompanyCode AS "name",
    COUNT(DISTINCT CASE WHEN p.s_QuoteNumber IS NOT NULL THEN p.s_QuoteNumber END) AS "# Quotes",
    COUNT(DISTINCT CASE WHEN p.s_QuoteNumber IS NOT NULL AND p.d_BookingDate IS NOT NULL THEN p.s_QuoteNumber END) AS "# Quote NB",
    (COUNT(DISTINCT CASE WHEN p.d_BookingDate IS NOT NULL THEN p.s_QuoteNumber END) /
     COUNT(DISTINCT CASE WHEN p.s_QuoteNumber IS NOT NULL THEN p.s_QuoteNumber END)) * 100 AS "Quote Conversion %",
    SUM(CASE WHEN p.d_BookingDate IS NOT NULL THEN p.n_CitizenTotalPremium END) AS "Quote NB Premium",
    AVG(CASE WHEN p.d_BookingDate IS NOT NULL THEN p.n_CitizenTotalPremium END) AS "Average NB Premium",
    COUNT(CASE WHEN p.s_PolicyStatusCode != 'CANCELLED' THEN 1 END) AS "# PIF",
    COUNT(CASE WHEN p.d_InceptionDate < CURDATE() THEN 1 END) AS "Expired Policies",
    SUM(CASE WHEN p.d_InceptionDate < CURDATE() THEN p.n_CitizenTotalPremium END) AS "Expired Premium",
    (COUNT(DISTINCT CASE WHEN p.s_RenewalTypeCode IS NOT NULL AND p.d_InceptionDate < CURDATE() THEN p.n_PolicyNoId_PK END) /
     COUNT(DISTINCT CASE WHEN p.d_InceptionDate < CURDATE() THEN p.n_PolicyNoId_PK END)) * 100 AS "Retention %"
FROM
    tb_policies p
JOIN
    tb_holdingcompanies hc ON p.n_IssueCompanyID_FK = hc.n_HoldingCompanyId_PK  -- Relación con Tenant
GROUP BY
    hc.s_HoldingCompanyCode;

-- Grouping By Agent
SELECT
    JSON_UNQUOTE(JSON_EXTRACT(p.metadata, '$.agent_code')) AS "name",
    COUNT(DISTINCT CASE WHEN p.s_QuoteNumber IS NOT NULL THEN p.s_QuoteNumber END) AS "# Quotes",
    COUNT(DISTINCT CASE WHEN p.s_QuoteNumber IS NOT NULL AND p.d_BookingDate IS NOT NULL THEN p.s_QuoteNumber END) AS "# Quote NB",
    (COUNT(DISTINCT CASE WHEN p.d_BookingDate IS NOT NULL THEN p.s_QuoteNumber END) /
     COUNT(DISTINCT CASE WHEN p.s_QuoteNumber IS NOT NULL THEN p.s_QuoteNumber END)) * 100 AS "Quote Conversion %",
    SUM(CASE WHEN p.d_BookingDate IS NOT NULL THEN p.n_CitizenTotalPremium END) AS "Quote NB Premium",
    AVG(CASE WHEN p.d_BookingDate IS NOT NULL THEN p.n_CitizenTotalPremium END) AS "Average NB Premium",
    COUNT(CASE WHEN p.s_PolicyStatusCode != 'CANCELLED' THEN 1 END) AS "# PIF",
    COUNT(CASE WHEN p.d_InceptionDate < CURDATE() THEN 1 END) AS "Expired Policies",
    SUM(CASE WHEN p.d_InceptionDate < CURDATE() THEN p.n_CitizenTotalPremium END) AS "Expired Premium",
    (COUNT(DISTINCT CASE WHEN p.s_RenewalTypeCode IS NOT NULL AND p.d_InceptionDate < CURDATE() THEN p.n_PolicyNoId_PK END) /
     COUNT(DISTINCT CASE WHEN p.d_InceptionDate < CURDATE() THEN p.n_PolicyNoId_PK END)) * 100 AS "Retention %"
FROM
    tb_policies p
GROUP BY
    JSON_UNQUOTE(JSON_EXTRACT(p.metadata, '$.agent_code'));

-- Grouping By State
SELECT
    p.s_IssueStateCode AS "name",
    COUNT(DISTINCT CASE WHEN p.s_QuoteNumber IS NOT NULL THEN p.s_QuoteNumber END) AS "# Quotes",
    COUNT(DISTINCT CASE WHEN p.s_QuoteNumber IS NOT NULL AND p.d_BookingDate IS NOT NULL THEN p.s_QuoteNumber END) AS "# Quote NB",
    (COUNT(DISTINCT CASE WHEN p.d_BookingDate IS NOT NULL THEN p.s_QuoteNumber END) /
     COUNT(DISTINCT CASE WHEN p.s_QuoteNumber IS NOT NULL THEN p.s_QuoteNumber END)) * 100 AS "Quote Conversion %",
    SUM(CASE WHEN p.d_BookingDate IS NOT NULL THEN p.n_CitizenTotalPremium END) AS "Quote NB Premium",
    AVG(CASE WHEN p.d_BookingDate IS NOT NULL THEN p.n_CitizenTotalPremium END) AS "Average NB Premium",
    COUNT(CASE WHEN p.s_PolicyStatusCode != 'CANCELLED' THEN 1 END) AS "# PIF",
    COUNT(CASE WHEN p.d_InceptionDate < CURDATE() THEN 1 END) AS "Expired Policies",
    SUM(CASE WHEN p.d_InceptionDate < CURDATE() THEN p.n_CitizenTotalPremium END) AS "Expired Premium",
    (COUNT(DISTINCT CASE WHEN p.s_RenewalTypeCode IS NOT NULL AND p.d_InceptionDate < CURDATE() THEN p.n_PolicyNoId_PK END) /
     COUNT(DISTINCT CASE WHEN p.d_InceptionDate < CURDATE() THEN p.n_PolicyNoId_PK END)) * 100 AS "Retention %"
FROM
    tb_policies p
GROUP BY
    p.s_IssueStateCode;
