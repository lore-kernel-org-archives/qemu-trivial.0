Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UkFEG-000522-HD
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jun 2013 11:02:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UkFEA-00050Z-Hd
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 11:02:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UkFE5-0004qH-WB
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 11:02:18 -0400
Received: from [216.171.111.232] (port=49661 helo=freebsd.org)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <emaste@freebsd.org>) id 1UkFE5-0004q0-QC
	for qemu-trivial@nongnu.org; Wed, 05 Jun 2013 11:02:13 -0400
Received: from emaste (uid 1001) (envelope-from emaste@freebsd.org) id 9cf8b
	by freebsd.org (DragonFly Mail Agent 1);
	Wed, 05 Jun 2013 11:02:13 -0400
From: Ed Maste <emaste@freebsd.org>
To: qemu-devel@nongnu.org
Date: Wed,  5 Jun 2013 11:02:12 -0400
Message-Id: <1370444532-68682-1-git-send-email-emaste@freebsd.org>
X-Mailer: git-send-email 1.7.11.5
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x
X-Received-From: 216.171.111.232
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] configure: Use ${config_host_ld} variable
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
X-List-Received-Date: Wed, 05 Jun 2013 15:02:23 -0000


Signed-off-by: Ed Maste <emaste@freebsd.org>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index 1654413..ec833df 100755
--- a/configure
+++ b/configure
@@ -4445,7 +4445,7 @@ fi
 if test "$ARCH" = "tci"; then
   linker_script=""
 else
-  linker_script="-Wl,-T../config-host.ld -Wl,-T,\$(SRC_PATH)/ldscripts/\$(ARCH).ld"
+  linker_script="-Wl,-T../${config_host_ld} -Wl,-T,\$(SRC_PATH)/ldscripts/\$(ARCH).ld"
 fi
 
 if test "$target_linux_user" = "yes" -o "$target_bsd_user" = "yes" ; then
-- 
1.7.11.5


