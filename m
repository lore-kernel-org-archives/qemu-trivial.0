Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UaLgG-0003Oz-IW
	for mharc-qemu-trivial@gnu.org; Thu, 09 May 2013 03:54:24 -0400
Received: from eggs.gnu.org ([208.118.235.92]:50046)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <donald.open@gmail.com>) id 1UaLgC-0003Ki-Sq
	for qemu-trivial@nongnu.org; Thu, 09 May 2013 03:54:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <donald.open@gmail.com>) id 1UaLgA-0007A3-Vr
	for qemu-trivial@nongnu.org; Thu, 09 May 2013 03:54:20 -0400
Received: from mail-ob0-x233.google.com ([2607:f8b0:4003:c01::233]:64547)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <donald.open@gmail.com>)
	id 1UaLgA-00079s-RK; Thu, 09 May 2013 03:54:18 -0400
Received: by mail-ob0-f179.google.com with SMTP id xn12so2593013obc.24
	for <multiple recipients>; Thu, 09 May 2013 00:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=U/S3+qUo8IGbIpiVx0sTA2LUQntD5C0ig5YfPWU8v8A=;
	b=Jo6Zez2Q1ks/foxyCrKI1bermXXoXWrpGI6a+pX3KTjLvEfA4Ud1AeP5K2EmIFJ4el
	SnAHTdAImKfvbgua4Rw71qcD3/V9iDt1RDm28aJ8wbOcGUGCli8sS+MaKw8VdaK8+f++
	Tyuew4XEuOHNq2I6iGTvgBbsjbv/En8hsBwA1ZkJ93FYKg+Te676Gj92A0p7zSgu+G6x
	Cadzt2BJBMECqwcnutaLUSSFBseY0FugJrtH2/Jlh01l/O1+IMSx1Nqc8zBBdQWSqjq/
	VqF3GT1m29+NZ5xG5mIqZ7NRAfWErRrr7EGvsGUDlWPQkxnMB0daRmebnCKepg69UrN+
	pAUw==
X-Received: by 10.182.226.162 with SMTP id rt2mr3654080obc.9.1368086058074;
	Thu, 09 May 2013 00:54:18 -0700 (PDT)
Received: from localhost.localdomain ([202.108.130.138])
	by mx.google.com with ESMTPSA id jz6sm2344394oeb.3.2013.05.09.00.54.12
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 09 May 2013 00:54:17 -0700 (PDT)
Sender: Dong Xu Wang <donald.open@gmail.com>
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
To: qemu-trivial@nongnu.org
Date: Thu,  9 May 2013 15:53:49 +0800
Message-Id: <1368086030-3847-1-git-send-email-wdongxu@linux.vnet.ibm.com>
X-Mailer: git-send-email 1.7.10.4
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::233
Cc: hutao@cn.fujitsu.com, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH 1/2] clean unnecessary code: don't check
	g_strdup arg for NULL
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
X-List-Received-Date: Thu, 09 May 2013 07:54:23 -0000

Signed-off-by: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
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


