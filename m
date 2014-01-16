Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3qy6-0000Pr-Dl
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jan 2014 12:43:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58932)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3qxx-00008v-V0
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:42:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1W3qxt-00016M-Dm
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 12:42:53 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:60857)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1W3qxk-0000yA-9m; Thu, 16 Jan 2014 12:42:40 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1D635415D6;
	Thu, 16 Jan 2014 21:42:38 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 8710D63F;
	Thu, 16 Jan 2014 21:35:26 +0400 (MSK)
Received: (nullmailer pid 16408 invoked by uid 1000);
	Thu, 16 Jan 2014 17:35:24 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@amazon.com
Date: Thu, 16 Jan 2014 21:35:18 +0400
Message-Id: <1389893719-16336-11-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1389893719-16336-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 10/11] pc-bios: Remove execute flag from BIOS
	files
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
X-List-Received-Date: Thu, 16 Jan 2014 17:42:58 -0000

From: Stefan Weil <sw@weilnetz.de>

BIOS files are not directly executable, so they don't need this flag.
All other BIOS files don't use the execute flag.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
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


