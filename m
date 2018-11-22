Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gPq1H-0003nO-4W
	for mharc-qemu-trivial@gnu.org; Thu, 22 Nov 2018 09:31:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1gPq1E-0003mv-JF
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 09:31:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1gPq1B-00027g-F3
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 09:31:48 -0500
Received: from 9.mo173.mail-out.ovh.net ([46.105.72.44]:56305)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1gPq1B-0001kd-5s
	for qemu-trivial@nongnu.org; Thu, 22 Nov 2018 09:31:45 -0500
Received: from player691.ha.ovh.net (unknown [10.109.143.249])
	by mo173.mail-out.ovh.net (Postfix) with ESMTP id 31845E3303
	for <qemu-trivial@nongnu.org>; Thu, 22 Nov 2018 15:31:42 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
	[82.253.208.248]) (Authenticated sender: groug@kaod.org)
	by player691.ha.ovh.net (Postfix) with ESMTPSA id 7BBE7342E5B;
	Thu, 22 Nov 2018 14:31:36 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-trivial@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Date: Thu, 22 Nov 2018 15:31:36 +0100
Message-ID: <154289709597.235079.13366613265527123490.stgit@bahia.lan>
User-Agent: StGit/unknown-version
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 13676587645989329387
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedruddtledgieeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.72.44
Subject: [Qemu-trivial] [PATCH] spapr: drop redundant statement in
 spapr_populate_drconf_memory()
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
X-List-Received-Date: Thu, 22 Nov 2018 14:31:49 -0000

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/ppc/spapr.c |    2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 9c41098b5781..7771a628f879 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -893,8 +893,6 @@ static int spapr_populate_drconf_memory(sPAPRMachineState *spapr, void *fdt)
     /* ibm,associativity-lookup-arrays */
     buf_len = (nr_nodes * 4 + 2) * sizeof(uint32_t);
     cur_index = int_buf = g_malloc0(buf_len);
-
-    cur_index = int_buf;
     int_buf[0] = cpu_to_be32(nr_nodes);
     int_buf[1] = cpu_to_be32(4); /* Number of entries per associativity list */
     cur_index += 2;


