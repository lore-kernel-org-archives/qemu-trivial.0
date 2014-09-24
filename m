Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XWjaV-0005wC-6H
	for mharc-qemu-trivial@gnu.org; Wed, 24 Sep 2014 06:14:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1XWjaN-0005mX-Nt
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 06:14:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1XWjaG-0006Bh-FA
	for qemu-trivial@nongnu.org; Wed, 24 Sep 2014 06:14:11 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:48777 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1XWjaG-0006AG-9j; Wed, 24 Sep 2014 06:14:04 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1XWjxB-0005zG-Vw; Wed, 24 Sep 2014 12:37:46 +0200
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-trivial@nongnu.org
Date: Wed, 24 Sep 2014 11:13:55 +0100
Message-Id: <1411553636-24717-4-git-send-email-alex.bennee@linaro.org>
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
Subject: [Qemu-trivial] [PATCH v2 3/4] .travis.yml: pre-seed sub-modules for
	speed
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
X-List-Received-Date: Wed, 24 Sep 2014 10:14:16 -0000

A significant portion of the build time is spent initialising all the
sub-modules we use in the source tree. Often this is almost as long as
the build itself. By pre-seeding the .git/modules tree this will
hopefully improve things.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Alexander Graf <agraf@suse.de>

---
v2
  - use wget -O - | tar as suggested by agraf

diff --git a/.travis.yml b/.travis.yml
index f113339..b9025be 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -37,7 +37,11 @@ env:
     - TARGETS=unicore32-softmmu,unicore32-linux-user
     # Group remaining softmmu only targets into one build
     - TARGETS=lm32-softmmu,moxie-softmmu,tricore-softmmu,xtensa-softmmu,xtensaeb-softmmu
+git:
+  # we want to do this ourselves
+  submodules: false
 before_install:
+  - wget -O - http://people.linaro.org/~alex.bennee/qemu-submodule-git-seed.tar.xz | tar -xvJ
   - git submodule update --init --recursive
   - sudo apt-get update -qq
   - sudo apt-get install -qq ${CORE_PKGS} ${NET_PKGS} ${GUI_PKGS} ${EXTRA_PKGS}
-- 
2.1.0


