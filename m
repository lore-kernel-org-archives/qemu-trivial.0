Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXZRm-0005i3-BF
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 13:36:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZRf-0005Vl-Dr
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:36:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XXZRa-0003lH-Gz
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 13:36:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:58669)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XXZRQ-0003h4-1J; Fri, 26 Sep 2014 13:36:24 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 9B03F46F3D;
	Fri, 26 Sep 2014 21:36:17 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 519086C6;
	Fri, 26 Sep 2014 21:36:17 +0400 (MSK)
Received: (nullmailer pid 29102 invoked by uid 1000);
	Fri, 26 Sep 2014 17:36:17 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 26 Sep 2014 21:36:04 +0400
Message-Id: <1411752976-29051-1-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 00/12] Trivial patches for 2014-09-26
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
X-List-Received-Date: Fri, 26 Sep 2014 17:36:44 -0000

Here goes another trivial-patches pull request.  Cleanups,
travis.yml changes, coding style changes and a little
bugfix for stable (avoiding running qom test twice).

Please consider applying/pulling.

Thanks,

/mjt

The following changes since commit da1c4ec88ad50c2b73d5fe960c373693f7337c=
c9:

  Merge remote-tracking branch 'remotes/stefanha/tags/tracing-pull-reques=
t' into staging (2014-09-26 12:26:07 +0100)

are available in the git repository at:

  git://git.corpit.ru/qemu.git tags/trivial-patches-2014-09-26

for you to fetch changes up to e5048d15ce6addae869f23514b2a1f0d4466418a:

  os-posix: report error message when lock file failed (2014-09-26 21:21:=
09 +0400)

----------------------------------------------------------------
trivial patches for 2014-09-26

----------------------------------------------------------------
Adrian-Ken Rueegsegger (1):
      vmxcap: Update according to SDM of September 2014

Alex Benn=C3=A9e (4):
      .travis.yml: add more linux-user to the build matrix
      .travis.yml: make the make slightly more parallel
      .travis.yml: pre-seed sub-modules for speed
      .travis.yml: remove "make check" from main matrix

Eric Blake (3):
      qapi: Consistent whitespace in tests/Makefile
      qapi: Ignore files created during make check
      qapi: Update docs given recent event, spacing fixes

Gonglei (3):
      os-posix: change tab to space avoid violating coding style
      os-posix: remove confused errno
      os-posix: report error message when lock file failed

Michael Roth (1):
      tests: avoid running duplicate qom-tests

 .travis.yml            |   55 +++++++++++++++++---------
 docs/qapi-code-gen.txt |  100 ++++++++++++++++++++++++++++++++++++++----=
------
 os-posix.c             |   83 ++++++++++++++++++++++------------------
 scripts/kvm/vmxcap     |   10 +++--
 tests/.gitignore       |    3 ++
 tests/Makefile         |   35 +++++++++--------
 6 files changed, 189 insertions(+), 97 deletions(-)

