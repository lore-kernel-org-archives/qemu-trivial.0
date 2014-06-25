Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wzi8t-0001Dx-3R
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jun 2014 04:01:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1Wzi8l-00013l-6G
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 04:01:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1Wzi8f-0008Io-2S
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 04:01:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:2550)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>)
	id 1Wzi8P-0008F5-Ss; Wed, 25 Jun 2014 04:00:50 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5P80kmO006093
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 25 Jun 2014 04:00:47 -0400
Received: from dell-pet610-01.lab.eng.brq.redhat.com
	(dell-pet610-01.lab.eng.brq.redhat.com [10.34.42.20])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s5P80iUf002657; Wed, 25 Jun 2014 04:00:45 -0400
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed, 25 Jun 2014 10:00:41 +0200
Message-Id: <1403683241-20678-1-git-send-email-imammedo@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org
Subject: [Qemu-trivial] [PATCH] qemu-char: fix warning 'res' may be used
	uninitialized
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
X-List-Received-Date: Wed, 25 Jun 2014 08:01:17 -0000

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 qemu-char.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/qemu-char.c b/qemu-char.c
index 2e50a10..f6bdf2f 100644
--- a/qemu-char.c
+++ b/qemu-char.c
@@ -132,7 +132,7 @@ int qemu_chr_fe_write(CharDriverState *s, const uint8_t *buf, int len)
 int qemu_chr_fe_write_all(CharDriverState *s, const uint8_t *buf, int len)
 {
     int offset = 0;
-    int res;
+    int res = 0;
 
     qemu_mutex_lock(&s->chr_write_lock);
     while (offset < len) {
-- 
1.7.1


