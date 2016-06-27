Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bHTzE-0007Gq-Tx
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jun 2016 06:41:52 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bHTzC-0007GM-6n
	for qemu-trivial@nongnu.org; Mon, 27 Jun 2016 06:41:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bHTzB-0001UC-B3
	for qemu-trivial@nongnu.org; Mon, 27 Jun 2016 06:41:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56960)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bHTz4-0001TA-11; Mon, 27 Jun 2016 06:41:42 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 79DB8C05B1EE;
	Mon, 27 Jun 2016 10:41:40 +0000 (UTC)
Received: from thh440s.redhat.com (ovpn-116-29.ams2.redhat.com [10.36.116.29])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with
	ESMTP id u5RAfbwS018420; Mon, 27 Jun 2016 06:41:38 -0400
From: Thomas Huth <thuth@redhat.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@siemens.com>, qemu-trivial@nongnu.org
Date: Mon, 27 Jun 2016 12:41:36 +0200
Message-Id: <1467024096-17942-1-git-send-email-thuth@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 27 Jun 2016 10:41:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] slirp: Remove superfluous memset() calls
 from the TFTP code
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
X-List-Received-Date: Mon, 27 Jun 2016 10:41:51 -0000

Commit fad7fb9ccd8013ea03  ("Add IPv6 support to the TFTP code")
refactored some common code for preparing the mbuf into a new
function called tftp_prep_mbuf_data(). One part of this common
code is to do a "memset(m->m_data, 0, m->m_size);" for the related
buffer first. However, at two spots, the memset() was not removed
from the calling function, so it currently done twice in these code
paths. Thus let's delete these superfluous memsets in the calling
functions now.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 slirp/tftp.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/slirp/tftp.c b/slirp/tftp.c
index 12b5ff6..3673402 100644
--- a/slirp/tftp.c
+++ b/slirp/tftp.c
@@ -208,8 +208,6 @@ static void tftp_send_error(struct tftp_session *spt,
     goto out;
   }
 
-  memset(m->m_data, 0, m->m_size);
-
   tp = tftp_prep_mbuf_data(spt, m);
 
   tp->tp_op = htons(TFTP_ERROR);
@@ -237,8 +235,6 @@ static void tftp_send_next_block(struct tftp_session *spt,
     return;
   }
 
-  memset(m->m_data, 0, m->m_size);
-
   tp = tftp_prep_mbuf_data(spt, m);
 
   tp->tp_op = htons(TFTP_DATA);
-- 
1.8.3.1


