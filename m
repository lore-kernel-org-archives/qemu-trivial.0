Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YIxAD-0007lh-OE
	for mharc-qemu-trivial@gnu.org; Wed, 04 Feb 2015 05:26:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38512)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YIxA8-0007b8-5N
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 05:26:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YIxA4-0003WR-5W
	for qemu-trivial@nongnu.org; Wed, 04 Feb 2015 05:26:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:56104)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YIx9z-0003Tk-LE; Wed, 04 Feb 2015 05:26:15 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t14AQANd009453
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Wed, 4 Feb 2015 05:26:10 -0500
Received: from blackfin.pond.sub.org (ovpn-116-58.ams2.redhat.com
	[10.36.116.58])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t14AQ83E019695
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 4 Feb 2015 05:26:09 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 136693008AD6; Wed,  4 Feb 2015 11:26:08 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Date: Wed,  4 Feb 2015 11:26:04 +0100
Message-Id: <1423045567-29855-4-git-send-email-armbru@redhat.com>
In-Reply-To: <1423045567-29855-1-git-send-email-armbru@redhat.com>
References: <1423045567-29855-1-git-send-email-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, arei.gonglei@huawei.com, eblake@redhat.com,
	thuth@linux.vnet.ibm.com
Subject: [Qemu-trivial] [PATCH v2 3/6] kvm: g_malloc() can't fail,
	bury dead error handling
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
X-List-Received-Date: Wed, 04 Feb 2015 10:26:27 -0000

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Gonglei <arei.gonglei@huawei.com>
---
 kvm-all.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kvm-all.c b/kvm-all.c
index 2f21a4e..05a79c2 100644
--- a/kvm-all.c
+++ b/kvm-all.c
@@ -2070,10 +2070,6 @@ int kvm_insert_breakpoint(CPUState *cpu, target_ulong addr,
         }
 
         bp = g_malloc(sizeof(struct kvm_sw_breakpoint));
-        if (!bp) {
-            return -ENOMEM;
-        }
-
         bp->pc = addr;
         bp->use_count = 1;
         err = kvm_arch_insert_sw_breakpoint(cpu, bp);
-- 
1.9.3


