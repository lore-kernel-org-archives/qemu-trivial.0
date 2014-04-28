Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WeuKF-0000c8-8b
	for mharc-qemu-trivial@gnu.org; Mon, 28 Apr 2014 18:47:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40652)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WeuK8-0000V3-MW
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 18:47:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1WeuK3-0005gQ-Qd
	for qemu-trivial@nongnu.org; Mon, 28 Apr 2014 18:46:56 -0400
Received: from mail-we0-x22c.google.com ([2a00:1450:400c:c03::22c]:61906)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1WeuJt-0005f8-OA; Mon, 28 Apr 2014 18:46:41 -0400
Received: by mail-we0-f172.google.com with SMTP id u57so2240626wes.3
	for <multiple recipients>; Mon, 28 Apr 2014 15:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=0PJLoKthPD/9X4pckHWovpcpWLZ4tF6Tg5vNqNcu7IA=;
	b=irNBLiDjQ/Di598e1GZ41nj0nfLZ9gAGIGNb/uFSqIjKZXDBFR5hkqyDdpZkuiRuIt
	D48b9grV0uuEXyu/1A3hAfTbgnntOwluEYrsZbRTHyaIoXUnWh8KQGk1XwmzC+DWR4vV
	KThk3b24I6/2rjdJJuSNbl26bMaug1M9Ri5eyRDQdD0vXuUPNN53OIfIkmZO+yPTre4j
	vM60IeYZPmvLTvdjNH/sWTTaePWc9dvkxv9hc39Up6xQaz7uL1+tVgUf54uFaZUZEEUZ
	12XTDlwBZnsOrbPLzKMem+mlYvjXIir4yQsgLse0AQ5R+4ZCj9LiQKqjUVCLA9tC1wsp
	/1RA==
X-Received: by 10.194.188.68 with SMTP id fy4mr21208874wjc.30.1398725200467;
	Mon, 28 Apr 2014 15:46:40 -0700 (PDT)
Received: from localhost.localdomain ([41.109.210.63])
	by mx.google.com with ESMTPSA id n5sm936385wiz.1.2014.04.28.15.46.38
	for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 28 Apr 2014 15:46:39 -0700 (PDT)
From: Hani Benhabiles <kroosec@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 28 Apr 2014 23:46:26 +0100
Message-Id: <1398725186-8202-1-git-send-email-kroosec@gmail.com>
X-Mailer: git-send-email 1.8.3.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c03::22c
Cc: qemu-trivial@nongnu.org, lcapitulino@redhat.com
Subject: [Qemu-trivial] [PATCH] qmp: Report path ambiguity error.
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
X-List-Received-Date: Mon, 28 Apr 2014 22:47:02 -0000

Signed-off-by: Hani Benhabiles <hani@linux.com>
Suggested-by: Andreas Färber <afaerber@suse.de>
---
 qmp.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/qmp.c b/qmp.c
index 74107be..0d49abf 100644
--- a/qmp.c
+++ b/qmp.c
@@ -199,7 +199,10 @@ ObjectPropertyInfoList *qmp_qom_list(const char *path, Error **errp)
     ObjectProperty *prop;
 
     obj = object_resolve_path(path, &ambiguous);
-    if (obj == NULL) {
+    if (ambiguous) {
+        error_setg(errp, "Path '%s' is ambiguous", path);
+        return NULL;
+    } else if (obj == NULL) {
         error_set(errp, QERR_DEVICE_NOT_FOUND, path);
         return NULL;
     }
-- 
1.8.3.2


