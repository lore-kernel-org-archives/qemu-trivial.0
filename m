Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hDjXJ-0006ye-GG
	for mharc-qemu-trivial@gnu.org; Tue, 09 Apr 2019 01:43:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36581)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1hDjXH-0006xU-9A
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 01:43:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1hDjXG-0002Jp-FJ
	for qemu-trivial@nongnu.org; Tue, 09 Apr 2019 01:43:07 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:42706
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1hDjXE-0002Id-Fg; Tue, 09 Apr 2019 01:43:04 -0400
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 524A6DB6058;
	Tue,  9 Apr 2019 07:33:47 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id zRAv7lYHggYD; Tue,  9 Apr 2019 07:33:46 +0200 (CEST)
Received: from qemu.weilnetz.de (qemu.weilnetz.de [188.68.58.204])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 05A26DB6050;
	Tue,  9 Apr 2019 07:33:45 +0200 (CEST)
Received: by qemu.weilnetz.de (Postfix, from userid 1000)
	id 45A6646000F; Tue,  9 Apr 2019 07:33:45 +0200 (CEST)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
	Stefan Weil <sw@weilnetz.de>
Date: Tue,  9 Apr 2019 07:33:20 +0200
Message-Id: <20190409053320.14612-1-sw@weilnetz.de>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 37.120.169.71
Subject: [Qemu-trivial] [PATCH] Update configure
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
X-List-Received-Date: Tue, 09 Apr 2019 05:43:08 -0000

The last *.aml file was removed in commit 13b1881aacc7e5018773bd545bbaf8d5476699ee.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index 1c563a7027..9c5d9a8c96 100755
--- a/configure
+++ b/configure
@@ -7886,7 +7886,6 @@ LINKS="$LINKS python"
 for bios_file in \
     $source_path/pc-bios/*.bin \
     $source_path/pc-bios/*.lid \
-    $source_path/pc-bios/*.aml \
     $source_path/pc-bios/*.rom \
     $source_path/pc-bios/*.dtb \
     $source_path/pc-bios/*.img \
-- 
2.11.0


