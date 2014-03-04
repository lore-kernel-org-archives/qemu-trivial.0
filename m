Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WKijY-0000eK-Tu
	for mharc-qemu-trivial@gnu.org; Tue, 04 Mar 2014 01:21:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKijP-0000dR-5u
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:21:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1WKijK-0003Nr-9z
	for qemu-trivial@nongnu.org; Tue, 04 Mar 2014 01:21:35 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:48816)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1WKij9-0003Le-0L; Tue, 04 Mar 2014 01:21:19 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9EC8B4084D;
	Tue,  4 Mar 2014 10:16:03 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 89B3564F;
	Tue,  4 Mar 2014 10:16:03 +0400 (MSK)
Received: (nullmailer pid 16566 invoked by uid 1000);
	Tue, 04 Mar 2014 06:16:03 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Tue,  4 Mar 2014 10:15:48 +0400
Message-Id: <1393913761-16516-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/13] Trivial patches for 2014-03-04
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
X-List-Received-Date: Tue, 04 Mar 2014 06:21:41 -0000

Here's another pull request for trivial-patches tree.
There's nothing exciting in there, small things here and there.
Please consider pulling/applying.

Thanks,

/mjt

The following changes since commit d844a7b6569fb2b5252773444b18841426e5b9=
06:

  modules: Fix building with --enable-modules (2014-02-28 12:30:13 +0000)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-03-04

for you to fetch changes up to 25254a7191cdaa6cc10edb7bdbbfd0a6d02b9905:

  vl: Remove unneeded include file (2014-03-03 09:46:27 +0400)

----------------------------------------------------------------
trivial patches for 2014-03-04

----------------------------------------------------------------
Dr. David Alan Gilbert (1):
      include/qemu/host-utils.h: Trivial typo: ctz->cto

Hani Benhabiles (1):
      object: Report type in error when not user creatable.

Peter Maydell (2):
      tests/test-int128: Don't use __noclone__ attribute on clang
      qjson.h: Remove spurious GCC_FMT_ATTR markup from qobject_from_json=
() declaration

Stefan Weil (9):
      bswap: Modify prototype of stb_p (avoid type conversions)
      bswap: Modify prototypes of st[wl]_{le, be}_p (avoid type conversio=
ns)
      tcg: Fix typo in comment (dependancies -> dependencies)
      stubs: Optimize dependencies for gdbstub.c
      util/iov: Use qemu/sockets.h instead of conditional code
      exec: Remove unneeded include files
      qemu-img: Remove unneeded include files
      qga: Remove unneeded include file
      vl: Remove unneeded include file

 exec.c                    |    4 +---
 include/qapi/qmp/qjson.h  |    2 +-
 include/qemu/bswap.h      |   10 +++++-----
 include/qemu/host-utils.h |    2 +-
 qemu-img.c                |    6 ------
 qga/main.c                |    1 -
 qmp.c                     |    4 ++--
 stubs/gdbstub.c           |    4 +++-
 tcg/tcg.c                 |    2 +-
 tests/test-int128.c       |   15 ++++++++++++++-
 util/iov.c                |    9 +--------
 vl.c                      |    4 ----
 12 files changed, 29 insertions(+), 34 deletions(-)

