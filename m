Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1a4kJX-0006Lv-8I
	for mharc-qemu-trivial@gnu.org; Fri, 04 Dec 2015 01:57:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4kJT-0006Cz-BE
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 01:57:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1a4kJS-0000Kp-Af
	for qemu-trivial@nongnu.org; Fri, 04 Dec 2015 01:57:51 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:33120)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1a4kJN-0000IE-E0; Fri, 04 Dec 2015 01:57:45 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id AD1E14063A;
	Fri,  4 Dec 2015 09:57:42 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 936BAAAD;
	Fri,  4 Dec 2015 09:57:42 +0300 (MSK)
Received: (nullmailer pid 7952 invoked by uid 1000);
	Fri, 04 Dec 2015 06:57:42 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri,  4 Dec 2015 09:57:31 +0300
Message-Id: <cover.1449211229.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL for-2.5 0/9] Trivial patches for 2015-12-04
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
X-List-Received-Date: Fri, 04 Dec 2015 06:57:52 -0000

Hello.

During the freeze period, let me please add my trivial pull request too ;=
)

There are just 9 patches this time, which are either (small) bugfixes,
or just prettifying one or another part of code to look nicely in the
release tarball.  Here are all of them:

aniel P. Berrange (1):
      crypto: avoid two coverity false positive error reports
	this is a cleanup together with a small tracing bugfix,
	an easy patch.  An making coverity even more useful is
	nice too.

Herv=C3=A9 Poussineau (1):
      scsi: remove scsi_req_free prototype
	just removing a prototype of a single unused function

John Snow (1):
      util/id: fully allocate names table
	a small bugfix avoiding accessing "random" memory

Markus Armbruster (1):
      typedefs: Put them back into alphabetical order
	this one sorts include/qemu/typedefs.h in alphabetical order,
	and removes duplicates while at it.  Actual set of typedefs
	isn't changed.  We should have good-looking code conforming
	to our own standards in the released tarball :)

Paolo Bonzini (3):
      bt: avoid unintended sign extension
	a simple bt bugfix

      gt64xxx: fix decoding of ISD register
	this is a small mips platform bugfix

      bt: check struct sizes
	this one is rather large, but it tries to fix real mess in BT
	device emulation which we have now

Peter Maydell (1):
      configure: Diagnose broken linkers directly
	A simple patch trying to verify whenever linker works too, not
	only compiler, at configure time before doing more complex
	tests.

Rodrigo Rebello (1):
      configure: use appropriate code fragment for -fstack-protector chec=
ks
	this is an interesting patch in context of the freeze time.
	In short, current test for -fstack-protector gives false positives
	(claiming the feature is available) in some configuration, because
	it only verifies whenever compiler accepts this option but not
	whenever it can compile and link a code which actually uses stack.

Please consider applying.

Thanks,

/mjt


The following changes since commit 4c65fed8bdf96780735dbdb92a8bd0d6b6526c=
c3:

  ui: vnc: avoid floating point exception (2015-12-03 13:34:50 +0000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/pull-trivial-patches-2015-12-04

for you to fetch changes up to 98475746b357f6c048caf9e001998d8a0618b2e4:

  bt: check struct sizes (2015-12-04 09:39:55 +0300)

----------------------------------------------------------------
trivial patches for 2015-12-04

----------------------------------------------------------------
Daniel P. Berrange (1):
      crypto: avoid two coverity false positive error reports

Herv=C3=A9 Poussineau (1):
      scsi: remove scsi_req_free prototype

John Snow (1):
      util/id: fully allocate names table

Markus Armbruster (1):
      typedefs: Put them back into alphabetical order

Paolo Bonzini (3):
      bt: avoid unintended sign extension
      gt64xxx: fix decoding of ISD register
      bt: check struct sizes

Peter Maydell (1):
      configure: Diagnose broken linkers directly

Rodrigo Rebello (1):
      configure: use appropriate code fragment for -fstack-protector chec=
ks

 configure               | 13 +++++++++++++
 crypto/tlscreds.c       |  4 ++--
 crypto/tlscredsx509.c   |  1 +
 hw/bt/sdp.c             |  2 +-
 hw/mips/gt64xxx_pci.c   |  3 ++-
 include/hw/bt.h         | 21 ++++-----------------
 include/hw/scsi/scsi.h  |  1 -
 include/qemu/typedefs.h | 13 ++++++-------
 util/id.c               |  4 ++--
 9 files changed, 31 insertions(+), 31 deletions(-)

