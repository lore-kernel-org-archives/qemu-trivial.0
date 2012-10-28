Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TSQgT-0002uI-Q0
	for mharc-qemu-trivial@gnu.org; Sun, 28 Oct 2012 07:05:37 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53973)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TSQgP-0002hD-CY
	for qemu-trivial@nongnu.org; Sun, 28 Oct 2012 07:05:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TSQgO-0007x8-5t
	for qemu-trivial@nongnu.org; Sun, 28 Oct 2012 07:05:33 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:63527)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TSQgL-0007pH-Gj; Sun, 28 Oct 2012 07:05:29 -0400
Received: by mail-lb0-f173.google.com with SMTP id gj3so2423304lbb.4
	for <multiple recipients>; Sun, 28 Oct 2012 04:05:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=rxFela6sa3JMAOCLlJze7fA5XP+yMDCKc8GD+CT1KQQ=;
	b=wjehaP/9WtWpe10f0pbX4t2qHmgZ7S3bcJ1dfB812E8EiCPNXMCkt5Yc1QWei26PzB
	CcrpjZVtCBaM2GpMyBRm1xTdaYsYZYlDFa646bGPpN0fzEcySFrSdBQAqpDCyEh1O7JU
	ZLbsUy4INxKOBYMvN2Aiq37chGQcY4tNwDEGhAYj9UIjjQA7H49R0bQPIzaxuK6h4tE5
	Hl0NHLVSoK7l6haUqLesuvAyymGqtG2dX8uTjkKE0MMhJUtJf3HjtxE10ehc1iOLR5Kf
	aq/NB14/p+c7GJIT7rNqqaEB3N+26sZ/LE/PdoQTXZD1RrNOH947mHNZdBBBq79BHU0f
	cCMw==
Received: by 10.152.148.40 with SMTP id tp8mr24580814lab.30.1351422328956;
	Sun, 28 Oct 2012 04:05:28 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id ft3sm2070067lbb.1.2012.10.28.04.05.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 28 Oct 2012 04:05:28 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 28 Oct 2012 11:04:48 +0000
Message-Id: <5ab69aafb781d87c79b9a390388e188c8f88dac1.1351422116.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1351422116.git.blauwirbel@gmail.com>
References: <cover.1351422116.git.blauwirbel@gmail.com>
In-Reply-To: <cover.1351422116.git.blauwirbel@gmail.com>
References: <cover.1351422116.git.blauwirbel@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.217.173
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com,
	Anthony Liguori <aliguori@us.ibm.com>
Subject: [Qemu-trivial] [PATCH v2 3/6] vnc: add missing static
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Oct 2012 11:05:35 -0000

Add missing 'static' qualifiers.

Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
---
 console.h     |    2 --
 ui/vnc-jobs.c |   10 +++++-----
 ui/vnc-jobs.h |    1 -
 ui/vnc.c      |   14 +++++++-------
 ui/vnc.h      |    5 -----
 5 files changed, 12 insertions(+), 20 deletions(-)

diff --git a/console.h b/console.h
index 6099d8d..5ad3615 100644
--- a/console.h
+++ b/console.h
@@ -377,10 +377,8 @@ void cocoa_display_init(DisplayState *ds, int full_screen);
 
 /* vnc.c */
 void vnc_display_init(DisplayState *ds);
-void vnc_display_close(DisplayState *ds);
 void vnc_display_open(DisplayState *ds, const char *display, Error **errp);
 void vnc_display_add_client(DisplayState *ds, int csock, int skipauth);
-int vnc_display_disable_login(DisplayState *ds);
 char *vnc_display_local_addr(DisplayState *ds);
 #ifdef CONFIG_VNC
 int vnc_display_password(DisplayState *ds, const char *password);
diff --git a/ui/vnc-jobs.c b/ui/vnc-jobs.c
index 3c592b3..dfe482d 100644
--- a/ui/vnc-jobs.c
+++ b/ui/vnc-jobs.c
@@ -320,6 +320,11 @@ static void *vnc_worker_thread(void *arg)
     return NULL;
 }
 
+static bool vnc_worker_thread_running(void)
+{
+    return queue; /* Check global queue */
+}
+
 void vnc_start_worker_thread(void)
 {
     VncJobQueue *q;
@@ -332,11 +337,6 @@ void vnc_start_worker_thread(void)
     queue = q; /* Set global queue */
 }
 
-bool vnc_worker_thread_running(void)
-{
-    return queue; /* Check global queue */
-}
-
 void vnc_stop_worker_thread(void)
 {
     if (!vnc_worker_thread_running())
diff --git a/ui/vnc-jobs.h b/ui/vnc-jobs.h
index 86e6d88..31da103 100644
--- a/ui/vnc-jobs.h
+++ b/ui/vnc-jobs.h
@@ -40,7 +40,6 @@ void vnc_jobs_join(VncState *vs);
 
 void vnc_jobs_consume_buffer(VncState *vs);
 void vnc_start_worker_thread(void);
-bool vnc_worker_thread_running(void);
 void vnc_stop_worker_thread(void);
 
 /* Locks */
diff --git a/ui/vnc.c b/ui/vnc.c
index d0ffcc5..d95e6ef 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -479,12 +479,12 @@ void buffer_reserve(Buffer *buffer, size_t len)
     }
 }
 
-int buffer_empty(Buffer *buffer)
+static int buffer_empty(Buffer *buffer)
 {
     return buffer->offset == 0;
 }
 
-uint8_t *buffer_end(Buffer *buffer)
+static uint8_t *buffer_end(Buffer *buffer)
 {
     return buffer->buffer + buffer->offset;
 }
@@ -1376,17 +1376,17 @@ void vnc_flush(VncState *vs)
     vnc_unlock_output(vs);
 }
 
-uint8_t read_u8(uint8_t *data, size_t offset)
+static uint8_t read_u8(uint8_t *data, size_t offset)
 {
     return data[offset];
 }
 
-uint16_t read_u16(uint8_t *data, size_t offset)
+static uint16_t read_u16(uint8_t *data, size_t offset)
 {
     return ((data[offset] & 0xFF) << 8) | (data[offset + 1] & 0xFF);
 }
 
-int32_t read_s32(uint8_t *data, size_t offset)
+static int32_t read_s32(uint8_t *data, size_t offset)
 {
     return (int32_t)((data[offset] << 24) | (data[offset + 1] << 16) |
                      (data[offset + 2] << 8) | data[offset + 3]);
@@ -2763,7 +2763,7 @@ void vnc_display_init(DisplayState *ds)
 }
 
 
-void vnc_display_close(DisplayState *ds)
+static void vnc_display_close(DisplayState *ds)
 {
     VncDisplay *vs = ds ? (VncDisplay *)ds->opaque : vnc_display;
 
@@ -2785,7 +2785,7 @@ void vnc_display_close(DisplayState *ds)
 #endif
 }
 
-int vnc_display_disable_login(DisplayState *ds)
+static int vnc_display_disable_login(DisplayState *ds)
 {
     VncDisplay *vs = ds ? (VncDisplay *)ds->opaque : vnc_display;
 
diff --git a/ui/vnc.h b/ui/vnc.h
index 068c2fc..c89f693 100644
--- a/ui/vnc.h
+++ b/ui/vnc.h
@@ -493,9 +493,6 @@ void vnc_read_when(VncState *vs, VncReadEvent *func, size_t expecting);
 
 
 /* Buffer I/O functions */
-uint8_t read_u8(uint8_t *data, size_t offset);
-uint16_t read_u16(uint8_t *data, size_t offset);
-int32_t read_s32(uint8_t *data, size_t offset);
 uint32_t read_u32(uint8_t *data, size_t offset);
 
 /* Protocol stage functions */
@@ -507,8 +504,6 @@ void start_auth_vnc(VncState *vs);
 
 /* Buffer management */
 void buffer_reserve(Buffer *buffer, size_t len);
-int buffer_empty(Buffer *buffer);
-uint8_t *buffer_end(Buffer *buffer);
 void buffer_reset(Buffer *buffer);
 void buffer_free(Buffer *buffer);
 void buffer_append(Buffer *buffer, const void *data, size_t len);
-- 
1.7.2.5


