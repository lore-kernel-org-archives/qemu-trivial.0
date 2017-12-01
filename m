Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eKufo-0007ML-7J
	for mharc-qemu-trivial@gnu.org; Fri, 01 Dec 2017 18:24:48 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKufl-0007KF-GC
	for qemu-trivial@nongnu.org; Fri, 01 Dec 2017 18:24:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKufk-00049s-Cz
	for qemu-trivial@nongnu.org; Fri, 01 Dec 2017 18:24:45 -0500
Received: from mx1.redhat.com ([209.132.183.28]:42460)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eKufd-000454-V3; Fri, 01 Dec 2017 18:24:38 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 18C38C04AC43;
	Fri,  1 Dec 2017 23:24:37 +0000 (UTC)
Received: from red.redhat.com (ovpn-122-182.rdu2.redhat.com [10.10.122.182])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 173895D6A3;
	Fri,  1 Dec 2017 23:24:33 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	qemu-trivial@nongnu.org,
	pbonzini@redhat.com
Date: Fri,  1 Dec 2017 17:24:26 -0600
Message-Id: <20171201232433.25193-1-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Fri, 01 Dec 2017 23:24:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 0/7] macro do/while (0) cleanup
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
X-List-Received-Date: Fri, 01 Dec 2017 23:24:46 -0000

Noticed this by chance in the tests/ directory, so I broadened
it to a grep of the entire code base.  I suspect^wKNOW many of
the bad macros were the victims of copy-and-paste from some
other bad location (particularly given how many bit-rotten
debug print macros were involved).

https://wiki.qemu.org/BiteSizedTasks#Bitrot_prevention is still
left for someone else, for another day.

In v2:
- add review tags
- audit that the maint patch has no semantic change (all callers
were indeed supplying ';' at the macro call-sites)
- improved commit messages
- more patches for some additional cleanups
- tighten the checkpatch rule to also flag 'while (false);'

Eric Blake (7):
  net: Drop unusual use of do { } while (0);
  mips: Tweak location of ';' in macros
  chardev: Use goto/label instead of do/break/while(0)
  chardev: Clean up previous patch indentation
  tests: Avoid 'do/while(false);' in vhost-user-bridge
  maint: Fix macros with broken 'do/while(0);' usage
  checkpatch: Enforce proper do/while (0) style

 tests/acpi-utils.h         |  8 ++---
 ui/sdl_zoom_template.h     |  8 ++---
 audio/paaudio.c            |  4 +--
 chardev/char-serial.c      | 75 ++++++++++++++++++++++++----------------=
------
 hw/adc/stm32f2xx_adc.c     |  2 +-
 hw/block/m25p80.c          |  2 +-
 hw/char/cadence_uart.c     |  2 +-
 hw/char/stm32f2xx_usart.c  |  2 +-
 hw/display/cg3.c           |  2 +-
 hw/display/dpcd.c          |  2 +-
 hw/display/xlnx_dp.c       |  2 +-
 hw/dma/pl330.c             |  2 +-
 hw/dma/xlnx-zynq-devcfg.c  |  2 +-
 hw/dma/xlnx_dpdma.c        |  2 +-
 hw/i2c/i2c-ddc.c           |  2 +-
 hw/misc/auxbus.c           |  2 +-
 hw/misc/macio/mac_dbdma.c  |  4 +--
 hw/misc/mmio_interface.c   |  2 +-
 hw/misc/stm32f2xx_syscfg.c |  2 +-
 hw/misc/zynq_slcr.c        |  2 +-
 hw/net/cadence_gem.c       |  2 +-
 hw/net/pcnet.c             | 20 ++++++-------
 hw/ssi/mss-spi.c           |  2 +-
 hw/ssi/stm32f2xx_spi.c     |  2 +-
 hw/ssi/xilinx_spi.c        |  2 +-
 hw/ssi/xilinx_spips.c      |  2 +-
 hw/timer/a9gtimer.c        |  2 +-
 hw/timer/cadence_ttc.c     |  2 +-
 hw/timer/mss-timer.c       |  2 +-
 hw/timer/stm32f2xx_timer.c |  2 +-
 hw/tpm/tpm_passthrough.c   |  2 +-
 hw/tpm/tpm_tis.c           |  2 +-
 migration/rdma.c           |  2 +-
 target/arm/translate-a64.c |  2 +-
 target/mips/msa_helper.c   | 34 +++++++++++----------
 target/s390x/kvm.c         |  2 +-
 tests/tcg/test-mmap.c      |  2 +-
 tests/vhost-user-bridge.c  |  6 ++--
 scripts/checkpatch.pl      |  5 ++++
 39 files changed, 119 insertions(+), 105 deletions(-)

--=20
2.14.3


