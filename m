Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gbz1h-0007lF-2P
	for mharc-qemu-trivial@gnu.org; Tue, 25 Dec 2018 21:34:29 -0500
Received: from eggs.gnu.org ([208.118.235.92]:37512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <plaes@plaes.org>) id 1gbxD7-0007B0-Ko
	for qemu-trivial@nongnu.org; Tue, 25 Dec 2018 19:38:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <plaes@plaes.org>) id 1gbxD3-00055U-OF
	for qemu-trivial@nongnu.org; Tue, 25 Dec 2018 19:38:09 -0500
Received: from plaes.org ([188.166.43.21]:39054)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <plaes@plaes.org>)
	id 1gbxCu-0004qe-Kp; Tue, 25 Dec 2018 19:37:56 -0500
Received: from localhost (185-237-29-85.dyn.estpak.ee [85.29.237.185])
	by plaes.org (Postfix) with ESMTPSA id 604CD40377;
	Wed, 26 Dec 2018 00:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=plaes.org; s=mail;
	t=1545784644; bh=M25/Lq+17Ad436oCFcE9Eouyh1/N8MRo7HOlMBBylP8=;
	h=From:To:Cc:Subject:Date:From;
	b=QxrWT/XZhoGqUf3pS9pehVKjttqTOjb0boG5IZikXTtFgOzKJbzD+9Pz1RC3yjWTA
	s+jNuITzT7Ke3z5CejTR+MtIHbRgpO33jlvbZzkFB07q07BrlV8bv5tQAXzkLBr+50
	A2NpuOhi9C9mkZqtl7jA2lGZ9MSHZ+hMIeC/3QjSewhPzheQTg2lK2lUwBzKora9gk
	Lu8RHPxlPbdkAhWiAjhfQtbF8aFgVk1hlw7PBFESw18KaSy6woajMXxQcnoSPj1HWd
	7dQGYqIsC1z6Vj04G4kR1XxA4srRG3+QmTys1W35f72DuXrC7VyeBEDA1WesB1lyas
	92nMS5l4kfRHw==
From: Priit Laes <plaes@plaes.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Priit Laes <plaes@plaes.org>
Date: Wed, 26 Dec 2018 02:37:22 +0200
Message-Id: <20181226003722.31257-1-plaes@plaes.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 188.166.43.21
X-Mailman-Approved-At: Tue, 25 Dec 2018 21:34:27 -0500
Subject: [Qemu-trivial] [PATCH] qom: Include qemu/fprintf-fn.h in cpu.h
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
X-List-Received-Date: Wed, 26 Dec 2018 00:38:14 -0000

QOM cpu.h uses fprintf_function which requires Qemu's
qemu/fprintf-fn.h header. Include it.

Signed-off-by: Priit Laes <plaes@plaes.org>
---
 include/qom/cpu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/qom/cpu.h b/include/qom/cpu.h
index 1396f53e5b..6d1ba53d72 100644
--- a/include/qom/cpu.h
+++ b/include/qom/cpu.h
@@ -26,6 +26,7 @@
 #include "exec/memattrs.h"
 #include "qapi/qapi-types-run-state.h"
 #include "qemu/bitmap.h"
+#include "qemu/fprintf-fn.h"
 #include "qemu/rcu_queue.h"
 #include "qemu/queue.h"
 #include "qemu/thread.h"
--=20
2.20.1


