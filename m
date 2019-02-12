Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gtYQk-0002P0-Fr
	for mharc-qemu-trivial@gnu.org; Tue, 12 Feb 2019 08:48:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45318)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1gtYQi-0002MG-7A
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 08:48:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1gtYQh-0007G5-GZ
	for qemu-trivial@nongnu.org; Tue, 12 Feb 2019 08:48:56 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36166)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1gtYQf-0006sy-GD; Tue, 12 Feb 2019 08:48:53 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2682240220;
	Tue, 12 Feb 2019 13:48:49 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-178.ams2.redhat.com
	[10.36.116.178])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B0A21649C5;
	Tue, 12 Feb 2019 13:48:19 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, pbonzini@redhat.com, kraxel@redhat.com,
	mst@redhat.com
Cc: qemu-trivial@nongnu.org
Date: Tue, 12 Feb 2019 13:47:56 +0000
Message-Id: <20190212134758.10514-3-dgilbert@redhat.com>
In-Reply-To: <20190212134758.10514-1-dgilbert@redhat.com>
References: <20190212134758.10514-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Tue, 12 Feb 2019 13:48:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/4] HMP: Prepend errors with 'Error:'
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
X-List-Received-Date: Tue, 12 Feb 2019 13:48:57 -0000

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Always make error messages start with 'Error:' as a fallback
to make sure that anything parsing them can tell it failed.

Note: Some places don't use hmp_handle_error

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hmp.c b/hmp.c
index b2a2b1f84e..4d14718fea 100644
--- a/hmp.c
+++ b/hmp.c
@@ -62,7 +62,7 @@ static void hmp_handle_error(Monitor *mon, Error **errp=
)
 {
     assert(errp);
     if (*errp) {
-        error_report_err(*errp);
+        error_reportf_err(*errp, "Error: ");
     }
 }
=20
--=20
2.20.1


