Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bma6S-0008B9-1c
	for mharc-qemu-trivial@gnu.org; Wed, 21 Sep 2016 01:29:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39598)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bma6L-00086s-SW
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2016 01:29:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>) id 1bma6K-0007oX-UN
	for qemu-trivial@nongnu.org; Wed, 21 Sep 2016 01:29:45 -0400
Received: from ozlabs.org ([103.22.144.67]:51428)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgibson@ozlabs.org>)
	id 1bma6B-0007ms-5H; Wed, 21 Sep 2016 01:29:35 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
	id 3sf7V44bghz9t1T; Wed, 21 Sep 2016 15:29:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=gibson.dropbear.id.au; s=201602; t=1474435772;
	bh=lCJqgRwUX3tdoxi8LR2nu9fl/xvGrBAGhZEjBvCTgFo=;
	h=From:To:Cc:Subject:Date:From;
	b=PwUCP6wXjGnrFES6NSIg/Zsje+ZLbvooxj0EvsXEOrCRXTIqBbInZhggN37DI6rb2
	iX/vI4s7Kawo7By6Eiwi4QTOrd3fidbB36BIK6LqfiKF8IbIE3F12WE8pFST8YdhEL
	IzRhUXudmlVZfQXtCSlxc/kKHX+mwdpUEkwKn+as=
From: David Gibson <david@gibson.dropbear.id.au>
To: qemu-trivial@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org, ehabkost@redhat.com,
	lcapitulino@redhat.com, armbru@redhat.com, imammedo@redhat.com,
	David Gibson <david@gibson.dropbear.id.au>,
	=?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Date: Wed, 21 Sep 2016 15:29:26 +1000
Message-Id: <1474435766-9727-1-git-send-email-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 103.22.144.67
Subject: [Qemu-trivial] [PATCH] monitor: fix crash for platforms without a
 CPU 0
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
X-List-Received-Date: Wed, 21 Sep 2016 05:29:50 -0000

Now that we allow CPU hot unplug on a few platforms, we can end up in a
situation where we don't have a CPU with index 0.  Or at least we could,
if we didn't have code to explicitly prohibit unplug of CPU 0.

Longer term we want to allow CPU 0 unplug, this patch is an early step in
allowing this, by removing an assumption in the monitor code that CPU 0
always exists.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
[dwg: Rewrote commit message to better explain background]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 monitor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

Anyone want to volunteer to take this through their tree?  If not, I
can take it through my ppc tree.

diff --git a/monitor.c b/monitor.c
index 8bb8bbf..83c4edf 100644
--- a/monitor.c
+++ b/monitor.c
@@ -1025,7 +1025,7 @@ int monitor_set_cpu(int cpu_index)
 CPUState *mon_get_cpu(void)
 {
     if (!cur_mon->mon_cpu) {
-        monitor_set_cpu(0);
+        monitor_set_cpu(first_cpu->cpu_index);
     }
     cpu_synchronize_state(cur_mon->mon_cpu);
     return cur_mon->mon_cpu;
--=20
2.7.4


