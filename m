Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzTI8-0005YI-U3
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jun 2014 12:09:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52326)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTHy-0005CZ-5B
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:09:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WzTHs-00050Q-BX
	for qemu-trivial@nongnu.org; Tue, 24 Jun 2014 12:09:42 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41536)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WzTHe-0004vn-Uf; Tue, 24 Jun 2014 12:09:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id DEA0F4407F;
	Tue, 24 Jun 2014 20:09:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id CA3C5674;
	Tue, 24 Jun 2014 20:09:21 +0400 (MSK)
Received: (nullmailer pid 15608 invoked by uid 1000);
	Tue, 24 Jun 2014 16:09:21 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue, 24 Jun 2014 20:09:06 +0400
Message-Id: <1403626160-15546-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/14] Trivial patches for 2014-06-24
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
X-List-Received-Date: Tue, 24 Jun 2014 16:09:51 -0000

Here's another pull request for the trivial patches queue.

Nothing exciting, but it contains some bugfixes.  For example,
a build fix for FreeBSD by Ed Maste.

Please consider pulling/applying.

Thanks,

/mjt

The following changes since commit 513d80edc15d77b6d85df7dfad750ce95d091b=
78:

  Merge remote-tracking branch 'remotes/juanquintela/tags/migration/20140=
623' into staging (2014-06-24 15:33:42 +0100)

are available in the git repository at:


  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-06-24

for you to fetch changes up to d535508793a8e9389379543ef8d506e50c10cf67:

  Add support for the arm breakpoint syscall (2014-06-24 20:01:24 +0400)

----------------------------------------------------------------
trivial patches for 2014-06-24

----------------------------------------------------------------
Bernhard =C3=9Cbelacker (1):
      Increase maximum number of session of the internal TFTP server.

Chen Gang (1):
      block.c: Remove useless 'buf' variable

Cole Robinson (1):
      configure: Enable TPM by default, add --disable-tpm

Ed Maste (1):
      vscclient: Add required headers to fix build on FreeBSD

Eduardo Habkost (1):
      rng-random: NULL check not needed before g_free()

Hunter Laux (1):
      Add support for the arm breakpoint syscall

Michael Tokarev (1):
      build-sys: introduce install-prog macro to install&strip binaries a=
nd use it

Paolo Bonzini (1):
      virtio-serial: remove useless set_config function

Peter Maydell (4):
      tcg: mark tcg_out* and tcg_patch* with attribute 'unused'
      target-unicore: Remove unused functions
      hw/moxie/moxiesim.c: Remove unused moxie_intc_create()
      target-s390x: Remove unused ld_code6() function

Stefan Weil (2):
      Fix new typos (found by codespell)
      target-ppc: Fix compiler warning

 Makefile                        |   12 ++----------
 Makefile.target                 |    5 +----
 backends/rng-random.c           |    5 +----
 block.c                         |    2 --
 block/iscsi.c                   |    2 +-
 configure                       |    5 ++++-
 hw/char/virtio-serial-bus.c     |    8 --------
 hw/input/hid.c                  |    2 +-
 hw/moxie/moxiesim.c             |   13 -------------
 libcacard/vscclient.c           |    2 ++
 linux-user/arm/syscall.h        |    1 +
 linux-user/main.c               |    4 ++++
 rules.mak                       |    7 +++++++
 slirp/tftp.h                    |    2 +-
 target-arm/helper.c             |    2 +-
 target-ppc/dfp_helper.c         |    3 +--
 target-s390x/translate.c        |    5 -----
 target-unicore32/translate.c    |   28 ----------------------------
 target-unicore32/ucf64_helper.c |   22 ----------------------
 tcg/mips/tcg-target.c           |    4 ++--
 tcg/tcg.c                       |   20 ++++++++++++--------
 tests/qemu-iotests/common.qemu  |    2 +-
 translate-all.c                 |    2 +-
 23 files changed, 43 insertions(+), 115 deletions(-)

