CREATE SCHEMA blog;

CREATE TABLE blog.post(
	post_id SERIAL PRIMARY KEY,
	user_id	INT NOT NULL,
	content TEXT,
	tags TEXT[],
	created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	is_public BOOLEAN DEFAULT TRUE
);

CREATE TABLE blog.post_like(
	user_id	 INT NOT NULL,
	post_id	INT NOT NULL,
	liked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY(user_id,post_id)
);

--
INSERT INTO blog.post (user_id, content, tags, created_at, is_public)
SELECT
    (random() * 500 + 1)::int AS user_id,

    'Bài viết #' || gs || ' - ' ||
    CASE (gs % 7)

        WHEN 0 THEN 'Tối ưu PostgreSQL index trong hệ thống lớn'
        WHEN 1 THEN 'Xây dựng backend API hiệu năng cao'
        WHEN 2 THEN 'Hiểu JOIN và query planner trong database'

        -- CÓ CHỨA "du lịch"
        WHEN 3 THEN 'Kinh nghiệm du lịch Đà Lạt rất thú vị'
        WHEN 4 THEN 'Chuyến du lịch Nha Trang biển xanh cát trắng'
        WHEN 5 THEN 'Trải nghiệm du lịch Sapa với khí hậu lạnh'

        -- đảm bảo có %du lịch% trong content
        ELSE 'Review chi tiết chuyến du lịch Việt Nam tuyệt vời'
    END AS content,

    CASE (gs % 7)
        WHEN 0 THEN ARRAY['sql', 'postgres']
        WHEN 1 THEN ARRAY['backend', 'api']
        WHEN 2 THEN ARRAY['database', 'performance']

        WHEN 3 THEN ARRAY['travel', 'dalat', 'vietnam']
        WHEN 4 THEN ARRAY['travel', 'nhatrang']
        WHEN 5 THEN ARRAY['travel', 'sapa']
        ELSE ARRAY['travel', 'vietnam']
    END AS tags,

    CURRENT_TIMESTAMP - (random() * 365)::int * INTERVAL '1 day',
    CASE WHEN random() < 0.9 THEN TRUE ELSE FALSE END

FROM generate_series(1, 5000) gs;

--
CREATE EXTENSION pg_trgm;
-- 1.
EXPLAIN ANALYZE
SELECT *
FROM blog.post
WHERE is_public = TRUE AND content ILIKE '%du lịch%';

CREATE INDEX idx_post_content_lower
ON blog.post
USING gin (LOWER(content) gin_trgm_ops);

-- 2.
EXPLAIN ANALYZE
SELECT * FROM blog.post
WHERE tags @> ARRAY['travel'];

CREATE INDEX idx_post_tags
ON blog.post
USING gin (tags);

-- 3.
CREATE INDEX idx_post_recent_public
ON blog.post(created_at DESC)
WHERE is_public = TRUE AND created_at >= NOW() - INTERVAL '7 days';
SELECT * FROM blog.post

-- 4.
CREATE INDEX idx_post_user_created
ON blog.post (user_id, created_at DESC);

EXPLAIN ANALYZE
SELECT *
FROM blog.post
WHERE user_id = 14
  AND is_public = TRUE
ORDER BY created_at DESC;
