Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dwEVV-0004x0-Re
	for mharc-qemu-trivial@gnu.org; Sun, 24 Sep 2017 17:32:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45761)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEVS-0004sq-Sx
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:32:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1dwEVS-0000LV-0E
	for qemu-trivial@nongnu.org; Sun, 24 Sep 2017 17:32:06 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60671)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1dwEVN-0000Hr-5T; Sun, 24 Sep 2017 17:32:01 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id C7B2E41C95;
	Mon, 25 Sep 2017 00:31:59 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id AF46EC37;
	Mon, 25 Sep 2017 00:22:56 +0300 (MSK)
Received: (nullmailer pid 28282 invoked by uid 1000);
	Sun, 24 Sep 2017 21:22:52 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Michael Tokarev <mjt@tls.msk.ru>, qemu-trivial@nongnu.org
Date: Mon, 25 Sep 2017 00:22:39 +0300
Message-Id: <467e6372f88cec9f9f70d1d32703c03ee40bf083.1506288070.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
References: <cover.1506288070.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 21/31] remove trailing whitespace from
 qemu-options.hx
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
X-List-Received-Date: Sun, 24 Sep 2017 21:32:07 -0000

Remove trailing whitespace in qemu-options documentation, as it causes
reproducibility issues depending on the echo implementation used by
the Makefile.

Reported-By: Vagrant Cascadian <vagrant@debian.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 qemu-options.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 77859a248c..39225ae6c3 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -284,8 +284,8 @@ Set default value of @var{driver}'s property @var{prop} to @var{value}, e.g.:
 qemu-system-i386 -global ide-hd.physical_block_size=4096 disk-image.img
 @end example
 
-In particular, you can use this to set driver properties for devices which are 
-created automatically by the machine model. To create a device which is not 
+In particular, you can use this to set driver properties for devices which are
+created automatically by the machine model. To create a device which is not
 created automatically and set properties on it, use -@option{device}.
 
 -global @var{driver}.@var{prop}=@var{value} is shorthand for -global
-- 
2.11.0


