Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNCag-0004Vg-FH
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2018 03:01:30 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40933)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <root@localhost.localdomain>) id 1gNApk-0007PN-7q
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 01:08:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <root@localhost.localdomain>) id 1gNApj-0007J9-Jx
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 01:08:56 -0500
Received: from [123.58.160.154] (port=4685 helo=localhost.localdomain)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <root@localhost.localdomain>)
	id 1gNApe-0007H7-2g; Thu, 15 Nov 2018 01:08:50 -0500
Received: by localhost.localdomain (Postfix, from userid 0)
	id ECAFC80D8CA7; Wed, 14 Nov 2018 22:00:15 -0800 (PST)
From: root <root@localhost.localdomain>
To: pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
	laurent@vivier.eu
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, Li Qiang <liq3ea@gmail.com>
Date: Wed, 14 Nov 2018 22:00:14 -0800
Message-Id: <1542261614-2606-1-git-send-email-root@localhost.localdomain>
X-Mailer: git-send-email 1.8.3.1
X-detected-operating-system: by eggs.gnu.org: Windows NT kernel [generic]
	[fuzzy]
X-Received-From: 123.58.160.154
X-Mailman-Approved-At: Thu, 15 Nov 2018 03:01:29 -0500
Subject: [Qemu-trivial] [PATCH] target: hax: replace g_malloc with g_malloc0
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
X-List-Received-Date: Thu, 15 Nov 2018 06:08:57 -0000

From: Li Qiang <liq3ea@gmail.com>

And also the g_malloc doesn't need check return value,
remove it.

Cc: qemu-trivial@nongnu.org

Signed-off-by: Li Qiang <liq3ea@gmail.com>
---
 target/i386/hax-all.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
index d2e512856b..a460c605af 100644
--- a/target/i386/hax-all.c
+++ b/target/i386/hax-all.c
@@ -154,13 +154,7 @@ int hax_vcpu_create(int id)
         return 0;
     }
 
-    vcpu = g_malloc(sizeof(struct hax_vcpu_state));
-    if (!vcpu) {
-        fprintf(stderr, "Failed to alloc vcpu state\n");
-        return -ENOMEM;
-    }
-
-    memset(vcpu, 0, sizeof(struct hax_vcpu_state));
+    vcpu = g_malloc0(sizeof(struct hax_vcpu_state));
 
     ret = hax_host_create_vcpu(hax_global.vm->fd, id);
     if (ret) {
@@ -250,11 +244,8 @@ struct hax_vm *hax_vm_create(struct hax_state *hax)
         return hax->vm;
     }
 
-    vm = g_malloc(sizeof(struct hax_vm));
-    if (!vm) {
-        return NULL;
-    }
-    memset(vm, 0, sizeof(struct hax_vm));
+    vm = g_malloc0(sizeof(struct hax_vm));
+
     ret = hax_host_create_vm(hax, &vm_id);
     if (ret) {
         fprintf(stderr, "Failed to create vm %x\n", ret);
-- 
2.11.0


