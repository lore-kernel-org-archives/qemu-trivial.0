Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1chmkf-0001bg-NJ
	for mharc-qemu-trivial@gnu.org; Sat, 25 Feb 2017 19:31:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1chmkb-0001Na-5Y
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 19:31:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1chmkZ-0005yS-P9
	for qemu-trivial@nongnu.org; Sat, 25 Feb 2017 19:31:45 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:32618)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1chmkV-0005tA-0D; Sat, 25 Feb 2017 19:31:39 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id E93FD74596F;
	Sun, 26 Feb 2017 01:31:29 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 6B4B074577A; Sun, 26 Feb 2017 01:31:29 +0100 (CET)
Message-Id: <cover.1488068248.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Sun, 26 Feb 2017 01:17:28 +0100
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: [Qemu-trivial] [PATCH v2 00/14] Improvements for SM501 display
 controller emulation
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
X-List-Received-Date: Sun, 26 Feb 2017 00:31:46 -0000

Second try, addressing review comments.

BALATON Zoltan (14):
  sm501: Fixed code style and a few typos in comments
  sm501: Use defines instead of constants where available
  sm501: QOMify
  sm501: Get rid of base address in draw_hwc_line
  sm501: Add emulation of chip connected via PCI
  sm501: Add missing arbitration control register
  sm501: Fix device endianness
  sm501: Fix hardware cursor
  sm501: Misc clean ups
  sm501: Add support for panel layer
  sm501: Add some more missing registers
  sm501: Implement reading 2D engine registers
  sm501: Add reset function and vmstate descriptor
  ppc: Add SM501 device in config for ppc and ppcemb targets

 default-configs/ppc-softmmu.mak    |    1 +
 default-configs/ppcemb-softmmu.mak |    1 +
 hw/display/sm501.c                 | 1718 ++++++++++++++++++++++--------------
 hw/display/sm501_template.h        |   94 +-
 hw/sh4/r2d.c                       |   11 +-
 include/hw/devices.h               |    5 -
 6 files changed, 1089 insertions(+), 741 deletions(-)

-- 
2.7.4


