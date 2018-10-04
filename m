Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g86LY-0005mK-66
	for mharc-qemu-trivial@gnu.org; Thu, 04 Oct 2018 12:19:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46401)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1g86LU-0005kL-AE
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:19:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1g86LK-0002Yn-OE
	for qemu-trivial@nongnu.org; Thu, 04 Oct 2018 12:19:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:30596)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1g86L4-0002OD-EP; Thu, 04 Oct 2018 12:18:58 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 32ADFC049D65;
	Thu,  4 Oct 2018 16:18:56 +0000 (UTC)
Received: from dhcp-17-10.bos.redhat.com (dhcp-17-10.bos.redhat.com
	[10.18.17.10])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7932577C02;
	Thu,  4 Oct 2018 16:18:54 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Cleber Rosa <crosa@redhat.com>, qemu-trivial@nongnu.org,
	Max Reitz <mreitz@redhat.com>
Date: Thu,  4 Oct 2018 12:18:43 -0400
Message-Id: <20181004161852.11673-2-crosa@redhat.com>
In-Reply-To: <20181004161852.11673-1-crosa@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 04 Oct 2018 16:18:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 01/10] qemu-img.c: comment typo fix
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
X-List-Received-Date: Thu, 04 Oct 2018 16:19:27 -0000

A trivial comment typo fix.

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 qemu-img.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qemu-img.c b/qemu-img.c
index b12f4cd19b..a96b76c187 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -1085,7 +1085,7 @@ static int64_t find_nonzero(const uint8_t *buf, int64_t n)
 }
 
 /*
- * Returns true iff the first sector pointed to by 'buf' contains at least
+ * Returns true if the first sector pointed to by 'buf' contains at least
  * a non-NUL byte.
  *
  * 'pnum' is set to the number of sectors (including and immediately following
-- 
2.17.1


