Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c09CE-0002Uq-4S
	for mharc-qemu-trivial@gnu.org; Fri, 28 Oct 2016 11:35:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60179)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09CB-0002S1-Ia
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:35:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1c09CA-0003l5-EZ
	for qemu-trivial@nongnu.org; Fri, 28 Oct 2016 11:35:51 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:59693)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1c09C4-0003hy-Qq; Fri, 28 Oct 2016 11:35:44 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 01AB44373A;
	Fri, 28 Oct 2016 18:35:44 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 35E79B62;
	Fri, 28 Oct 2016 18:18:58 +0300 (MSK)
Received: (nullmailer pid 6091 invoked by uid 1000);
	Fri, 28 Oct 2016 15:18:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Stefan Weil <sw@weilnetz.de>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Fri, 28 Oct 2016 18:18:54 +0300
Message-Id: <630b210b9abbf362905a2096c22c5eb1d6224e77.1477667878.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
References: <cover.1477667878.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 23/23] Fix build for less common build
 directories names
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Oct 2016 15:35:52 -0000

From: Stefan Weil <sw@weilnetz.de>

scripts/tracetool generates a C preprocessor macro from the name of the
build directory. Any characters which are possible in a directory name
but not allowed in a macro name must be substituted, otherwise builds
will fail.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 scripts/tracetool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/tracetool.py b/scripts/tracetool.py
index 629b259..fe9c9e9 100755
--- a/scripts/tracetool.py
+++ b/scripts/tracetool.py
@@ -70,7 +70,7 @@ def make_group_name(filename):
 
     if dirname == "":
         return "common"
-    return re.sub(r"/|-", "_", dirname)
+    return re.sub(r"[^A-Za-z0-9]", "_", dirname)
 
 def main(args):
     global _SCRIPT
-- 
2.1.4


