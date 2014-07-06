Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X3i3T-0007UB-MQ
	for mharc-qemu-trivial@gnu.org; Sun, 06 Jul 2014 04:44:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39283)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1X3i3I-0007Ft-Vg
	for qemu-trivial@nongnu.org; Sun, 06 Jul 2014 04:44:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>) id 1X3i39-0005NX-TF
	for qemu-trivial@nongnu.org; Sun, 06 Jul 2014 04:44:04 -0400
Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b]:46054)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gang.chen.5i5j@gmail.com>)
	id 1X3i2r-0005Ll-Eq; Sun, 06 Jul 2014 04:43:37 -0400
Received: by mail-pa0-f43.google.com with SMTP id lf10so3856492pab.2
	for <multiple recipients>; Sun, 06 Jul 2014 01:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:content-type:content-transfer-encoding;
	bh=yE8mQP+KUhQ+EDOP5TfNQxTo6waMRw+n/rheOiuA+W8=;
	b=LaYm/GT3UN5aJpsrtb/fMaxWfEt/ayzpz/lUjpnnzVISZCI8P71BcNGmuTVW+F/aWf
	TJVLta2bQSmtqYpGXRJk2/k030NGoskJ27FKswf1oyJCT0DBA86R5AbGhb4WlhlZlsWC
	1bm6cwm3yyh5D/d79NzJnHjSNWCkZET3aDkWSlLYCz52OXmgWuRQGmphdIKyO9R7a8nL
	WIOEXpjSA2l1IL4Clv0xCBZrvgqiNaJpo1bziEHpD0ZkffboZHBFfcTYXXONuLk3FLz3
	PP78rwUXxowO+qTax1dUYeTSBsjGSOUI1ySJv0dQcn2dBDPu9Y8oj7vxIwE9T1Gt3bY+
	AUpQ==
X-Received: by 10.66.161.4 with SMTP id xo4mr21901764pab.36.1404636215695;
	Sun, 06 Jul 2014 01:43:35 -0700 (PDT)
Received: from [192.168.1.101] ([223.72.65.112])
	by mx.google.com with ESMTPSA id
	mi8sm15608275pdb.39.2014.07.06.01.43.33 for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sun, 06 Jul 2014 01:43:35 -0700 (PDT)
Message-ID: <53B90C35.6070501@gmail.com>
Date: Sun, 06 Jul 2014 16:43:33 +0800
From: Chen Gang <gang.chen.5i5j@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Kevin Wolf <kwolf@redhat.com>, stefanha@redhat.com, 
	Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::22b
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: [Qemu-trivial] [PATCH-trivial] qemu-img: Check getchar() return
 value in read_password() for WIN32
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
X-List-Received-Date: Sun, 06 Jul 2014 08:44:14 -0000

getchar() is a standard c library function which may return with failure
(e.g. -1), so like another platforms, also need check it under WIN32.

And make the related code match current qemu code styles, too.


Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
---
 qemu-img.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/qemu-img.c b/qemu-img.c
index c98896b..8423e8e 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -185,15 +185,21 @@ static int GCC_FMT_ATTR(2, 3) qprintf(bool quiet, const char *fmt, ...)
 static int read_password(char *buf, int buf_size)
 {
     int c, i;
+
     printf("Password: ");
     fflush(stdout);
     i = 0;
     for(;;) {
         c = getchar();
-        if (c == '\n')
+        if (c < 0) {
+            buf[i] = '\0';
+            return -1;
+        } else if (c == '\n') {
             break;
-        if (i < (buf_size - 1))
+        }
+        if (i < (buf_size - 1)) {
             buf[i++] = c;
+        }
     }
     buf[i] = '\0';
     return 0;
-- 
1.7.11.7

