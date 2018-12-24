Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gbT6i-000600-IY
	for mharc-qemu-trivial@gnu.org; Mon, 24 Dec 2018 11:29:32 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58641)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wainersm@redhat.com>) id 1gbSU4-0002m5-O9
	for qemu-trivial@nongnu.org; Mon, 24 Dec 2018 10:49:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wainersm@redhat.com>) id 1gbSU2-00043w-QP
	for qemu-trivial@nongnu.org; Mon, 24 Dec 2018 10:49:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:60256)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <wainersm@redhat.com>)
	id 1gbSTv-0003tl-0f; Mon, 24 Dec 2018 10:49:27 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B157EC04AC54;
	Mon, 24 Dec 2018 15:49:24 +0000 (UTC)
Received: from virtlab501.virt.lab.eng.bos.redhat.com
	(virtlab501.virt.lab.eng.bos.redhat.com [10.19.152.162])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1DB7C60161;
	Mon, 24 Dec 2018 15:49:23 +0000 (UTC)
From: Wainer dos Santos Moschetta <wainersm@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com
Date: Mon, 24 Dec 2018 10:49:22 -0500
Message-Id: <20181224154922.3338-1-wainersm@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 24 Dec 2018 15:49:24 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
X-Mailman-Approved-At: Mon, 24 Dec 2018 11:29:31 -0500
Subject: [Qemu-trivial] [PATCH] hw/core: fix whitespace in a sentence
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
X-List-Received-Date: Mon, 24 Dec 2018 15:49:37 -0000

Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>
---
 hw/core/machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 4439ea663f..a0beeeb2a9 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -591,7 +591,7 @@ static void machine_class_init(ObjectClass *oc, void =
*data)
     object_class_property_add_bool(oc, "dump-guest-core",
         machine_get_dump_guest_core, machine_set_dump_guest_core, &error=
_abort);
     object_class_property_set_description(oc, "dump-guest-core",
-        "Include guest memory in  a core dump", &error_abort);
+        "Include guest memory in a core dump", &error_abort);
=20
     object_class_property_add_bool(oc, "mem-merge",
         machine_get_mem_merge, machine_set_mem_merge, &error_abort);
--=20
2.19.2


