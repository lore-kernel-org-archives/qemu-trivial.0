Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RoCI4-0000LH-Pi
	for mharc-qemu-trivial@gnu.org; Fri, 20 Jan 2012 06:05:52 -0500
Received: from eggs.gnu.org ([140.186.70.92]:41815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RoCHz-00007x-QR
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2012 06:05:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1RoCHv-0006gk-Ge
	for qemu-trivial@nongnu.org; Fri, 20 Jan 2012 06:05:47 -0500
Received: from mail-ww0-f53.google.com ([74.125.82.53]:37172)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1RoCHm-0006fs-3s; Fri, 20 Jan 2012 06:05:34 -0500
Received: by wgbdr1 with SMTP id dr1so411930wgb.10
	for <multiple recipients>; Fri, 20 Jan 2012 03:05:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=IhXUhnBhgK8uJgSWc1uFCxMZIuRMxIIfDHTFOe4+Yok=;
	b=OnI6CDDQ+Mx4LPObh49MmVX7mnWa5TsNWV4DmnyG+GOOcxMZL6TMfuVqQlKFxYxfx4
	W4Ishhpxbj4qLov2gSJdVO1fCyp67k3Jry1RSh+KI2B0LGYav3jDP32VH3LkZv2n+kHH
	74wbVroviKOP6n1hbx95Eb1LyGB0Il9Z0mHLY=
Received: by 10.180.19.130 with SMTP id f2mr2912304wie.12.1327057532682;
	Fri, 20 Jan 2012 03:05:32 -0800 (PST)
Received: from localhost.localdomain (93-34-200-238.ip51.fastwebnet.it.
	[93.34.200.238])
	by mx.google.com with ESMTPS id fv6sm7848260wib.8.2012.01.20.03.05.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 20 Jan 2012 03:05:31 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 20 Jan 2012 12:05:21 +0100
Message-Id: <1327057522-6590-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.7.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 74.125.82.53
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] rename get_clock_realtime
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
X-List-Received-Date: Fri, 20 Jan 2012 11:05:49 -0000

get_clock_realtime accesses the host_clock, not the rt_clock.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qemu-timer.c |    2 +-
 qemu-timer.h |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/qemu-timer.c b/qemu-timer.c
index cd026c6..4a14a6d 100644
--- a/qemu-timer.c
+++ b/qemu-timer.c
@@ -436,7 +436,7 @@ int64_t qemu_get_clock_ns(QEMUClock *clock)
             return cpu_get_clock();
         }
     case QEMU_CLOCK_HOST:
-        now = get_clock_realtime();
+        now = get_clock_host();
         last = clock->last;
         clock->last = now;
         if (now < last) {
diff --git a/qemu-timer.h b/qemu-timer.h
index de17f3b..b180fca 100644
--- a/qemu-timer.h
+++ b/qemu-timer.h
@@ -93,7 +93,7 @@ static inline int64_t get_ticks_per_sec(void)
 }
 
 /* real time host monotonic timer */
-static inline int64_t get_clock_realtime(void)
+static inline int64_t get_clock_host(void)
 {
     struct timeval tv;
 
@@ -131,7 +131,7 @@ static inline int64_t get_clock(void)
     {
         /* XXX: using gettimeofday leads to problems if the date
            changes, so it should be avoided. */
-        return get_clock_realtime();
+        return get_clock_host();
     }
 }
 #endif
-- 
1.7.7.1


