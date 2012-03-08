Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5Rs9-0005GH-Lv
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2012 20:10:25 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58345)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1S5Rrm-0003pZ-Rh
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 20:10:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1S5Rrk-0006wd-UD
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 20:10:02 -0500
Received: from ozlabs.org ([203.10.76.45]:59526)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1S5Rrh-0006w0-HZ; Wed, 07 Mar 2012 20:09:57 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
	id 84615B6F98; Thu,  8 Mar 2012 12:09:54 +1100 (EST)
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-trivial@nongnu.org
Date: Thu,  8 Mar 2012 12:09:40 +1100
Message-Id: <1331168981-13139-1-git-send-email-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 1.7.9.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 203.10.76.45
Cc: qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [PATCH 1/2] .gitignore update
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
X-List-Received-Date: Thu, 08 Mar 2012 01:10:24 -0000

This adds a few previously missing generated files to .gitignore: the
qemu-bridge-helper binary, and the linuxboot and multiboot images from
pc-bios/optionrom.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 .gitignore                   |    1 +
 pc-bios/optionrom/.gitignore |    5 +++++
 2 files changed, 6 insertions(+), 0 deletions(-)
 create mode 100644 pc-bios/optionrom/.gitignore

diff --git a/.gitignore b/.gitignore
index 81b1510..b290954 100644
--- a/.gitignore
+++ b/.gitignore
@@ -39,6 +39,7 @@ qemu-img-cmds.texi
 qemu-img-cmds.h
 qemu-io
 qemu-ga
+qemu-bridge-helper
 qemu-monitor.texi
 QMP/qmp-commands.txt
 test-coroutine
diff --git a/pc-bios/optionrom/.gitignore b/pc-bios/optionrom/.gitignore
new file mode 100644
index 0000000..57b036c
--- /dev/null
+++ b/pc-bios/optionrom/.gitignore
@@ -0,0 +1,5 @@
+linuxboot.img
+linuxboot.raw
+multiboot.img
+kvmvapic.img
+kvmvapic.raw
-- 
1.7.9.1


