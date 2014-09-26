Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XXaJM-0004xp-9V
	for mharc-qemu-trivial@gnu.org; Fri, 26 Sep 2014 14:32:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46758)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1XXaJE-0004m9-B1
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 14:32:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1XXaJ4-0002jm-3y
	for qemu-trivial@nongnu.org; Fri, 26 Sep 2014 14:32:00 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:36685 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1XXaJ3-0002in-Tp; Fri, 26 Sep 2014 14:31:50 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1XXagW-0004kU-Ev; Fri, 26 Sep 2014 20:56:04 +0200
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-trivial@nongnu.org
Date: Fri, 26 Sep 2014 19:31:35 +0100
Message-Id: <1411756299-15428-1-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: iggy@theiggy.com, peter.maydell@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, agraf@suse.de
Subject: [Qemu-trivial] [PATCH v3 0/4] A number of Travis CI tweaks
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
X-List-Received-Date: Fri, 26 Sep 2014 18:32:07 -0000

Hi,

Only one change in this set to ensure the second patch bisects
cleanly. I've also added the additional Reviewed-by tags.

Please apply to the trivial tree.

Alex Bennée (4):
  .travis.yml: add more linux-user to the build matrix
  .travis.yml: make the make slightly more parallel
  .travis.yml: pre-seed sub-modules for speed
  .travis.yml: remove "make check" from main matrix

 .travis.yml | 55 +++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 18 deletions(-)

-- 
2.1.0


