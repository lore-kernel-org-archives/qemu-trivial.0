Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gWmOM-0007T9-Kb
	for mharc-qemu-trivial@gnu.org; Tue, 11 Dec 2018 13:04:22 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOI-0007Qx-LV
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gWmOH-0006xG-Md
	for qemu-trivial@nongnu.org; Tue, 11 Dec 2018 13:04:18 -0500
Received: from mout.kundenserver.de ([212.227.126.131]:45543)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gWmO9-0006rb-EB; Tue, 11 Dec 2018 13:04:11 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1N94FT-1hYamt2q51-0165Dm; Tue, 11 Dec 2018 19:04:00 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 11 Dec 2018 19:03:22 +0100
Message-Id: <20181211180352.19644-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Pm4UGjXpwDcxgnMEGvAqQ5oWKnteeV0fVjd7ubXM9q1F0a442hf
	EtcaMMstiTAkVZDnBQUN/QQn132rtb4JiQ6yfrc+28J+5aOOoKub3KIcGUyhY1vTBysJwSc
	kX7kloNxbvDpYMLGW1yA6RGH78S8erfOtR7KgH27l1s+zdY6GCbaT/xo2NmqM5t/8cmo0WT
	b7x9RMdSWBuWwGMiVZKFA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:8IRQ7RYcifU=:fLrFeRVJ4qtQP9J9ubQhAW
	IkkRoL10HbVetArABqmHgwALWioeZHdoPXG9ZmZKmhJvHt84QLG++ODCtvWfgWMJ3iMqU2Q/f
	4ZzNwDm1BX59udBwXoZpSGtMBBnUf2NLS0e10rfusNgzEE5vBidXUdpInRm08PfLq2jIWoe8m
	jCfhJBIizuijhddN4k/yzEBjhm7UABcXCctCOzZrj2jzvJuOMmQRQ9OZZoOJgpmlHRF4gaQQD
	L9RntBvuhU042RX2QsM0QohBgdHgvEV0W60zOoOSIHNPprwuORnAr+fwFMW4IZtdgL1NIOg8v
	fJ0W5NVPg5+opiFqTLDLH885YA9jIMpl52/EknllPSOChZPn1TgheNmvG9ePyEsQmVth+ujOs
	w88VUPGz5xwuNv2s3fAPAXEmKUrMv/agT9ltAP93n1+jXKelywH5ZixwgygxraOWhwL2g2OBp
	K5xZXOgGKbc8ehH6H+AW/xqWR7htWpKfYzeWrWLT9reCqNwf71etTVaILTqmy17fbNV7WCK2X
	c89g1KHl+tKlo5J7mgY9OIesCmitD5DaXYUL6I3jgRgNJjIm5VCocF3mNWnwfc8266h3igQaE
	4DVmQR5RemqAlFv1kdUnJNFcwEa1Mr0J+ZXAT+OoxbwwxZNwM9ocwLPh3G2nZVNnkRM4pq+jy
	cqvTHkAv/oFaWPQgMPun6AEKAC8pPBgvF0/yv7+NndnCVhG2YjpqV+xwo0Qly0d/VXpIIa8Yi
	FrFCtB78Jb/6vSioB08tfb3jFWHdXj6vA3XCzmdIkp87EqWP7GQfoQTE/I0=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: [Qemu-trivial] [PULL 00/30] Trivial patches
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
X-List-Received-Date: Tue, 11 Dec 2018 18:04:21 -0000

The following changes since commit 32a1a94dd324d33578dca1dc96d7896a0244d768:

  Update version for v3.1.0 release (2018-12-11 17:18:37 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-patches-pull-request

for you to fetch changes up to 82c48fb79df5596a9d0a3b6d998c4491e542aa7a:

  Fixes i386 xchgq test (2018-12-11 18:41:25 +0100)

----------------------------------------------------------------
Trivial patches (2018-12-11)

----------------------------------------------------------------

Dongli Zhang (1):
  virtio: pass argument by value for virtqueue_map_iovec()

Eric Blake (4):
  qapi: Reduce Makefile boilerplate
  misc: Avoid UTF-8 in error messages
  cutils: Assert in-range base for string-to-integer conversions
  maint: Grammar fix to mailmap

Fam Zheng (1):
  MAINTAINERS: Update email address for Fam Zheng

Li Qiang (5):
  hw: qdev: fix error in comment
  hw: set_netdev: remove useless code
  target: hax: replace g_malloc with g_new0
  target: hax: fix errors in comment
  util: vfio-helpers: use ARRAY_SIZE in qemu_vfio_init_pci()

Marc-André Lureau (1):
  misc: fix spelling

Philippe Mathieu-Daudé (15):
  MAINTAINERS: Fix ACPI tests data files path
  MAINTAINERS: Add a missing entry to the SPARC CPU
  MAINTAINERS: Add missing entries for the Xilinx ZynqMP machine
  MAINTAINERS: Add missing entries for the Jazz machine
  MAINTAINERS: Add a missing entry for the Xilinx S3A-DSP 1800 machine
  MAINTAINERS: Add a missing entry for the Old World machines
  MAINTAINERS: Add a missing entry for the sun4m machines
  MAINTAINERS: Add missing entries to the PC Chipset section
  MAINTAINERS: Add missing entries to the vhost section
  MAINTAINERS: Add missing entries for the Canon DIGIC machine
  MAINTAINERS: Add missing entries for the MPS2 machine
  MAINTAINERS: Add a missing entry to SPICE
  MAINTAINERS: Add a missing entry to the QMP section
  MAINTAINERS: Add a missing entry for the NVDIMM device
  MAINTAINERS: Use my work email to review Build and test automation
    patches

Thomas Huth (2):
  MAINTAINERS: Add missing hw/pci-host entries
  MAINTAINERS: Add nios2-related files to the Nios2 section

fabrice.desclaux@cea.fr (1):
  Fixes i386 xchgq test

 .gitignore                       |  72 +-----------
 .mailmap                         |   2 +-
 MAINTAINERS                      |  49 +++++---
 Makefile                         | 194 ++++---------------------------
 Makefile.objs                    |  75 ++----------
 hw/core/qdev-properties-system.c |   4 -
 hw/misc/tmp105.c                 |   2 +-
 hw/misc/tmp421.c                 |   2 +-
 hw/virtio/virtio.c               |   8 +-
 include/hw/qdev-core.h           |   2 +-
 target/i386/cpu.c                |   2 +-
 target/i386/hax-all.c            |  17 +--
 tests/tcg/i386/test-i386.c       |   2 +-
 util/cutils.c                    |   8 ++
 util/vfio-helpers.c              |   2 +-
 15 files changed, 94 insertions(+), 347 deletions(-)

-- 
2.19.2


