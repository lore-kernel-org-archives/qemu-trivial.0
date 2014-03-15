Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOlLO-0002Zo-Rk
	for mharc-qemu-trivial@gnu.org; Sat, 15 Mar 2014 05:57:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlLG-0002D3-5x
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 05:57:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WOlLA-0004Sb-VC
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 05:57:22 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45306)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WOlKz-0004Q2-7L; Sat, 15 Mar 2014 05:57:05 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id BA00C41D73;
	Sat, 15 Mar 2014 13:57:02 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 66200662;
	Sat, 15 Mar 2014 13:57:02 +0400 (MSK)
Received: (nullmailer pid 20001 invoked by uid 1000);
	Sat, 15 Mar 2014 09:57:02 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Mar 2014 13:56:46 +0400
Message-Id: <1394877419-19949-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/13] Trivial patches for 2014-03-15
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
X-List-Received-Date: Sat, 15 Mar 2014 09:57:28 -0000

Here's another pull request for the trivial-patches queue.
This time it does not include Peter's shifts-to-sign-bit
patchset, but I'd hope to get it included in the next
few days.

All the changes appears to be fine for 2.0 (including the
shifts-to-sign-bit series actually).

Please consider applying for 2.0.

Thanks,

/mjt

The following changes since commit 03d51428e2da0188a0adea00cbd713cc1e967e=
7a:

  Merge remote-tracking branch 'remotes/bonzini/scsi-next' into staging (=
2014-03-14 18:17:25 +0000)

are available in the git repository at:


  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-03-15

for you to fetch changes up to 9c749e4dbe65e61e159ad822a4110167c2c108fe:

  FSL eTSEC: Fix typo in rx ring (2014-03-15 13:54:18 +0400)

----------------------------------------------------------------
trivial patches for 2014-03-15

----------------------------------------------------------------
Alex Benn=C3=A9e (4):
      .travis.yml: add a new build target with non-core devlibs
      .travis.yml: re-enable lttng user space trace test
      .travis.yml: trivial whitespace fixup
      .travis.yml: add IRC notifications for build failures

Cole Robinson (1):
      scripts/make-release: Don't distribute .git directories

Fabien Chouteau (1):
      FSL eTSEC: Fix typo in rx ring

Gabriel L. Somlo (1):
      Add qga/qapi-generated to .gitignore

Laszlo Ersek (1):
      sasl: Avoid 'Could not find keytab file' in syslog

Sebastian Huber (1):
      hw/timer/grlib_gptimer: Avoid integer overflows

Stefan Weil (4):
      misc: Fix typos in comments
      tests: Fix 'make test' for i686 hosts (build regression)
      audio: Add 'static' attributes to several variables
      configure: Don't use __int128_t for clang versions before 3.2

 .gitignore               |    1 +
 .travis.yml              |   53 +++++++++++++++++++++++++++-------------=
------
 configure                |    5 +++++
 hw/audio/fmopl.c         |    6 +++---
 hw/intc/arm_gic_kvm.c    |    2 +-
 hw/net/fsl_etsec/rings.c |    8 +++----
 hw/timer/grlib_gptimer.c |    4 ++--
 qemu.sasl                |    4 +++-
 scripts/make-release     |    2 +-
 target-arm/helper.c      |    2 +-
 target-ppc/int_helper.c  |    2 +-
 tests/tcg/test_path.c    |   13 +++++++-----
 12 files changed, 61 insertions(+), 41 deletions(-)

