Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UUBP7-00030Q-E8
	for mharc-qemu-trivial@gnu.org; Mon, 22 Apr 2013 03:43:13 -0400
Received: from eggs.gnu.org ([208.118.235.92]:34282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UUBP3-0002vl-QU
	for qemu-trivial@nongnu.org; Mon, 22 Apr 2013 03:43:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UUBP2-0007wk-IC
	for qemu-trivial@nongnu.org; Mon, 22 Apr 2013 03:43:09 -0400
Received: from mail-pd0-f176.google.com ([209.85.192.176]:44365)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UUBP2-0007wH-D6
	for qemu-trivial@nongnu.org; Mon, 22 Apr 2013 03:43:08 -0400
Received: by mail-pd0-f176.google.com with SMTP id r11so3367194pdi.7
	for <qemu-trivial@nongnu.org>; Mon, 22 Apr 2013 00:43:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer
	:x-gm-message-state;
	bh=+yfogUgOy2LyDimmMywI5tZSOE7hYpCJGSEarQJ5GJs=;
	b=KRGmWyVahCJVYQGIj56cdQzk30qlPLe6MXQ1H87RByQIkLYnynsHfRx+ByRl2oTgLm
	JSpXpmagJ249KQjUxRlvnu6PT3F2sV0karrxCO5uyui4b35G9XAAN19gSCMb5cq7Tf8D
	FggDqdfigbbByvw0DDbXK8xL45OUejG+lR4guDnHTpweuICyt/ZHRejFjwTxCmv8XICb
	H4opQsL7dQtLn7QsPs9tB/wlUONzw2BJqTCoqqfOWNduxDJcxHl8nM8VyFQpDnKXkU0w
	uHLNyJoqi5aXwg5HFJ+oy4+RILWbIE8jHSJbf1nFcpBZvWTHq+qU0zILAklp39oQSluJ
	rtdA==
X-Received: by 10.66.241.71 with SMTP id wg7mr11372400pac.155.1366616586126;
	Mon, 22 Apr 2013 00:43:06 -0700 (PDT)
Received: from ka1.ozlabs.ibm.com (ibmaus65.lnk.telstra.net. [165.228.126.9])
	by mx.google.com with ESMTPS id
	lo7sm26018984pab.19.2013.04.22.00.43.02
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 22 Apr 2013 00:43:04 -0700 (PDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Mon, 22 Apr 2013 17:42:50 +1000
Message-Id: <1366616571-4321-1-git-send-email-aik@ozlabs.ru>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQnDEv7il9dKpYjcu3ryfqTjUZwAyGD6ygCt1GownUbqvG+9HNq3RUPq6XgdP8wDkQ+M6h1F
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.192.176
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [Qemu-trivial] [PATCH] translate-all: fix compiler warning and
	linked error
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
X-List-Received-Date: Mon, 22 Apr 2013 07:43:12 -0000

The code did use profile_getclock() but did not include
include/qemu/timer.h where this function is defined. The patch fixes this.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

The exact warning and error messages are:

/home/alexey/pcipassthru/qemu-impreza/translate-all.c:150:5: warning: implicit declaration of function 'profile_getclock' [-Wimplicit-function-declaration]
     ti = profile_getclock();
     ^

...

/home/alexey/pcipassthru/qemu-impreza/translate-all.c:150: undefined reference to `profile_getclock'


---
 translate-all.c |    1 +
 1 file changed, 1 insertion(+)

diff --git a/translate-all.c b/translate-all.c
index 08dd038..d04a116 100644
--- a/translate-all.c
+++ b/translate-all.c
@@ -58,6 +58,7 @@
 
 #include "exec/cputlb.h"
 #include "translate-all.h"
+#include "qemu/timer.h"
 
 //#define DEBUG_TB_INVALIDATE
 //#define DEBUG_FLUSH
-- 
1.7.10.4


