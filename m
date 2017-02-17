Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ceeN8-0006H8-Nt
	for mharc-qemu-trivial@gnu.org; Fri, 17 Feb 2017 03:58:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50715)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <franklinmathieu@gmail.com>) id 1ceeN6-0006Ev-Ba
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 03:58:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <franklinmathieu@gmail.com>) id 1ceeN5-0001TM-Ec
	for qemu-trivial@nongnu.org; Fri, 17 Feb 2017 03:58:32 -0500
Received: from mail-wm0-f65.google.com ([74.125.82.65]:36061)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <franklinmathieu@gmail.com>)
	id 1ceeN0-0001Sp-My; Fri, 17 Feb 2017 03:58:26 -0500
Received: by mail-wm0-f65.google.com with SMTP id r18so1369095wmd.3;
	Fri, 17 Feb 2017 00:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=E2VOJOSURVghvhgjYgW8cguq8gW+0fJLeryD4TKR3K0=;
	b=LwZlRH9nD2hshe4SISY8L6hX8X0SNd07lInh9cf6uzA60hCaKwH+yh135pap+hu/zl
	+aUCHGJrP6OcjTQM0ScQU4rZb4quI0oHVW2I4KpaMzWicX18nzu9BzwkKYtu5beWtjqE
	rL6Jgy8zwZN5UyOyK+exVEhuez9i6DM3lR/mIduSIITLrwUF9rxypF2g93sqi8PvqVbD
	FlT41CaMX3uLiNrGEG6zyZLyjoH+Iv7n3lLwGqXEc7u9whpL5QXSc7X8zb7dRVnO5rXt
	Mgri6O0IXpKH4t+3hIkvYIAWYLWmBWQ3BRpdIGJU2J4GgtoUU4Z+Y3W7owjmjPk1x5Ju
	8Rcg==
X-Gm-Message-State: AMke39kPkcGFUb97Vy7WsfsPLeAoKEJzgqsOnkvCLWN1LyPz1IkW74Y/pTJ3kQlUGIT3Ig==
X-Received: by 10.28.68.6 with SMTP id r6mr2046608wma.57.1487321905169;
	Fri, 17 Feb 2017 00:58:25 -0800 (PST)
Received: from localhost.localdomain ([193.120.165.186])
	by smtp.gmail.com with ESMTPSA id e74sm882027wmd.2.2017.02.17.00.58.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Feb 2017 00:58:24 -0800 (PST)
From: Franklin Snaipe Mathieu <snaipe@diacritic.io>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, snaipe@arista.com,
	"Franklin \"Snaipe\" Mathieu" <snaipe@diacritic.io>,
	Riku Voipio <riku.voipio@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>
Date: Fri, 17 Feb 2017 08:57:59 +0000
Message-Id: <20170217085800.28873-1-snaipe@diacritic.io>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170216085857.23501-1-snaipe@diacritic.io>
References: <20170216085857.23501-1-snaipe@diacritic.io>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 74.125.82.65
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
X-List-Received-Date: Fri, 17 Feb 2017 08:58:33 -0000

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


