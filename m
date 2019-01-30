Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1goppf-0001LT-K6
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 08:23:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36701)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1goppd-0001JV-O5
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1goppa-0006Kd-SF
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:08 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:34451)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1goppS-0006BR-A5; Wed, 30 Jan 2019 08:23:00 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MkpjD-1haF0B2LtP-00mOaI; Wed, 30 Jan 2019 14:22:32 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Jiri Slaby <jslaby@suse.cz>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Igor Mammedov <imammedo@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Stefan Hajnoczi <stefanha@redhat.com>,
	Stafford Horne <shorne@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Date: Wed, 30 Jan 2019 14:22:01 +0100
Message-Id: <20190130132214.25493-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bvgwF1I/LfHhIYrDn9SsKX6yEo/Rn6PONwtLoU7ogERwtiZJtYX
	QtUi5VUPbOnYPJXb8Vw50JXvsTnB3BTON2MKfmz8infzE6oRFKjd2AEzP3Npu7LXNX/T0+m
	uoLkQdamhNyp2hwwe3qDPAYVRaeIm7Y79cjpjAN2DpM42yr7fqOabHv+pbqTxr41AIN4hSk
	VQ0wbjGLHOhxXGDfkOO7w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QsvPAhxyLLs=:DH4F2hFPABjaAlq0dgwn9z
	LDMHMCh4ClvvIEos43UTd1RX7lthThGVy/ASj37lGT8R9hln/us4nFF6L+OYksp3qeQOjZxDn
	bzikzbU2lDFdkzSqyrOlB1Y/FIW+3O4Xtan8eDCUcTNsSAjbcz8hF1nd4uOkC6EsgLyBwqO9D
	3n2WC8FzF/9lNF8zRn/lazR4dWHP2wiltR8U12Wo29zw/kNNjJBX+fxfxk0ymICsE5vCqZvvs
	CwCPi3gi9o0/IPQTQcOdU1FQwASHEnEVU5nQm7eje/5uJ7DhCWEPREbJuAqRQqPiCKURGEojW
	DNoxrXg5mPw1l6xDnsktC0bxgL9k3oE7emez/5auOI0m7Ko2+iHN4areQtxyS5zWSCbgjbhzH
	8YDfkSW5LujtIM8oFMJSRK+v5qAtrzzcxe4Jkd6fFyZ0j+nEYseo/eSDtY5/YHGPsz5BC9C76
	uoh/nGDwots4A47Yg0DapQCYzXcj0I/BGOL+M8mXV+wH8uvroE2M+bSBiPxk4FVDbuCtJ6gqL
	u8Ho5Z5R5Qd29e4ICZD1Hnl2Rufa98/CnTH1inIku7Gtd/p75B9FL/1KtoJVdg5/GJ+m7rKl1
	cRtobz/KI7+PlOn1qf+wIhjHTCg3cDOATRoLIJQIUO66yA4+ooDuy1SLqnZ3vBdaNKlst/T9f
	35KFCS9XZz8IZcOJusk7V+zuqk8Vl478L9CzozKQ5k+8W1aAX5TdWykUQeWRV16WyfgjG58+A
	8ZArbUHQWJQ1/CNdjZI2kgO9J20ax6cIEc2O3OejiyR6pwFsIXo0EWNo3XM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 00/13] Trivial branch patches
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
X-List-Received-Date: Wed, 30 Jan 2019 13:23:10 -0000

The following changes since commit b4fbe1f65a4769c09e6bf2d79fc84360f840f40e:

  Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20190129' into staging (2019-01-29 12:00:19 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to 95b3c9cfd5eaaa4a2a4afa1eaf09612a94ade1da:

  virtio-blk: remove duplicate definition of VirtIOBlock *s pointer (2019-01-30 14:20:18 +0100)

----------------------------------------------------------------
- add device category (edu, i8042, sd memory card)
- code clean-up
- LGPL information clean-up
- fix typo (acpi)

----------------------------------------------------------------

Dr. David Alan Gilbert (1):
  typo: apci->acpi

Paul Durrant (1):
  hw/block: clean up stale xen_disk trace entries

Stefano Garzarella (1):
  virtio-blk: remove duplicate definition of VirtIOBlock *s pointer

Thomas Huth (7):
  Don't talk about the LGPL if the file is licensed under the GPL
  COPYING.LIB: Synchronize the LGPL 2.1 with the version from gnu.org
  target/openrisc: Fix LGPL version number
  target/tricore: Fix LGPL version number
  tcg: Fix LGPL version number
  target/s390x: Fix LGPL version in the file header comments
  target/m68k: Fix LGPL information in the file headers

kumar sourav (3):
  hw: edu: set category of the edu device
  hw: input: set category of the i8042 device
  hw: sd: set category of the sd memory card

 COPYING.LIB                        | 22 ++++++++++------------
 accel/tcg/atomic_template.h        |  2 +-
 accel/tcg/cpu-exec-common.c        |  2 +-
 accel/tcg/cpu-exec.c               |  2 +-
 accel/tcg/cputlb.c                 |  2 +-
 accel/tcg/softmmu_template.h       |  2 +-
 accel/tcg/tcg-runtime-gvec.c       |  2 +-
 accel/tcg/translate-all.c          |  2 +-
 accel/tcg/translate-all.h          |  2 +-
 accel/tcg/user-exec.c              |  2 +-
 crypto/afsplit.c                   | 11 +++++------
 hw/acpi/cpu.c                      |  2 +-
 hw/block/trace-events              |  7 -------
 hw/block/virtio-blk.c              |  2 --
 hw/i386/acpi-build.c               |  2 +-
 hw/input/pckbd.c                   |  1 +
 hw/misc/edu.c                      |  2 ++
 hw/sd/sd.c                         |  1 +
 include/crypto/afsplit.h           | 11 +++++------
 include/hw/acpi/cpu.h              |  2 +-
 include/hw/pci-host/gpex.h         |  4 ++--
 include/hw/pci-host/q35.h          |  4 ++--
 include/qemu/range.h               | 11 +++++------
 linux-user/m68k/target_cpu.h       |  4 ++--
 linux-user/m68k/target_structs.h   |  2 +-
 target/i386/hvf/hvf.c              |  6 +++---
 target/m68k/cpu.h                  |  4 ++--
 target/m68k/fpu_helper.c           |  4 ++--
 target/m68k/gdbstub.c              |  2 +-
 target/m68k/helper.c               |  4 ++--
 target/m68k/op_helper.c            |  2 +-
 target/m68k/translate.c            |  4 ++--
 target/openrisc/cpu.c              |  2 +-
 target/openrisc/exception.h        |  2 +-
 target/openrisc/gdbstub.c          |  2 +-
 target/openrisc/helper.h           |  2 +-
 target/openrisc/interrupt_helper.c |  2 +-
 target/openrisc/sys_helper.c       |  2 +-
 target/openrisc/translate.c        |  2 +-
 target/s390x/cc_helper.c           |  2 +-
 target/s390x/excp_helper.c         |  2 +-
 target/s390x/fpu_helper.c          |  2 +-
 target/s390x/gdbstub.c             |  2 +-
 target/s390x/helper.c              |  2 +-
 target/s390x/int_helper.c          |  2 +-
 target/s390x/mem_helper.c          |  2 +-
 target/s390x/misc_helper.c         |  2 +-
 target/s390x/translate.c           |  2 +-
 target/tricore/cpu-qom.h           |  2 +-
 target/tricore/cpu.c               |  2 +-
 target/tricore/cpu.h               |  2 +-
 target/tricore/fpu_helper.c        |  2 +-
 target/tricore/helper.c            |  2 +-
 target/tricore/helper.h            |  2 +-
 target/tricore/op_helper.c         |  2 +-
 target/tricore/translate.c         |  2 +-
 target/tricore/tricore-defs.h      |  2 +-
 target/tricore/tricore-opcodes.h   |  2 +-
 tcg/tcg-gvec-desc.h                |  2 +-
 tcg/tcg-op-gvec.c                  |  2 +-
 tcg/tcg-op-gvec.h                  |  2 +-
 tcg/tcg-op-vec.c                   |  2 +-
 util/range.c                       | 11 +++++------
 63 files changed, 96 insertions(+), 107 deletions(-)

-- 
2.20.1


