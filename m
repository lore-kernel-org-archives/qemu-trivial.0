Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WpHLH-0005w2-H1
	for mharc-qemu-trivial@gnu.org; Tue, 27 May 2014 09:22:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40103)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1WpCYn-0002hk-OX
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 04:16:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1WpCYe-0000oc-Or
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 04:16:37 -0400
Received: from mail-lb0-x22b.google.com ([2a00:1450:4010:c04::22b]:46824)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1WpCYM-0000jd-D6; Tue, 27 May 2014 04:16:10 -0400
Received: by mail-lb0-f171.google.com with SMTP id 10so4808116lbg.30
	for <multiple recipients>; Tue, 27 May 2014 01:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=l4BgvB5Xa7x3Wpt8Wx7yY3GKj3rNsARdEEyJKaHJmE0=;
	b=miSKKKnTm5R6gka2bFwgG3b5+gq3i5Z980QAmvbHGmWXKkabzBpcx03bNFhZiBhLgy
	a5RQ3PyA1IrOcDB3PKAOBFkBOgZtAa+6tCH6ML4YoX/8yug6xc1PwndXm0hrqpFTe8sK
	JIKODdOAOCyu+sEWZo5A86vQ1PGhx89PuRuw6vZMRe+YlX9+Li245eUvye13iSwjcRGQ
	rqgoFUtX15CyUDMkWkDSP2Zm1vSUczpQw9g1BgGyKTFJIKaue+2cACGmkW0Zk29YMMty
	Nk5aLJalELLUpsHlK0XeyfmHFLSRGvgF772G6KR6L13ZJ6rJxBNZFzc9y9vstxND0vq/
	GdPg==
X-Received: by 10.112.171.101 with SMTP id at5mr501928lbc.83.1401178568691;
	Tue, 27 May 2014 01:16:08 -0700 (PDT)
Received: from sfedorov-laptop.smware.local ([213.243.91.10])
	by mx.google.com with ESMTPSA id
	k16sm14446219lbo.37.2014.05.27.01.16.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 May 2014 01:16:08 -0700 (PDT)
From: serge.fdrv@gmail.com
To: qemu-devel@nongnu.org
Date: Tue, 27 May 2014 12:16:00 +0400
Message-Id: <1401178560-3852-1-git-send-email-serge.fdrv@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c04::22b
X-Mailman-Approved-At: Tue, 27 May 2014 09:22:57 -0400
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
	Alex Bligh <alex@alex.org.uk>, Sergey Fedorov <serge.fdrv@gmail.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.de>
Subject: [Qemu-trivial] [PATCH] qtest: fix hex2nib for capital characters
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
X-List-Received-Date: Tue, 27 May 2014 08:16:47 -0000

From: Sergey Fedorov <serge.fdrv@gmail.com>

Signed-off-by: Sergey Fedorov <serge.fdrv@gmail.com>

---
 qtest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qtest.c b/qtest.c
index 2aba20d..87ccd62 100644
--- a/qtest.c
+++ b/qtest.c
@@ -148,7 +148,7 @@ static int hex2nib(char ch)
     } else if (ch >= 'a' && ch <= 'f') {
         return 10 + (ch - 'a');
     } else if (ch >= 'A' && ch <= 'F') {
-        return 10 + (ch - 'a');
+        return 10 + (ch - 'A');
     } else {
         return -1;
     }
-- 
1.9.1


