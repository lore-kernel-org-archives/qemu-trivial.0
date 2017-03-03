Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cjcMV-0006Ui-V1
	for mharc-qemu-trivial@gnu.org; Thu, 02 Mar 2017 20:50:28 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cjcMM-0006J5-T4
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 20:50:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1cjcML-0001HW-IG
	for qemu-trivial@nongnu.org; Thu, 02 Mar 2017 20:50:18 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:46557)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1cjcMG-0001CH-22; Thu, 02 Mar 2017 20:50:12 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 56DED745967;
	Fri,  3 Mar 2017 02:50:10 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 3AD887456BC; Fri,  3 Mar 2017 02:50:10 +0100 (CET)
Message-Id: <cover.1488504063.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Fri, 3 Mar 2017 02:21:03 +0100
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: [Qemu-trivial] [PATCH v3 00/13] Improvements for SM501 display
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
X-List-Received-Date: Fri, 03 Mar 2017 01:50:20 -0000

Third version addressing points that came up in review of v2.

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
 hw/display/sm501.c                 | 1757 ++++++++++++++++++++++--------------
 hw/display/sm501_template.h        |   94 +-
 hw/sh4/r2d.c                       |   11 +-
 include/hw/devices.h               |    5 -
 include/hw/pci/pci_ids.h           |    3 +
 7 files changed, 1130 insertions(+), 742 deletions(-)

-- 
2.7.4


