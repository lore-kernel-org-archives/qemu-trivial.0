Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WNjic-0007RI-1J
	for mharc-qemu-trivial@gnu.org; Wed, 12 Mar 2014 10:01:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38244)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1WNjiT-0007A5-UA
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 10:01:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1WNjiP-00005t-05
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 10:01:05 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:33549 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1WNjiD-0008SS-NK; Wed, 12 Mar 2014 10:00:49 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1WNjiR-00038b-1o; Wed, 12 Mar 2014 15:01:03 +0100
From: alex.bennee@linaro.org
To: qemu-devel@nongnu.org
Date: Wed, 12 Mar 2014 14:00:47 +0000
Message-Id: <1394632851-17070-1-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 1.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PULL 0/4] Travis Updates
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
X-List-Received-Date: Wed, 12 Mar 2014 14:01:10 -0000

From: Alex Bennée <alex.bennee@linaro.org>

No changes from the original version posted except to add Stefan's
reviewed-by tags. I thought it was worth submitting this before we
froze for 2.0!

The following changes since commit be813ef02d18ba58e1ff32f1706bcacb88f1f764:

  Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2014-03-11 19:52:32 +0000)

are available in the git repository at:


  git@github.com:stsquad/qemu.git travis-updates

for you to fetch changes up to 3e6fa9a5bb773d0d7d22d9aea0495d91404dfd3d:

  .travis.yml: add IRC notifications for build failures (2014-03-12 13:52:27 +0000)

----------------------------------------------------------------
Alex Bennée (4):
      .travis.yml: add a new build target with non-core devlibs
      .travis.yml: re-enable lttng user space trace test
      .travis.yml: trivial whitespace fixup
      .travis.yml: add IRC notifications for build failures

 .travis.yml | 53 +++++++++++++++++++++++++++++++----------------------
 1 file changed, 31 insertions(+), 22 deletions(-)

