Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SPrVM-0002QQ-7z
	for mharc-qemu-trivial@gnu.org; Thu, 03 May 2012 04:35:16 -0400
Received: from eggs.gnu.org ([208.118.235.92]:58359)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1SPrVF-0002Pz-Pk
	for qemu-trivial@nongnu.org; Thu, 03 May 2012 04:35:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>) id 1SPrV9-00071v-AY
	for qemu-trivial@nongnu.org; Thu, 03 May 2012 04:35:09 -0400
Received: from mail-pz0-f46.google.com ([209.85.210.46]:51074)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <riegamaths@gmail.com>)
	id 1SPrUz-0006v1-Ph; Thu, 03 May 2012 04:34:53 -0400
Received: by dady13 with SMTP id y13so1328887dad.5
	for <multiple recipients>; Thu, 03 May 2012 01:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=asnpkqicstGZo2q6fAWZXgdmQQGGgvtmw8vxWiDrKxs=;
	b=QaPwrYCOKtKeyBCCt6Cud1XezS6cf1/D8FZCOAh2ApV5f8pS0rjkhVXCn6nKrJEq5J
	DZcVeIm1OkRzkfqqr0zLXxXvTyynisc+VhO4c+v1cQyUxFZgfcl+xN4ItE9bDWeDnWXV
	48azhzVxcApAXuFQtItGDBlM8G2IfSDksNgMmzs3gQAl61TZNK7gdG8I6gtuIXBVcRDs
	aNKYA2l5WOz7MeRgpHJpBllIbcSg58u4Z6HU0+fdAcejeOCsfnVBoGM3teiQb/52cJ+I
	o6TFl6Qhk+eJeoRDFOyNmdrE5BpQJiHjhP2mqGNJDPIsyuEe4V3JVkK9nbccXFeSM4M8
	intg==
Received: by 10.68.221.136 with SMTP id qe8mr5311402pbc.108.1336034091085;
	Thu, 03 May 2012 01:34:51 -0700 (PDT)
Received: from riegamaths@gmail.com ([119.255.44.227])
	by mx.google.com with ESMTPS id pz3sm4627964pbc.16.2012.05.03.01.34.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 03 May 2012 01:34:50 -0700 (PDT)
Received: by riegamaths@gmail.com (sSMTP sendmail emulation);
	Thu, 03 May 2012 16:35:23 +0800
From: dunrong huang <riegamaths@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu,  3 May 2012 16:34:42 +0800
Message-Id: <1336034082-5288-1-git-send-email-riegamaths@gmail.com>
X-Mailer: git-send-email 1.7.8.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.46
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	dunrong huang <riegamaths@gmail.com>
Subject: [Qemu-trivial] [Qemu-devel][PATCH] qdev: Fix memory leak
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
X-List-Received-Date: Thu, 03 May 2012 08:35:15 -0000

The str allocated in visit_type_str was not freed

Signed-off-by: dunrong huang <riegamaths@gmail.com>
---
 hw/qdev-properties.c |    8 ++++++--
 1 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/qdev-properties.c b/hw/qdev-properties.c
index 98dd06a..8088699 100644
--- a/hw/qdev-properties.c
+++ b/hw/qdev-properties.c
@@ -726,7 +726,7 @@ static void set_mac(Object *obj, Visitor *v, void *opaque,
     MACAddr *mac = qdev_get_prop_ptr(dev, prop);
     Error *local_err = NULL;
     int i, pos;
-    char *str, *p;
+    char *str = NULL, *p;
 
     if (dev->state != DEV_STATE_CREATED) {
         error_set(errp, QERR_PERMISSION_DENIED);
@@ -753,10 +753,12 @@ static void set_mac(Object *obj, Visitor *v, void *opaque,
         }
         mac->a[i] = strtol(str+pos, &p, 16);
     }
+    g_free(str);
     return;
 
 inval:
     error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
+    g_free(str);
 }
 
 PropertyInfo qdev_prop_macaddr = {
@@ -825,7 +827,7 @@ static void set_pci_devfn(Object *obj, Visitor *v, void *opaque,
     uint32_t *ptr = qdev_get_prop_ptr(dev, prop);
     unsigned int slot, fn, n;
     Error *local_err = NULL;
-    char *str = (char *)"";
+    char *str = NULL;
 
     if (dev->state != DEV_STATE_CREATED) {
         error_set(errp, QERR_PERMISSION_DENIED);
@@ -847,10 +849,12 @@ static void set_pci_devfn(Object *obj, Visitor *v, void *opaque,
         goto invalid;
     }
     *ptr = slot << 3 | fn;
+    g_free(str);
     return;
 
 invalid:
     error_set_from_qdev_prop_error(errp, EINVAL, dev, prop, str);
+    g_free(str);
 }
 
 static int print_pci_devfn(DeviceState *dev, Property *prop, char *dest, size_t len)
-- 
1.7.8.4


