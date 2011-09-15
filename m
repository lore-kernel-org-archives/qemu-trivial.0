Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R49vK-0005fe-JZ
	for mharc-qemu-trivial@gnu.org; Thu, 15 Sep 2011 07:16:06 -0400
Received: from eggs.gnu.org ([140.186.70.92]:53421)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1R49vI-0005au-Mj
	for qemu-trivial@nongnu.org; Thu, 15 Sep 2011 07:16:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1R49vH-0006xU-M4
	for qemu-trivial@nongnu.org; Thu, 15 Sep 2011 07:16:04 -0400
Received: from mnementh.archaic.org.uk ([81.2.115.146]:49953)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1R49vC-0006vr-HK; Thu, 15 Sep 2011 07:15:58 -0400
Received: from pm215 by mnementh.archaic.org.uk with local (Exim 4.72)
	(envelope-from <pm215@archaic.org.uk>)
	id 1R49vA-0000Ae-6s; Thu, 15 Sep 2011 12:15:56 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu, 15 Sep 2011 12:15:56 +0100
Message-Id: <1316085356-632-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 81.2.115.146
Cc: qemu-trivial@nongnu.org, patches@linaro.org
Subject: [Qemu-trivial] [PATCH] configure: Make missing pkg-config an error
	rather than a warning
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
X-List-Received-Date: Thu, 15 Sep 2011 11:16:05 -0000

If pkg-config doesn't exist then make configure fail immediately
with a useful error message. Now that glib is a required dependency,
proceeding despite the missing pkg-config will just cause us to
fail later with a misleading message about glib not being present.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 configure |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index 0875f95..6c2839d 100755
--- a/configure
+++ b/configure
@@ -1339,8 +1339,8 @@ fi
 # pkg-config probe
 
 if ! has $pkg_config; then
-  echo warning: proceeding without "$pkg_config" >&2
-  pkg_config=/bin/false
+  echo "Error: pkg-config binary '$pkg_config' not found"
+  exit 1
 fi
 
 ##########################################
-- 
1.7.1


