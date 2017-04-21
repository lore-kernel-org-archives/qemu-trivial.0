Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d1aWO-0001gH-8N
	for mharc-qemu-trivial@gnu.org; Fri, 21 Apr 2017 11:30:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49947)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1d1aWF-0001Sj-B8
	for qemu-trivial@nongnu.org; Fri, 21 Apr 2017 11:30:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <balaton@eik.bme.hu>) id 1d1aWE-0007tG-97
	for qemu-trivial@nongnu.org; Fri, 21 Apr 2017 11:30:47 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:33781)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <balaton@eik.bme.hu>)
	id 1d1aW7-0007nl-MV; Fri, 21 Apr 2017 11:30:39 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
	by localhost (Postfix) with SMTP id 301177456F9;
	Fri, 21 Apr 2017 17:30:38 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
	id 194917456BA; Fri, 21 Apr 2017 17:30:38 +0200 (CEST)
Message-Id: <cover.1492787889.git.balaton@eik.bme.hu>
From: BALATON Zoltan <balaton@eik.bme.hu>
Date: Fri, 21 Apr 2017 17:18:09 +0200
To: qemu-devel@nongnu.org,
    qemu-trivial@nongnu.org
Cc: Magnus Damm <magnus.damm@gmail.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	David Gibson <david@gibson.dropbear.id.au>
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 152.66.115.2
Subject: [Qemu-trivial] [PATCH v7 00/13] Improvements for SM501 display
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
X-List-Received-Date: Fri, 21 Apr 2017 15:30:48 -0000

v7: Define default values for some variables to avoid an (invalid)
    warning from gcc 6 or 7 as suggested by Aurelien Jarno.

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
  ppc: Add SM501 device in ppc softmmu targets default configs

 default-configs/ppc-softmmu.mak    |    1 +
 default-configs/ppc64-softmmu.mak  |    1 +
 default-configs/ppcemb-softmmu.mak |    1 +
 hw/display/sm501.c                 | 1784 ++++++++++++++++++++++--------------
 hw/display/sm501_template.h        |   90 +-
 hw/sh4/r2d.c                       |   11 +-
 include/hw/devices.h               |    5 -
 include/hw/pci/pci_ids.h           |    3 +
 8 files changed, 1150 insertions(+), 746 deletions(-)

-- 
2.7.4


