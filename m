Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cPJ-0007oW-5j
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:51:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41197)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPD-0007eL-4i
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPC-0005K4-AH
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:47 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:45324)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPA-0005Hh-6N; Fri, 06 Oct 2017 19:51:44 -0400
Received: by mail-qt0-x244.google.com with SMTP id k1so23349898qti.2;
	Fri, 06 Oct 2017 16:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NgvAa6l3iSRe7nWQKXdR6AHzYz65ulegWQHIqncCGYI=;
	b=Ns7CmFA2ZcdVdvfMmu/bwvd3czvRmTEX35TRM/cgBFz0+Lh1tQsOatHTJSveyWH0G0
	bpmPk9sG8vah5NfCNeAtcVqOl9ZCUERHPeYjXRtTZZ6xJUzhckWyGtp3OstNttAqQYt0
	M7aWmimAd4BazmykzRkwNvFu5TaiUzxHeLcnTztYqpCKg2cnthqlICu4kVUip+SyEGLV
	36rN9ff4xZ4optZeRYj4cwLsoq1kWLUbNn8tcLnZG6MBvck26xOa/dktmBP/qog7pgDL
	oCrJDI0/YlzPA4FBRstPzLQ1h0KFfB+0Y/M4VwNf7Xe2V7IN8HvVk4jW0qelJ1W4N2hL
	olmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=NgvAa6l3iSRe7nWQKXdR6AHzYz65ulegWQHIqncCGYI=;
	b=WnRMBrczDnq51/tui71+/RNsbwWWHhha8XRZWiELG4d9o6PtucbUi8pIJXmw8e7RWe
	Ue01iUia//Gnq4IvZ253qO9f6+x5VCMea2GndLsZqbAwyMgDrbu4XdNbRZV37La9n8m5
	IVKHuGrAikSy0e4rKCv7U3Vq27Liym+w3RjQg+4TNt//K+kTXUzhP+Ku+y/WXzjgO9a6
	aDlWQ7B5OYPolbvu1Wty/xXyS++hdbHDgYNw9rUhb5J06h5m+p9JxC92bbExKR6kqCFZ
	DVMgYCVAAnyy5o/w0EwDI6ZP2oKs7h/oav6BmVPgnW2hKJke6cbwpO/peoYcA9NYaEFU
	w87w==
X-Gm-Message-State: AMCzsaX+b84iIpm9jh54uZJz4t/ZHAScGBpVCOxH8XYQ5n7rHpos7pAu
	yQ9nAE5DkE1f6W1R0fbg8tU=
X-Google-Smtp-Source: AOwi7QCAwrfvOUTPyvezx7kF7u/r7h45kzbcFOCHftAxNihNMKHqTSs1h6XfUpKl+I8UkGS7tKTFgQ==
X-Received: by 10.237.60.101 with SMTP id u34mr5150473qte.153.1507333903630;
	Fri, 06 Oct 2017 16:51:43 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.51.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:51:43 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:15 -0300
Message-Id: <20171006235023.11952-21-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH 20/88] Migration: use g_new() family of
 functions
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 06 Oct 2017 23:51:48 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: indented, added migration/migration.c and migration/page_cache.c]
---
 migration/migration.c    | 2 +-
 migration/page_cache.c   | 2 +-
 migration/postcopy-ram.c | 2 +-
 migration/ram.c          | 3 +--
 4 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/migration/migration.c b/migration/migration.c
index 98429dc843..4899182b32 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -485,7 +485,7 @@ MigrationParameters *qmp_query_migrate_parameters(Error **errp)
     MigrationState *s = migrate_get_current();
 
     /* TODO use QAPI_CLONE() instead of duplicating it inline */
-    params = g_malloc0(sizeof(*params));
+    params = g_new0(MigrationParameters, 1);
     params->has_compress_level = true;
     params->compress_level = s->parameters.compress_level;
     params->has_compress_threads = true;
diff --git a/migration/page_cache.c b/migration/page_cache.c
index ba984c4858..30169a1dd3 100644
--- a/migration/page_cache.c
+++ b/migration/page_cache.c
@@ -57,7 +57,7 @@ PageCache *cache_init(int64_t num_pages, unsigned int page_size)
     }
 
     /* We prefer not to abort if there is no memory */
-    cache = g_try_malloc(sizeof(*cache));
+    cache = g_try_new(PageCache, 1);
     if (!cache) {
         DPRINTF("Failed to allocate cache\n");
         return NULL;
diff --git a/migration/postcopy-ram.c b/migration/postcopy-ram.c
index 0de68e8b25..d51684ce30 100644
--- a/migration/postcopy-ram.c
+++ b/migration/postcopy-ram.c
@@ -811,7 +811,7 @@ void *postcopy_get_tmp_page(MigrationIncomingState *mis)
 PostcopyDiscardState *postcopy_discard_send_init(MigrationState *ms,
                                                  const char *name)
 {
-    PostcopyDiscardState *res = g_malloc0(sizeof(PostcopyDiscardState));
+    PostcopyDiscardState *res = g_new0(PostcopyDiscardState, 1);
 
     if (res) {
         res->ramblock_name = name;
diff --git a/migration/ram.c b/migration/ram.c
index b83f8977c5..3f5407ee43 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1376,8 +1376,7 @@ int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len)
         goto err;
     }
 
-    struct RAMSrcPageRequest *new_entry =
-        g_malloc0(sizeof(struct RAMSrcPageRequest));
+    struct RAMSrcPageRequest *new_entry = g_new0(struct RAMSrcPageRequest, 1);
     new_entry->rb = ramblock;
     new_entry->offset = start;
     new_entry->len = len;
-- 
2.14.2


