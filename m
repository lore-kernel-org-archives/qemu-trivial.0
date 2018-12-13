Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gXVFd-0000nj-TP
	for mharc-qemu-trivial@gnu.org; Thu, 13 Dec 2018 12:58:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41034)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gXVFa-0000kA-QS
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 12:58:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gXVFZ-0008A2-R3
	for qemu-trivial@nongnu.org; Thu, 13 Dec 2018 12:58:18 -0500
Received: from mx1.redhat.com ([209.132.183.28]:30068)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gXVFT-0007vn-Ra; Thu, 13 Dec 2018 12:58:13 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 98B1C7AEA8;
	Thu, 13 Dec 2018 17:58:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-56.ams2.redhat.com
	[10.36.116.56])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 6620C648D3;
	Thu, 13 Dec 2018 17:58:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id EE213113860E; Thu, 13 Dec 2018 18:58:07 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
Date: Thu, 13 Dec 2018 18:58:07 +0100
Message-Id: <20181213175807.12039-1-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 13 Dec 2018 17:58:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH] vl: Use error_fatal to simplify obvious
 fatal errors (again)
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
X-List-Received-Date: Thu, 13 Dec 2018 17:58:19 -0000

Patch created mechanically by rerunning:

    $ spatch --in-place --sp-file scripts/coccinelle/use-error_fatal.cocci \
             --macro-file scripts/cocci-macro-file.h vl.c

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 vl.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/vl.c b/vl.c
index a5ae5f23d2..702a828ca2 100644
--- a/vl.c
+++ b/vl.c
@@ -3138,11 +3138,8 @@ int main(int argc, char **argv, char **envp)
                     Visitor *v;
                     BlockdevOptions_queue *bdo;
 
-                    v = qobject_input_visitor_new_str(optarg, "driver", &err);
-                    if (!v) {
-                        error_report_err(err);
-                        exit(1);
-                    }
+                    v = qobject_input_visitor_new_str(optarg, "driver",
+                                                      &error_fatal);
 
                     bdo = g_new(BlockdevOptions_queue, 1);
                     visit_type_BlockdevOptions(v, NULL, &bdo->bdo,
-- 
2.17.2


