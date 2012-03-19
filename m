Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S9UhN-0000hN-FJ
	for mharc-qemu-trivial@gnu.org; Mon, 19 Mar 2012 01:00:01 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34707)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1S9UhI-0000Rq-QU
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 00:59:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1S9UhH-0005dr-8g
	for qemu-trivial@nongnu.org; Mon, 19 Mar 2012 00:59:56 -0400
Received: from ozlabs.org ([203.10.76.45]:44938)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1S9Ugu-0005ap-CZ; Mon, 19 Mar 2012 00:59:32 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 19702B6FBD; Mon, 19 Mar 2012 15:59:29 +1100 (EST)
From: David Gibson <david@gibson.dropbear.id.au>
To: anthony@codemonkey.ws
Date: Mon, 19 Mar 2012 15:58:45 +1100
Message-Id: <1332133125-7832-1-git-send-email-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 1.7.9.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 203.10.76.45
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Subject: [Qemu-trivial] [PATCH] .gitignore update
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
X-List-Received-Date: Mon, 19 Mar 2012 04:59:59 -0000

This adds a few previously missing generated files to .gitignore: the
qemu-bridge-helper binary, and more generated versions of the
linuxboot, multiboot and kvmvapic roms from pc-bios/optionrom.

Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 .gitignore |    6 ++++++
 1 files changed, 6 insertions(+), 0 deletions(-)

diff --git a/.gitignore b/.gitignore
index 81b1510..9859c7d 100644
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
@@ -75,9 +76,14 @@ patches
 pc-bios/bios-pq/status
 pc-bios/vgabios-pq/status
 pc-bios/optionrom/linuxboot.bin
+pc-bios/optionrom/linuxboot.raw
+pc-bios/optionrom/linuxboot.img
 pc-bios/optionrom/multiboot.bin
 pc-bios/optionrom/multiboot.raw
+pc-bios/optionrom/multiboot.img
 pc-bios/optionrom/kvmvapic.bin
+pc-bios/optionrom/kvmvapic.raw
+pc-bios/optionrom/kvmvapic.img
 .stgit-*
 cscope.*
 tags
-- 
1.7.9.1


