Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eKsxa-0005le-ML
	for mharc-qemu-trivial@gnu.org; Fri, 01 Dec 2017 16:35:02 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46830)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mmcco@mykolab.com>) id 1eKq6U-0002bD-Ko
	for qemu-trivial@nongnu.org; Fri, 01 Dec 2017 13:32:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mmcco@mykolab.com>) id 1eKq6T-000302-Tb
	for qemu-trivial@nongnu.org; Fri, 01 Dec 2017 13:32:02 -0500
Received: from mx.kolabnow.com ([95.128.36.42]:9994)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mmcco@mykolab.com>)
	id 1eKq6O-0002yB-Ih; Fri, 01 Dec 2017 13:31:56 -0500
Received: from localhost (unknown [127.0.0.1])
	by ext-mx-out003.mykolab.com (Postfix) with ESMTP id 0A3D241083;
	Fri,  1 Dec 2017 19:31:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mykolab.com; h=
	date:date:message-id:subject:subject:mime-version
	:content-transfer-encoding:content-type:content-type:from:from
	:received:received:received; s=dkim20160331; t=1512153111; x=
	1512153133; bh=VRTz6hc6SPsbZHcvPLlgvWJ3mo0Ievj2o5wYqbGnI/s=; b=X
	xSPwEJ98+1LI+j0h9Vfde/+WbvgOKHD5Pf08JsAfhlUW4/Lt3MOxXB3njZiO+Aw9
	rPJLglN61JBsPugXeoLf9nip2uP4eTU9gITvd5agmmJrw2LYz+qgrPoOh3lBc63+
	Ez1NTHf0r30vyXBT2AcLHLrRq+/eRcozyQ8Q9zN4kBZn1Qn1P96EvyZhHsfwgEpV
	WVhx4EiZXZWYAzmvUbKdDK1f5n3wsD6Fg8O2slmmXpZFYXaOt8UeHNcQFxVEvhvK
	rRxjZ2cXPkhELe83WJIO9IvQ4GbYzLbQ+0Y9YRPDmIl0Lv9ie3JdSvzvmlyV53Et
	KJuMf7i1jq807CLMP6CvdgvBl7WuDzm8F6ejYfuMr9qVvVr4wDY9peh0N5UfD6BI
	5drVMSETeUM+mldOavtF7zkna4VLhosWw2CSJv7LcyP5nrZssmjLL5m2lqguSk5x
	9PdTgqd49fMzWPJNswB1qVxgyUkfNWFM7UFck2/rltUorAxd96zxLgAMLNiuxdz1
	Fs+trontRL1j6wQlJ1+Pwo+oz0CZDNykxLFFgb9VaOqBNdp3t2kimS4kLnjnl23F
	VWUMuW52P2kU3J3Mr9SjO/1tiAv+yZ9lB1esHQ1BOnJitI+n9sTjnynQi6tC/T5a
	Jr8LU2+N45KaySCz7jG0102MAjbwL6Ki3Tz2+UR+mg=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
	by localhost (ext-mx-out003.mykolab.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id AFzaCmx81hpy; Fri,  1 Dec 2017 19:31:51 +0100 (CET)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
	by ext-mx-out003.mykolab.com (Postfix) with ESMTPS id A504141068;
	Fri,  1 Dec 2017 19:31:51 +0100 (CET)
Received: from ext-subm003.mykolab.com (unknown [10.9.6.3])
	by int-mx001.mykolab.com (Postfix) with ESMTPS id 782AE111;
	Fri,  1 Dec 2017 19:31:51 +0100 (CET)
From: Michael McConville <mmcco@mykolab.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Mac OS X Mail 11.1 \(3445.4.7\))
Message-Id: <A6478011-CD5E-4FDF-A212-6D9BB0E70028@mykolab.com>
Date: Fri, 1 Dec 2017 11:31:57 -0700
Cc: qemu-trivial@nongnu.org
To: qemu-devel@nongnu.org
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 95.128.36.42
X-Mailman-Approved-At: Fri, 01 Dec 2017 16:34:59 -0500
Subject: [Qemu-trivial] [PATCH] mmap(2) returns MAP_FAILED, not NULL,
 on failure
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
X-List-Received-Date: Fri, 01 Dec 2017 18:32:03 -0000

Signed-off-by: Michael McConville <mmcco@mykolab.com>
---
 hw/i386/xen/xen-mapcache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/xen/xen-mapcache.c b/hw/i386/xen/xen-mapcache.c
index baab93b614..efa35dc6e0 100644
--- a/hw/i386/xen/xen-mapcache.c
+++ b/hw/i386/xen/xen-mapcache.c
@@ -199,7 +199,7 @@ static void xen_remap_bucket(MapCacheEntry *entry,
          */
         vaddr_base = mmap(vaddr, size, PROT_READ | PROT_WRITE,
                           MAP_ANON | MAP_SHARED, -1, 0);
-        if (vaddr_base == NULL) {
+        if (vaddr_base == MAP_FAILED) {
             perror("mmap");
             exit(-1);
         }
-- 
2.15.1

