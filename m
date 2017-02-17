Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ceeNK-0006Rn-CD
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 03:58:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <franklinmathieu@gmail.com>) id 1ceeNH-0006PD-Ub
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 03:58:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <franklinmathieu@gmail.com>) id 1ceeNH-0001Wv-26
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 03:58:44 -0500
Received: from mail-wr0-f194.google.com ([209.85.128.194]:33559)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <franklinmathieu@gmail.com>)
	id 1ceeNC-0001Ve-IG; Fri, 17 Feb 2017 03:58:38 -0500
Received: by mail-wr0-f194.google.com with SMTP id i10so4551786wrb.0;
	Fri, 17 Feb 2017 00:58:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=E2VOJOSURVghvhgjYgW8cguq8gW+0fJLeryD4TKR3K0=;
	b=XB4JMXAD9VrAqVKqOyUVEjSG/E+KJGfk9aQSKwzQUfnrd/wGQGG41TfEty4HlbfnYr
	eg5xeBhEG2H5QJJPh6/yPIc7NXER1UEz1RPDYXv9sTGOMpomVwwLTTdhBqFK7YHZ/tIP
	1FOd/DFuuWVYg2DZpfm3vgrlwkqiybQdNFp7vol0RQUWu2lVXBbCcRuIEmB6xHjztEEw
	pQmf0sG4wt/DMV03ciGrKssjw8/hnyZ81pHdxzfyTDTh5YVoEf6qVRUa1RIT0kGQixzw
	kQ0QeIyYFtuMaDkRtgX2tw3OD8vnvNdUl5lN0b6x22erOQGgRJ91Xqb9qrJJqJc2rhsO
	5XLA==
X-Gm-Message-State: AMke39lagjbC3sV6I/zXM0ci1TscXBYZxdYVz1WrACo9JfdNzGtIwGzoTL0sb+34P1mrfw==
X-Received: by 10.223.139.220 with SMTP id w28mr5737761wra.172.1487321917300; 
	Fri, 17 Feb 2017 00:58:37 -0800 (PST)
Received: from localhost.localdomain ([193.120.165.186])
	by smtp.gmail.com with ESMTPSA id e74sm882027wmd.2.2017.02.17.00.58.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Feb 2017 00:58:36 -0800 (PST)
From: Franklin Snaipe Mathieu <snaipe@diacritic.io>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, snaipe@arista.com,
	"Franklin \"Snaipe\" Mathieu" <snaipe@diacritic.io>,
	Riku Voipio <riku.voipio@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>
Date: Fri, 17 Feb 2017 08:58:00 +0000
Message-Id: <20170217085800.28873-2-snaipe@diacritic.io>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170217085800.28873-1-snaipe@diacritic.io>
References: <20170216085857.23501-1-snaipe@diacritic.io>
	<20170217085800.28873-1-snaipe@diacritic.io>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.194
Subject: [Qemu-trivial] [PATCH v2] syscall: fixed mincore(2) not failing
 with ENOMEM
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
X-List-Received-Date: Fri, 17 Feb 2017 08:58:45 -0000

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
index 9be8e9530e..733e0009e1 100644
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
+            p = lock_user_string(arg3);
+            if (!p) {
                 goto mincore_fail;
+            }
             ret = get_errno(mincore(a, arg2, p));
             unlock_user(p, arg3, ret);
             mincore_fail:
-- 
2.11.0


