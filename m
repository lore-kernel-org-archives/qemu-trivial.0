Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WpHLH-0005wS-Lc
	for mharc-qemu-trivial@gnu.org; Tue, 27 May 2014 09:22:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46943)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1WpGIu-0003Ts-S1
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 08:16:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>) id 1WpGIl-0003K3-Sl
	for qemu-trivial@nongnu.org; Tue, 27 May 2014 08:16:28 -0400
Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230]:36403)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <serge.fdrv@gmail.com>)
	id 1WpGIO-0003FM-4U; Tue, 27 May 2014 08:15:56 -0400
Received: by mail-lb0-f176.google.com with SMTP id p9so4823153lbv.21
	for <multiple recipients>; Tue, 27 May 2014 05:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=8cJTzw8eCAZEev+Lk2b4ZRYTwulGW4K1HiGHXJFeFy8=;
	b=qcyud3YaoZqd4a1W7DNHzNCrokOJIWEpE8lC1MLHM6OThOARMx8MJNCNYCtJzSphN6
	cYo1QvQ8TR4c/zCyd9LV6R9SLgxYsfGuAhWI/N/U5s7MIQBtRxtGm0xN5U207D3s1TvD
	EnA7QN2sIpccDzU8UiGgehvptNWBZjd1s1Hf1ivYEZAnWSb2x/eOeu9yJEb+1O29hggg
	6Tt3OTGID+CTTu99IwosIAjP/kNgI8nYEOOLyxbOvqmC0KcfHt4fgyTapQUyCp9PFUT+
	w6gxkK1KADzIfQG7GMQMwuKqgZBdkoBld+ema0QiuUxl2AvPWxTBBKl5FUR3hZlQbeob
	4p7Q==
X-Received: by 10.112.132.233 with SMTP id ox9mr15551348lbb.35.1401192954853; 
	Tue, 27 May 2014 05:15:54 -0700 (PDT)
Received: from sfedorov-laptop.smware.local ([213.243.91.10])
	by mx.google.com with ESMTPSA id
	ob4sm14996034lbc.30.2014.05.27.05.15.54 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 May 2014 05:15:54 -0700 (PDT)
From: Sergey Fedorov <serge.fdrv@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue, 27 May 2014 16:15:20 +0400
Message-Id: <1401192920-4604-1-git-send-email-serge.fdrv@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4010:c04::230
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
X-List-Received-Date: Tue, 27 May 2014 12:16:38 -0000

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


