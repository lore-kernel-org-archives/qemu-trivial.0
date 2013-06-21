Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Upyk1-00069V-SQ
	for mharc-qemu-trivial@gnu.org; Fri, 21 Jun 2013 06:38:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42703)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Upyjo-0005k0-4S
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 06:38:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Upyjj-0007nQ-9j
	for qemu-trivial@nongnu.org; Fri, 21 Jun 2013 06:38:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56649)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Upyjd-0007jB-2w; Fri, 21 Jun 2013 06:38:29 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5LAcS3T002316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 21 Jun 2013 06:38:28 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-29.ams2.redhat.com
	[10.36.116.29])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5LAcR4W025413; Fri, 21 Jun 2013 06:38:28 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id 0E94643276; Fri, 21 Jun 2013 12:38:26 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 21 Jun 2013 12:38:23 +0200
Message-Id: <1371811105-730-12-git-send-email-kraxel@redhat.com>
In-Reply-To: <1371811105-730-1-git-send-email-kraxel@redhat.com>
References: <1371811105-730-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH 11/13] qemu-char: add -chardev mux support
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
X-List-Received-Date: Fri, 21 Jun 2013 10:38:45 -0000

Allow to explicitly create mux chardevs on the command line,
like you can using QMP.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qemu-char.c |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/qemu-char.c b/qemu-char.c
index 65c0c48..c83ff21 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -3122,6 +3122,19 @@ static void qemu_chr_parse_memory(QemuOpts *opts, ChardevBackend *backend,
     }
 }
 
+static void qemu_chr_parse_mux(QemuOpts *opts, ChardevBackend *backend,
+                               Error **errp)
+{
+    const char *chardev = qemu_opt_get(opts, "chardev");
+
+    if (chardev == NULL) {
+        error_setg(errp, "chardev: mux: no chardev given");
+        return;
+    }
+    backend->mux = g_new0(ChardevMux, 1);
+    backend->mux->chardev = g_strdup(chardev);
+}
+
 typedef struct CharDriver {
     const char *name;
     /* old, pre qapi */
@@ -3488,6 +3501,9 @@ QemuOptsList qemu_chardev_opts = {
         },{
             .name = "size",
             .type = QEMU_OPT_SIZE,
+        },{
+            .name = "chardev",
+            .type = QEMU_OPT_STRING,
         },
         { /* end of list */ }
     },
@@ -3778,6 +3794,8 @@ static void register_types(void)
     register_char_driver_qapi("console", CHARDEV_BACKEND_KIND_CONSOLE, NULL);
     register_char_driver_qapi("pipe", CHARDEV_BACKEND_KIND_PIPE,
                               qemu_chr_parse_pipe);
+    register_char_driver_qapi("mux", CHARDEV_BACKEND_KIND_MUX,
+                              qemu_chr_parse_mux);
 }
 
 type_init(register_types);
-- 
1.7.9.7


