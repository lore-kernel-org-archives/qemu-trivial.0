Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cVykd-0004up-GW
	for mharc-qemu-trivial@gnu.org; Tue, 24 Jan 2017 05:54:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58856)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVyka-0004rt-OG
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 05:54:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1cVyka-0006Uk-0U
	for qemu-trivial@nongnu.org; Tue, 24 Jan 2017 05:54:56 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:41987)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1cVykT-0006SM-Sf; Tue, 24 Jan 2017 05:54:50 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 648EB4211A;
	Tue, 24 Jan 2017 13:54:48 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 918EB55F;
	Tue, 24 Jan 2017 12:39:42 +0300 (MSK)
Received: (nullmailer pid 12624 invoked by uid 1000);
	Tue, 24 Jan 2017 09:39:41 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Frediano Ziglio <fziglio@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Tue, 24 Jan 2017 12:39:12 +0300
Message-Id: <98e14c100e7f1bc03ae610ff587f08f30a5087ab.1485250702.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
In-Reply-To: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
References: <cover.1485250702.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 08/31] usb: Fix typo in documentation
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
X-List-Received-Date: Tue, 24 Jan 2017 10:54:57 -0000

From: Frediano Ziglio <fziglio@redhat.com>

simliar -> similar

Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 docs/usb-storage.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/docs/usb-storage.txt b/docs/usb-storage.txt
index fbc1f2e..551af6f 100644
--- a/docs/usb-storage.txt
+++ b/docs/usb-storage.txt
@@ -34,7 +34,7 @@ with tree logical units:
 Number three emulates the classic bulk-only transport protocol too.
 It's called "usb-bot".  It shares most code with "usb-storage", and
 the guest will not be able to see the difference.  The qemu command
-line interface is simliar to usb-uas though, i.e. no automatic scsi
+line interface is similar to usb-uas though, i.e. no automatic scsi
 disk creation.  It also features support for up to 16 LUNs.  The LUN
 numbers must be continuous, i.e. for three devices you must use 0+1+2.
 The 0+1+5 numbering from the "usb-uas" example isn't going to work
-- 
2.1.4


