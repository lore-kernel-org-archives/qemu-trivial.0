Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xo7aJ-0006Ks-HH
	for mharc-qemu-trivial@gnu.org; Tue, 11 Nov 2014 04:17:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49069)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Xo7a8-0006F3-2x
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 04:17:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Xo7Zz-0008Kw-1V
	for qemu-trivial@nongnu.org; Tue, 11 Nov 2014 04:17:48 -0500
Received: from mail-pd0-x22e.google.com ([2607:f8b0:400e:c02::22e]:62707)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Xo7Zy-0008Kq-Qu; Tue, 11 Nov 2014 04:17:38 -0500
Received: by mail-pd0-f174.google.com with SMTP id p10so9659913pdj.5
	for <multiple recipients>; Tue, 11 Nov 2014 01:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=MH4YQzi7h2NA4iXBmxUj3tNdKaE797GBP71CVqTPYZk=;
	b=ajR4PKOU6cGChUACNyGyjlTNb/8l9C+dX5ESxmJBf4ymUynCKNzNodFARsxsUjHbo7
	doyxUWADT2q/ha6f3MtKFEZQqwdKpeb02k2IRrbkUKRMzXFQk5sEUe5OgZFlK4ObArip
	dU/jjZFX34Rj1NJDGUikIohu9utT/lFAEMNzUTJeQiLubANlBrbkf/6ys1gfb8w+Zvvx
	hQxvpQJDQc5CwFt7T9fJ3nsSXQF06gmHZHVTy9FP0c/mwXRY0ZiTdkZwdu7qTSPJ2QVb
	J8YHD2flwDHj1H1hbpwSJru0J/CCB9MJX0MrDp+HoE07BRuJGdZO/IVzND7f5t+3jEKu
	3ouw==
X-Received: by 10.70.52.98 with SMTP id s2mr38166399pdo.5.1415697457899;
	Tue, 11 Nov 2014 01:17:37 -0800 (PST)
Received: from ShengShiZhuChengdeMacBook-Pro.local ([124.127.118.42])
	by mx.google.com with ESMTPSA id a10sm18823039pdp.0.2014.11.11.01.17.29
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 11 Nov 2014 01:17:36 -0800 (PST)
Message-ID: <5461D59C.5020106@gmail.com>
Date: Tue, 11 Nov 2014 17:23:40 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22e
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, xen-devel@lists.xensource.com,
	qemu-devel <qemu-devel@nongnu.org>,
	Stefano Stabellini <stefano.stabellini@eu.citrix.com>
Subject: [Qemu-trivial] [PATCH trivial] xen-hvm: Remove redandant varialbe
	'xstate'
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
X-List-Received-Date: Tue, 11 Nov 2014 09:17:57 -0000

In xen_hvm_change_state_handler(), can pass 'opaque' with type cast to
xen_main_loop_prepare() directly, need not use additional variable for
it.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 xen-hvm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/xen-hvm.c b/xen-hvm.c
index 21f1cbb..7548794 100644
--- a/xen-hvm.c
+++ b/xen-hvm.c
@@ -993,9 +993,8 @@ static void xen_main_loop_prepare(XenIOState *state)
 static void xen_hvm_change_state_handler(void *opaque, int running,
                                          RunState rstate)
 {
-    XenIOState *xstate = opaque;
     if (running) {
-        xen_main_loop_prepare(xstate);
+        xen_main_loop_prepare((XenIOState *)opaque);
     }
 }
 
-- 
1.8.5.2 (Apple Git-48)

