Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TsKry-0005l2-O9
	for mharc-qemu-trivial@gnu.org; Mon, 07 Jan 2013 17:08:34 -0500
Received: from eggs.gnu.org ([208.118.235.92]:45216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TsKrs-0005Su-JC
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2013 17:08:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1TsKrq-0005US-7P
	for qemu-trivial@nongnu.org; Mon, 07 Jan 2013 17:08:28 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:33453)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1TsKrk-0005Tb-CM; Mon, 07 Jan 2013 17:08:20 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	3DEE7728004E; Mon,  7 Jan 2013 23:08:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id mIBx4-dQLrnQ; Mon,  7 Jan 2013 23:08:18 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 7815B728004F; Mon,  7 Jan 2013 23:08:18 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-trivial@nongnu.org
Date: Mon,  7 Jan 2013 23:08:13 +0100
Message-Id: <1357596493-27396-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 78.47.199.172
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	Anthony Liguori <aliguori@us.ibm.com>,
	Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [Qemu-trivial] [PATCH] Replace remaining gmtime,
	localtime by gmtime_r, localtime_r
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
X-List-Received-Date: Mon, 07 Jan 2013 22:08:32 -0000

This allows removing of MinGW specific code and improves
reentrancy for POSIX hosts.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 block.c       |   10 ----------
 block/vvfat.c |    4 ----
 hw/omap1.c    |    2 +-
 vl.c          |    8 +++-----
 4 files changed, 4 insertions(+), 20 deletions(-)

diff --git a/block.c b/block.c
index 4e28c55..60873ea 100644
--- a/block.c
+++ b/block.c
@@ -3338,11 +3338,7 @@ char *get_human_readable_size(char *buf, int buf_size, int64_t size)
 char *bdrv_snapshot_dump(char *buf, int buf_size, QEMUSnapshotInfo *sn)
 {
     char buf1[128], date_buf[128], clock_buf[128];
-#ifdef _WIN32
-    struct tm *ptm;
-#else
     struct tm tm;
-#endif
     time_t ti;
     int64_t secs;
 
@@ -3352,15 +3348,9 @@ char *bdrv_snapshot_dump(char *buf, int buf_size, QEMUSnapshotInfo *sn)
                  "ID", "TAG", "VM SIZE", "DATE", "VM CLOCK");
     } else {
         ti = sn->date_sec;
-#ifdef _WIN32
-        ptm = localtime(&ti);
-        strftime(date_buf, sizeof(date_buf),
-                 "%Y-%m-%d %H:%M:%S", ptm);
-#else
         localtime_r(&ti, &tm);
         strftime(date_buf, sizeof(date_buf),
                  "%Y-%m-%d %H:%M:%S", &tm);
-#endif
         secs = sn->vm_clock_nsec / 1000000000;
         snprintf(clock_buf, sizeof(clock_buf),
                  "%02d:%02d:%02d.%03d",
diff --git a/block/vvfat.c b/block/vvfat.c
index 83706ce..06e6654 100644
--- a/block/vvfat.c
+++ b/block/vvfat.c
@@ -529,13 +529,9 @@ static inline uint8_t fat_chksum(const direntry_t* entry)
 /* if return_time==0, this returns the fat_date, else the fat_time */
 static uint16_t fat_datetime(time_t time,int return_time) {
     struct tm* t;
-#ifdef _WIN32
-    t=localtime(&time); /* this is not thread safe */
-#else
     struct tm t1;
     t = &t1;
     localtime_r(&time,t);
-#endif
     if(return_time)
 	return cpu_to_le16((t->tm_sec/2)|(t->tm_min<<5)|(t->tm_hour<<11));
     return cpu_to_le16((t->tm_mday)|((t->tm_mon+1)<<5)|((t->tm_year-80)<<9));
diff --git a/hw/omap1.c b/hw/omap1.c
index 8536e96..e85f2e2 100644
--- a/hw/omap1.c
+++ b/hw/omap1.c
@@ -2830,7 +2830,7 @@ static void omap_rtc_tick(void *opaque)
         s->round = 0;
     }
 
-    memcpy(&s->current_tm, localtime(&s->ti), sizeof(s->current_tm));
+    localtime_r(&s->ti, &s->current_tm);
 
     if ((s->interrupts & 0x08) && s->ti == s->alarm_ti) {
         s->status |= 0x40;
diff --git a/vl.c b/vl.c
index f056c95..21e4a74 100644
--- a/vl.c
+++ b/vl.c
@@ -454,15 +454,13 @@ void qemu_get_timedate(struct tm *tm, int offset)
     ti += offset;
     if (rtc_date_offset == -1) {
         if (rtc_utc)
-            ret = gmtime(&ti);
+            ret = gmtime_r(&ti, tm);
         else
-            ret = localtime(&ti);
+            ret = localtime_r(&ti, tm);
     } else {
         ti -= rtc_date_offset;
-        ret = gmtime(&ti);
+        ret = gmtime_r(&ti, tm);
     }
-
-    memcpy(tm, ret, sizeof(struct tm));
 }
 
 int qemu_timedate_diff(struct tm *tm)
-- 
1.7.10.4


