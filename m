Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WNjiZ-0007LF-CJ
	for mharc-qemu-trivial@gnu.org; Wed, 12 Mar 2014 10:01:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38216)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1WNjiS-00077R-It
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 10:01:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1WNjiN-0008V4-Kw
	for qemu-trivial@nongnu.org; Wed, 12 Mar 2014 10:01:04 -0400
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:33550 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1WNjiD-0008SV-NE; Wed, 12 Mar 2014 10:00:49 -0400
Received: from localhost ([127.0.0.1] helo=zen.linaro.local)
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1WNjiR-00038b-8P; Wed, 12 Mar 2014 15:01:03 +0100
From: alex.bennee@linaro.org
To: qemu-devel@nongnu.org
Date: Wed, 12 Mar 2014 14:00:48 +0000
Message-Id: <1394632851-17070-2-git-send-email-alex.bennee@linaro.org>
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
Subject: [Qemu-trivial] [PULL 1/4] .travis.yml: add a new build target with
	non-core devlibs
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
X-List-Received-Date: Wed, 12 Mar 2014 14:01:09 -0000

From: Alex Bennée <alex.bennee@linaro.org>

The current builds don't include all the features which are
auto-detected and then disabled when the appropriate test packages don't
exist. I've added another target that enables all known additional
packages for increased coverage. I didn't add it to the core package
list to reduce build time.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>

diff --git a/.travis.yml b/.travis.yml
index c7ff4da..286cf62 100644
--- a/.travis.yml
+++ b/.travis.yml
@@ -46,6 +46,10 @@ matrix:
     - env: TARGETS=i386-softmmu,x86_64-softmmu
            EXTRA_CONFIG="--enable-debug --enable-tcg-interpreter"
       compiler: gcc
+    # All the extra -dev packages
+    - env: TARGETS=i386-softmmu,x86_64-softmmu
+           EXTRA_PKGS="libaio-dev libcap-ng-dev libattr1-dev libbrlapi-dev uuid-dev libusb-1.0.0-dev"
+      compiler: gcc
     # Currently configure doesn't force --disable-pie
     - env: TARGETS=i386-softmmu,x86_64-softmmu
            EXTRA_CONFIG="--enable-gprof --enable-gcov --disable-pie"
-- 
1.9.0


