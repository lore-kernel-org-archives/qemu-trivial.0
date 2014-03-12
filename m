Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WNjie-0007X3-II
	for mharc-qemu-trivial@gnu.org; Wed, 12 Mar 2014 10:01:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38257)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1WNjiY-0007Ip-90
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 10:01:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1WNjiT-00006t-IL
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 10:01:10 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:33551 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1WNjiD-0008SY-NQ; Wed, 12 Mar 2014 10:00:49 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1WNjiR-00038b-Eq; Wed, 12 Mar 2014 15:01:03 +0100
From: alex.bennee@linaro.org
To: qemu-devel@nongnu.org
Date: Wed, 12 Mar 2014 14:00:49 +0000
Message-Id: <1394632851-17070-3-git-send-email-alex.bennee@linaro.org>
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
Subject: [Qemu-trivial] [PULL 2/4] .travis.yml: re-enable lttng user space
	trace test
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
X-List-Received-Date: Wed, 12 Mar 2014 14:01:15 -0000

From: Alex Bennée <alex.bennee@linaro.org>

This build was disabled while the lttng tracing was broken. Stefan has
recently submitted a pull request with it re-enabled.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

diff --git a/.travis.yml b/.travis.yml
index 286cf62..1d78421 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -69,8 +69,7 @@ matrix:
            EXTRA_CONFIG="--enable-trace-backend=ftrace"
            TEST_CMD=""
       compiler: gcc
-    # This disabled make check for the ftrace backend which needs more setting up
-    # Currently broken on 12.04 due to mis-packaged liburcu and changed API, will be pulled.
-    #- env: TARGETS=i386-softmmu,x86_64-softmmu
-    #       EXTRA_PKGS="liblttng-ust-dev liburcu-dev"
-    #       EXTRA_CONFIG="--enable-trace-backend=ust"
+    - env: TARGETS=i386-softmmu,x86_64-softmmu
+          EXTRA_PKGS="liblttng-ust-dev liburcu-dev"
+          EXTRA_CONFIG="--enable-trace-backend=ust"
+      compiler: gcc
-- 
1.9.0


