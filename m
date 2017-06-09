Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dJLiB-0003gh-Ta
	for mharc-qemu-trivial@gnu.org; Fri, 09 Jun 2017 11:20:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dJLi5-0003d3-Uw
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:20:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1dJLi5-0006Va-8z
	for qemu-trivial@nongnu.org; Fri, 09 Jun 2017 11:20:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47284)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1dJLi3-0006TA-Du; Fri, 09 Jun 2017 11:20:23 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 7BAD337E72;
	Fri,  9 Jun 2017 15:20:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 7BAD337E72
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx05.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=eblake@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 7BAD337E72
Received: from red.redhat.com (ovpn-121-94.rdu2.redhat.com [10.10.121.94])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C50695DD70;
	Fri,  9 Jun 2017 15:20:21 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com,
	marcandre.lureau@redhat.com,
	qemu-trivial@nongnu.org
Date: Fri,  9 Jun 2017 10:20:16 -0500
Message-Id: <20170609152017.7286-2-eblake@redhat.com>
In-Reply-To: <20170609152017.7286-1-eblake@redhat.com>
References: <20170609152017.7286-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Fri, 09 Jun 2017 15:20:22 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 1/2] qobject: Update coccinelle script to
 catch Q{INC, DEC}REF
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
X-List-Received-Date: Fri, 09 Jun 2017 15:20:26 -0000

A recent patch submission was about to use qobject_decref(QOBJECT(E)),
even though we already have QDECREF(E) for that purpose.  While our
tree is currently free from the longhand form, we might as well update
our coccinelle script to catch any future relapses.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 scripts/coccinelle/qobject.cocci | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/coccinelle/qobject.cocci b/scripts/coccinelle/qobject.cocci
index 97703a4..656dc3e 100644
--- a/scripts/coccinelle/qobject.cocci
+++ b/scripts/coccinelle/qobject.cocci
@@ -3,6 +3,12 @@
 expression Obj, Key, E;
 @@
 (
+- qobject_incref(QOBJECT(E));
++ QINCREF(E);
+|
+- qobject_decref(QOBJECT(E));
++ QDECREF(E);
+|
 - qdict_put_obj(Obj, Key, QOBJECT(E));
 + qdict_put(Obj, Key, E);
 |
-- 
2.9.4


