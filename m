Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cfUu2-00008T-9X
	for mharc-qemu-trivial@gnu.org; Sun, 19 Feb 2017 12:04:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cfUtz-00005y-Q3
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2017 12:04:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cfUtw-0002mz-L3
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2017 12:03:59 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:65179)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>) id 1cfUtw-0002eg-Db
	for qemu-trivial@nongnu.org; Sun, 19 Feb 2017 12:03:56 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 294E4745960;
	Sun, 19 Feb 2017 18:03:39 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 0FEE47456BA; Sun, 19 Feb 2017 18:03:39 +0100 (CET)
Message-Id: <cover.1487522123.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Sun, 19 Feb 2017 17:35:23 +0100
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: [Qemu-trivial] [PATCH 00/10] Improvements for sm501 display
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
X-List-Received-Date: Sun, 19 Feb 2017 17:04:01 -0000

This series improves the sm501 display controller emulation fixing
endianness problems that caused mixed up colors in LE hosts, fix hardware
cursor and adding panel layer support and some missing registers. The
first few patches update the code style and QOMify the device before
changes are made to it in subsequent patches.

Including qemu-trivial list as well, both because some of the patches
are trivial and also I'm not sure how actively maintained this part is
so that also may need attention from the trivial list to get this merged.

The changes were tested with sh4 image at
https://people.debian.org/~aurel32/qemu/sh4/
which accepts video= kernel parameter to excercise different screen modes.

BALATON Zoltan (10):
  sm501: Fixed code style and a few typos in comments
  sm501: Use defines instead of constants where available
  sm501: QOMify
  sm501: Add emulation of chip connected via PCI
  sm501: Add missing arbitration control register
  sm501: Fix device endianness
  sm501: Fix hardware cursor
  sm501: Add support for panel layer
  sm501: Add some more missing registers
  ppc: Add SM501 device in config for ppc and ppcemb targets

 default-configs/ppc-softmmu.mak    |    1 +
 default-configs/ppcemb-softmmu.mak |    1 +
 hw/display/sm501.c                 | 1546 ++++++++++++++++++++----------------
 hw/display/sm501_template.h        |   92 +--
 hw/sh4/r2d.c                       |   11 +-
 include/hw/devices.h               |    5 -
 6 files changed, 920 insertions(+), 736 deletions(-)

-- 
2.7.4


