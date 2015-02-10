Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YL4Ws-0000sw-5R
	for mharc-qemu-trivial@gnu.org; Tue, 10 Feb 2015 01:42:38 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4Wp-0000no-St
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:42:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YL4Wm-0004Vp-DU
	for qemu-trivial@nongnu.org; Tue, 10 Feb 2015 01:42:35 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41901)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YL4WT-0004Qm-Os; Tue, 10 Feb 2015 01:42:13 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id D2D064181F;
	Tue, 10 Feb 2015 09:34:43 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id B9B60931;
	Tue, 10 Feb 2015 09:34:43 +0300 (MSK)
Received: (nullmailer pid 9346 invoked by uid 1000);
	Tue, 10 Feb 2015 06:34:43 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 10 Feb 2015 09:33:56 +0300
Message-Id: <46ede58bb461c1171251988e7fb1db6590350975.1423549659.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
References: <cover.1423549659.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Markus Armbruster <armbru@redhat.com>
Subject: [Qemu-trivial] [PULL 07/46] vl: Fix bogus error message for implied
	mon ID clashing
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
X-List-Received-Date: Tue, 10 Feb 2015 06:42:37 -0000

From: Markus Armbruster <armbru@redhat.com>

monitor_parse() desugars --monitor, --qmp and -qmp-pretty to --mon.
The ID it picks can clash with a user-specified ID.  When it happens,
the error message is misleading.

Reproducer:

    $ qemu --mon id=compat_monitor0 --monitor stdio

Message before the patch:

    duplicate chardev: compat_monitor0

There's no "duplicate chardev" here.  The problem is a duplicate
monitor ID.  Moreover, the message provides no clue which option
caused the problem.  The patch changes the message to:

    qemu: --monitor stdio: Duplicate ID 'compat_monitor0' for mon

monitor_parse() is also used for creating a default monitor, but
that's not done when the user specifies a monitor, so an ID clash is
impossible then.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 vl.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/vl.c b/vl.c
index 983259b..2573afd 100644
--- a/vl.c
+++ b/vl.c
@@ -2195,6 +2195,7 @@ static int mon_init_func(QemuOpts *opts, void *opaque)
 static void monitor_parse(const char *optarg, const char *mode, bool pretty)
 {
     static int monitor_device_index = 0;
+    Error *local_err = NULL;
     QemuOpts *opts;
     const char *p;
     char label[32];
@@ -2215,9 +2216,10 @@ static void monitor_parse(const char *optarg, const char *mode, bool pretty)
         }
     }
 
-    opts = qemu_opts_create(qemu_find_opts("mon"), label, 1, NULL);
+    opts = qemu_opts_create(qemu_find_opts("mon"), label, 1, &local_err);
     if (!opts) {
-        fprintf(stderr, "duplicate chardev: %s\n", label);
+        error_report("%s", error_get_pretty(local_err));
+        error_free(local_err);
         exit(1);
     }
     qemu_opt_set(opts, "mode", mode);
-- 
2.1.4


