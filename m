Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wj6kw-0003Ip-OO
	for mharc-qemu-trivial@gnu.org; Sat, 10 May 2014 08:51:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wj6km-00032i-BF
	for qemu-trivial@nongnu.org; Sat, 10 May 2014 08:51:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1Wj6kd-00076V-9a
	for qemu-trivial@nongnu.org; Sat, 10 May 2014 08:51:48 -0400
Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233]:34303)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1Wj6kK-00074d-Ul; Sat, 10 May 2014 08:51:21 -0400
Received: by mail-pd0-f179.google.com with SMTP id g10so4755901pdj.38
	for <multiple recipients>; Sat, 10 May 2014 05:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=29q/6NlGsdKI5owdseP95Ir0PY4zpfa9I3Y2OHt7dD4=;
	b=l67j4WgX+G3HK1UVJkpYaof5x5VZXp4BuvWKz1oobwGQYWptWkHVgzskam/0tLsK22
	YoMDPaSfTuKtitWB42DZFCf4sVtBKK58XePLBKomiZeKOqYIlmP7aTHnDI07by3PVoqf
	bN9YKpMfjMBKJo9leWeLKDcHm7XepcXr6i/MO6rncttACU9jGX1/AwMvbqMUAr4eLVVC
	wkT145IACkiB0mpP5IXhSZb8dRe94XIcNnzNgYzIMlbr6T+v/d3cGWWLtYEIOQ/HJ2Dw
	mRr6tZzZKgjP+Xg1yAbX6/6fCc/i0IirXbloUp04qBEho2fsGxFOe/ShfD7Py4/ms3GZ
	3TXA==
X-Received: by 10.66.148.230 with SMTP id tv6mr20894529pab.155.1399726279413; 
	Sat, 10 May 2014 05:51:19 -0700 (PDT)
Received: from [192.168.1.102] ([223.72.65.126])
	by mx.google.com with ESMTPSA id gj9sm12795663pbc.7.2014.05.10.05.51.16
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 10 May 2014 05:51:18 -0700 (PDT)
Message-ID: <536E20CC.4030401@gmail.com>
Date: Sat, 10 May 2014 20:51:24 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: mjt@tls.msk.ru, quintela@redhat.com, owasserm@redhat.com, 
	pbonzini@redhat.com, mst@redhat.com, Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::233
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] arch_init: Simplify code for load_xbzrle()
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
X-List-Received-Date: Sat, 10 May 2014 12:51:57 -0000

For xbzrle_decode_buffer(), when decoding contents will exceed writing
buffer, it will return -1, so need not check the return value whether
large than writing buffer.

And when failure occurs within load_xbzrle(), it always return -1
without any resources which need release.

So can remove the related checking statements, and also can remove 'rc'
and 'ret' local variables,


Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 arch_init.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch_init.c b/arch_init.c
index 60c975d..98ee5b6 100644
--- a/arch_init.c
+++ b/arch_init.c
@@ -908,7 +908,6 @@ static uint64_t ram_save_pending(QEMUFile *f, void *opaque, uint64_t max_size)
 
 static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
 {
-    int ret, rc = 0;
     unsigned int xh_len;
     int xh_flags;
 
@@ -933,18 +932,13 @@ static int load_xbzrle(QEMUFile *f, ram_addr_t addr, void *host)
     qemu_get_buffer(f, xbzrle_decoded_buf, xh_len);
 
     /* decode RLE */
-    ret = xbzrle_decode_buffer(xbzrle_decoded_buf, xh_len, host,
-                               TARGET_PAGE_SIZE);
-    if (ret == -1) {
+    if (xbzrle_decode_buffer(xbzrle_decoded_buf, xh_len, host,
+                             TARGET_PAGE_SIZE) == -1) {
         fprintf(stderr, "Failed to load XBZRLE page - decode error!\n");
-        rc = -1;
-    } else  if (ret > TARGET_PAGE_SIZE) {
-        fprintf(stderr, "Failed to load XBZRLE page - size %d exceeds %d!\n",
-                ret, TARGET_PAGE_SIZE);
-        abort();
+        return -1;
     }
 
-    return rc;
+    return 0;
 }
 
 static inline void *host_from_stream_offset(QEMUFile *f,
-- 
1.7.11.7

