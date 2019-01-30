Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gopqC-0001v7-Ji
	for mharc-qemu-trivial@gnu.org; Wed, 30 Jan 2019 08:23:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37366)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gopqA-0001sl-Sm
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gopq9-0006zd-RG
	for qemu-trivial@nongnu.org; Wed, 30 Jan 2019 08:23:42 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:33043)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gopq4-0006rZ-Jt; Wed, 30 Jan 2019 08:23:36 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 1Mr9OA-1hTvSp11a2-00oIGR; Wed, 30 Jan 2019 14:22:57 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Jiri Slaby <jslaby@suse.cz>, qemu-s390x@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <rth@twiddle.net>, Igor Mammedov <imammedo@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Riku Voipio <riku.voipio@iki.fi>, Stefan Hajnoczi <stefanha@redhat.com>,
	Stafford Horne <shorne@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
	qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Paul Durrant <paul.durrant@citrix.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Date: Wed, 30 Jan 2019 14:22:13 +0100
Message-Id: <20190130132214.25493-13-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190130132214.25493-1-laurent@vivier.eu>
References: <20190130132214.25493-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:SNFDgADADbm/fFXtSZNnqdB9BzRNRMwa2eNInnlQ3eUpqYxVq0Q
	XVU9bIyp5poIPF/hE6jd3ytc1CmvHyr5zlei7Fr7Wrtbfh3NocdJwvnKXPj8Z+1rC9pxd+a
	A44T6KxAOlXKnbvY4lRFK3Zdn7Uqxbf1djkpxXucMBmx39ZpAIKJ42kY5bYjxQ9J4J1EA/w
	bnOZcftjQmGBIfNLuWZbg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:1sTaJX50/Aw=:QFO9PpXOn64oRj7rtl8TWX
	UNtrM1eFarGw6fiGkLa8H83YnLmzLHXZB9h6M7frk7yhs69OjyJTaxgPCa7GD9w3djbjcXZMb
	IoyHflNxDC6XxDs3qO68iYI2cnh36r8M3Eo8PLXZv33nFvsNihWVYuiJYRUl9uCuzb40J+vz0
	t5ZdeVbRbbrZ1gKe0kCjzXnOxZlBIfTfKK9NoBGFL8yLAEG6gW7BBFL+N1GEWcZWgHKg6wXJJ
	fFhVODcURQR4dlfTgX7GFaJMVaNB/297+xi1tOeEhTvi2PRs70ac7prUt0BhRqKS14j27mO9z
	biwY7D1KY5REMXhQGDt4Yoe9pgGu6woygxRGYOiK/th0l48f1PSpAaGLcOZxGdUAS+C5IonlX
	fKdyNthvRbelihpbAQIBD6CCtYDmABrwICmcatZnLrgSirJ5IyEOn28OnT+/EblgfQEkC3Lke
	dzuudB0jpQqbE5gQW6ph6CibhTlkMPDoWXP/2aD4E4F/3hJgyoNLYxCyfC+f+Pik0sWcjmvOE
	mXUKM+djiEiJYav41HB5IPAhTi/kl1Leyszt3+3LghEso2GC6EfZzADRBwY6H/HEc2INOeMKX
	z49Bu/Xmh145tqnWWjng969Jt1Rz4TlfiMCPZ4GgZtnNp/JrCUTfNnQA8LpMb6qhI/uOd9wQV
	5CN1o+qdmcZdHc/0c1xSPRNA7/oDDv3xA/StlstKaqE0kUaP+bJJDsbUXT/nnds2PiyHN2cL1
	9mrHCnHLGpzEwVCGBJYK650hGtdOk2lkJ1rDXk1XrfCg0ACzMf7n/fbk/G8=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.187
Subject: [Qemu-trivial] [PULL 12/13] hw/block: clean up stale xen_disk trace
 entries
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
X-List-Received-Date: Wed, 30 Jan 2019 13:23:44 -0000

From: Paul Durrant <paul.durrant@citrix.com>

This should have been removed then xen_disk.c was removed but I missed them.

Fixes: 19f87870baa570bcd7e80e7657e030bf427f16be
       xen: remove the legacy 'xen_disk' backend
Signed-off-by: Paul Durrant <paul.durrant@citrix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190122145132.12571-1-paul.durrant@citrix.com>
[lv: s/stake/stale/ and add "Fixes" tag]
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/block/trace-events | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/hw/block/trace-events b/hw/block/trace-events
index 55e5a5500c..d0851953c5 100644
--- a/hw/block/trace-events
+++ b/hw/block/trace-events
@@ -121,13 +121,6 @@ nvme_ub_db_wr_invalid_cqhead(uint32_t qid, uint16_t new_head) "completion queue
 nvme_ub_db_wr_invalid_sq(uint32_t qid) "submission queue doorbell write for nonexistent queue, sqid=%"PRIu32", ignoring"
 nvme_ub_db_wr_invalid_sqtail(uint32_t qid, uint16_t new_tail) "submission queue doorbell write value beyond queue size, sqid=%"PRIu32", new_head=%"PRIu16", ignoring"
 
-# hw/block/xen_disk.c
-xen_disk_alloc(char *name) "%s"
-xen_disk_init(char *name) "%s"
-xen_disk_connect(char *name) "%s"
-xen_disk_disconnect(char *name) "%s"
-xen_disk_free(char *name) "%s"
-
 # hw/block/xen-block.c
 xen_block_realize(const char *type, uint32_t disk, uint32_t partition) "%s d%up%u"
 xen_block_connect(const char *type, uint32_t disk, uint32_t partition) "%s d%up%u"
-- 
2.20.1


