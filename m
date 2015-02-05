Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YJPYr-0003g7-3O
	for mharc-qemu-trivial@gnu.org; Thu, 05 Feb 2015 11:45:49 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37996)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1YJPYl-0003ZS-Kg
	for qemu-trivial@nongnu.org; Thu, 05 Feb 2015 11:45:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1YJPYk-0001B5-AQ
	for qemu-trivial@nongnu.org; Thu, 05 Feb 2015 11:45:43 -0500
Received: from mail-qa0-x229.google.com ([2607:f8b0:400d:c00::229]:63416)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>)
	id 1YJPYf-00019C-6T; Thu, 05 Feb 2015 11:45:37 -0500
Received: by mail-qa0-f41.google.com with SMTP id bm13so6658951qab.0;
	Thu, 05 Feb 2015 08:45:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=QVETSVUO7GglVMLl+5ZSagK7wPz9swWo3I3uFANEB6g=;
	b=r7Y5TZ5OS9Gayw0Le+VssdHKgKlP8BnL8IeRDGKU6bNlUNfOQmaY1Jrxen6zmAsd+4
	t2jE8TThRWFRz5EM/GOGmlQaoB2eDNxj5xQXCS0vBmfq12f5ppV2wLgpDIGtx4qwxpF5
	WvvKCvNVBFlj3enlqmN2qqo+nsGRnJ9Yhj+cOOJgbKvvETADciRWqahjTz9jigvNIgSv
	AN0Rgbd/3+e6kuLoRMprpYodPRsqN3Uc+T+F9XP6LsxZlD7qFAHJ2Crn47jzobFm4L3B
	edL568uGLbcve04s6/WakkdRseirVrdC/GrazBWxxreuoblRl0wddrtmMi4AqqSLrGjP
	Vjbg==
X-Received: by 10.224.126.201 with SMTP id d9mr10073950qas.49.1423154736343;
	Thu, 05 Feb 2015 08:45:36 -0800 (PST)
Received: from HEDWIG.ini.cmu.edu (HEDWIG.INI.CMU.EDU. [128.2.16.51])
	by mx.google.com with ESMTPSA id n4sm5410713qac.30.2015.02.05.08.45.35
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Feb 2015 08:45:35 -0800 (PST)
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
X-Google-Original-From: "Gabriel L. Somlo" <somlo@cmu.edu>
To: qemu-devel@nongnu.org
Date: Thu,  5 Feb 2015 11:45:30 -0500
Message-Id: <1423154730-11998-1-git-send-email-somlo@cmu.edu>
X-Mailer: git-send-email 2.1.0
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400d:c00::229
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] smbios: document cmdline options for smbios
	type 2-4, 17 structures
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
X-List-Received-Date: Thu, 05 Feb 2015 16:45:47 -0000

Signed-off-by: Gabriel Somlo <somlo@cmu.edu>
---
 qemu-options.hx | 32 +++++++++++++++++++++++++++++---
 1 file changed, 29 insertions(+), 3 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 85ca3ad..ee4b223 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1364,11 +1364,25 @@ ETEXI
 DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
     "-smbios file=binary\n"
     "                load SMBIOS entry from binary file\n"
-    "-smbios type=0[,vendor=str][,version=str][,date=str][,release=%d.%d][,uefi=on|off]\n"
+    "-smbios type=0[,vendor=str][,version=str][,date=str][,release=%d.%d]\n"
+    "              [,uefi=on|off]\n"
     "                specify SMBIOS type 0 fields\n"
     "-smbios type=1[,manufacturer=str][,product=str][,version=str][,serial=str]\n"
     "              [,uuid=uuid][,sku=str][,family=str]\n"
-    "                specify SMBIOS type 1 fields\n", QEMU_ARCH_I386)
+    "                specify SMBIOS type 1 fields\n"
+    "-smbios type=2[,manufacturer=str][,product=str][,version=str][,serial=str]\n"
+    "              [,asset=str][,location=str]\n"
+    "                specify SMBIOS type 2 fields\n"
+    "-smbios type=3[,manufacturer=str][,version=str][,serial=str][,asset=str]\n"
+    "              [,sku=str]\n"
+    "                specify SMBIOS type 3 fields\n"
+    "-smbios type=4[,sock_pfx=str][,manufacturer=str][,version=str][,serial=str]\n"
+    "              [,asset=str][,part=str]\n"
+    "                specify SMBIOS type 4 fields\n"
+    "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
+    "               [,asset=str][,part=str]\n"
+    "                specify SMBIOS type 17 fields\n",
+    QEMU_ARCH_I386)
 STEXI
 @item -smbios file=@var{binary}
 @findex -smbios
@@ -1377,8 +1391,20 @@ Load SMBIOS entry from binary file.
 @item -smbios type=0[,vendor=@var{str}][,version=@var{str}][,date=@var{str}][,release=@var{%d.%d}][,uefi=on|off]
 Specify SMBIOS type 0 fields
 
-@item -smbios type=1[,manufacturer=@var{str}][,product=@var{str}] [,version=@var{str}][,serial=@var{str}][,uuid=@var{uuid}][,sku=@var{str}] [,family=@var{str}]
+@item -smbios type=1[,manufacturer=@var{str}][,product=@var{str}][,version=@var{str}][,serial=@var{str}][,uuid=@var{uuid}][,sku=@var{str}][,family=@var{str}]
 Specify SMBIOS type 1 fields
+
+@item -smbios type=2[,manufacturer=@var{str}][,product=@var{str}][,version=@var{str}][,serial=@var{str}][,asset=@var{str}][,location=@var{str}][,family=@var{str}]
+Specify SMBIOS type 2 fields
+
+@item -smbios type=3[,manufacturer=@var{str}][,version=@var{str}][,serial=@var{str}][,asset=@var{str}][,sku=@var{str}]
+Specify SMBIOS type 3 fields
+
+@item -smbios type=4[,sock_pfx=@var{str}][,manufacturer=@var{str}][,version=@var{str}][,serial=@var{str}][,asset=@var{str}][,part=@var{str}]
+Specify SMBIOS type 4 fields
+
+@item -smbios type=17[,loc_pfx=@var{str}][,bank=@var{str}][,manufacturer=@var{str}][,serial=@var{str}][,asset=@var{str}][,part=@var{str}]
+Specify SMBIOS type 17 fields
 ETEXI
 
 STEXI
-- 
2.1.0


