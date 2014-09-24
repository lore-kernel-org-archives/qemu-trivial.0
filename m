Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XWjaR-0005oV-Kn
	for mharc-qemu-trivial@gnu.org; Wed, 24 Sep 2014 06:14:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55558)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1XWjaL-0005mV-Ib
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 06:14:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1XWjaF-0006BJ-Uz
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 06:14:09 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:48774 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1XWjaF-0006AC-Oo; Wed, 24 Sep 2014 06:14:03 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1XWjxB-0005zG-IL; Wed, 24 Sep 2014 12:37:45 +0200
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-trivial@nongnu.org
Date: Wed, 24 Sep 2014 11:13:54 +0100
Message-Id: <1411553636-24717-3-git-send-email-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1411553636-24717-1-git-send-email-alex.bennee@linaro.org>
References: <1411553636-24717-1-git-send-email-alex.bennee@linaro.org>
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
Subject: [Qemu-trivial] [PATCH v2 2/4] .travis.yml: make the make slightly
	more parallel
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
X-List-Received-Date: Wed, 24 Sep 2014 10:14:14 -0000

The Travis VMs have 1.5 cores so we might as well make some use of the
paralellism.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alexander Graf <agraf@suse.de>

diff --git a/.travis.yml b/.travis.yml
index 72cfc9f..f113339 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -41,7 +41,10 @@ before_install:
   - git submodule update --init --recursive
   - sudo apt-get update -qq
   - sudo apt-get install -qq ${CORE_PKGS} ${NET_PKGS} ${GUI_PKGS} ${EXTRA_PKGS}
-script: "./configure --target-list=${TARGETS} ${EXTRA_CONFIG} && make && ${TEST_CMD}"
+before_script:
+  - ./configure --target-list=${TARGETS} --enable-debug-tcg ${EXTRA_CONFIG}
+script:
+  - make -j2 && {TEST_CMD}
 matrix:
   # We manually include a number of additional build for non-standard bits
   include:
-- 
2.1.0


