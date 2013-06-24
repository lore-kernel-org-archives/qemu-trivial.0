Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ur0Rp-0004wA-Sm
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jun 2013 02:40:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Re-0004S7-5H
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1Ur0Rb-0007Gy-Nw
	for qemu-trivial@nongnu.org; Mon, 24 Jun 2013 02:40:10 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52972)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1Ur0RU-0006y6-09; Mon, 24 Jun 2013 02:40:00 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r5O6dxsP010297
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 24 Jun 2013 02:39:59 -0400
Received: from rincewind.home.kraxel.org (ovpn-116-31.ams2.redhat.com
	[10.36.116.31])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r5O6dws5025574; Mon, 24 Jun 2013 02:39:58 -0400
Received: by rincewind.home.kraxel.org (Postfix, from userid 500)
	id 278864186D; Mon, 24 Jun 2013 08:39:57 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Date: Mon, 24 Jun 2013 08:39:52 +0200
Message-Id: <1372055996-4072-10-git-send-email-kraxel@redhat.com>
In-Reply-To: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
References: <1372055996-4072-1-git-send-email-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Subject: [Qemu-trivial] [PATCH v2 09/13] qemu-char: use ChardevBackendKind
	in in CharDriver
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
X-List-Received-Date: Mon, 24 Jun 2013 06:40:14 -0000

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/sysemu/char.h |    2 +-
 qemu-char.c           |    4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/char.h b/include/sysemu/char.h
index 066c216..e65e4a4 100644
--- a/include/sysemu/char.h
+++ b/include/sysemu/char.h
@@ -281,7 +281,7 @@ CharDriverState *qemu_chr_find(const char *name);
 QemuOpts *qemu_chr_parse_compat(const char *label, const char *filename);
 
 void register_char_driver(const char *name, CharDriverState *(*open)(QemuOpts *));
-void register_char_driver_qapi(const char *name, int kind,
+void register_char_driver_qapi(const char *name, ChardevBackendKind kind,
         void (*parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp));
 
 /* add an eventfd to the qemu devices that are polled */
diff --git a/qemu-char.c b/qemu-char.c
index 5751391..5a2291d 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -3127,7 +3127,7 @@ typedef struct CharDriver {
     /* old, pre qapi */
     CharDriverState *(*open)(QemuOpts *opts);
     /* new, qapi-based */
-    int kind;
+    ChardevBackendKind kind;
     void (*parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp);
 } CharDriver;
 
@@ -3144,7 +3144,7 @@ void register_char_driver(const char *name, CharDriverState *(*open)(QemuOpts *)
     backends = g_slist_append(backends, s);
 }
 
-void register_char_driver_qapi(const char *name, int kind,
+void register_char_driver_qapi(const char *name, ChardevBackendKind kind,
         void (*parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp))
 {
     CharDriver *s;
-- 
1.7.9.7


