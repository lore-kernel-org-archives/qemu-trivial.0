Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y3Xv5-0007oJ-Ij
	for mharc-qemu-trivial@gnu.org; Tue, 23 Dec 2014 17:27:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55731)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Y3Xux-0007Ya-DL
	for qemu-trivial@nongnu.org; Tue, 23 Dec 2014 17:27:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Y3Xur-0001zP-A0
	for qemu-trivial@nongnu.org; Tue, 23 Dec 2014 17:27:03 -0500
Received: from mnementh.archaic.org.uk ([81.2.115.146]:47682)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1Y3Xur-0001yz-43
	for qemu-trivial@nongnu.org; Tue, 23 Dec 2014 17:26:57 -0500
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.80)
	(envelope-from <pm215@archaic.org.uk>)
	id 1Y3Xup-0004gc-QV; Tue, 23 Dec 2014 22:26:55 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 23 Dec 2014 22:26:52 +0000
Message-Id: <1419373615-17989-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH 0/3] miscellaneous minor clang fixes
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
X-List-Received-Date: Tue, 23 Dec 2014 22:27:09 -0000

This is a collection of three miscellaneous minor fixes for
clang compile warnings, which I think could reasonably go via
the -trivial tree. The map_exec patch has been on list and
reviewed before; the other two are new.

Peter Maydell (2):
  tests/hd-geo-test.c: Remove unused test_image variable
  migration/qemu-file.c: Don't shift left into sign bit

SeokYeon Hwang (1):
  translate-all: Mark map_exec() with the 'unused' attribute

 migration/qemu-file.c | 2 +-
 tests/hd-geo-test.c   | 2 --
 translate-all.c       | 4 ++--
 3 files changed, 3 insertions(+), 5 deletions(-)

-- 
1.9.1


