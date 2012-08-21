Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T3w3c-0003ig-42
	for mharc-qemu-trivial@gnu.org; Tue, 21 Aug 2012 17:32:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:56923)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1T3w3a-0003iZ-AX
	for qemu-trivial@nongnu.org; Tue, 21 Aug 2012 17:32:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1T3w3T-0004pL-Kv
	for qemu-trivial@nongnu.org; Tue, 21 Aug 2012 17:32:14 -0400
Received: from mono.eik.bme.hu ([152.66.115.2]:54019)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>)
	id 1T3w3R-0004oc-EJ; Tue, 21 Aug 2012 17:32:05 -0400
Received: from localhost (localhost [127.0.0.1])
	by mono.eik.bme.hu (Postfix) with ESMTP id BBD1DA61;
	Tue, 21 Aug 2012 23:32:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from mono.eik.bme.hu ([127.0.0.1])
	by localhost (mono.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id 5XtbIP9USxeG; Tue, 21 Aug 2012 23:32:04 +0200 (CEST)
Received: by mono.eik.bme.hu (Postfix, from userid 432)
	id 8C343A77; Tue, 21 Aug 2012 23:32:04 +0200 (CEST)
Date: Tue, 21 Aug 2012 23:32:04 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
X-X-Sender: balaton@mono
To: qemu-devel@nongnu.org
Message-ID: <Pine.GSO.4.64.1208212331340.11653@mono>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Solaris 10 (beta)
X-Received-From: 152.66.115.2
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] Correct computation of bytes per pixel from
	bits per pixel
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
X-List-Received-Date: Tue, 21 Aug 2012 21:32:15 -0000


Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
  console.c |    4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/console.c b/console.c
index 4525cc7..f698b77 100644
--- a/console.c
+++ b/console.c
@@ -1612,7 +1612,7 @@ PixelFormat qemu_different_endianness_pixelformat(int bpp)
      memset(&pf, 0x00, sizeof(PixelFormat));

      pf.bits_per_pixel = bpp;
-    pf.bytes_per_pixel = bpp / 8;
+    pf.bytes_per_pixel = (bpp + 7) >> 3;
      pf.depth = bpp == 32 ? 24 : bpp;

      switch (bpp) {
@@ -1661,7 +1661,7 @@ PixelFormat qemu_default_pixelformat(int bpp)
      memset(&pf, 0x00, sizeof(PixelFormat));

      pf.bits_per_pixel = bpp;
-    pf.bytes_per_pixel = bpp / 8;
+    pf.bytes_per_pixel = (bpp + 7) >> 3;
      pf.depth = bpp == 32 ? 24 : bpp;

      switch (bpp) {
-- 
1.7.10

