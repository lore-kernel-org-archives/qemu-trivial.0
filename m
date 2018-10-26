Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gG4Jp-0005SC-FJ
	for mharc-qemu-trivial@gnu.org; Fri, 26 Oct 2018 11:46:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49903)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG4Jm-0003tU-Uu
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:46:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gG45z-0004cT-Iz
	for qemu-trivial@nongnu.org; Fri, 26 Oct 2018 11:32:25 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:43003)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gG45y-0004Yo-PY; Fri, 26 Oct 2018 11:32:19 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MqZE0-1flLyM3MpM-00malX; Fri, 26 Oct 2018 17:31:39 +0200
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MqZE0-1flLyM3MpM-00malX; Fri, 26 Oct 2018 17:31:39 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
	Michael Walle <michael@walle.cc>, Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, xen-devel@lists.xenproject.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Markus Armbruster <armbru@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	Aurelien Jarno <aurelien@aurel32.net>, Kevin Wolf <kwolf@redhat.com>,
	qemu-block@nongnu.org, Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Fri, 26 Oct 2018 17:31:05 +0200
Message-Id: <20181026153125.24738-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:lYLc1dx4To2RSwjjCvunpxVW/UC94x9ZcQQD10Npw1/m6/TQTJu
	4bLxzIwBRhh1RckGCgaJWrNiEDLCE3nva/OQycJVuz/m6orNEK44F9UGVuWzdTUqr1xXch7
	KiQXh/lwhpPO5r3Wee/YAB7yi0Xs9ExTkGXkeiynF8MHDveAUhNgSbsc/Cfb2YpB89R3xry
	YX1OUniZ2Kei65SOoc1zQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:TwBvokqDqs8=:7NNa5we2tf8XWjjxtO1SsF
	q8ps1V/D/qgqSAu5kQL7PRFhn2hPIV7EsNLYh4nrqicfdEkSmwCJUfWs4EsT2PlpAUNxFYG47
	jWhN4gwDfASFyZEZ5XSB4oqJasKzRtsh8W+Ni3cqmFFdgNyJDWwAxnu4gTwtCNXMnJK5+SKCv
	P8r2QD7gof6hlPbacyTmiCgHC/Fe/qs65olEfbwwkrUs2KBMWEe0CP0FYcRs8taiX6L8W5ilY
	0bZhRz5nY/sJqYauaACnqEIZHbOy8ES4NpQsN5wbKPDxDYY+FXxnLEk9Ak2Y+XCORFsfktIKk
	cHoBlXDC1dr1D1W9biSO4f/FP7UwZpmNSu58UTEiSaZIdi9a7WfdjTPUJrtT48XcWr4pyOMDU
	zwr5i2woMbgJte7wPSXwR2dv7aMr+B90iHJeNaYOrPq7e1LDGkA6aUlv5PplZ3z3iPwuu/Sx0
	s6WaeqUFeJnjadcLDr0DP54a8VDO2p35yrTn7eu82e9i6T0YBGNZK3BhJpeiLvGAW9BFdIVQB
	+8MWVyLHaLtxEHgSFps7KPBZBdne20HuDzFmcC89k1XivU8k/OiPJxZW0Y5YtmfxQcdZyJlP2
	eMk5a4saeXGlcdOOgz8rIHi3b3NTvyuP5c/2n0L18GJ5ABDMhubGlXoFdDvEqyCrr79h9DrT6
	i4i1gKiyZFrKLfsPwG11vv2kUePyK+QELr9l3NIYj0oxzDY93tM5zRyuymcjR3NXi9t3H+pyU
	TZ3F5x1V5PY3ur36
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.135
Subject: [Qemu-trivial] [PULL 00/20] Trivial patches patches
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
X-List-Received-Date: Fri, 26 Oct 2018 15:46:36 -0000

The following changes since commit 808ebd66e467f77c0d1f8c6346235f81e9c99cf2:

  Merge remote-tracking branch 'remotes/riscv/tags/riscv-for-master-3.1-sf0' into staging (2018-10-25 17:41:03 +0100)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-patches-pull-request

for you to fetch changes up to 4b03da6e87c34793137a231b558231fd406c05e8:

  ppc: move at24c to its own CONFIG_ symbol (2018-10-26 17:17:32 +0200)

----------------------------------------------------------------
QEMU trivial patches collected between June and October 2018
(Thank you to Thomas Huth)

----------------------------------------------------------------

Cleber Rosa (6):
  tests/tcg/README: fix location for lm32 tests
  qemu-iotests: fix filename containing checks
  docs/devel/testing.rst: add missing newlines after code block
  scripts/decodetree.py: remove unused imports
  scripts/qemu.py: remove trailing quotes on docstring
  qemu-iotests: make 218 executable

Emilio G. Cota (1):
  linux-user: fix comment s/atomic_write/atomic_set/

Li Qiang (2):
  memory.h: fix typos in comments
  cpu.h: fix a typo in comment

Paolo Bonzini (1):
  ppc: move at24c to its own CONFIG_ symbol

Philippe Mathieu-Daudé (6):
  qobject: Catch another straggler for use of qdict_put_str()
  xen: Use the PCI_DEVICE macro
  tests/bios-tables-test: Remove an useless cast
  hw/pci-host: Remove useless parenthesis around DIV_ROUND_UP macro
  hw/intc/gicv3: Remove useless parenthesis around DIV_ROUND_UP macro
  milkymist-minimac2: Use qemu_log_mask(GUEST_ERROR) instead of
    error_report

Stefan Weil (2):
  tests: Fix typos in comments and help message (found by codespell)
  configure: Support pkg-config for zlib

Thomas Huth (1):
  configs/alpha: Remove unused CONFIG_PARALLEL_ISA switch

yuchenlin (1):
  vga_int: remove unused function protype

 configure                             | 40 +++++++++++++++------------
 default-configs/alpha-softmmu.mak     |  1 -
 default-configs/ppc-softmmu.mak       |  1 +
 docs/devel/testing.rst                |  2 ++
 hw/display/vga_int.h                  |  1 -
 hw/net/milkymist-minimac2.c           | 14 ++++++----
 hw/nvram/Makefile.objs                |  2 +-
 hw/pci-host/piix.c                    |  2 +-
 hw/pci-host/q35.c                     |  2 +-
 hw/xen/xen_pt_config_init.c           |  8 +++---
 include/exec/memory.h                 |  6 ++--
 include/hw/intc/arm_gicv3_common.h    |  2 +-
 include/qom/cpu.h                     |  2 +-
 linux-user/qemu.h                     |  2 +-
 qobject/block-qdict.c                 |  2 +-
 scripts/decodetree.py                 |  2 --
 scripts/qemu.py                       |  2 +-
 tests/bios-tables-test.c              |  4 +--
 tests/docker/Makefile.include         |  2 +-
 tests/docker/docker.py                |  4 +--
 tests/guest-debug/test-gdbstub.py     |  2 +-
 tests/qemu-iotests/218                |  0
 tests/qemu-iotests/common.qemu        |  2 +-
 tests/qemu-iotests/common.rc          |  4 +--
 tests/tcg/Makefile.include            |  2 +-
 tests/tcg/Makefile.probe              |  2 +-
 tests/tcg/README                      |  2 +-
 tests/tcg/mips/mips64-dsp/subq_s_pw.c |  2 +-
 28 files changed, 63 insertions(+), 54 deletions(-)
 mode change 100644 => 100755 tests/qemu-iotests/218

-- 
2.17.2


