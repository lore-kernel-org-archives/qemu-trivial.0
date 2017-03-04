Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ckIOK-0003Zz-Nc
	for mharc-qemu-trivial@gnu.org; Sat, 04 Mar 2017 17:43:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1ckIO4-0003In-Cv
	for qemu-trivial@nongnu.org; Sat, 04 Mar 2017 17:42:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1ckIO3-0000y5-9O
	for qemu-trivial@nongnu.org; Sat, 04 Mar 2017 17:42:52 -0500
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:26732)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1ckINx-0000pW-RG; Sat, 04 Mar 2017 17:42:45 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id C5A5B745969;
	Sat,  4 Mar 2017 23:42:37 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id AE1F47456AE; Sat,  4 Mar 2017 23:42:37 +0100 (CET)
Message-Id: <cover.1488665935.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Sat, 4 Mar 2017 23:18:55 +0100
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:738:2001:2001::2001
Subject: [Qemu-trivial] [PATCH v4 00/13] Improvements for SM501 display
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
X-List-Received-Date: Sat, 04 Mar 2017 22:42:57 -0000

Fourth and hopefully last version with more changes according to
review comments. Also cc'ing David Gibson as PPC maintainer to check
the last patch and in case it's decided to go via PPC tree at the end
being too big for trivial and lack of maintenance for SH4.

BALATON Zoltan (13):
  sm501: Fixed code style and a few typos in comments
  sm501: Use defined constants instead of literal values where available
  sm501: Add missing arbitration control register
  sm501: QOMify
  sm501: Get rid of base address in draw_hwc_line
  sm501: Add emulation of chip connected via PCI
  sm501: Fix device endianness
  sm501: Fix hardware cursor
  sm501: Misc clean ups
  sm501: Add support for panel layer
  sm501: Add some more missing registers
  sm501: Add vmstate descriptor
  ppc: Add SM501 device in config for ppc and ppcemb targets

 default-configs/ppc-softmmu.mak    |    1 +
 default-configs/ppcemb-softmmu.mak |    1 +
 hw/display/sm501.c                 | 1784 ++++++++++++++++++++++--------------
 hw/display/sm501_template.h        |   94 +-
 hw/sh4/r2d.c                       |   11 +-
 include/hw/devices.h               |    5 -
 include/hw/pci/pci_ids.h           |    3 +
 7 files changed, 1157 insertions(+), 742 deletions(-)

-- 
2.7.4


