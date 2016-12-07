Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cEeeb-0002HV-U8
	for mharc-qemu-trivial@gnu.org; Wed, 07 Dec 2016 11:01:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47340)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fziglio@redhat.com>) id 1cEeeV-0002Dq-5H
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2016 11:01:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fziglio@redhat.com>) id 1cEeeQ-0005Uq-B4
	for qemu-trivial@nongnu.org; Wed, 07 Dec 2016 11:01:03 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35188)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <fziglio@redhat.com>)
	id 1cEeeF-0005TD-5B; Wed, 07 Dec 2016 11:00:47 -0500
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 58CEC384D;
	Wed,  7 Dec 2016 16:00:42 +0000 (UTC)
Received: from rhwork.redhat.com (ovpn-116-54.ams2.redhat.com [10.36.116.54])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id uB7G0cPR021658; Wed, 7 Dec 2016 11:00:39 -0500
From: Frediano Ziglio <fziglio@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Frediano Ziglio <fziglio@redhat.com>
Date: Wed,  7 Dec 2016 16:00:37 +0000
Message-Id: <20161207160037.4583-1-fziglio@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Wed, 07 Dec 2016 16:00:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2] usb: Fix typo in documentation
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
X-List-Received-Date: Wed, 07 Dec 2016 16:01:08 -0000

simliar -> similar

Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
---
 docs/usb-storage.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Changes since v1:
- extend commit message

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
2.9.3


