Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1S5Bnr-0002LP-TF
	for mharc-qemu-trivial@gnu.org; Wed, 07 Mar 2012 03:00:55 -0500
Received: from eggs.gnu.org ([208.118.235.92]:48168)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@cyf-mac.local>) id 1S5Bnp-0002Ko-4g
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 03:00:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex@cyf-mac.local>) id 1S5Bnn-0001V6-KY
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 03:00:52 -0500
Received: from [199.19.224.98] (port=52617 helo=cyf-mac.local)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex@cyf-mac.local>) id 1S5Bnn-0001UP-65
	for qemu-trivial@nongnu.org; Wed, 07 Mar 2012 03:00:51 -0500
Received: by cyf-mac.local (Postfix, from userid 501)
	id 31D03620EEE; Tue,  6 Mar 2012 21:25:27 +0800 (CST)
From: Chen Yufei <cyfdecyf@gmail.com>
To: qemu-trivial@nongnu.org
Date: Tue,  6 Mar 2012 21:24:45 +0800
Message-Id: <1331040285-17807-1-git-send-email-cyfdecyf@gmail.com>
X-Mailer: git-send-email 1.7.8.1
In-Reply-To: <y>
References: <y>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 199.19.224.98
Subject: [Qemu-trivial] [PATCH] Remove type field in ModuleEntry as it's not
	used.
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
X-List-Received-Date: Wed, 07 Mar 2012 08:00:54 -0000

---
 module.c |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

diff --git a/module.c b/module.c
index 106a969..c3a6da7 100644
--- a/module.c
+++ b/module.c
@@ -19,7 +19,6 @@
 
 typedef struct ModuleEntry
 {
-    module_init_type type;
     void (*init)(void);
     QTAILQ_ENTRY(ModuleEntry) node;
 } ModuleEntry;
-- 
1.7.3.2


