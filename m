Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eC0cp-0002XY-ST
	for mharc-qemu-trivial@gnu.org; Tue, 07 Nov 2017 04:56:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44636)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1eC0cn-0002UB-Mo
	for qemu-trivial@nongnu.org; Tue, 07 Nov 2017 04:56:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mlureau@redhat.com>) id 1eC0ch-0003ES-VE
	for qemu-trivial@nongnu.org; Tue, 07 Nov 2017 04:56:51 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36688)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mlureau@redhat.com>) id 1eC0ch-0003Dk-P0
	for qemu-trivial@nongnu.org; Tue, 07 Nov 2017 04:56:47 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E5F79C0587CA
	for <qemu-trivial@nongnu.org>; Tue,  7 Nov 2017 09:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E5F79C0587CA
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=mlureau@redhat.com
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DE1615C460
	for <qemu-trivial@nongnu.org>; Tue,  7 Nov 2017 09:56:45 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
	(zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id D77664BB78
	for <qemu-trivial@nongnu.org>; Tue,  7 Nov 2017 09:56:45 +0000 (UTC)
Date: Tue, 7 Nov 2017 04:56:45 -0500 (EST)
From: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
To: qemu-trivial@nongnu.org
Message-ID: <1101861683.37201679.1510048605600.JavaMail.zimbra@redhat.com>
In-Reply-To: <20171106185411.19551-1-marcandre.lureau@redhat.com>
References: <20171106185411.19551-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.36.112.38, 10.4.195.10]
Thread-Topic: .gitignore: remove vscclient
Thread-Index: k2n9zWLv2s4z3nck9lxhfrSSSo7Uww==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 07 Nov 2017 09:56:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] Fwd: [PATCH] .gitignore: remove vscclient
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
X-List-Received-Date: Tue, 07 Nov 2017 09:56:54 -0000

CC qemu-trivial

----- Forwarded Message -----
From: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Marc-Andr=C3=A9 Lureau" <marcandre.lureau@redhat.com>
Sent: Monday, November 6, 2017 7:54:10 PM
Subject: [PATCH] .gitignore: remove vscclient

It was removed with libcacard.

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 .gitignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/.gitignore b/.gitignore
index 588769b250..433f64f429 100644
--- a/.gitignore
+++ b/.gitignore
@@ -53,7 +53,6 @@
 /qemu-version.h.tmp
 /module_block.h
 /scsi/qemu-pr-helper
-/vscclient
 /vhost-user-scsi
 /fsdev/virtfs-proxy-helper
 *.tmp
--=20
2.15.0.rc0.40.gaefcc5f6f


