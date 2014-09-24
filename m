Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XWjaX-0005yr-Ds
	for mharc-qemu-trivial@gnu.org; Wed, 24 Sep 2014 06:14:21 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55586)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1XWjaO-0005mY-3T
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 06:14:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1XWjaF-0006BE-UD
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 06:14:12 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:48770 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1XWjaF-0006A6-Nf; Wed, 24 Sep 2014 06:14:03 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1XWjx9-0005zG-Rc; Wed, 24 Sep 2014 12:37:44 +0200
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-trivial@nongnu.org
Date: Wed, 24 Sep 2014 11:13:52 +0100
Message-Id: <1411553636-24717-1-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.1.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, agraf@suse.de
Subject: [Qemu-trivial] [PATCH v2 0/4] A number of Travis CI tweaks
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
X-List-Received-Date: Wed, 24 Sep 2014 10:14:19 -0000

Hi,

The patches I posted last week have been reviewed and I've given them
a good test on my tree. My last test failed but only because master
has introduced a regression. This was found by the tests in master but
missed due to the noise of GTester hangs which are mitigated by
reducing the times we run "make check" in this patch series.

Please apply to the trivial tree so we can get the master branch
testing a little less noisy soon ;-)

Alex Bennée (4):
  .travis.yml: add more linux-user to the build matrix
  .travis.yml: make the make slightly more parallel
  .travis.yml: pre-seed sub-modules for speed
  .travis.yml: remove "make check" from main matrix

 .travis.yml | 55 +++++++++++++++++++++++++++++++++++++------------------
 1 file changed, 37 insertions(+), 18 deletions(-)

-- 
2.1.0


