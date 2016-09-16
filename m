Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bktfm-0005Nc-Sz
	for mharc-qemu-trivial@gnu.org; Fri, 16 Sep 2016 09:59:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60513)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktfj-0005Iz-RL
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:59:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lvivier@redhat.com>) id 1bktfZ-0000hB-Kk
	for qemu-trivial@nongnu.org; Fri, 16 Sep 2016 09:59:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lvivier@redhat.com>)
	id 1bktf7-0006q3-Ma; Fri, 16 Sep 2016 09:58:41 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6565A13592;
	Fri, 16 Sep 2016 13:56:36 +0000 (UTC)
Received: from thinkpad.redhat.com (ovpn-112-33.ams2.redhat.com [10.36.112.33])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8GDuHkA024127; Fri, 16 Sep 2016 09:56:35 -0400
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>
Date: Fri, 16 Sep 2016 15:55:59 +0200
Message-Id: <1474034177-17663-9-git-send-email-lvivier@redhat.com>
In-Reply-To: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Fri, 16 Sep 2016 13:56:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 08/26] replay: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
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
X-List-Received-Date: Fri, 16 Sep 2016 13:59:21 -0000

This patch is the result of coccinelle script
scripts/coccinelle/exit.cocci

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 replay/replay-char.c     |  6 +++---
 replay/replay-events.c   |  6 +++---
 replay/replay-internal.c |  2 +-
 replay/replay-time.c     |  2 +-
 replay/replay.c          | 14 +++++++-------
 5 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/replay/replay-char.c b/replay/replay-char.c
index edf46ab..0011079 100755
--- a/replay/replay-char.c
+++ b/replay/replay-char.c
@@ -56,7 +56,7 @@ void replay_chr_be_write(CharDriverState *s, uint8_t *buf, int len)
     event->id = find_char_driver(s);
     if (event->id < 0) {
         fprintf(stderr, "Replay: cannot find char driver\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     event->buf = g_malloc(len);
     memcpy(event->buf, buf, len);
@@ -116,7 +116,7 @@ void replay_char_write_event_load(int *res, int *offset)
     } else {
         replay_mutex_unlock();
         error_report("Missing character write event in the replay log");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
@@ -140,7 +140,7 @@ int replay_char_read_all_load(uint8_t *buf)
     } else {
         replay_mutex_unlock();
         error_report("Missing character read all event in the replay log");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 }
 
diff --git a/replay/replay-events.c b/replay/replay-events.c
index 3807245..14a2978 100644
--- a/replay/replay-events.c
+++ b/replay/replay-events.c
@@ -57,7 +57,7 @@ static void replay_run_event(Event *event)
     default:
         error_report("Replay: invalid async event ID (%d) in the queue",
                     event->event_kind);
-        exit(1);
+        exit(EXIT_FAILURE);
         break;
     }
 }
@@ -191,7 +191,7 @@ static void replay_save_event(Event *event, int checkpoint)
             break;
         default:
             error_report("Unknown ID %" PRId64 " of replay event", event->id);
-            exit(1);
+            exit(EXIT_FAILURE);
         }
     }
 }
@@ -254,7 +254,7 @@ static Event *replay_read_event(int checkpoint)
         break;
     default:
         error_report("Unknown ID %d of replay event", read_event_kind);
-        exit(1);
+        exit(EXIT_FAILURE);
         break;
     }
 
diff --git a/replay/replay-internal.c b/replay/replay-internal.c
index 5835e8d..532323d 100644
--- a/replay/replay-internal.c
+++ b/replay/replay-internal.c
@@ -159,7 +159,7 @@ void replay_fetch_data_kind(void)
             replay_has_unread_data = 1;
             if (replay_data_kind >= EVENT_COUNT) {
                 error_report("Replay: unknown event kind %d", replay_data_kind);
-                exit(1);
+                exit(EXIT_FAILURE);
             }
         }
     }
diff --git a/replay/replay-time.c b/replay/replay-time.c
index fffe072..1741a84 100644
--- a/replay/replay-time.c
+++ b/replay/replay-time.c
@@ -61,5 +61,5 @@ int64_t replay_read_clock(ReplayClockKind kind)
     }
 
     error_report("REPLAY INTERNAL ERROR %d", __LINE__);
-    exit(1);
+    exit(EXIT_FAILURE);
 }
diff --git a/replay/replay.c b/replay/replay.c
index 167fd29..d257b24 100644
--- a/replay/replay.c
+++ b/replay/replay.c
@@ -221,7 +221,7 @@ static void replay_enable(const char *fname, int mode)
         break;
     default:
         fprintf(stderr, "Replay: internal error: invalid replay mode\n");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     atexit(replay_finish);
@@ -231,7 +231,7 @@ static void replay_enable(const char *fname, int mode)
     replay_file = fopen(fname, fmode);
     if (replay_file == NULL) {
         fprintf(stderr, "Replay: open %s: %s\n", fname, strerror(errno));
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     replay_filename = g_strdup(fname);
@@ -248,7 +248,7 @@ static void replay_enable(const char *fname, int mode)
         unsigned int version = replay_get_dword();
         if (version != REPLAY_VERSION) {
             fprintf(stderr, "Replay: invalid input log file version\n");
-            exit(1);
+            exit(EXIT_FAILURE);
         }
         /* go to the beginning */
         fseek(replay_file, HEADER_SIZE, SEEK_SET);
@@ -282,13 +282,13 @@ void replay_configure(QemuOpts *opts)
         mode = REPLAY_MODE_PLAY;
     } else {
         error_report("Invalid icount rr option: %s", rr);
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     fname = qemu_opt_get(opts, "rrfile");
     if (!fname) {
         error_report("File name not specified for replay");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     replay_enable(fname, mode);
@@ -305,11 +305,11 @@ void replay_start(void)
 
     if (replay_blockers) {
         error_reportf_err(replay_blockers->data, "Record/replay: ");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
     if (!use_icount) {
         error_report("Please enable icount to use record/replay");
-        exit(1);
+        exit(EXIT_FAILURE);
     }
 
     /* Timer for snapshotting will be set up here. */
-- 
2.5.5


