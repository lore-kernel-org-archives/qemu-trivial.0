Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Y0z3v-0005tj-0b
	for mharc-qemu-trivial@gnu.org; Tue, 16 Dec 2014 15:49:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Y0z3k-0005hF-9h
	for qemu-trivial@nongnu.org; Tue, 16 Dec 2014 15:49:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Y0z3b-0001Ak-6h
	for qemu-trivial@nongnu.org; Tue, 16 Dec 2014 15:49:32 -0500
Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233]:44233)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Y0z3I-00016m-Sn; Tue, 16 Dec 2014 15:49:05 -0500
Received: by mail-pa0-f51.google.com with SMTP id ey11so14880814pad.38
	for <multiple recipients>; Tue, 16 Dec 2014 12:49:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=mvDXHF8VC1VKARwe/WBgzp+G8BSs9oJUJyPcEPIyQXE=;
	b=BitmSLMOAyttveapzdt2zDSaNEWYkgksFUC0DFG+m5FYgiBq77LjIb50YIhclM+Qn6
	wf9xI0gNvjI3SW0//1wH/sMX0DWcjvI7IRQOLJMaRac+xwyAAZX7i09M5PD3yFfmIBkj
	X9RSofwDXgoc2g7rvgSTS2hnsqFsiwA9FuqPMb9OjZPj4hGdOT98dgZG8rIglS1xDXcn
	Sd5xIItW8Nk1CvqBXug2h8rnAZBZbGMWod19ltRkBBGWxNXKLdEC/j7z1fNFNI9pDirU
	smJQUgG0oGhf9dM1LFqcO8KxedkEMbqIz0sYz3gYgcVWknAvbv2/35G7bjUzPJvLXwxy
	YPDA==
X-Received: by 10.66.120.47 with SMTP id kz15mr64308100pab.71.1418762943118;
	Tue, 16 Dec 2014 12:49:03 -0800 (PST)
Received: from [192.168.1.103] ([223.72.65.78])
	by mx.google.com with ESMTPSA id nv7sm1835644pbc.29.2014.12.16.12.49.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 16 Dec 2014 12:49:01 -0800 (PST)
Message-ID: <54909AB6.7020705@gmail.com>
Date: Wed, 17 Dec 2014 04:48:54 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::233
Subject: [Qemu-trivial] [PATCH] hw/net/xen_nic.c: Free 'netdev->txs' when
 map 'netdev->rxs' fails
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
X-List-Received-Date: Tue, 16 Dec 2014 20:49:41 -0000

When map 'netdev->rxs' fails, need free the original resource, or will
cause resource leak.

Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 hw/net/xen_nic.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/net/xen_nic.c b/hw/net/xen_nic.c
index 63918ae..7a57feb 100644
--- a/hw/net/xen_nic.c
+++ b/hw/net/xen_nic.c
@@ -370,11 +370,16 @@ static int net_connect(struct XenDevice *xendev)
                                           netdev->xendev.dom,
                                           netdev->tx_ring_ref,
                                           PROT_READ | PROT_WRITE);
+    if (!netdev->txs) {
+        return -1;
+    }
     netdev->rxs = xc_gnttab_map_grant_ref(netdev->xendev.gnttabdev,
                                           netdev->xendev.dom,
                                           netdev->rx_ring_ref,
                                           PROT_READ | PROT_WRITE);
-    if (!netdev->txs || !netdev->rxs) {
+    if (!netdev->rxs) {
+        xc_gnttab_munmap(netdev->xendev.gnttabdev, netdev->txs, 1);
+        netdev->txs = NULL;
         return -1;
     }
     BACK_RING_INIT(&netdev->tx_ring, netdev->txs, XC_PAGE_SIZE);
-- 
1.9.3

