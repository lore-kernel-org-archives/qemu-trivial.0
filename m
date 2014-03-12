Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WNjvD-0001KA-8o
	for mharc-qemu-trivial@gnu.org; Wed, 12 Mar 2014 10:14:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1WNjv6-00017g-Q9
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 10:14:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1WNjv1-0004zf-Qx
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 10:14:08 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:33637 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1WNjuq-0004vt-In; Wed, 12 Mar 2014 10:13:52 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1WNjv4-0003Ek-Kl; Wed, 12 Mar 2014 15:14:06 +0100
From: alex.bennee@linaro.org
To: qemu-devel@nongnu.org
Date: Wed, 12 Mar 2014 14:13:49 +0000
Message-Id: <1394633633-18211-1-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 1.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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
X-List-Received-Date: Wed, 12 Mar 2014 14:14:13 -0000

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

