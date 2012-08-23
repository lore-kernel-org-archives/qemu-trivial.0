Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4Kyu-0003GX-GY
	for mharc-qemu-trivial@gnu.org; Wed, 22 Aug 2012 20:09:04 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34446)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1T4Kyk-0002nq-NW
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 20:09:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1T4Kyj-0007Xh-9g
	for qemu-trivial@nongnu.org; Wed, 22 Aug 2012 20:08:54 -0400
Received: from mono.eik.bme.hu ([152.66.115.2]:64375)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>)
	id 1T4Kyb-0007WI-5m; Wed, 22 Aug 2012 20:08:45 -0400
Received: from localhost (localhost [127.0.0.1])
	by mono.eik.bme.hu (Postfix) with ESMTP id A027D27E;
	Thu, 23 Aug 2012 02:08:36 +0200 (CEST)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from mono.eik.bme.hu ([127.0.0.1])
	by localhost (mono.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id Rqd7A8NCDOvB; Thu, 23 Aug 2012 02:08:36 +0200 (CEST)
Received: by mono.eik.bme.hu (Postfix, from userid 432)
	id 5DB71A0C; Thu, 23 Aug 2012 02:08:36 +0200 (CEST)
Date: Thu, 23 Aug 2012 02:08:36 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
X-X-Sender: balaton@mono
To: qemu-devel@nongnu.org
Message-ID: <Pine.GSO.4.64.1208230207120.26411@mono>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
X-detected-operating-system: by eggs.gnu.org: Solaris 10 (beta)
X-Received-From: 152.66.115.2
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH v3] console: Cleanup computation of bytes per
 pixel and add missing cases
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
X-List-Received-Date: Thu, 23 Aug 2012 00:09:02 -0000

Division with round up is the correct way to compute this even if the
only case where division with round down gives incorrect result is
probably 15 bpp. This case was explicitely patched up in one of these
functions but was unhandled in the other. This patch also adds the
missing cases and aborts for invalid unhandled cases. (I'm not sure
about setting 16 bpp for the 15 bpp case so I left it there for now.)

Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
---
  console.c |  230 +++++++++++++++++++++++++++++++++++--------------------------
  1 file changed, 131 insertions(+), 99 deletions(-)

  v2: Use DIV_ROUND_UP and extended commit message
  v3: Add missing cases to qemu_different_endianness_pixelformat (I
      have no way to test if this is correct though),
      abort() for the default: case
      also reindented as suggested by scripts/checkpatch.pl

diff --git a/console.c b/console.c
index 4525cc7..21843cd 100644
--- a/console.c
+++ b/console.c
@@ -1612,44 +1612,75 @@ PixelFormat qemu_different_endianness_pixelformat(int bpp)
      memset(&pf, 0x00, sizeof(PixelFormat));

      pf.bits_per_pixel = bpp;
-    pf.bytes_per_pixel = bpp / 8;
+    pf.bytes_per_pixel = DIV_ROUND_UP(bpp, 8);
      pf.depth = bpp == 32 ? 24 : bpp;

      switch (bpp) {
-        case 24:
-            pf.rmask = 0x000000FF;
-            pf.gmask = 0x0000FF00;
-            pf.bmask = 0x00FF0000;
-            pf.rmax = 255;
-            pf.gmax = 255;
-            pf.bmax = 255;
-            pf.rshift = 0;
-            pf.gshift = 8;
-            pf.bshift = 16;
-            pf.rbits = 8;
-            pf.gbits = 8;
-            pf.bbits = 8;
-            break;
-        case 32:
-            pf.rmask = 0x0000FF00;
-            pf.gmask = 0x00FF0000;
-            pf.bmask = 0xFF000000;
-            pf.amask = 0x00000000;
-            pf.amax = 255;
-            pf.rmax = 255;
-            pf.gmax = 255;
-            pf.bmax = 255;
-            pf.ashift = 0;
-            pf.rshift = 8;
-            pf.gshift = 16;
-            pf.bshift = 24;
-            pf.rbits = 8;
-            pf.gbits = 8;
-            pf.bbits = 8;
-            pf.abits = 8;
-            break;
-        default:
-            break;
+    case 0:
+        break;
+    case 15:
+        pf.bits_per_pixel = 16; /* Is this correct? */
+        pf.rmask = 0x0000001F;
+        pf.gmask = 0x000003E0;
+        pf.bmask = 0x00007C00;
+        pf.rmax = 31;
+        pf.gmax = 31;
+        pf.bmax = 31;
+        pf.rshift = 0;
+        pf.gshift = 5;
+        pf.bshift = 10;
+        pf.rbits = 5;
+        pf.gbits = 5;
+        pf.bbits = 5;
+        break;
+    case 16:
+        pf.rmask = 0x0000001F;
+        pf.gmask = 0x000007E0;
+        pf.bmask = 0x0000F800;
+        pf.rmax = 31;
+        pf.gmax = 63;
+        pf.bmax = 31;
+        pf.rshift = 0;
+        pf.gshift = 5;
+        pf.bshift = 11;
+        pf.rbits = 5;
+        pf.gbits = 6;
+        pf.bbits = 5;
+        break;
+    case 24:
+        pf.rmask = 0x000000FF;
+        pf.gmask = 0x0000FF00;
+        pf.bmask = 0x00FF0000;
+        pf.rmax = 255;
+        pf.gmax = 255;
+        pf.bmax = 255;
+        pf.rshift = 0;
+        pf.gshift = 8;
+        pf.bshift = 16;
+        pf.rbits = 8;
+        pf.gbits = 8;
+        pf.bbits = 8;
+        break;
+    case 32:
+        pf.rmask = 0x0000FF00;
+        pf.gmask = 0x00FF0000;
+        pf.bmask = 0xFF000000;
+        pf.amask = 0x00000000;
+        pf.amax = 255;
+        pf.rmax = 255;
+        pf.gmax = 255;
+        pf.bmax = 255;
+        pf.ashift = 0;
+        pf.rshift = 8;
+        pf.gshift = 16;
+        pf.bshift = 24;
+        pf.rbits = 8;
+        pf.gbits = 8;
+        pf.bbits = 8;
+        pf.abits = 8;
+        break;
+    default:
+        abort();
      }
      return pf;
  }
@@ -1661,73 +1692,74 @@ PixelFormat qemu_default_pixelformat(int bpp)
      memset(&pf, 0x00, sizeof(PixelFormat));

      pf.bits_per_pixel = bpp;
-    pf.bytes_per_pixel = bpp / 8;
+    pf.bytes_per_pixel = DIV_ROUND_UP(bpp, 8);
      pf.depth = bpp == 32 ? 24 : bpp;

      switch (bpp) {
-        case 15:
-            pf.bits_per_pixel = 16;
-            pf.bytes_per_pixel = 2;
-            pf.rmask = 0x00007c00;
-            pf.gmask = 0x000003E0;
-            pf.bmask = 0x0000001F;
-            pf.rmax = 31;
-            pf.gmax = 31;
-            pf.bmax = 31;
-            pf.rshift = 10;
-            pf.gshift = 5;
-            pf.bshift = 0;
-            pf.rbits = 5;
-            pf.gbits = 5;
-            pf.bbits = 5;
-            break;
-        case 16:
-            pf.rmask = 0x0000F800;
-            pf.gmask = 0x000007E0;
-            pf.bmask = 0x0000001F;
-            pf.rmax = 31;
-            pf.gmax = 63;
-            pf.bmax = 31;
-            pf.rshift = 11;
-            pf.gshift = 5;
-            pf.bshift = 0;
-            pf.rbits = 5;
-            pf.gbits = 6;
-            pf.bbits = 5;
-            break;
-        case 24:
-            pf.rmask = 0x00FF0000;
-            pf.gmask = 0x0000FF00;
-            pf.bmask = 0x000000FF;
-            pf.rmax = 255;
-            pf.gmax = 255;
-            pf.bmax = 255;
-            pf.rshift = 16;
-            pf.gshift = 8;
-            pf.bshift = 0;
-            pf.rbits = 8;
-            pf.gbits = 8;
-            pf.bbits = 8;
-            break;
-        case 32:
-            pf.rmask = 0x00FF0000;
-            pf.gmask = 0x0000FF00;
-            pf.bmask = 0x000000FF;
-            pf.amax = 255;
-            pf.rmax = 255;
-            pf.gmax = 255;
-            pf.bmax = 255;
-            pf.ashift = 24;
-            pf.rshift = 16;
-            pf.gshift = 8;
-            pf.bshift = 0;
-            pf.rbits = 8;
-            pf.gbits = 8;
-            pf.bbits = 8;
-            pf.abits = 8;
-            break;
-        default:
-            break;
+    case 0: /* Used by ui/curses */
+        break;
+    case 15:
+        pf.bits_per_pixel = 16; /* Is this correct? */
+        pf.rmask = 0x00007C00;
+        pf.gmask = 0x000003E0;
+        pf.bmask = 0x0000001F;
+        pf.rmax = 31;
+        pf.gmax = 31;
+        pf.bmax = 31;
+        pf.rshift = 10;
+        pf.gshift = 5;
+        pf.bshift = 0;
+        pf.rbits = 5;
+        pf.gbits = 5;
+        pf.bbits = 5;
+        break;
+    case 16:
+        pf.rmask = 0x0000F800;
+        pf.gmask = 0x000007E0;
+        pf.bmask = 0x0000001F;
+        pf.rmax = 31;
+        pf.gmax = 63;
+        pf.bmax = 31;
+        pf.rshift = 11;
+        pf.gshift = 5;
+        pf.bshift = 0;
+        pf.rbits = 5;
+        pf.gbits = 6;
+        pf.bbits = 5;
+        break;
+    case 24:
+        pf.rmask = 0x00FF0000;
+        pf.gmask = 0x0000FF00;
+        pf.bmask = 0x000000FF;
+        pf.rmax = 255;
+        pf.gmax = 255;
+        pf.bmax = 255;
+        pf.rshift = 16;
+        pf.gshift = 8;
+        pf.bshift = 0;
+        pf.rbits = 8;
+        pf.gbits = 8;
+        pf.bbits = 8;
+        break;
+    case 32:
+        pf.rmask = 0x00FF0000;
+        pf.gmask = 0x0000FF00;
+        pf.bmask = 0x000000FF;
+        pf.amax = 255;
+        pf.rmax = 255;
+        pf.gmax = 255;
+        pf.bmax = 255;
+        pf.ashift = 24;
+        pf.rshift = 16;
+        pf.gshift = 8;
+        pf.bshift = 0;
+        pf.rbits = 8;
+        pf.gbits = 8;
+        pf.bbits = 8;
+        pf.abits = 8;
+        break;
+    default:
+        abort();
      }
      return pf;
  }
-- 
1.7.10

