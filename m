Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TNULy-0001gk-UO
	for mharc-qemu-trivial@gnu.org; Sun, 14 Oct 2012 16:00:02 -0400
Received: from eggs.gnu.org ([208.118.235.92]:44672)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNULw-0001ZK-7L
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:00:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TNULu-0002M5-EK
	for qemu-trivial@nongnu.org; Sun, 14 Oct 2012 16:00:00 -0400
Received: from mail-la0-f45.google.com ([209.85.215.45]:37016)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TNULr-0002LR-Di; Sun, 14 Oct 2012 15:59:55 -0400
Received: by mail-la0-f45.google.com with SMTP id m13so2786709lah.4
	for <multiple recipients>; Sun, 14 Oct 2012 12:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=C2TEKsTD+23tWnHxA4ETT5paVea4JJ5/3Ca3Uxkxf2U=;
	b=G+LcaSQf5vpUOIXle2veeTeu5HAGqp5+MCQfKBYKmsgiR1KayDINlJfzydlIsJzx90
	lZY7pjXDkqqoqlqXCSVxIcnLVQezxvEIoF+SeozShuPXuKyWttEzKegke+zZBnWSxRG8
	jShGxJHdetKVNwyjtMA+0DixDPBE1foNyNd4E66YRIcnBqdAkoPzUVPUUnxneXugRsI5
	YWXI+rdDhl/k0STyTjY38ZeR8Pu/fw3YEQz8oNJ6EPAdN8jCd52Yvyn99Mtf5wlG/e5X
	DgFu5s+ukJFeqoawRSUMVLlaoBMvpE9Wp6Y9/4iGpB7AR03jyPmyzEXSWoXJ/2rwfeZ6
	+yQw==
Received: by 10.152.148.195 with SMTP id tu3mr8089966lab.16.1350244794144;
	Sun, 14 Oct 2012 12:59:54 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id r8sm3941759lba.15.2012.10.14.12.59.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 14 Oct 2012 12:59:53 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 14 Oct 2012 19:58:51 +0000
Message-Id: <d57a1e01b220160e15a35c76fb15d9054d26b2ef.1350244587.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
In-Reply-To: <cover.1350244587.git.blauwirbel@gmail.com>
References: <cover.1350244587.git.blauwirbel@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.45
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com,
	Anthony Liguori <aliguori@us.ibm.com>
Subject: [Qemu-trivial] [PATCH 03/11] vnc: add missing static and remove
	unused functions
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
X-List-Received-Date: Sun, 14 Oct 2012 20:00:02 -0000

Add missing 'static' qualifiers. Remove unused functions
vnc_stop_worker_thread(), vnc_has_job() and vnc_jobs_clear().

Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
---
 console.h     |    2 --
 ui/vnc-jobs.c |   46 +++++-----------------------------------------
 ui/vnc-jobs.h |    4 ----
 ui/vnc.c      |   14 +++++++-------
 ui/vnc.h      |    5 -----
 5 files changed, 12 insertions(+), 59 deletions(-)

diff --git a/console.h b/console.h
index f990684..b848e20 100644
--- a/console.h
+++ b/console.h
@@ -377,10 +377,8 @@ void cocoa_display_init(DisplayState *ds, int full_screen);
 
 /* vnc.c */
 void vnc_display_init(DisplayState *ds);
-void vnc_display_close(DisplayState *ds);
 int vnc_display_open(DisplayState *ds, const char *display);
 void vnc_display_add_client(DisplayState *ds, int csock, int skipauth);
-int vnc_display_disable_login(DisplayState *ds);
 char *vnc_display_local_addr(DisplayState *ds);
 #ifdef CONFIG_VNC
 int vnc_display_password(DisplayState *ds, const char *password);
diff --git a/ui/vnc-jobs.c b/ui/vnc-jobs.c
index 087b84d..c779796 100644
--- a/ui/vnc-jobs.c
+++ b/ui/vnc-jobs.c
@@ -126,29 +126,6 @@ static bool vnc_has_job_locked(VncState *vs)
     return false;
 }
 
-bool vnc_has_job(VncState *vs)
-{
-    bool ret;
-
-    vnc_lock_queue(queue);
-    ret = vnc_has_job_locked(vs);
-    vnc_unlock_queue(queue);
-    return ret;
-}
-
-void vnc_jobs_clear(VncState *vs)
-{
-    VncJob *job, *tmp;
-
-    vnc_lock_queue(queue);
-    QTAILQ_FOREACH_SAFE(job, &queue->jobs, next, tmp) {
-        if (job->vs == vs || !vs) {
-            QTAILQ_REMOVE(&queue->jobs, job, next);
-        }
-    }
-    vnc_unlock_queue(queue);
-}
-
 void vnc_jobs_join(VncState *vs)
 {
     vnc_lock_queue(queue);
@@ -320,6 +297,11 @@ static void *vnc_worker_thread(void *arg)
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
@@ -331,21 +313,3 @@ void vnc_start_worker_thread(void)
     qemu_thread_create(&q->thread, vnc_worker_thread, q, QEMU_THREAD_DETACHED);
     queue = q; /* Set global queue */
 }
-
-bool vnc_worker_thread_running(void)
-{
-    return queue; /* Check global queue */
-}
-
-void vnc_stop_worker_thread(void)
-{
-    if (!vnc_worker_thread_running())
-        return ;
-
-    /* Remove all jobs and wake up the thread */
-    vnc_lock_queue(queue);
-    queue->exit = true;
-    vnc_unlock_queue(queue);
-    vnc_jobs_clear(NULL);
-    qemu_cond_broadcast(&queue->cond);
-}
diff --git a/ui/vnc-jobs.h b/ui/vnc-jobs.h
index 86e6d88..59f66bc 100644
--- a/ui/vnc-jobs.h
+++ b/ui/vnc-jobs.h
@@ -34,14 +34,10 @@
 VncJob *vnc_job_new(VncState *vs);
 int vnc_job_add_rect(VncJob *job, int x, int y, int w, int h);
 void vnc_job_push(VncJob *job);
-bool vnc_has_job(VncState *vs);
-void vnc_jobs_clear(VncState *vs);
 void vnc_jobs_join(VncState *vs);
 
 void vnc_jobs_consume_buffer(VncState *vs);
 void vnc_start_worker_thread(void);
-bool vnc_worker_thread_running(void);
-void vnc_stop_worker_thread(void);
 
 /* Locks */
 static inline int vnc_trylock_display(VncDisplay *vd)
diff --git a/ui/vnc.c b/ui/vnc.c
index 33e6386..bde896b 100644
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
@@ -2761,7 +2761,7 @@ void vnc_display_init(DisplayState *ds)
 }
 
 
-void vnc_display_close(DisplayState *ds)
+static void vnc_display_close(DisplayState *ds)
 {
     VncDisplay *vs = ds ? (VncDisplay *)ds->opaque : vnc_display;
 
@@ -2783,7 +2783,7 @@ void vnc_display_close(DisplayState *ds)
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


