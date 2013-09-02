Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGS2r-0001BE-MX
	for mharc-qemu-trivial@gnu.org; Mon, 02 Sep 2013 07:11:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGS2k-0000wb-Tm
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:11:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGS2g-00008b-An
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:11:38 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41134)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VGS2V-0008Ve-1z; Mon, 02 Sep 2013 07:11:23 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 2C3134023F;
	Mon,  2 Sep 2013 15:11:21 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5EE7020E;
	Mon,  2 Sep 2013 15:01:57 +0400 (MSK)
Received: (nullmailer pid 14637 invoked by uid 1000);
	Mon, 02 Sep 2013 11:01:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Mon,  2 Sep 2013 15:01:27 +0400
Message-Id: <1378119695-14568-8-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 07/15] configure: Don't write .pyc files by
	default (python -B)
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
X-List-Received-Date: Mon, 02 Sep 2013 11:11:44 -0000

From: Stefan Weil <sw@weilnetz.de>

When a Python script is run, Python normally writes bytecode into a .pyc file.
QEMU's build process uses several Python scripts which are called from
configure or make.

The generated .pyc files take disk space without being of much use, because
those scripts are short, not time critical and only called a few times.

Python's option -B disables writing of .pyc files. QEMU now uses "python -B"
as default, but it is still possible to choose a different call by passing
--python=PYTHON to configure.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 03157c7..391b204 100755
--- a/configure
+++ b/configure
@@ -568,7 +568,7 @@ fi
 
 : ${make=${MAKE-make}}
 : ${install=${INSTALL-install}}
-: ${python=${PYTHON-python}}
+: ${python=${PYTHON-python -B}}
 : ${smbd=${SMBD-/usr/sbin/smbd}}
 
 # Default objcc to clang if available, otherwise use CC
@@ -1349,7 +1349,7 @@ fi
 
 # Note that if the Python conditional here evaluates True we will exit
 # with status 1 which is a shell 'false' value.
-if ! "$python" -c 'import sys; sys.exit(sys.version_info < (2,4) or sys.version_info >= (3,))'; then
+if ! $python -c 'import sys; sys.exit(sys.version_info < (2,4) or sys.version_info >= (3,))'; then
   error_exit "Cannot use '$python', Python 2.4 or later is required." \
       "Note that Python 3 or later is not yet supported." \
       "Use --python=/path/to/python to specify a supported Python."
-- 
1.7.10.4


