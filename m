Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN5bY-0005JV-UC
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 15:11:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57275)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WN5bP-00051d-4e
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 15:11:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1WN5bO-0003QQ-CB
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 15:11:07 -0400
Received: from mnementh.archaic.org.uk ([2001:8b0:1d0::1]:46636)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WN5b8-0003JG-VQ; Mon, 10 Mar 2014 15:10:51 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1WN5b7-0002Sw-0z; Mon, 10 Mar 2014 19:10:49 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 10 Mar 2014 19:10:36 +0000
Message-Id: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2001:8b0:1d0::1
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH 00/12] Avoid shifting left into sign bit
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
X-List-Received-Date: Mon, 10 Mar 2014 19:11:08 -0000

This is a set of patches which silence clang -fsanitize=undefined
warnings about shifting left into the sign bit of a signed value.
Typically this is the result of "1 << 31" and similar constructs;
the fix is to add a "U" suffix to the 1 so that we do unsigned
arithmetic rather than signed arithmetic.

Since these patches are very minor changes to a fairly
wide ranging set of files, it seems easiest to send these
through the -trivial queue. Happy to split the series up
if people disagree.

Mostly I think these warnings are not particularly exciting
(even the adversarial optimizations preferred by modern
compilers will probably not break "1 << 31") but there are
a lot of them, the fix is pretty trivial, and getting rid of
them allows us to see the interesting sanitizer warnings more
clearly.

My method here has been just to look at the warnings produced
during a 'make check' run; no doubt actually running a guest
for various platforms would identify more of these.

thanks
-- PMM

Peter Maydell (12):
  target-i386: Avoid shifting left into sign bit
  hw/intc/apic.c: Use uint32_t for mask word in foreach_apic
  hw/pci/pci_host.c: Avoid shifting left into sign bit
  hw/i386/acpi_build.c: Avoid shifting left into sign bit
  target-mips: Avoid shifting left into sign bit
  hw/usb/hcd-ohci.c: Avoid shifting left into sign bit
  hw/intc/openpic: Avoid shifting left into sign bit
  hw/ppc: Avoid shifting left into sign bit
  tests/libqos/pci-pc: Avoid shifting left into sign bit
  hw/intc/slavio_intctl: Avoid shifting left into sign bit
  hw/intc/xilinx_intc: Avoid shifting left into sign bit
  hw/pci-host/apb.c: Avoid shifting left into sign bit

 hw/i386/acpi-build.c         |  2 +-
 hw/intc/apic.c               |  5 +++--
 hw/intc/openpic.c            |  4 ++--
 hw/intc/slavio_intctl.c      |  2 +-
 hw/intc/xilinx_intc.c        |  3 ++-
 hw/pci-host/apb.c            |  2 +-
 hw/pci/pci_host.c            |  3 ++-
 hw/ppc/ppc.c                 |  2 +-
 hw/ppc/ppc440_bamboo.c       |  4 ++--
 hw/ppc/ppc4xx_devs.c         |  2 +-
 hw/ppc/ppc_booke.c           |  4 ++--
 hw/ppc/virtex_ml507.c        |  4 ++--
 hw/usb/hcd-ohci.c            |  6 +++---
 target-i386/cpu.h            |  8 ++++----
 target-mips/cpu.h            |  2 +-
 target-mips/helper.c         |  8 ++++----
 target-mips/op_helper.c      |  2 +-
 target-mips/translate_init.c | 22 +++++++++++-----------
 tests/libqos/pci-pc.c        | 12 ++++++------
 19 files changed, 50 insertions(+), 47 deletions(-)

-- 
1.9.0


