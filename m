Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UjxmR-0001tF-FE
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jun 2013 16:24:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1UjxmL-0001h2-Uf
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:24:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1UjxmG-0005vQ-Kd
	for qemu-trivial@nongnu.org; Tue, 04 Jun 2013 16:24:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1Ujxm6-0005tN-A5; Tue, 04 Jun 2013 16:24:10 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r54KO9cg010554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 4 Jun 2013 16:24:09 -0400
Received: from garlic.sbx07344.newyony.wayport.net (vpn1-5-107.ams2.redhat.com
	[10.36.5.107])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r54KNeZi022345; Tue, 4 Jun 2013 16:24:07 -0400
From: Alon Levy <alevy@redhat.com>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue,  4 Jun 2013 16:23:38 -0400
Message-Id: <1370377419-31788-4-git-send-email-alevy@redhat.com>
In-Reply-To: <1370377419-31788-1-git-send-email-alevy@redhat.com>
References: <1370377419-31788-1-git-send-email-alevy@redhat.com>
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 4/5] libcacard/vreader.c: fix possible NULL
	dereference
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
X-List-Received-Date: Tue, 04 Jun 2013 20:24:30 -0000

Reported by Coverity:

Error: FORWARD_NULL (CWE-476):
qemu-1.5.0/libcacard/vreader.c:267: cond_false: Condition "card == NULL", taking false branch
qemu-1.5.0/libcacard/vreader.c:269: if_end: End of if statement
qemu-1.5.0/libcacard/vreader.c:272: cond_false: Condition "apdu == NULL", taking false branch
qemu-1.5.0/libcacard/vreader.c:275: else_branch: Reached else branch
qemu-1.5.0/libcacard/vreader.c:280: cond_false: Condition "response", taking false branch
qemu-1.5.0/libcacard/vreader.c:284: if_end: End of if statement
qemu-1.5.0/libcacard/vreader.c:280: var_compare_op: Comparing "response" to null implies that "response" might be null.
qemu-1.5.0/libcacard/vreader.c:286: cond_true: Condition "card_status == VCARD_DONE", taking true branch
qemu-1.5.0/libcacard/vreader.c:287: cond_true: Condition "card_status == VCARD_DONE", taking true branch
qemu-1.5.0/libcacard/vreader.c:288: var_deref_op: Dereferencing null pointer "response".

Signed-off-by: Alon Levy <alevy@redhat.com>
---
 libcacard/vreader.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/libcacard/vreader.c b/libcacard/vreader.c
index 5793d73..60eb43b 100644
--- a/libcacard/vreader.c
+++ b/libcacard/vreader.c
@@ -260,7 +260,7 @@ vreader_xfr_bytes(VReader *reader,
 {
     VCardAPDU *apdu;
     VCardResponse *response = NULL;
-    VCardStatus card_status;
+    VCardStatus card_status = VCARD_FAIL;
     unsigned short status;
     VCard *card = vreader_get_card(reader);
 
-- 
1.8.2.1


