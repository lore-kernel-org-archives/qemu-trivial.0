Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pSJoa-0004Yh-Oe
	for mharc-qemu-trivial@gnu.org; Wed, 15 Feb 2023 10:35:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSJoY-0004Xo-CY
 for qemu-trivial@nongnu.org; Wed, 15 Feb 2023 10:35:22 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSJoW-00013Z-FB
 for qemu-trivial@nongnu.org; Wed, 15 Feb 2023 10:35:21 -0500
Received: by mail-wr1-x42d.google.com with SMTP id l2so2938023wry.0
 for <qemu-trivial@nongnu.org>; Wed, 15 Feb 2023 07:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=fWoi9+MGZrsXcu6b1ITlIp9Td/V/JR2WQ7/C8DO5GbQ=;
 b=ht1P/jn8+WblQMDhyTzEM6oydIG5jrNAdgIaRCscMKP8L62jFI4K13eazjCTtHl1WA
 bNtY9JCnwy74PUhDKUqWGmcUt3ScfKWFS02c1soZC0RQAwR6jo5GGxQTr/9T+vGxS32Z
 mRAMhqc9jJ6SdyihbsoQP1qWkdpqzl1vpsEnZWAR0Ctrh+ISi7M5RnJLnHh1l4zVlSBu
 U8U7ride9zUqxGQHYtIf21Qx+pihwk1yqovDcHLbj9XP2snrppEKWsS1fRDyCj8qPhQn
 BniZNqL327uD8OIFLl6tomUkwIPJ6u6KIi8cdhHUO6BtHWQrD16KJ8deSshiswn+HMuN
 4DVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fWoi9+MGZrsXcu6b1ITlIp9Td/V/JR2WQ7/C8DO5GbQ=;
 b=Bllk3Yp99Kpkb9wnl3+0JkxsgGNGDGui1NYn/aM09ebuCwJUACHtMdU2AHBX6CrsIR
 rmNyjmx5dLPlg6uDGmVFTQKNV+czh3OHx+cUgveZ9xBE1tRTEF4TTg41Wc3e67cEwKXF
 xc7E1izC+hxrJYQH9mjW10MM+8w1psbrh/j/F0FIHmH6idHm67dsMwTx3BX3ot9kZEMH
 g3wjlziy4Cho320r414YpZkeIp/wuELcreONPCa/TdVuBysKUnRBv+PBFYRE9RlOMj7g
 kJdy0qj/Eg7NUbMekJrkj8IXzNssPb/PdB+ce3cHnXLhYur3GVocDJpAgCUxlmu07sx9
 Bo1w==
X-Gm-Message-State: AO0yUKUSTIULW0oa/YYjmmjCCag0m9Uh20awkeOWSaEwvGe/dY4xbmlg
 iu6ScmC9CzXCXdU6FqfYA5b1Qw==
X-Google-Smtp-Source: AK7set8PpoW0dGpwQMNlg9OZznkUibI8jSFRPAQ9C9ECz9++2/bP7TnbSrflF7JjFPw35OYm0qhWJA==
X-Received: by 2002:a5d:591b:0:b0:2bf:c066:dd7e with SMTP id
 v27-20020a5d591b000000b002bfc066dd7emr2027340wrd.40.1676475318905; 
 Wed, 15 Feb 2023 07:35:18 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 g9-20020a5d5409000000b002c558228b6dsm8435791wrv.12.2023.02.15.07.35.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 07:35:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Fam Zheng <fam@euphon.net>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] migration/block: Convert remaining DPRINTF() debug macro to
 trace events
Date: Wed, 15 Feb 2023 16:35:17 +0100
Message-Id: <20230215153517.30732-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 15 Feb 2023 15:35:22 -0000

Finish the conversion from commit fe80c0241d
("migration: using trace_ to replace DPRINTF").

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 migration/block.c      | 12 +-----------
 migration/trace-events |  1 +
 2 files changed, 2 insertions(+), 11 deletions(-)

diff --git a/migration/block.c b/migration/block.c
index 29f69025af..b5ce506d01 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -42,16 +42,6 @@
 #define MAX_IO_BUFFERS 512
 #define MAX_PARALLEL_IO 16
 
-/* #define DEBUG_BLK_MIGRATION */
-
-#ifdef DEBUG_BLK_MIGRATION
-#define DPRINTF(fmt, ...) \
-    do { printf("blk_migration: " fmt, ## __VA_ARGS__); } while (0)
-#else
-#define DPRINTF(fmt, ...) \
-    do { } while (0)
-#endif
-
 typedef struct BlkMigDevState {
     /* Written during setup phase.  Can be read without a lock.  */
     BlockBackend *blk;
@@ -502,7 +492,7 @@ static int blk_mig_save_bulked_block(QEMUFile *f)
         block_mig_state.prev_progress = progress;
         qemu_put_be64(f, (progress << BDRV_SECTOR_BITS)
                          | BLK_MIG_FLAG_PROGRESS);
-        DPRINTF("Completed %d %%\r", progress);
+        trace_migration_block_progression(progress);
     }
 
     return ret;
diff --git a/migration/trace-events b/migration/trace-events
index 67b65a70ff..b20e1271bc 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -357,6 +357,7 @@ migration_block_flush_blks(const char *action, int submitted, int read_done, int
 migration_block_save(const char *mig_stage, int submitted, int transferred) "Enter save live %s submitted %d transferred %d"
 migration_block_save_complete(void) "Block migration completed"
 migration_block_state_pending(uint64_t pending) "Enter save live pending  %" PRIu64
+migration_block_progression(unsigned percent) "Completed %u%%"
 
 # page_cache.c
 migration_pagecache_init(int64_t max_num_items) "Setting cache buckets to %" PRId64
-- 
2.38.1


