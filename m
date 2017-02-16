Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ceNPM-0000Wg-LH
	for mharc-qemu-trivial@gnu.org; Thu, 16 Feb 2017 09:51:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <franklinmathieu@gmail.com>) id 1ceHu9-0004SO-EA
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 03:59:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <franklinmathieu@gmail.com>) id 1ceHu8-0000Ez-LC
	for qemu-trivial@nongnu.org; Thu, 16 Feb 2017 03:59:09 -0500
Received: from mail-wm0-f66.google.com ([74.125.82.66]:36508)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <franklinmathieu@gmail.com>)
	id 1ceHu3-00009o-8a; Thu, 16 Feb 2017 03:59:03 -0500
Received: by mail-wm0-f66.google.com with SMTP id r18so2008152wmd.3;
	Thu, 16 Feb 2017 00:59:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8ta5sMQG4miD+wemKLF51LQeHq7Z9+l5W4pccUuP20s=;
	b=LQIJ4xetLYtHiJFFdf/f0lujfidFGyeu6A7LBkNk1G7h+SDlzRLhmIV9g2N1p6CCdl
	g89s96rfT9zTGtxxQ8DuzvmxI5T9EPdL+vlbtNXeOtDwpxDI9bhJz9fUTV/1NPAhhYAZ
	xRp5axsrKBUv5Yt6YTbQhU377h5KylfR+1DsdtTcMg+2oZS43slUX+0qJHPNM/wJil+5
	S+AifFaXKOILmmiFTUwQNndrar1r9CzFTA/CYMT3b1yFOIe55KSgv7PEa5YjJWe+3588
	uhTLpmrGTab2afvblGzUSPSuLvhAUbYhXDHTduChx31b9bCUJRwCbPyKW/5p58BE/2rj
	nHbg==
X-Gm-Message-State: AMke39lFdPZnG/PZyhwYzOFiFVpV4V9UW39ye+aCeQi1UZtHgaS89QNT2AMMZxTSZOzKuw==
X-Received: by 10.28.86.214 with SMTP id k205mr1267522wmb.26.1487235540648;
	Thu, 16 Feb 2017 00:59:00 -0800 (PST)
Received: from localhost.localdomain ([193.120.165.186])
	by smtp.gmail.com with ESMTPSA id
	136sm2525427wms.32.2017.02.16.00.58.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 16 Feb 2017 00:59:00 -0800 (PST)
From: Franklin Snaipe Mathieu <snaipe@diacritic.io>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, snaipe@arista.com,
	"Franklin \"Snaipe\" Mathieu" <snaipe@diacritic.io>,
	Riku Voipio <riku.voipio@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>
Date: Thu, 16 Feb 2017 08:58:57 +0000
Message-Id: <20170216085857.23501-1-snaipe@diacritic.io>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.66
X-Mailman-Approved-At: Thu, 16 Feb 2017 09:51:43 -0500
Subject: [Qemu-trivial] [PATCH] syscall: fixed mincore(2) not failing with
 ENOMEM
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
X-List-Received-Date: Thu, 16 Feb 2017 08:59:10 -0000

From: "Franklin \"Snaipe\" Mathieu" <snaipe@diacritic.io>

The current implementation of the mincore(2) syscall sets errno to
EFAULT when the region identified by the first two parameters is
invalid.

This goes against the man page specification, where mincore(2) should
only fail with EFAULT when the third parameter is an invalid address;
and fail with ENOMEM when the checked region does not point to mapped
memory.

Signed-off-by: Franklin "Snaipe" Mathieu <snaipe@diacritic.io>
Cc: Riku Voipio <riku.voipio@linaro.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>
---
 linux-user/syscall.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 9be8e9530e..af0dd40631 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11061,11 +11061,16 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
     case TARGET_NR_mincore:
         {
             void *a;
+            ret = -TARGET_ENOMEM;
+            a = lock_user(VERIFY_READ, arg1, arg2, 0);
+            if (!a) {
+                goto fail;
+            }
             ret = -TARGET_EFAULT;
-            if (!(a = lock_user(VERIFY_READ, arg1,arg2, 0)))
-                goto efault;
-            if (!(p = lock_user_string(arg3)))
+            p = lock_user_string(arg3)
+            if (!p) {
                 goto mincore_fail;
+            }
             ret = get_errno(mincore(a, arg2, p));
             unlock_user(p, arg3, ret);
             mincore_fail:
-- 
2.11.0


