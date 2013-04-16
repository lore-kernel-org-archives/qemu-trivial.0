Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1USDmA-0004eL-Tu
	for mharc-qemu-trivial@gnu.org; Tue, 16 Apr 2013 17:50:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53717)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1USDm6-0004dM-3e
	for qemu-trivial@nongnu.org; Tue, 16 Apr 2013 17:50:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1USDm4-0008BG-MN
	for qemu-trivial@nongnu.org; Tue, 16 Apr 2013 17:50:50 -0400
Received: from qmta03.emeryville.ca.mail.comcast.net ([76.96.30.32]:39333)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1USDm3-0008Ax-Tz
	for qemu-trivial@nongnu.org; Tue, 16 Apr 2013 17:50:48 -0400
Received: from omta23.emeryville.ca.mail.comcast.net ([76.96.30.90])
	by qmta03.emeryville.ca.mail.comcast.net with comcast
	id QcEN1l0061wfjNsA3lqmER; Tue, 16 Apr 2013 21:50:46 +0000
Received: from red.redhat.com ([24.10.251.25])
	by omta23.emeryville.ca.mail.comcast.net with comcast
	id Qlqh1l00k0ZdyUg8jlqkNL; Tue, 16 Apr 2013 21:50:45 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Apr 2013 15:50:41 -0600
Message-Id: <1366149041-626-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 1.8.1.4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20121106; t=1366149046;
	bh=LqP6IFLgXbjpCvfY8TD/21voitWoh0IGhy8y9KXWSFE=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=Yuwo9ZoG5VYZdye59lyZzw6j7y7XXuqM/+zSr3v+Hqm4QuGqNFKM1t7ND82YyOD98
	AQnB69YEXLkbrcTVx+rZYqHKptCz6kqYTIM78Rf2u2iTkR0DeTeVj6kg2fyPOg3VWu
	M3spPvNK8sn/tfbcOTOj4+kN4oqbW3/UsmHIeBbqbPm8kCkNgQo+Kr7PbvmD5fjkMt
	xSQ2edPECTPFJDgFTElBsY1Hoq90gV1FHrCcN3xARuFWucfTdhID2j305myh5GvtqL
	Ts2wNfQuwYx3yGEbF/Xsj4xM8E1O/WJyBKQ0U2KS6w5R6JGftWmyTBZhmUXiJ25UWs
	VsJF3e2oEFieQ==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 76.96.30.32
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com, phrdina@redhat.com,
	quintela@redhat.com
Subject: [Qemu-trivial] [PATCH] migration: reflect incoming failure to shell
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
X-List-Received-Date: Tue, 16 Apr 2013 21:50:52 -0000

Management apps like libvirt don't know to pay attention to
stderr unless there is a non-zero exit status.

* migration.c (process_incoming_migration_co): Exit with non-zero
status on failure.

Signed-off-by: Eric Blake <eblake@redhat.com>
---

Noticed while reviewing:
https://lists.gnu.org/archive/html/qemu-devel/2013-04/msg03293.html
and it seems blatant enough to fix now, rather than waiting for
Pavel's series to stabilize.

Side note: libvirt explicitly forbids all use of exit({0,1}), and
instead encourages exit(EXIT_{SUCCESS,FAILURE}), precisely because
it makes it harder to slip in unintentional successful exits.

 migration.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration.c b/migration.c
index 3b4b467..3eb0fad 100644
--- a/migration.c
+++ b/migration.c
@@ -99,7 +99,7 @@ static void process_incoming_migration_co(void *opaque)
     qemu_fclose(f);
     if (ret < 0) {
         fprintf(stderr, "load of migration failed\n");
-        exit(0);
+        exit(EXIT_FAILURE);
     }
     qemu_announce_self();
     DPRINTF("successfully loaded vm state\n");
-- 
1.8.1.4


