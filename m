Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sr9cv-0006p6-7t
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jul 2012 11:23:53 -0400
Received: from eggs.gnu.org ([208.118.235.92]:38272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1Sr9co-0006mn-6w
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 11:23:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1Sr9ce-0002Td-H1
	for qemu-trivial@nongnu.org; Tue, 17 Jul 2012 11:23:46 -0400
Received: from thoth.sbs.de ([192.35.17.2]:20739)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1Sr9ce-0002TT-7F; Tue, 17 Jul 2012 11:23:36 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.13.6/8.13.6) with ESMTP id q6HFNY5q024089;
	Tue, 17 Jul 2012 17:23:34 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id q6HFNXXP031090;
	Tue, 17 Jul 2012 17:23:33 +0200
Message-ID: <50058375.5080009@siemens.com>
Date: Tue, 17 Jul 2012 17:23:33 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: qemu-trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 192.35.17.2
Cc: qemu-devel <qemu-devel@nongnu.org>
Subject: [Qemu-trivial] [PATCH] Stop saving/restoring cpu_single_env
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
X-List-Received-Date: Tue, 17 Jul 2012 15:23:51 -0000

This variable is now thread-local, so cannot change anymore while
dropping the global mutex.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 cpus.c |    3 ---
 1 files changed, 0 insertions(+), 3 deletions(-)

diff --git a/cpus.c b/cpus.c
index b182b3d..733568d 100644
--- a/cpus.c
+++ b/cpus.c
@@ -660,10 +660,7 @@ void run_on_cpu(CPUArchState *env, void (*func)(void *data), void *data)
 
     qemu_cpu_kick(env);
     while (!wi.done) {
-        CPUArchState *self_env = cpu_single_env;
-
         qemu_cond_wait(&qemu_work_cond, &qemu_global_mutex);
-        cpu_single_env = self_env;
     }
 }
 
-- 
1.7.3.4

