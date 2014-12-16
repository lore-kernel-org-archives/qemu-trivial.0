Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y0zD5-0002eq-LY
	for mharc-qemu-trivial@gnu.org; Tue, 16 Dec 2014 15:59:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47355)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Y0zD3-0002c3-SH
	for qemu-trivial@nongnu.org; Tue, 16 Dec 2014 15:59:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Y0zD3-00053o-50
	for qemu-trivial@nongnu.org; Tue, 16 Dec 2014 15:59:09 -0500
Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234]:34396)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Y0zCr-0004yh-RX; Tue, 16 Dec 2014 15:58:57 -0500
Received: by mail-pa0-f52.google.com with SMTP id eu11so14837026pac.11
	for <multiple recipients>; Tue, 16 Dec 2014 12:58:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=ywo67hG7H+4KWA9M0ZSu0MldVsVluNGUTLWXLgyzdpA=;
	b=nf1qzLRKOe16avEue8GfDC07iMbfqFTwpugsxKqMxuZLmJIOAzipDgdizyKHnJudy2
	bIHyyrJnet0n0TzWfPswWwK5SC208K3Tz/fyE8aeP7LHxa5JMXY8lOrGcXdQ71LK3Pxw
	uWvHRo8anOUFt0jKjbyZxU2B2zqEYivmr8Lt8auMxOoT1SM8M70FsSba1kOJQFeVSGHB
	XkDEvOGlC3wepzafS7yfUAkIh/Pzjnr86ATf7jz0L8l4rrFS5mOZhJ2r2ce2Naz3B9+7
	Q47+DbqZYhmR1P96B1WBFkV5JZBHHjl0ey8jmb0pFVs1NQE4BAI74AlmawLNxbDZV93t
	6i6w==
X-Received: by 10.70.123.97 with SMTP id lz1mr28699017pdb.150.1418763536909;
	Tue, 16 Dec 2014 12:58:56 -0800 (PST)
Received: from [192.168.1.103] ([223.72.65.78])
	by mx.google.com with ESMTPSA id nv7sm1847956pbc.29.2014.12.16.12.58.54
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 16 Dec 2014 12:58:55 -0800 (PST)
Message-ID: <54909D02.2030404@gmail.com>
Date: Wed, 17 Dec 2014 04:58:42 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::234
Subject: [Qemu-trivial] [PATCH] hw/net/xen_nic.c: Set 'netdev->mac' to NULL
	after free it
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
X-List-Received-Date: Tue, 16 Dec 2014 20:59:10 -0000

Since net_init() checks whether 'netdev->mac' is NULL, before alloc it;
net_release() also need set 'netdev->mac' to NULL after free it.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 hw/net/xen_nic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index 8eaa77b..19ecfc4 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -428,6 +428,7 @@ static int net_free(struct XenDevice *xendev)
         netdev->nic = NULL;
     }
     g_free(netdev->mac);
+    netdev->mac = NULL;
     return 0;
 }
 
-- 
1.9.3

