Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aTqUR-0000eQ-9D
	for mharc-qemu-trivial@gnu.org; Thu, 11 Feb 2016 07:36:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34569)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqUO-0000an-Qm
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:36:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1aTqUN-0002RK-V6
	for qemu-trivial@nongnu.org; Thu, 11 Feb 2016 07:36:52 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:49514)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1aTqUK-0002Qc-3G; Thu, 11 Feb 2016 07:36:48 -0500
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 90C8C4146D;
	Thu, 11 Feb 2016 15:36:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 82343AAA;
	Thu, 11 Feb 2016 15:19:06 +0300 (MSK)
Received: (nullmailer pid 11179 invoked by uid 1000);
	Thu, 11 Feb 2016 12:19:04 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Thu, 11 Feb 2016 15:18:53 +0300
Message-Id: <945123a554c39b68f38cec87403de1f783a86906.1455192968.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
References: <cover.1455192968.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 04/14] cpu: cpu_save/cpu_load is no more
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
X-List-Received-Date: Thu, 11 Feb 2016 12:36:53 -0000

From: Paolo Bonzini <pbonzini@redhat.com>

Everything has been converted to vmstate.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 exec.c                | 6 ------
 include/qemu-common.h | 6 ------
 2 files changed, 12 deletions(-)

diff --git a/exec.c b/exec.c
index 7d67c11..ca7f8df 100644
--- a/exec.c
+++ b/exec.c
@@ -661,12 +661,6 @@ void cpu_exec_init(CPUState *cpu, Error **errp)
     if (qdev_get_vmsd(DEVICE(cpu)) == NULL) {
         vmstate_register(NULL, cpu_index, &vmstate_cpu_common, cpu);
     }
-#if defined(CPU_SAVE_VERSION) && !defined(CONFIG_USER_ONLY)
-    register_savevm(NULL, "cpu", cpu_index, CPU_SAVE_VERSION,
-                    cpu_save, cpu_load, cpu->env_ptr);
-    assert(cc->vmsd == NULL);
-    assert(qdev_get_vmsd(DEVICE(cpu)) == NULL);
-#endif
     if (cc->vmsd != NULL) {
         vmstate_register(NULL, cpu_index, cc->vmsd, cpu);
     }
diff --git a/include/qemu-common.h b/include/qemu-common.h
index 22b010c..f557be7 100644
--- a/include/qemu-common.h
+++ b/include/qemu-common.h
@@ -330,12 +330,6 @@ bool tcg_enabled(void);
 
 void cpu_exec_init_all(void);
 
-/* CPU save/load.  */
-#ifdef CPU_SAVE_VERSION
-void cpu_save(QEMUFile *f, void *opaque);
-int cpu_load(QEMUFile *f, void *opaque, int version_id);
-#endif
-
 /* Unblock cpu */
 void qemu_cpu_kick_self(void);
 
-- 
2.1.4


