Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UJezu-0007M1-2s
	for mharc-qemu-trivial@gnu.org; Sun, 24 Mar 2013 03:05:42 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1UJezp-0007Gb-TY
	for qemu-trivial@nongnu.org; Sun, 24 Mar 2013 03:05:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1UJezk-0004jB-Bw
	for qemu-trivial@nongnu.org; Sun, 24 Mar 2013 03:05:37 -0400
Received: from mail-pb0-f54.google.com ([209.85.160.54]:33362)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>)
	id 1UJezb-0004cX-GF; Sun, 24 Mar 2013 03:05:23 -0400
Received: by mail-pb0-f54.google.com with SMTP id jt11so1001768pbb.41
	for <multiple recipients>; Sun, 24 Mar 2013 00:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=tqYR8JOTRFmlouKT43MkGfO/5F12zaityle9YPxiisU=;
	b=CIU6vBn8DVsm/6RioWTL5NBMMD92DTrYWT+7s7juEpxlaBwn1T8dEU7qFhlUl8DXy5
	R9x5nzKXqZk7QU5avwqMYZUF7iocCYkS7DoYDjUvrwUYiBm4b28iscGQ2/130x7IV87Q
	FfWeHIKczE/ketwrDOY4Rkn9v4mWpa5pPg7AdWwU+EDDYmApDbt9uqXQTq0P+ihIQq9p
	sU2CjBiAix0NTpNm3KB8ukhqkB9X3cYYtyavhnbS4OVcZQzm5npadKnblqiozq+IXR9y
	tQE3T4ZDj7DpBxwiasc4r1Tc1qUQoCTauvd28sYv6ZrrXpVA2fpEFKyrPbmL1xEnDS/z
	TxJA==
X-Received: by 10.68.197.133 with SMTP id iu5mr10807383pbc.195.1364108722554; 
	Sun, 24 Mar 2013 00:05:22 -0700 (PDT)
Received: from localhost.localdomain ([220.181.73.114])
	by mx.google.com with ESMTPS id z1sm8721297pbw.19.2013.03.24.00.05.19
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 24 Mar 2013 00:05:21 -0700 (PDT)
From: riegamaths@gmail.com
To: qemu-devel <qemu-devel@nongnu.org>
Date: Sun, 24 Mar 2013 15:05:27 +0800
Message-Id: <1364108727-14445-1-git-send-email-riegamaths@gmail.com>
X-Mailer: git-send-email 1.8.1.5
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.160.54
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	Dunrong Huang <huangdr@cloud-times.com>
Subject: [Qemu-trivial] [PATCH] configure: show debug-info option in --help
	output
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
X-List-Received-Date: Sun, 24 Mar 2013 07:05:41 -0000

From: Dunrong Huang <huangdr@cloud-times.com>

"--enable-debug-info" and "--disable-debug-info" were not shown
in --help output.

Signed-off-by: Dunrong Huang <huangdr@cloud-times.com>
---
 configure | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configure b/configure
index f2af714..61e71fa 100755
--- a/configure
+++ b/configure
@@ -1057,6 +1057,8 @@ echo "  --localstatedir=PATH     install local state in PATH"
 echo "  --with-confsuffix=SUFFIX suffix for QEMU data inside datadir and sysconfdir [$confsuffix]"
 echo "  --enable-debug-tcg       enable TCG debugging"
 echo "  --disable-debug-tcg      disable TCG debugging (default)"
+echo "  --enable-debug-info       enable debugging information (default)"
+echo "  --disable-debug-info      disable debugging information"
 echo "  --enable-debug           enable common debug build options"
 echo "  --enable-sparse          enable sparse checker"
 echo "  --disable-sparse         disable sparse checker (default)"
-- 
1.8.1.5


