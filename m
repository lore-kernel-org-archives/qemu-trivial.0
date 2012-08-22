Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4Cii-0004HW-3o
	for mharc-qemu-trivial@gnu.org; Wed, 22 Aug 2012 11:19:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38807)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1T4Cig-0004CC-2g
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 11:19:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1T4Cif-00012F-5s
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 11:19:45 -0400
Received: from mono.eik.bme.hu ([152.66.115.2]:61124)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>)
	id 1T4Cid-00011j-4c; Wed, 22 Aug 2012 11:19:43 -0400
Received: from localhost (localhost [127.0.0.1])
	by mono.eik.bme.hu (Postfix) with ESMTP id A9140283;
	Wed, 22 Aug 2012 17:19:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from mono.eik.bme.hu ([127.0.0.1])
	by localhost (mono.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id remuofD05TbE; Wed, 22 Aug 2012 17:19:42 +0200 (CEST)
Received: by mono.eik.bme.hu (Postfix, from userid 432)
	id 794EC91F; Wed, 22 Aug 2012 17:19:42 +0200 (CEST)
Date: Wed, 22 Aug 2012 17:19:42 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
X-X-Sender: balaton@mono
To: qemu-devel@nongnu.org
Message-ID: <Pine.GSO.4.64.1208221718470.28960@mono>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Solaris 10 (beta)
X-Received-From: 152.66.115.2
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH v2] console: Correct computation of bytes per
 pixel from bits per pixel
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
X-List-Received-Date: Wed, 22 Aug 2012 15:19:47 -0000

Division with round up is the correct way to compute this even if the
only case where division with round down gives incorrect result is
probably 15 bpp. This case was explicitely patched up in one of these
functions but was unhandled in the other. (I'm not sure about setting
16 bpp for the 15bpp case either but I left that there for now.)

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
  console.c |    5 ++---
  1 file changed, 2 insertions(+), 3 deletions(-)

  v2: Use DIV_ROUND_UP and extended commit message

diff --git a/console.c b/console.c
index 4525cc7..9df1701 100644
--- a/console.c
+++ b/console.c
@@ -1612,7 +1612,7 @@ PixelFormat qemu_different_endianness_pixelformat(int bpp)
      memset(&pf, 0x00, sizeof(PixelFormat));

      pf.bits_per_pixel = bpp;
-    pf.bytes_per_pixel = bpp / 8;
+    pf.bytes_per_pixel = DIV_ROUND_UP(bpp, 8);
      pf.depth = bpp == 32 ? 24 : bpp;

      switch (bpp) {
@@ -1661,13 +1661,12 @@ PixelFormat qemu_default_pixelformat(int bpp)
      memset(&pf, 0x00, sizeof(PixelFormat));

      pf.bits_per_pixel = bpp;
-    pf.bytes_per_pixel = bpp / 8;
+    pf.bytes_per_pixel = DIV_ROUND_UP(bpp, 8);
      pf.depth = bpp == 32 ? 24 : bpp;

      switch (bpp) {
          case 15:
              pf.bits_per_pixel = 16;
-            pf.bytes_per_pixel = 2;
              pf.rmask = 0x00007c00;
              pf.gmask = 0x000003E0;
              pf.bmask = 0x0000001F;
-- 
1.7.10

