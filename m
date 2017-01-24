Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVykd-0004vI-UN
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 05:54:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58861)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVyka-0004ry-Qr
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 05:54:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVyka-0006Up-3b
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 05:54:56 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:56474)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVykU-0006SS-6z; Tue, 24 Jan 2017 05:54:50 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0F2974211C;
	Tue, 24 Jan 2017 13:54:50 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id C5EC5562;
	Tue, 24 Jan 2017 12:39:42 +0300 (MSK)
Received: (nullmailer pid 12616 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:08 +0300
Message-Id: <425d343b84d90455510ac7786703f93d0a786293.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 04/31] Fix documentation and some comments
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
X-List-Received-Date: Tue, 24 Jan 2017 10:54:58 -0000

From: Stefan Weil <sw@weilnetz.de>

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 arch_init.c     | 2 +-
 qemu-doc.texi   | 2 +-
 qemu-options.hx | 2 +-
 util/uri.c      | 4 ++--
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch_init.c b/arch_init.c
index 6c4e287..13d6c56 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -85,7 +85,7 @@ const uint32_t arch_type = QEMU_ARCH;
 
 static struct defconfig_file {
     const char *filename;
-    /* Indicates it is an user config file (disabled by -no-user-config) */
+    /* Indicates it is a user config file (disabled by -no-user-config) */
     bool userconfig;
 } default_config_files[] = {
     { CONFIG_QEMU_CONFDIR "/qemu.conf",                   true },
diff --git a/qemu-doc.texi b/qemu-doc.texi
index 0b2746f..3840585 100644
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
index 232f737..82b9991 100644
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
2.1.4


