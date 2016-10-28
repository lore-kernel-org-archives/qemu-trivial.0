Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c09CI-0002Ws-Fx
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:35:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60210)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09CC-0002Te-Tf
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:35:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09CB-0003lV-KY
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:35:52 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41084)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c09C4-0003hz-Qx; Fri, 28 Oct 2016 11:35:45 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2D4804373E;
	Fri, 28 Oct 2016 18:35:44 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 65F0FB65;
	Fri, 28 Oct 2016 18:18:58 +0300 (MSK)
Received: (nullmailer pid 6085 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:51 +0300
Message-Id: <bdbcb547cf96fc1794b31003cbae1c7a37c4d205.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 20/23] monitor: deprecate 'default' option
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
X-List-Received-Date: Fri, 28 Oct 2016 15:35:54 -0000

From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

This option does nothing since commit 06ac27f.  Deprecate it.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/monitor/monitor.h |  2 +-
 monitor.c                 |  2 +-
 qemu-options.hx           |  8 ++++----
 vl.c                      | 11 +++--------
 4 files changed, 9 insertions(+), 14 deletions(-)

diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
index a714d8e..8cc532e 100644
--- a/include/monitor/monitor.h
+++ b/include/monitor/monitor.h
@@ -9,7 +9,7 @@
 extern Monitor *cur_mon;
=20
 /* flags for monitor_init */
-#define MONITOR_IS_DEFAULT    0x01
+/* 0x01 unused */
 #define MONITOR_USE_READLINE  0x02
 #define MONITOR_USE_CONTROL   0x04
 #define MONITOR_USE_PRETTY    0x08
diff --git a/monitor.c b/monitor.c
index 21dcfb2..c4b6e26 100644
--- a/monitor.c
+++ b/monitor.c
@@ -4094,7 +4094,7 @@ QemuOptsList qemu_mon_opts =3D {
             .name =3D "chardev",
             .type =3D QEMU_OPT_STRING,
         },{
-            .name =3D "default",
+            .name =3D "default",  /* deprecated */
             .type =3D QEMU_OPT_BOOL,
         },{
             .name =3D "pretty",
diff --git a/qemu-options.hx b/qemu-options.hx
index f296406..95332cc 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2239,7 +2239,7 @@ two serial ports and the QEMU monitor:
=20
 @example
 -chardev stdio,mux=3Don,id=3Dchar0 \
--mon chardev=3Dchar0,mode=3Dreadline,default \
+-mon chardev=3Dchar0,mode=3Dreadline \
 -serial chardev:char0 \
 -serial chardev:char0
 @end example
@@ -2250,7 +2250,7 @@ multiplexed between the QEMU monitor and a parallel=
 port:
=20
 @example
 -chardev stdio,mux=3Don,id=3Dchar0 \
--mon chardev=3Dchar0,mode=3Dreadline,default \
+-mon chardev=3Dchar0,mode=3Dreadline \
 -parallel chardev:char0 \
 -chardev tcp,...,mux=3Don,id=3Dchar1 \
 -serial chardev:char1 \
@@ -3112,9 +3112,9 @@ Like -qmp but uses pretty JSON formatting.
 ETEXI
=20
 DEF("mon", HAS_ARG, QEMU_OPTION_mon, \
-    "-mon [chardev=3D]name[,mode=3Dreadline|control][,default]\n", QEMU_=
ARCH_ALL)
+    "-mon [chardev=3D]name[,mode=3Dreadline|control]\n", QEMU_ARCH_ALL)
 STEXI
-@item -mon [chardev=3D]name[,mode=3Dreadline|control][,default]
+@item -mon [chardev=3D]name[,mode=3Dreadline|control]
 @findex -mon
 Setup monitor on chardev @var{name}.
 ETEXI
diff --git a/vl.c b/vl.c
index 74dfe4e..496e655 100644
--- a/vl.c
+++ b/vl.c
@@ -2408,8 +2408,9 @@ static int mon_init_func(void *opaque, QemuOpts *op=
ts, Error **errp)
     if (qemu_opt_get_bool(opts, "pretty", 0))
         flags |=3D MONITOR_USE_PRETTY;
=20
-    if (qemu_opt_get_bool(opts, "default", 0))
-        flags |=3D MONITOR_IS_DEFAULT;
+    if (qemu_opt_get_bool(opts, "default", 0)) {
+        error_report("option 'default' does nothing and is deprecated");
+    }
=20
     chardev =3D qemu_opt_get(opts, "chardev");
     chr =3D qemu_chr_find(chardev);
@@ -2428,16 +2429,12 @@ static void monitor_parse(const char *optarg, con=
st char *mode, bool pretty)
     QemuOpts *opts;
     const char *p;
     char label[32];
-    int def =3D 0;
=20
     if (strstart(optarg, "chardev:", &p)) {
         snprintf(label, sizeof(label), "%s", p);
     } else {
         snprintf(label, sizeof(label), "compat_monitor%d",
                  monitor_device_index);
-        if (monitor_device_index =3D=3D 0) {
-            def =3D 1;
-        }
         opts =3D qemu_chr_parse_compat(label, optarg);
         if (!opts) {
             error_report("parse error: %s", optarg);
@@ -2449,8 +2446,6 @@ static void monitor_parse(const char *optarg, const=
 char *mode, bool pretty)
     qemu_opt_set(opts, "mode", mode, &error_abort);
     qemu_opt_set(opts, "chardev", label, &error_abort);
     qemu_opt_set_bool(opts, "pretty", pretty, &error_abort);
-    if (def)
-        qemu_opt_set(opts, "default", "on", &error_abort);
     monitor_device_index++;
 }
=20
--=20
2.1.4


