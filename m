Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WNjic-0007S1-AS
	for mharc-qemu-trivial@gnu.org; Wed, 12 Mar 2014 10:01:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1WNjiT-00079h-Dt
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 10:01:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1WNjiN-0008VH-Tz
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 10:01:05 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:33553 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1WNjiE-0008Sf-0X; Wed, 12 Mar 2014 10:00:50 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1WNjiR-00038b-TH; Wed, 12 Mar 2014 15:01:03 +0100
From: alex.bennee@linaro.org
To: qemu-devel@nongnu.org
Date: Wed, 12 Mar 2014 14:00:51 +0000
Message-Id: <1394632851-17070-5-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 1.9.0
In-Reply-To: <1394632851-17070-1-git-send-email-alex.bennee@linaro.org>
References: <1394632851-17070-1-git-send-email-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PULL 4/4] .travis.yml: add IRC notifications for
	build failures
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
X-List-Received-Date: Wed, 12 Mar 2014 14:01:11 -0000

From: Alex Bennée <alex.bennee@linaro.org>

I'm trying to avoid spamming the IRC channel (not overly likely as
builds take a while). So failure will always be reported but if the
build continues to work then the IRC notifications will be quiet.

Note any GitHub based repository with Travis enabled will use this
notification. If it proves to be too spammy we may want to ask users not
to use Travis themselves although this seems sub-optimal.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

diff --git a/.travis.yml b/.travis.yml
index 0dbf2da..04da973 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -4,6 +4,12 @@ python:
 compiler:
   - gcc
   - clang
+notifications:
+  irc:
+    channels:
+      - "irc.oftc.net#qemu"
+    on_success: change
+    on_failure: always
 env:
   global:
     - TEST_CMD="make check"
-- 
1.9.0


