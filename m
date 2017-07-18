Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLkZ-0003Ro-17
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:12:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLkW-0003Ob-5E
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:12:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLkV-0004P6-4B
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:12:48 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:34190)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLkU-0004Or-Vt; Tue, 18 Jul 2017 02:12:47 -0400
Received: by mail-qk0-x241.google.com with SMTP id q66so1352354qki.1;
	Mon, 17 Jul 2017 23:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cLVdvWrno2IDPvBRRkNyec+Z2xuGvW38qJnyDJn5Tt8=;
	b=YjaomYsUWTrm5JAsVHZTsRz7OSWKs5x4rOQbXqA+iJK+RjCt2b2L3uHOupgRXFcci4
	i3ljX/CzNf63dn7oICkALrD63tNUkaaW7zlmdRA7wsNG7cKmqT9E4jD322ftMIGyzd1c
	kDK1gwqPi2l7vefFeJcZwI374nQHh98COO8IZf8Gjm9rKiNbCs/YYUm198rmw9RVaFGA
	lJGlUml6Ylu9yVe2lheG4srqaZqzqXtWa5tz5fpUFmpODJHB1LXNHhLe7G590zvSbAJi
	alNBqnF1sHhDSd9LjiVKBA9zMlfIt0omTEctrOalHtDBTuOR6NFhSA0/ETVdbbI7yGik
	AgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=cLVdvWrno2IDPvBRRkNyec+Z2xuGvW38qJnyDJn5Tt8=;
	b=FlmmYfNYc9hvvhS1AK5N7I+cOCoOnES91YeHBWoKaeyDI0pfDRiSZwJDqRPJ/K2thm
	qLdsGa/PsjtTsEGnXs+vop8dfiLcFiZnZCdfR9RiExI0r+gjQXiT1YQeVwrC4twd1qDD
	I9VzpwZ869sXrh4MNKPf91W5W3q5vpzd8/OuWHNfE8F8riheAbedSnZYMxG7GObS1ghn
	GH22ZHVfxZkzN9btSbenqscC5jZnbeG702p5W+rwDzFoiF6HhLAh33bC6EHb+spHHVq+
	R+/R/n41GnfjzYiNrgdQ5HlBVu4BjQO3q+Rm8B72/iGsY7/3MICz0pquiKCU0Dn+nJoo
	JEQA==
X-Gm-Message-State: AIVw1138HlUS4VA5RyZtjF3Ov0/Sb4DIaDJuuWJhvj2LxqcoFE8hkNOe
	n3+VEB0B8QIo2cMFQ8UVQA==
X-Received: by 10.55.140.71 with SMTP id o68mr99941qkd.18.1500358366217;
	Mon, 17 Jul 2017 23:12:46 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.12.42
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:12:45 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Fam Zheng <famz@redhat.com>, Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	Jeff Cody <jcody@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-block@nongnu.org,
	Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:09:41 -0300
Message-Id: <20170718061005.29518-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH 05/29] block: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:12:49 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 block/io.c          | 4 ++--
 block/qcow2-cache.c | 2 +-
 block/vhdx-log.c    | 2 +-
 block/vvfat.c       | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/block/io.c b/block/io.c
index aece54c015..2db571c310 100644
--- a/block/io.c
+++ b/block/io.c
@@ -1232,7 +1232,7 @@ static int coroutine_fn bdrv_co_do_pwrite_zeroes(BlockDriverState *bs,
     int max_transfer = MIN_NON_ZERO(bs->bl.max_transfer,
                                     MAX_WRITE_ZEROES_BOUNCE_BUFFER);
 
-    assert(alignment % bs->bl.request_alignment == 0);
+    assert(QEMU_IS_ALIGNED(alignment, bs->bl.request_alignment));
     head = offset % alignment;
     tail = (offset + bytes) % alignment;
     max_write_zeroes = QEMU_ALIGN_DOWN(max_write_zeroes, alignment);
@@ -2342,7 +2342,7 @@ int coroutine_fn bdrv_co_pdiscard(BlockDriverState *bs, int64_t offset,
      * unaligned requests (by returning -ENOTSUP), so we must fragment
      * the request accordingly.  */
     align = MAX(bs->bl.pdiscard_alignment, bs->bl.request_alignment);
-    assert(align % bs->bl.request_alignment == 0);
+    assert(QEMU_IS_ALIGNED(align, bs->bl.request_alignment));
     head = offset % align;
     tail = (offset + bytes) % align;
 
diff --git a/block/qcow2-cache.c b/block/qcow2-cache.c
index 1d25147392..a4886c581e 100644
--- a/block/qcow2-cache.c
+++ b/block/qcow2-cache.c
@@ -58,7 +58,7 @@ static inline int qcow2_cache_get_table_idx(BlockDriverState *bs,
     BDRVQcow2State *s = bs->opaque;
     ptrdiff_t table_offset = (uint8_t *) table - (uint8_t *) c->table_array;
     int idx = table_offset / s->cluster_size;
-    assert(idx >= 0 && idx < c->size && table_offset % s->cluster_size == 0);
+    assert(idx >= 0 && idx < c->size && QEMU_IS_ALIGNED(table_offset, s->cluster_size));
     return idx;
 }
 
diff --git a/block/vhdx-log.c b/block/vhdx-log.c
index 01278f3fc9..bdcaa4cc16 100644
--- a/block/vhdx-log.c
+++ b/block/vhdx-log.c
@@ -282,7 +282,7 @@ static bool vhdx_log_desc_is_valid(VHDXLogDescriptor *desc,
     }
 
     if (desc->signature == VHDX_LOG_ZERO_SIGNATURE) {
-        if (desc->zero_length % VHDX_LOG_SECTOR_SIZE == 0) {
+        if (QEMU_IS_ALIGNED(desc->zero_length, VHDX_LOG_SECTOR_SIZE)) {
             /* valid */
             ret = true;
         }
diff --git a/block/vvfat.c b/block/vvfat.c
index 4dae790203..5eb827fbd6 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -454,7 +454,7 @@ static direntry_t *create_long_filename(BDRVVVFATState *s, const char *filename)
         entry=array_get(&(s->directory),s->directory.next-1-(i/26));
         if (i >= 2 * length + 2) {
             entry->name[offset] = 0xff;
-        } else if (i % 2 == 0) {
+        } else if (QEMU_IS_ALIGNED(i, 2)) {
             entry->name[offset] = longname[i / 2] & 0xff;
         } else {
             entry->name[offset] = longname[i / 2] >> 8;
-- 
2.13.2


