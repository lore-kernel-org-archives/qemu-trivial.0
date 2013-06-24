Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur0Rr-00051Q-TJ
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 02:40:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41139)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Rg-0004Xq-7a
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Rc-0007Hf-FG
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:64648)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Ur0RU-0006y9-2M; Mon, 24 Jun 2013 02:40:00 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O6dxwQ029982
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 02:39:59 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r5O6dw1g002281; Mon, 24 Jun 2013 02:39:58 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id 41ED041A6F; Mon, 24 Jun 2013 08:39:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Jun 2013 08:39:54 +0200
Message-Id: <1372055996-4072-12-git-send-email-kraxel@redhat.com>
In-Reply-To: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
References: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 11/13] qemu-char: add -chardev mux support
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
X-List-Received-Date: Mon, 24 Jun 2013 06:40:17 -0000

Allow to explicitly create mux chardevs on the command line,
like you can using QMP.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qemu-char.c |   18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/qemu-char.c b/qemu-char.c
index e6c3157..7d072a8 100644
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


