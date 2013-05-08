Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ua0xR-0005Qm-2X
	for mharc-qemu-trivial@gnu.org; Wed, 08 May 2013 05:46:48 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <donald.open@gmail.com>) id 1Ua0xM-0005La-SM
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 05:46:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <donald.open@gmail.com>) id 1Ua0xM-0006aC-2i
	for qemu-trivial@nongnu.org; Wed, 08 May 2013 05:46:40 -0400
Received: from mail-pa0-f51.google.com ([209.85.220.51]:35400)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <donald.open@gmail.com>)
	id 1Ua0xL-0006a6-SZ; Wed, 08 May 2013 05:46:40 -0400
Received: by mail-pa0-f51.google.com with SMTP id ld10so1205971pab.10
	for <multiple recipients>; Wed, 08 May 2013 02:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=aiJzzy8oV0DnOMBvpkcpMD+MPMCMpMuxnDF3tuaUREs=;
	b=HNxJ/6WcQY+UoJ8Bx3ffLlz4SSxmnEeNu+yV/pBTEy2JrLEY2Lxh+H+Yp+Jd+j+1mz
	1wRSG+rd/lk49Iso8l60QqjHWitS2jmBbheccAK0jDm8hUH0tW9b6eMZXGhbe/3ggdgi
	qd6nSGxiNL1e4iP+XOfYhh3NPnZ3R5xYgkOYDZ+8wHQgjvxtxboDlMzC9bxX4h/W/Nnz
	/xj/ruzs62Aved5bYn/BpjRdjADxX+u8jx8zSPFzkhXfofACbrHoR8XOwdzVuWhv7KAV
	rFBbmmD911j5+6Yf54lp4o6WE+r3M2rCDBXbTQR3bNlioEbpG1qNm5AbTeaNoGLQbp/H
	C82A==
X-Received: by 10.66.122.8 with SMTP id lo8mr6996607pab.165.1368006398978;
	Wed, 08 May 2013 02:46:38 -0700 (PDT)
Received: from localhost.localdomain ([202.108.130.138])
	by mx.google.com with ESMTPSA id bl3sm7160741pbd.12.2013.05.08.02.46.34
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 08 May 2013 02:46:38 -0700 (PDT)
Sender: Dong Xu Wang <donald.open@gmail.com>
From: Trival <wdongxu@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Wed,  8 May 2013 17:46:19 +0800
Message-Id: <1368006380-3125-1-git-send-email-trivial@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.51
Cc: qemu-devel@nongnu.org, Trival <trivial@linux.vnet.ibm.com>
Subject: [Qemu-trivial] [PATCH 1/2] clean unnecessary code
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
X-List-Received-Date: Wed, 08 May 2013 09:46:42 -0000

Duplicates a string. If str is NULL it returns NULL, so
can make code simple.

Signed-off-by: Trival <trivial@linux.vnet.ibm.com>
---
 util/uri.c | 2 +-
 vl.c       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/util/uri.c b/util/uri.c
index 4238729..e348c17 100644
--- a/util/uri.c
+++ b/util/uri.c
@@ -2162,7 +2162,7 @@ query_params_append (struct QueryParams *ps,
     }
 
     ps->p[ps->n].name = g_strdup(name);
-    ps->p[ps->n].value = value ? g_strdup(value) : NULL;
+    ps->p[ps->n].value = g_strdup(value);
     ps->p[ps->n].ignore = 0;
     ps->n++;
 
diff --git a/vl.c b/vl.c
index 6e6225f..be0a93c 100644
--- a/vl.c
+++ b/vl.c
@@ -1215,7 +1215,7 @@ void add_boot_device_path(int32_t bootindex, DeviceState *dev,
 
     node = g_malloc0(sizeof(FWBootEntry));
     node->bootindex = bootindex;
-    node->suffix = suffix ? g_strdup(suffix) : NULL;
+    node->suffix = g_strdup(suffix);
     node->dev = dev;
 
     QTAILQ_FOREACH(i, &fw_boot_order, link) {
-- 
1.7.11.7


