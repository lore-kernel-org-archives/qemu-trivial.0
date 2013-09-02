Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGRti-0001Xd-JD
	for mharc-qemu-trivial@gnu.org; Mon, 02 Sep 2013 07:02:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45134)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGRtb-0001LA-V5
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:02:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1VGRtX-0005Pl-7T
	for qemu-trivial@nongnu.org; Mon, 02 Sep 2013 07:02:11 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:37794)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1VGRtN-0005Lg-Q0; Mon, 02 Sep 2013 07:01:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 1658940236;
	Mon,  2 Sep 2013 15:01:57 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id EDDE920F;
	Mon,  2 Sep 2013 15:01:56 +0400 (MSK)
Received: (nullmailer pid 14630 invoked by uid 1000);
	Mon, 02 Sep 2013 11:01:56 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: aliguori@us.ibm.com
Date: Mon,  2 Sep 2013 15:01:24 +0400
Message-Id: <1378119695-14568-5-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1378119695-14568-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 04/15] configure: disable clang
	-Wstring-plus-int warning
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
X-List-Received-Date: Mon, 02 Sep 2013 11:02:17 -0000

From: Peter Maydell <peter.maydell@linaro.org>

Some versions of clang will warn about adding integers to strings:

disas/i386.c:4753:23: error: adding 'char' to a string does not append
      to the string [-Werror,-Wstring-plus-int]
      oappend ("%es:" + intel_syntax);
               ~~~~~~~^~~~~~~~~~~~~~
disas/i386.c:4753:23: note: use array indexing to silence this warning
      oappend ("%es:" + intel_syntax);
                      ^
               &      [             ]

disas/i386.c uses this idiom to to skip a "%" prefix if using intel
rather than AT&T syntax. This seems like a reasonable  thing to do,
and I don't think anybody contributing to QEMU is likely to believe
that '+' is a string concatenation operator in C, so just disable
-Wstring-plus-int.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 configure |    1 +
 1 file changed, 1 insertion(+)

diff --git a/configure b/configure
index 0a55c20..03157c7 100755
--- a/configure
+++ b/configure
@@ -1204,6 +1204,7 @@ gcc_flags="-Wformat-security -Wformat-y2k -Winit-self -Wignored-qualifiers $gcc_
 gcc_flags="-Wmissing-include-dirs -Wempty-body -Wnested-externs $gcc_flags"
 gcc_flags="-Wendif-labels $gcc_flags"
 gcc_flags="-Wno-initializer-overrides $gcc_flags"
+gcc_flags="-Wno-string-plus-int $gcc_flags"
 # Note that we do not add -Werror to gcc_flags here, because that would
 # enable it for all configure tests. If a configure test failed due
 # to -Werror this would just silently disable some features,
-- 
1.7.10.4


