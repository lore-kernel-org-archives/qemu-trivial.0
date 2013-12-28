Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VwoMi-0005Q3-SG
	for mharc-qemu-trivial@gnu.org; Sat, 28 Dec 2013 02:31:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36860)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VwoMh-0005Nu-Dx
	for qemu-trivial@nongnu.org; Sat, 28 Dec 2013 02:31:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VwoMg-00024N-BU
	for qemu-trivial@nongnu.org; Sat, 28 Dec 2013 02:31:19 -0500
Received: from qemu.weilnetz.de ([2a03:4000:2:362::1]:53726
	helo=v2201305906712890.yourvserver.net)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@v2201305906712890.yourvserver.net>)
	id 1VwoMe-00023z-4x; Sat, 28 Dec 2013 02:31:16 -0500
Received: by v2201305906712890.yourvserver.net (Postfix, from userid 1000)
	id AA95517F616; Sat, 28 Dec 2013 08:31:11 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 28 Dec 2013 08:31:11 +0100
Message-Id: <1388215871-4977-1-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a03:4000:2:362::1
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH] pc-bios: Remove execute flag from BIOS files
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
X-List-Received-Date: Sat, 28 Dec 2013 07:31:20 -0000

BIOS files are not directly executable, so they don't need this flag.
All other BIOS files don't use the execute flag.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 pc-bios/kvmvapic.bin  |  Bin 9216 -> 9216 bytes
 pc-bios/multiboot.bin |  Bin 1024 -> 1024 bytes
 pc-bios/sgabios.bin   |  Bin 4096 -> 4096 bytes
 3 files changed, 0 insertions(+), 0 deletions(-)
 mode change 100755 => 100644 pc-bios/kvmvapic.bin
 mode change 100755 => 100644 pc-bios/multiboot.bin
 mode change 100755 => 100644 pc-bios/sgabios.bin

diff --git a/pc-bios/kvmvapic.bin b/pc-bios/kvmvapic.bin
old mode 100755
new mode 100644
diff --git a/pc-bios/multiboot.bin b/pc-bios/multiboot.bin
old mode 100755
new mode 100644
diff --git a/pc-bios/sgabios.bin b/pc-bios/sgabios.bin
old mode 100755
new mode 100644
-- 
1.7.10.4


