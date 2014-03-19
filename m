Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQH4p-00077U-QL
	for mharc-qemu-trivial@gnu.org; Wed, 19 Mar 2014 10:02:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <deepak.mk17@gmail.com>) id 1WQBjN-0000AT-I1
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 04:20:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <deepak.mk17@gmail.com>) id 1WQBjF-0007Fr-5d
	for qemu-trivial@nongnu.org; Wed, 19 Mar 2014 04:20:09 -0400
Received: from mail-pa0-x235.google.com ([2607:f8b0:400e:c03::235]:34980)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <deepak.mk17@gmail.com>)
	id 1WQBix-0007DC-O1; Wed, 19 Mar 2014 04:19:43 -0400
Received: by mail-pa0-f53.google.com with SMTP id ld10so8523579pab.26
	for <multiple recipients>; Wed, 19 Mar 2014 01:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=sGgNf54XOO2semihYR8vVqA8lDA5b+AqTwtgK81UVH0=;
	b=I8OLt058OjrmuskeFmxd4XARCezhtnKGhJJFdUCmo86yj/d+iG455aTs73JtIEFhd5
	roi4peCP20Q/YX2gQKMzxJxvqB1XEJX+vID31gbzQ+WaS80r9NE+b7sr0c1ekHIFD7wi
	d+5mW0HQF3XHcoUW3S8sI+nqDxfFRDZcNYxgp2/J6VtFrDKsyiT/fETeHDZ8dHT5x9b5
	7/ONbZikIpOTjks74aLurciZu/O7ietFm2kAaylui9Kmcq78+8krwqDdZjKow4nriX6K
	9oJZ2Wmrd6HwSALL7S4qzEYEy2fuzoVULvHBZZWo6fNdJY+DG8Zil7tA5q9lfr+OPIcP
	QsUg==
X-Received: by 10.68.136.133 with SMTP id qa5mr38012250pbb.63.1395217181732;
	Wed, 19 Mar 2014 01:19:41 -0700 (PDT)
Received: from monroe.comp.nus.edu.sg (nusnet-228-5.dynip.nus.edu.sg.
	[137.132.228.5])
	by mx.google.com with ESMTPSA id ha2sm59824684pbb.8.2014.03.19.01.19.38
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 19 Mar 2014 01:19:40 -0700 (PDT)
From: Deepak Kathayat <deepak.mk17@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 19 Mar 2014 16:19:33 +0800
Message-Id: <1395217173-20902-1-git-send-email-deepak.mk17@gmail.com>
X-Mailer: git-send-email 1.7.9.5
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::235
X-Mailman-Approved-At: Wed, 19 Mar 2014 10:02:37 -0400
Cc: qemu-trivial@nongnu.org, Deepak Kathayat <deepak.mk17@gmail.com>,
	stefanha@redhat.com
Subject: [Qemu-trivial] [PATCH] qcow2.c: Check if backing file name length
	is valid
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
X-List-Received-Date: Wed, 19 Mar 2014 08:20:18 -0000


Signed-off-by: Deepak Kathayat <deepak.mk17@gmail.com>
---
The len variable is a signed integer whereas the backing file name
 length in the image header is unsigned. Therefore, it may
 overflow. Furthermore, backing file name length cannot be
 zero. These two cases must be handled explicitly.
 block/qcow2.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/block/qcow2.c b/block/qcow2.c
index 945c9d6..7b6f65c 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -625,6 +625,11 @@ static int qcow2_open(BlockDriverState *bs, QDict *options, int flags,
     /* read the backing file name */
     if (header.backing_file_offset != 0) {
         len = header.backing_file_size;
+        if (len <= 0) {
+            error_setg(errp, "Invalid backing file name length: %d", len);
+            ret = -EINVAL;
+            goto fail;
+        }
         if (len > 1023) {
             len = 1023;
         }
-- 
1.7.9.5


