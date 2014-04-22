Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WciUa-0003id-TM
	for mharc-qemu-trivial@gnu.org; Tue, 22 Apr 2014 17:44:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WciUT-0003a2-0a
	for qemu-trivial@nongnu.org; Tue, 22 Apr 2014 17:44:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WciUM-0003nw-IJ
	for qemu-trivial@nongnu.org; Tue, 22 Apr 2014 17:44:32 -0400
Received: from mail-ee0-x22c.google.com ([2a00:1450:4013:c00::22c]:56796)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1WciUA-0003m6-9v; Tue, 22 Apr 2014 17:44:14 -0400
Received: by mail-ee0-f44.google.com with SMTP id e49so145345eek.3
	for <multiple recipients>; Tue, 22 Apr 2014 14:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Q6CdFH7HxWuQPRt7t6a+p1CRRpI+Qu9fBqM2b+gYF2k=;
	b=0ostBCRZOpY8WwhMGmXuSlJqd5EVmY6GBQSA6XhHP86wZLVArvggJnhg9Rs9ZvNdrp
	CvWtyOyxR7X68RUll9X3sbaXCto80aSTrly9rszo90EyvR5bnLaatVY2PIbvkobtI3Xc
	PMDK0budE6YflTEzqG8yuAHBItoPocLcHcwtQ1Uz99EmK+5MyCbAX3awsCbRmqmrzPsg
	XngYZEVMeGFT/N6QLy2cTtbRww+muaWUhrSZl5xjMdrtlm9jaTLPiEiTHi8UC0N+71IP
	/OR/F6O/8OcFIkRZ/yD16s0iAmdgMZP5DzuKTdw3IQBzpMv9g8vBZT+Kz00qGw5JLMf7
	MhcQ==
X-Received: by 10.14.95.136 with SMTP id p8mr5179527eef.103.1398203052846;
	Tue, 22 Apr 2014 14:44:12 -0700 (PDT)
Received: from localhost.localdomain ([41.104.12.129])
	by mx.google.com with ESMTPSA id q41sm294213eez.7.2014.04.22.14.44.11
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 22 Apr 2014 14:44:11 -0700 (PDT)
From: Hani Benhabiles <kroosec@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 22 Apr 2014 22:44:03 +0100
Message-Id: <1398203043-20559-1-git-send-email-kroosec@gmail.com>
X-Mailer: git-send-email 1.8.3.2
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::22c
Cc: qemu-trivial@nongnu.org, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH] qmp: Remove unused variable.
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
X-List-Received-Date: Tue, 22 Apr 2014 21:44:39 -0000

Signed-off-by: Hani Benhabiles <hani@linux.com>
---
 qmp.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/qmp.c b/qmp.c
index 87a28f7..44a6e17 100644
--- a/qmp.c
+++ b/qmp.c
@@ -194,11 +194,10 @@ void qmp_system_wakeup(Error **errp)
 ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)
 {
     Object *obj;
-    bool ambiguous = false;
     ObjectPropertyInfoList *props = NULL;
     ObjectProperty *prop;
 
-    obj = object_resolve_path(path, &ambiguous);
+    obj = object_resolve_path(path, NULL);
     if (obj == NULL) {
         error_set(errp, QERR_DEVICE_NOT_FOUND, path);
         return NULL;
-- 
1.8.3.2


