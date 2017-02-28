Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cibX7-0001vJ-2A
	for mharc-qemu-trivial@gnu.org; Tue, 28 Feb 2017 01:45:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cibX3-0001px-Um
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 01:45:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cibX2-0003I1-Sh
	for qemu-trivial@nongnu.org; Tue, 28 Feb 2017 01:45:10 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:59747)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cibWy-0003DX-CC; Tue, 28 Feb 2017 01:45:04 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9A0C443567;
	Tue, 28 Feb 2017 09:45:00 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id C5ACE2C;
	Tue, 28 Feb 2017 09:44:59 +0300 (MSK)
Received: (nullmailer pid 19614 invoked by uid 1000);
	Tue, 28 Feb 2017 06:44:59 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Tue, 28 Feb 2017 09:44:43 +0300
Message-Id: <cover.1488264243.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 00/14] Trivial patches for 2017-02-28
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
X-List-Received-Date: Tue, 28 Feb 2017 06:45:11 -0000

This is yet another trivial patches pull request.
Please consider applying/pulling.

The following changes since commit 8f2d7c341184a95d05476ea3c45dbae2b9ddbe=
51:

  Merge remote-tracking branch 'remotes/berrange/tags/pull-qcrypto-2017-0=
2-27-1' into staging (2017-02-27 15:33:21 +0000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-fetch

for you to fetch changes up to f5507e0448bd34473af72509297617a783049024:

  syscall: fixed mincore(2) not failing with ENOMEM (2017-02-28 09:03:39 =
+0300)

----------------------------------------------------------------
trivial patches for 2017-02-28

----------------------------------------------------------------
Fam Zheng (1):
      cadence_gem: Remove unused parameter debug message

Franklin \"Snaipe\" Mathieu (1):
      syscall: fixed mincore(2) not failing with ENOMEM

Igor Pavlikevich (1):
      hw/acpi/tco.c: fix tco timer stop

John Snow (1):
      ide: remove undefined behavior in ide-test

Marc-Andr=C3=A9 Lureau (1):
      Update copyright year

Peter Maydell (3):
      softfloat: Use correct type in float64_to_uint64_round_to_zero()
      CODING_STYLE: Mention preferred comment form
      lm32: milkymist-tmu2: fix a third integer overflow

Philippe Mathieu-Daud=C3=A9 (1):
      register: fix incorrect read mask

Stefan Weil (1):
      target/s390x: Fix typo

Thomas Huth (3):
      hw/core/or-irq: Mark the device with cannot_instantiate_with_device=
_add_yet
      hw/core/register: Mark the device with cannot_instantiate_with_devi=
ce_add_yet
      tests/prom-env: Enable the test for the sun4u machine, too

Vincenzo Maffione (1):
      qemu-options.hx: add missing id=3Dchr0 chardev argument in vhost-us=
er example

 CODING_STYLE                |  7 +++++++
 fpu/softfloat.c             |  2 +-
 hw/acpi/tco.c               |  1 +
 hw/core/or-irq.c            |  3 +++
 hw/core/register.c          | 30 ++++++++++++++++++++++++------
 hw/display/milkymist-tmu2.c |  2 +-
 hw/net/cadence_gem.c        |  2 +-
 include/qemu-common.h       |  2 +-
 linux-user/syscall.c        | 11 ++++++++---
 qemu-options.hx             |  2 +-
 target/s390x/cpu_models.c   |  2 +-
 tests/Makefile.include      |  3 +--
 tests/ide-test.c            |  1 +
 tests/prom-env-test.c       |  2 +-
 14 files changed, 52 insertions(+), 18 deletions(-)

