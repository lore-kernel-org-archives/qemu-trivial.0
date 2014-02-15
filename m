Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WEeCt-0002K5-QQ
	for mharc-qemu-trivial@gnu.org; Sat, 15 Feb 2014 07:18:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeCn-00026V-CC
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:18:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WEeCh-00071H-W2
	for qemu-trivial@nongnu.org; Sat, 15 Feb 2014 07:18:49 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:35852)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WEeCW-0006vY-9K; Sat, 15 Feb 2014 07:18:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 4A50941BD1;
	Sat, 15 Feb 2014 16:18:22 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 2FF0121B;
	Sat, 15 Feb 2014 16:18:22 +0400 (MSK)
Received: (nullmailer pid 21817 invoked by uid 1000);
	Sat, 15 Feb 2014 12:18:22 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Sat, 15 Feb 2014 16:18:10 +0400
Message-Id: <1392466700-21770-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/10] Trivial patches for 2014-02-15
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
X-List-Received-Date: Sat, 15 Feb 2014 12:18:54 -0000

This is a trivial-patches pull request for 2014-02-15.
Amount of patches this time is small, but some of them deserves some
explanation.

 vl: trim includes  -- this one removes many #include statements from vl.=
c.
  I actually verified that qemu builds fine on linux and several variants
  of *BSD with this patch applied, so those includes really aren't needed=
.
  There _might_ be an issue on windows, but the chances are rather small.

 gitignore: anchor all ignored names  -- I haven't got any comments about
  this one, probably no one cares one or another way.  But I think it is
  better to include exact names and miss some (to be added later) than to
  include wildcarded names and ignore too much, like what happens with,
  for example, debian/patches directory because "patches" is listed in
  .gitignore.  I plan to reduce this file a bit further too.

Please consider applying/pulling.

Thanks,

/mjt

The following changes since commit 933b19ea9784de7ed2eb6e10262b9363c5c03e=
d7:

  PPC: KVM: Add missing address space to ldl_phys helper (2014-02-14 10:4=
2:31 +0000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-02-15

for you to fetch changes up to 88c1ee73d3231c74ff90bcfc084a7589670ec244:

  char/serial: Fix emptyness check (2014-02-15 16:10:25 +0400)

----------------------------------------------------------------
trivial patches for 2014-02-15

----------------------------------------------------------------
Michael Tokarev (5):
      linux-user: refactor do_socketcall()
      net: declare struct iovec in checksum.h to fix compiler warning
      vl: remove old, long-unused defines
      vl: trim includes
      gitignore: anchor all ignored names

Peter Crosthwaite (1):
      char/serial: Fix emptyness check

Sebastian Huber (1):
      sparc/leon3: Initialize stack pointer

Stefan Weil (1):
      misc: Fix case Qemu -> QEMU

Stewart Smith (2):
      configure: add hint of libfdt to DTC dependency not found message
      configure: add hints to a remedy for feature_not_found errors

 .gitignore               |  150 ++++++++++-----------
 configure                |   72 +++++-----
 hw/char/serial.c         |    2 +-
 hw/sparc/leon3.c         |    3 +
 include/net/checksum.h   |    1 +
 linux-user/syscall.c     |  326 ++++++++++------------------------------=
------
 scripts/switch-timer-api |    2 +-
 tests/i440fx-test.c      |    2 +-
 vl.c                     |   55 +-------
 9 files changed, 188 insertions(+), 425 deletions(-)

