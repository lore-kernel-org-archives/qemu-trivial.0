Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TUfts-0008Ht-9A
	for mharc-qemu-trivial@gnu.org; Sat, 03 Nov 2012 11:44:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TUftp-00089v-CQ
	for qemu-trivial@nongnu.org; Sat, 03 Nov 2012 11:44:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>) id 1TUfto-0001Rk-E6
	for qemu-trivial@nongnu.org; Sat, 03 Nov 2012 11:44:41 -0400
Received: from mail-la0-f45.google.com ([209.85.215.45]:55955)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <blauwirbel@gmail.com>)
	id 1TUftm-0001Ob-3K; Sat, 03 Nov 2012 11:44:38 -0400
Received: by mail-la0-f45.google.com with SMTP id m13so3029056lah.4
	for <multiple recipients>; Sat, 03 Nov 2012 08:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=2J0uHU7irncPZU6WqSKMZnMhKhJi3Nw0b4CZqw8E6Jc=;
	b=pTI4gt0+Ci927QMtjY1HbN4vnNY/+3zXmMNOAkH5z30WRzJE2PVGWVueXaGmkv/dFB
	V3lIe7zrEd8Z9ZMtDhbnJg4UkvNNgRdRatRtMqaZdoVfuBINIht/xLdZ0q6bkdSNazKB
	GMFLkpaf5PyfcA6g4tg9ex/jm1gCa27tBoj5O52m0SW/d5C+aZgtbskw62Y4ALVp0P/L
	qaFGe0E3DWqBuF4Q/ZEslciJ5UAPDMyRfKfMclFzXCqKOSuv+7xhsHD3zBhI38vXMUt0
	5UOr9X3Hc1eyixtTrW+jUBQ1pHUgVxD7gTdunKhVZmNfmXmj6VsYVxSyvz/12Si2upG3
	jmRA==
Received: by 10.152.132.3 with SMTP id oq3mr4503819lab.18.1351957476664;
	Sat, 03 Nov 2012 08:44:36 -0700 (PDT)
Received: from localhost.localdomain (blueswirl.broker.freenet6.net.
	[2001:5c0:1000:b::b867])
	by mx.google.com with ESMTPS id eo4sm4116378lbb.5.2012.11.03.08.44.33
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 03 Nov 2012 08:44:35 -0700 (PDT)
From: Blue Swirl <blauwirbel@gmail.com>
To: qemu-devel@nongnu.org
Date: Sat,  3 Nov 2012 15:44:19 +0000
Message-Id: <ca6867dfc9e12d5bbd88a18e2402c63714fe5c01.1351957436.git.blauwirbel@gmail.com>
X-Mailer: git-send-email 1.7.2.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.215.45
Cc: qemu-trivial@nongnu.org, blauwirbel@gmail.com
Subject: [Qemu-trivial] [PATCH] libseccomp: require version 1.0.0
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
X-List-Received-Date: Sat, 03 Nov 2012 15:44:42 -0000

Debian Wheezy has version 0.1.0 which is not compatible, avoid it.

Signed-off-by: Blue Swirl <blauwirbel@gmail.com>
---
 configure |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/configure b/configure
index 8e70cbb..b6948f7 100755
--- a/configure
+++ b/configure
@@ -1383,7 +1383,7 @@ fi
 # libseccomp check
 
 if test "$seccomp" != "no" ; then
-    if $pkg_config libseccomp --modversion >/dev/null 2>&1; then
+    if $pkg_config --atleast-version=1.0.0 libseccomp --modversion >/dev/null 2>&1; then
         LIBS=`$pkg_config --libs libseccomp`
 	seccomp="yes"
     else
-- 
1.7.2.5


