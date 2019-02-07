Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1grpTF-0002Vj-CH
	for mharc-qemu-trivial@gnu.org; Thu, 07 Feb 2019 14:36:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55037)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1grpTB-0002U2-VS
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 14:36:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1grpT8-0007Ym-1t
	for qemu-trivial@nongnu.org; Thu, 07 Feb 2019 14:36:20 -0500
Received: from mx1.redhat.com ([209.132.183.28]:48390)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1grpT4-0007WB-Gf; Thu, 07 Feb 2019 14:36:14 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A386C811A9;
	Thu,  7 Feb 2019 19:36:13 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-120-41.rdu2.redhat.com
	[10.10.120.41])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id F366162FA3;
	Thu,  7 Feb 2019 19:36:10 +0000 (UTC)
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Thu,  7 Feb 2019 14:36:03 -0500
Message-Id: <20190207193605.25676-3-crosa@redhat.com>
In-Reply-To: <20190207193605.25676-1-crosa@redhat.com>
References: <20190207193605.25676-1-crosa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Thu, 07 Feb 2019 19:36:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/4] configure: fix qemu-img name
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
X-List-Received-Date: Thu, 07 Feb 2019 19:36:22 -0000

Signed-off-by: Cleber Rosa <crosa@redhat.com>
---
 configure | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configure b/configure
index ff55e2273e..c8fc1647fe 100755
--- a/configure
+++ b/configure
@@ -1768,7 +1768,7 @@ disabled with --disable-FEATURE, default is enabled=
 if available:
   virglrenderer   virgl rendering support
   xfsctl          xfsctl support
   qom-cast-debug  cast debugging support
-  tools           build qemu-io, qemu-nbd and qemu-image tools
+  tools           build qemu-io, qemu-nbd and qemu-img tools
   vxhs            Veritas HyperScale vDisk backend support
   bochs           bochs image format support
   cloop           cloop image format support
--=20
2.20.1


