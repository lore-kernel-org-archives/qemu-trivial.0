Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1h4Rvb-0002Wp-4W
	for mharc-qemu-trivial@gnu.org; Thu, 14 Mar 2019 11:05:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41910)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h4RvX-0002TH-AL
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 11:05:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1h4RvS-0004sB-CE
	for qemu-trivial@nongnu.org; Thu, 14 Mar 2019 11:05:47 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:36325)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1h4RvJ-0004NX-W7; Thu, 14 Mar 2019 11:05:34 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1MOm9H-1hP0gA1H0Z-00QAxH; Thu, 14 Mar 2019 16:05:05 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Eric Blake <eblake@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>
Date: Thu, 14 Mar 2019 16:04:52 +0100
Message-Id: <20190314150454.15960-2-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190314150454.15960-1-laurent@vivier.eu>
References: <20190314150454.15960-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fNMFp5ZoZRBJeWDFORRFX1px1qxpg82Sb801CFq5eD5TD8aut9g
	6GsJxw3H3U4BljaszWMHd5B1Vxgc6xeqOYKkzxMxakkOfY1GjQtqgTBDLcKVI7b5Xsd4LyY
	Zh9y1X2rBcNrtJoeT7mR5SEXCGhm2LL38bc+ti1uhMgCHe2baGvkgdOzx1PD8kqdXebzcrM
	vnR2Bljv0gTEP+HB08FBw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FgX4+RF/VIo=:FWmlFLyp1xw/9GLCzK8c/M
	hnFk4xNpMOwuzkrBlYDUUYMeUBwlWEkNBEFWsZ1yVebsO7KHfsKy2FqsH18FI3AAShJ6/eBM8
	YuVFpXIcX3/rbqHKKPEnByd0OLIatV23TCsXMATFz4DwZp/FIacCDmGCP9L8BUTocEy0mNuRa
	1LL23pGz3xqgxngK7ZgqxoYxs8dXzxFWwSmjXaBeBJM+3rpqivugptgbD86eXVe4L1yM2imEr
	q90d+5JStSDeycXYfedSU2A9MAEQtlr+TRb8fLzUPc7jSi5v0RwdH9eeMY+MoU6hS5iaSZ0XP
	wIcDaVHE0oNi/GgDNgO77L/UbBrFwB4FJRHZWX+z9jGz5o2bAVuRwvbnB4zNVWNOq8awIS8gb
	zRwSGXMLnm+0Vp1ZV4bbn2XsqNpCzskG9zYGYs4latOTk9Ykj0e9UwzPFXYtexkiAyNyuLzdU
	01QW4tyGdkDvBVZ8OOAAhxJcBs/Cf9ff+rBUz7BKquT4aeGOv67ppQHgapngSHH9Fzrz9Tuoa
	Q7icrnjd5ApCRZrIppevd6+GuOCxzH/aeA7O3Yuz+DlUaxe3PKE2Lbq8YZByDyf0veBzubHIQ
	phley8rcp4sJ8kYhX6nPFu1tECLa3bC86A8Tbt4ah2/5OHiag672U9HJEUTFT2VipG5GjBb59
	8xghpT3FGwwt+TFR6mnZ1Rt8AYbBjgXLkV2WLvL2X0IhOEboGTkpfXpqMqUX7reIGgBwhuhWF
	iBhUCjJvS+qjUpAMLG3vUlqPZlFn42AP8Ycxwg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.134
Subject: [Qemu-trivial] [PULL 1/3] maint: Ignore built elf2dmp
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 14 Mar 2019 15:05:49 -0000

From: Eric Blake <eblake@redhat.com>

Commit 3fa2d384 added a binary 'elf2dmp' but did not ignore it
during an in-tree build.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20190313144557.8845-1-eblake@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 .gitignore | 1 +
 1 file changed, 1 insertion(+)

diff --git a/.gitignore b/.gitignore
index 77522561b8ea..42d2d473559d 100644
--- a/.gitignore
+++ b/.gitignore
@@ -6,6 +6,7 @@
 /config-target.*
 /config.status
 /config-temp
+/elf2dmp
 /trace-events-all
 /trace/generated-events.h
 /trace/generated-events.c
-- 
2.20.1


