Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Uap4w-00044c-T8
	for mharc-qemu-trivial@gnu.org; Fri, 10 May 2013 11:17:50 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39309)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <i.mitsyanko@gmail.com>) id 1Uap4s-0003yT-0H
	for qemu-trivial@nongnu.org; Fri, 10 May 2013 11:17:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <i.mitsyanko@gmail.com>) id 1Uap4p-00053k-BR
	for qemu-trivial@nongnu.org; Fri, 10 May 2013 11:17:45 -0400
Received: from mail-lb0-f176.google.com ([209.85.217.176]:38529)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <i.mitsyanko@gmail.com>)
	id 1Uap4g-00052x-Eg; Fri, 10 May 2013 11:17:34 -0400
Received: by mail-lb0-f176.google.com with SMTP id v20so4255344lbc.7
	for <multiple recipients>; Fri, 10 May 2013 08:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=UtdYFU7YxdCPxWjwBdu6RRT5hdjZ13BipCMgF8MF9u4=;
	b=kdHYmdYR+XNGVIuUo7KKKaXMrHQCR9KTym9fyTHfhBNN/f90UjJhsWinNX41ljU2kF
	q5SkDhF7Y/ibrnNJ5gJ5yRI9AWMOlre9zmbovXHnbdt+3AHNjR9jzjsiSoIVtV+PsMOc
	Eff6Zmv/Lu7sUf1M8/S4MhexI6y7L1OM2YWlbOUsPG1R/CAQ7zV1e0smxJhBj0L+0hRO
	deWXpSX5SbyuX3bmprGTBJOLyp5e/TfYtAzGF/TLas3p1ck32zSZThMbnE4tyTOmk8dL
	UOMnf4+L2/k8BZ4hc4JG/HQekaawCG6r/OS6U3FtA+ZRqTTCQYWu0QSQrvU7z3ZDqG1D
	oDlA==
X-Received: by 10.152.87.39 with SMTP id u7mr7822142laz.48.1368199053400;
	Fri, 10 May 2013 08:17:33 -0700 (PDT)
Received: from localhost.localdomain ([79.164.42.118])
	by mx.google.com with ESMTPSA id y1sm1076681lay.3.2013.05.10.08.17.31
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Fri, 10 May 2013 08:17:32 -0700 (PDT)
From: Igor Mitsyanko <i.mitsyanko@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 10 May 2013 19:16:30 +0400
Message-Id: <1368198990-44941-1-git-send-email-i.mitsyanko@gmail.com>
X-Mailer: git-send-email 1.8.1.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.176
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, aliguori@us.ibm.com,
	Igor Mitsyanko <i.mitsyanko@gmail.com>
Subject: [Qemu-trivial] [PATCH] osdep.h: include sys/types.h for ssize_t
	definition
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
X-List-Received-Date: Fri, 10 May 2013 15:17:48 -0000

This fixes build for mingw32

Signed-off-by: Igor Mitsyanko <i.mitsyanko@gmail.com>
---
 include/qemu/osdep.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index 42545bc..17946a3 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -163,6 +163,8 @@ int qemu_create_pidfile(const char *filename);
 int qemu_get_thread_id(void);
 
 #ifndef CONFIG_IOVEC
+#include <sys/types.h>
+
 struct iovec {
     void *iov_base;
     size_t iov_len;
-- 
1.8.1.4


