-- ポケモンGO フレンド募集掲示板（Cloudflare D1）
CREATE TABLE IF NOT EXISTS pogo_posts (
  id           INTEGER PRIMARY KEY AUTOINCREMENT,
  created_at   INTEGER NOT NULL,
  updated_at   INTEGER NOT NULL,
  trainer_name TEXT    NOT NULL,
  friend_code  TEXT    NOT NULL UNIQUE,
  team         TEXT,
  level        INTEGER,
  icon_id      INTEGER,
  is_active    INTEGER NOT NULL DEFAULT 1,
  purpose      TEXT    NOT NULL DEFAULT '',
  message      TEXT    NOT NULL DEFAULT '',
  region_code  TEXT    NOT NULL,
  lat          REAL    NOT NULL,
  lng          REAL    NOT NULL,
  token_hash   TEXT    NOT NULL,
  ip_hash      TEXT    NOT NULL
);

CREATE INDEX IF NOT EXISTS idx_pogo_active_updated ON pogo_posts (is_active, updated_at DESC);
CREATE INDEX IF NOT EXISTS idx_pogo_ip_created ON pogo_posts (ip_hash, created_at);
