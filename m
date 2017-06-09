Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dJLiI-0003mE-48
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jun 2017 11:20:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37026)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dJLiF-0003jb-4V
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:20:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dJLiE-0006d7-E5
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:20:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59406)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dJLi4-0006Uf-O6; Fri, 09 Jun 2017 11:20:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BF86685541;
	Fri,  9 Jun 2017 15:20:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com BF86685541
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx04.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com BF86685541
Received: from red.redhat.com (ovpn-121-94.rdu2.redhat.com [10.10.121.94])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B34CD5DD70;
	Fri,  9 Jun 2017 15:20:22 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, marcandre.lureau@redhat.com, qemu-trivial@nongnu.org,
	Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	qemu-block@nongnu.org (open list:Block layer core)
Date: Fri,  9 Jun 2017 10:20:17 -0500
Message-Id: <20170609152017.7286-3-eblake@redhat.com>
In-Reply-To: <20170609152017.7286-1-eblake@redhat.com>
References: <20170609152017.7286-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 09 Jun 2017 15:20:23 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/2] qobject: Catch another straggler for use
 of qdict_put_str()
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
X-List-Received-Date: Fri, 09 Jun 2017 15:20:36 -0000

Dan's addition of key-secret improvements in commit 29cf9336 was
developed prior to the addition of QDict scalar insertion macros,
but merged after the general cleanup in commit 46f5ac20.
Patch created mechanically by rerunning:
  spatch --sp-file scripts/coccinelle/qobject.cocci \
         --macro-file scripts/cocci-macro-file.h --dir . --in-place

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qemu-img.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-img.c b/qemu-img.c
index 0ad698d..6c972f7 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -355,7 +355,7 @@ static int img_add_key_secrets(void *opaque,
     QDict *options = opaque;

     if (g_str_has_suffix(name, "key-secret")) {
-        qdict_put(options, name, qstring_from_str(value));
+        qdict_put_str(options, name, value);
     }

     return 0;
-- 
2.9.4


