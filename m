Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vl27T-0004vb-AW
	for mharc-qemu-trivial@gnu.org; Mon, 25 Nov 2013 14:46:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vl27M-0004mt-Dw
	for qemu-trivial@nongnu.org; Mon, 25 Nov 2013 14:46:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1Vl27I-0007VU-2T
	for qemu-trivial@nongnu.org; Mon, 25 Nov 2013 14:46:48 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39337)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1Vl278-0007TI-Vw; Mon, 25 Nov 2013 14:46:35 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 600224335A;
	Mon, 25 Nov 2013 23:41:08 +0400 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 43EEF50D;
	Mon, 25 Nov 2013 23:41:08 +0400 (MSK)
Received: (nullmailer pid 13240 invoked by uid 1000);
	Mon, 25 Nov 2013 19:41:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: Anthony Liguori <aliguori@amazon.com>
Date: Mon, 25 Nov 2013 23:41:06 +0400
Message-Id: <1385408466-13183-4-git-send-email-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1385408466-13183-1-git-send-email-mjt@msgid.tls.msk.ru>
References: <1385408466-13183-1-git-send-email-mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Fam Zheng <famz@redhat.com>, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PULL 3/3] .gitignore: Ignore config.status
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
X-List-Received-Date: Mon, 25 Nov 2013 19:46:52 -0000

From: Fam Zheng <famz@redhat.com>

Signed-off-by: Fam Zheng <famz@redhat.com>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 .gitignore |    1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 5584b5f..1c9d63d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -3,6 +3,7 @@ config-all-devices.*
 config-all-disas.*
 config-host.*
 config-target.*
+config.status
 trace/generated-tracers.h
 trace/generated-tracers.c
 trace/generated-tracers-dtrace.h
-- 
1.7.10.4


