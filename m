Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WFtNg-0007dr-TB
	for mharc-qemu-trivial@gnu.org; Tue, 18 Feb 2014 17:43:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46233)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WFtNZ-0007VJ-HW
	for qemu-trivial@nongnu.org; Tue, 18 Feb 2014 17:43:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WFtNT-0000Ed-Oo
	for qemu-trivial@nongnu.org; Tue, 18 Feb 2014 17:43:05 -0500
Received: from mail-ea0-x22a.google.com ([2a00:1450:4013:c01::22a]:44189)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1WFtNH-0000CM-Rp; Tue, 18 Feb 2014 17:42:48 -0500
Received: by mail-ea0-f170.google.com with SMTP id g15so6437854eak.1
	for <multiple recipients>; Tue, 18 Feb 2014 14:42:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=E0PtPlNcsc+0pycw3q55XDnLuvCzct1Nc0Zyu4mA+iQ=;
	b=o2Nu6GdJs2OV33Hsu48xgD7bjeN/NpLoyV8zP+EX9hfwZb4A6QX1rkzDCaJCl4p8Po
	qkRrkz5xDkvQ4/MKcFRbio16KJI6yQY/rk3/ezos4P1zMmD3bxDFXvooT/yN760SlyzP
	FTYdn1brhKLmSA0XMWJu7CK01OKNIWkqIIwTpsHOeyTlRVU5sMaj7IwToaULLAf+AUc8
	yMmQ6UvJkKPmxxKuYbmJdrEkpTvFARWYPnaO6amW/4o3lUrf3F3bOLAneTA6U20eCBf0
	ZbdrGtiUUZPBDgAOhBMVBtnxsHgVKiTOzFNL9Bde1KTXhMfTe6GNa/o/xXYjvcTts6zd
	6qNA==
X-Received: by 10.15.56.130 with SMTP id y2mr36797035eew.17.1392763366279;
	Tue, 18 Feb 2014 14:42:46 -0800 (PST)
Received: from localhost.localdomain ([41.109.247.99])
	by mx.google.com with ESMTPSA id x2sm75424589eeo.8.2014.02.18.14.42.43
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 18 Feb 2014 14:42:45 -0800 (PST)
From: Hani Benhabiles <kroosec@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 18 Feb 2014 23:42:36 +0100
Message-Id: <1392763356-29026-1-git-send-email-kroosec@gmail.com>
X-Mailer: git-send-email 1.8.3.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c01::22a
Cc: qemu-trivial@nongnu.org, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH] object: Report type in error when not user
	creatable.
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
X-List-Received-Date: Tue, 18 Feb 2014 22:43:11 -0000

Signed-off-by: Hani Benhabiles <hani@linux.com>
---
 qmp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qmp.c b/qmp.c
index d0d98e7..f556a04 100644
--- a/qmp.c
+++ b/qmp.c
@@ -556,8 +556,8 @@ void object_add(const char *type, const char *id, const QDict *qdict,
     }
 
     if (!object_dynamic_cast(obj, TYPE_USER_CREATABLE)) {
-        error_setg(&local_err, "object '%s' isn't supported by object-add",
-                   id);
+        error_setg(&local_err, "object type '%s' isn't supported by object-add",
+                   type);
         goto out;
     }
 
-- 
1.8.3.2


