Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnMpg-0002rp-Hq
	for mharc-qemu-trivial@gnu.org; Thu, 31 Aug 2017 06:36:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41803)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMpe-0002po-Nq
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:36:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dnMpd-0006Qh-U7
	for qemu-trivial@nongnu.org; Thu, 31 Aug 2017 06:36:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58668)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dnMpb-0006MW-3Q; Thu, 31 Aug 2017 06:36:15 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 2D5AFC047B61;
	Thu, 31 Aug 2017 10:36:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 2D5AFC047B61
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=marcandre.lureau@redhat.com
Received: from localhost (ovpn-112-36.ams2.redhat.com [10.36.112.36])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C256060A98;
	Thu, 31 Aug 2017 10:36:11 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Marcel Apfelbaum <marcel@redhat.com>
Date: Thu, 31 Aug 2017 12:34:24 +0200
Message-Id: <20170831103432.6007-22-marcandre.lureau@redhat.com>
In-Reply-To: <20170831103432.6007-1-marcandre.lureau@redhat.com>
References: <20170831103432.6007-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 31 Aug 2017 10:36:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PULL 21/29] msix: use DIV_ROUND_UP
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
X-List-Received-Date: Thu, 31 Aug 2017 10:36:20 -0000

I used the clang-tidy qemu-round check to generate the fix:
https://github.com/elmarco/clang-tools-extra

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
Reviewed-by: Richard Henderson <rth@twiddle.net>
---
 hw/pci/msix.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci/msix.c b/hw/pci/msix.c
index 5078d3dd19..c944c02135 100644
--- a/hw/pci/msix.c
+++ b/hw/pci/msix.c
@@ -438,7 +438,7 @@ void msix_save(PCIDevice *dev, QEMUFile *f)
     }
=20
     qemu_put_buffer(f, dev->msix_table, n * PCI_MSIX_ENTRY_SIZE);
-    qemu_put_buffer(f, dev->msix_pba, (n + 7) / 8);
+    qemu_put_buffer(f, dev->msix_pba, DIV_ROUND_UP(n, 8));
 }
=20
 /* Should be called after restoring the config space. */
@@ -453,7 +453,7 @@ void msix_load(PCIDevice *dev, QEMUFile *f)
=20
     msix_clear_all_vectors(dev);
     qemu_get_buffer(f, dev->msix_table, n * PCI_MSIX_ENTRY_SIZE);
-    qemu_get_buffer(f, dev->msix_pba, (n + 7) / 8);
+    qemu_get_buffer(f, dev->msix_pba, DIV_ROUND_UP(n, 8));
     msix_update_function_masked(dev);
=20
     for (vector =3D 0; vector < n; vector++) {
--=20
2.14.1.146.gd35faa819


