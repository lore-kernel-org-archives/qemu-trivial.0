Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c8BDP-0000py-Co
	for mharc-qemu-trivial@gnu.org; Sat, 19 Nov 2016 14:22:19 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47636)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1c8BDN-0000os-9C
	for qemu-trivial@nongnu.org; Sat, 19 Nov 2016 14:22:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1c8BDM-0004QS-7Q
	for qemu-trivial@nongnu.org; Sat, 19 Nov 2016 14:22:17 -0500
Received: from mail.weilnetz.de ([37.221.199.173]:56976)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1c8BDH-0004Pf-Nu; Sat, 19 Nov 2016 14:22:11 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by mail.weilnetz.de (Postfix) with ESMTP id 9E55911810A9;
	Sat, 19 Nov 2016 20:22:10 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from mail.weilnetz.de ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id 2i3u9YlCAzoj; Sat, 19 Nov 2016 20:22:08 +0100 (CET)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by mail.weilnetz.de (Postfix) with ESMTP id 62BA811810A8;
	Sat, 19 Nov 2016 20:22:08 +0100 (CET)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 33D334677CA; Sat, 19 Nov 2016 20:22:08 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: QEMU Developer <qemu-devel@nongnu.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Stefan Weil <sw@weilnetz.de>
Date: Sat, 19 Nov 2016 20:22:07 +0100
Message-Id: <20161119192207.18717-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.10.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 37.221.199.173
Subject: [Qemu-trivial] [PATCH for-2.8] Fix documentation and some comments
 (article, grammar)
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
X-List-Received-Date: Sat, 19 Nov 2016 19:22:18 -0000

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 arch_init.c     | 2 +-
 qemu-doc.texi   | 2 +-
 qemu-options.hx | 2 +-
 util/uri.c      | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch_init.c b/arch_init.c
index 5cc58b2..b35deb8 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -86,7 +86,7 @@ const uint32_t arch_type = QEMU_ARCH;
 
 static struct defconfig_file {
     const char *filename;
-    /* Indicates it is an user config file (disabled by -no-user-config) */
+    /* Indicates it is a user config file (disabled by -no-user-config) */
     bool userconfig;
 } default_config_files[] = {
     { CONFIG_QEMU_CONFDIR "/qemu.conf",                   true },
diff --git a/qemu-doc.texi b/qemu-doc.texi
index 023c140..691acf9 100644
--- a/qemu-doc.texi
+++ b/qemu-doc.texi
@@ -1037,7 +1037,7 @@ qemu-system-i386 -iscsi initiator-name=iqn.qemu.test:my-initiator \
 @node disk_images_gluster
 @subsection GlusterFS disk images
 
-GlusterFS is an user space distributed file system.
+GlusterFS is a user space distributed file system.
 
 You can boot from the GlusterFS disk image with the command:
 @example
diff --git a/qemu-options.hx b/qemu-options.hx
index 4a5b29f..3bad94e 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -2589,7 +2589,7 @@ qemu-system-i386 --drive file=sheepdog://192.0.2.1:30000/MyVirtualMachine
 See also @url{http://http://www.osrg.net/sheepdog/}.
 
 @item GlusterFS
-GlusterFS is an user space distributed file system.
+GlusterFS is a user space distributed file system.
 QEMU supports the use of GlusterFS volumes for hosting VM disk images using
 TCP, Unix Domain Sockets and RDMA transport protocols.
 
diff --git a/util/uri.c b/util/uri.c
index 70a9cbc..21b1828 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -342,7 +342,7 @@ rfc3986_parse_port(URI *uri, const char **str)
  * @uri:  pointer to an URI structure
  * @str:  the string to analyze
  *
- * Parse an user informations part and fills in the appropriate fields
+ * Parse a user information part and fill in the appropriate fields
  * of the @uri structure
  *
  * userinfo      = *( unreserved / pct-encoded / sub-delims / ":" )
@@ -508,7 +508,7 @@ rfc3986_parse_authority(URI *uri, const char **str)
 
     cur = *str;
     /*
-     * try to parse an userinfo and check for the trailing @
+     * try to parse a userinfo and check for the trailing @
      */
     ret = rfc3986_parse_user_info(uri, &cur);
     if ((ret != 0) || (*cur != '@'))
-- 
2.10.2


