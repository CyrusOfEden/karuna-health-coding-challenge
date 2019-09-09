SELECT
    messages.*
FROM
    messages
    JOIN (SELECT DISTINCT ON (m.medium, m.identifier)
            m.id,
            m.status
        FROM
            messages m
        WHERE
            m.status <> 2
        ORDER BY
            m.medium,
            m.identifier,
            m.status DESC,
            m.created_at ASC) unsent_messages
        USING (id)
    WHERE
        messages.status = 0

-- Rough work below
-- ================

-- WITH unsent_messages AS (
--     SELECT m.*
--     FROM messages m
--     WHERE status <> 2
-- ), next_messages AS (
--     SELECT m.*
--     FROM unsent_messages m
--     GROUP BY m.medium, m.identifier
--     ORDER BY m.status DESC, m.created_at ASC
--     LIMIT 1
-- )

-- SELECT m.* FROM next_messages m WHERE status = 0


-- -- Alternative
-- SELECT m.*
-- FROM (SELECT m.* FROM messages WHERE m.status <> 2) m
-- WHERE 
-- GROUP BY m.medium, m.identifier
-- ORDER BY m.status DESC, m.created_at ASC
-- LIMIT 1


-- -- Alternative again

-- SELECT MIN(m.id)
-- FROM messages WHERE status <> 2 
