Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eKP6T-0006yC-1j
	for mharc-qemu-trivial@gnu.org; Thu, 30 Nov 2017 08:42:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40014)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKP6P-0006wK-7j
	for qemu-trivial@nongnu.org; Thu, 30 Nov 2017 08:42:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKP6O-0005j8-AO
	for qemu-trivial@nongnu.org; Thu, 30 Nov 2017 08:42:09 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48758)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eKP6I-0005V8-C1; Thu, 30 Nov 2017 08:42:02 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 53143BDEA;
	Thu, 30 Nov 2017 13:42:01 +0000 (UTC)
Received: from red.redhat.com (ovpn-122-213.rdu2.redhat.com [10.10.122.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A31C95D6B4;
	Thu, 30 Nov 2017 13:42:00 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Thu, 30 Nov 2017 07:41:56 -0600
Message-Id: <20171130134159.9697-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Thu, 30 Nov 2017 13:42:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 0/3] macro do/while (0) cleanup
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
X-List-Received-Date: Thu, 30 Nov 2017 13:42:11 -0000

Noticed this by chance in the tests/ directory, so I broadened
it to a grep of the entire code base.  I suspect many of the
bad macros were the victims of copy-and-paste from some other
bad location (particularly given how many bit-rotten debug
print macros were involved).

https://wiki.qemu.org/BiteSizedTasks#Bitrot_prevention is still
left for someone else, for another day.

Eric Blake (3):
  net: Drop unusual use of do { } while (0);
  mips: Tweak location of ';' in macros
  maint: Fix macros with broken 'do/while(0);' usage

 tests/acpi-utils.h         |  8 ++++----
 ui/sdl_zoom_template.h     |  8 ++++----
 audio/paaudio.c            |  4 ++--
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
 hw/misc/macio/mac_dbdma.c  |  4 ++--
 hw/misc/mmio_interface.c   |  2 +-
 hw/misc/stm32f2xx_syscfg.c |  2 +-
 hw/misc/zynq_slcr.c        |  2 +-
 hw/net/cadence_gem.c       |  2 +-
 hw/net/pcnet.c             | 20 ++++++++++----------
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
 target/mips/msa_helper.c   | 34 ++++++++++++++++++----------------
 target/s390x/kvm.c         |  2 +-
 tests/tcg/test-mmap.c      |  2 +-
 36 files changed, 70 insertions(+), 68 deletions(-)

-- 
2.14.3


