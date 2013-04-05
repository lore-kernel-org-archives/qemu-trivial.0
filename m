Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UO7Ka-0007uV-Ph
	for mharc-qemu-trivial@gnu.org; Fri, 05 Apr 2013 10:09:28 -0400
Received: from eggs.gnu.org ([208.118.235.92]:33730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1UO7KT-0007gj-3D
	for qemu-trivial@nongnu.org; Fri, 05 Apr 2013 10:09:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1UO7KM-0008Mg-O7
	for qemu-trivial@nongnu.org; Fri, 05 Apr 2013 10:09:21 -0400
Received: from mx1.redhat.com ([209.132.183.28]:19258)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>)
	id 1UO7K6-0008H9-Aa; Fri, 05 Apr 2013 10:08:58 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r35E8vft018253
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 5 Apr 2013 10:08:57 -0400
Received: from localhost (ovpn-112-21.ams2.redhat.com [10.36.112.21])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r35E8uwe030199; Fri, 5 Apr 2013 10:08:56 -0400
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Fri,  5 Apr 2013 16:08:44 +0200
Message-Id: <1365170926-6361-4-git-send-email-stefanha@redhat.com>
In-Reply-To: <1365170926-6361-1-git-send-email-stefanha@redhat.com>
References: <1365170926-6361-1-git-send-email-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Anthony Liguori <aliguori@us.ibm.com>,
	Alexander Graf <agraf@suse.de>, Stefan Hajnoczi <stefanha@redhat.com>,
	Richard Henderson <rth@twiddle.net>
Subject: [Qemu-trivial] [PATCH 3/5] target-s390: Fix SRNMT
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
X-List-Received-Date: Fri, 05 Apr 2013 14:09:28 -0000

From: Richard Henderson <rth@twiddle.net>

Fallthough into abort = oops.

Cc: qemu-trivial@nongnu.org
Cc: Alexander Graf <agraf@suse.de>
Signed-off-by: Richard Henderson <rth@twiddle.net>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 target-s390x/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target-s390x/translate.c b/target-s390x/translate.c
index a4f2194..0c3cf68 100644
--- a/target-s390x/translate.c
+++ b/target-s390x/translate.c
@@ -3088,6 +3088,7 @@ static ExitStatus op_srnm(DisasContext *s, DisasOps *o)
         break;
     case 0xb9: /* SRNMT */
         pos = 4, len = 3;
+        break;
     default:
         tcg_abort();
     }
-- 
1.8.1.4


