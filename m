Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T3Zgp-00069z-M1
	for mharc-qemu-trivial@gnu.org; Mon, 20 Aug 2012 17:39:15 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T3Zgn-00066M-Aw
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2012 17:39:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T3Zgl-0000O4-PS
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2012 17:39:13 -0400
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:34751
	helo=smtp.smtpout.orange.fr) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <yann.morin.1998@free.fr>) id 1T3Zgl-0000Ni-Io
	for qemu-trivial@nongnu.org; Mon, 20 Aug 2012 17:39:11 -0400
Received: from treguer.bzh.lan ([90.32.34.169]) by mwinf5d54 with ME
	id p9f91j00M3ewyLA039fAS3; Mon, 20 Aug 2012 23:39:10 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: qemu-trivial@nongnu.org
Date: Mon, 20 Aug 2012 23:39:09 +0200
Message-Id: <1345498749-16769-3-git-send-email-yann.morin.1998@free.fr>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1345498749-16769-1-git-send-email-yann.morin.1998@free.fr>
References: <1345498749-16769-1-git-send-email-yann.morin.1998@free.fr>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 80.12.242.123
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [Qemu-trivial] [PATCH 3/3] configure: fix detection for Spice libs
	when static linking
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
X-List-Received-Date: Mon, 20 Aug 2012 21:39:14 -0000

Currently, configure uses the same code-path to check for Spice libraries,
whether we are doing a static or dynamic build.

Fix that by pasing '--static --libs' for pkg-config when a static build
is attempted.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 configure |    6 +++++-
 1 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index 5b52f9d..4d3aea4 100755
--- a/configure
+++ b/configure
@@ -2702,7 +2702,11 @@ if test "$spice" != "no" ; then
 int main(void) { spice_server_new(); return 0; }
 EOF
   spice_cflags=$($pkg_config --cflags spice-protocol spice-server 2>/dev/null)
-  spice_libs=$($pkg_config --libs spice-protocol spice-server 2>/dev/null)
+  if test "$static" = "yes" ; then
+    spice_libs=$($pkg_config --static --libs spice-protocol spice-server 2>/dev/null)
+  else
+    spice_libs=$($pkg_config --libs spice-protocol spice-server 2>/dev/null)
+  fi
   if $pkg_config --atleast-version=0.8.2 spice-server >/dev/null 2>&1 && \
      $pkg_config --atleast-version=0.8.1 spice-protocol > /dev/null 2>&1 && \
      compile_prog "$spice_cflags" "$spice_libs" ; then
-- 
1.7.2.5


