Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iQrpC-00012s-PC
	for mharc-qemu-trivial@gnu.org; Sat, 02 Nov 2019 07:44:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52986)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iQrpA-000116-Fr
 for qemu-trivial@nongnu.org; Sat, 02 Nov 2019 07:44:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iQrp8-0004NA-82
 for qemu-trivial@nongnu.org; Sat, 02 Nov 2019 07:44:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:28857
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iQrp8-0004I1-4Y
 for qemu-trivial@nongnu.org; Sat, 02 Nov 2019 07:44:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1572695044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+1THuLuSw0xjQPjCO5YWe8AoN+US1aCmSHR/MVwMob0=;
 b=Gqz+IilCzxY2d1aYIAkMeenQHrvCwLw/7YrPeg7dM3Dtxdf+UEkGlVtwzKkG7ObWnhRjIX
 /10LqpjXxQEgSSnCZfWPwZlLklcserX1KtXtDN8Q4VRB1Ih/NoUT32NQNKmW3DxAmWh12L
 caEf/EccpMD/EdoRxIHyVkZ56RpXelo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-JnDCX2CQOBaWxlZILnh34Q-1; Sat, 02 Nov 2019 07:44:00 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0BB661800DFD;
 Sat,  2 Nov 2019 11:43:59 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-63.brq.redhat.com [10.40.204.63])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0BBB35D9CD;
 Sat,  2 Nov 2019 11:43:49 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	Sergio Lopez <slp@redhat.com>
Cc: qemu-trivial@nongnu.org, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Bruce Rogers <brogers@suse.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] Makefile: install bios-microvm like other binary blobs
Date: Sat,  2 Nov 2019 12:43:46 +0100
Message-Id: <20191102114346.6445-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: JnDCX2CQOBaWxlZILnh34Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 02 Nov 2019 11:44:09 -0000

From: Bruce Rogers <brogers@suse.com>

Commit 0d5fae3e52e introduced bios-microvm.bin but forgot to add
it to the list of blobs being installed.
Add it to the list of BLOBS that get installed.

Fixes: 0d5fae3e52e "roms: add microvm-bios (qboot) as binary"
Signed-off-by: Bruce Rogers <brogers@suse.com>
[PMD: Reworded description]
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index bd6376d295..755aa6c5f5 100644
--- a/Makefile
+++ b/Makefile
@@ -770,7 +770,7 @@ de-ch  es     fo  fr-ca  hu     ja  mk  pt  sl     tr \
 bepo    cz
=20
 ifdef INSTALL_BLOBS
-BLOBS=3Dbios.bin bios-256k.bin sgabios.bin vgabios.bin vgabios-cirrus.bin =
\
+BLOBS=3Dbios.bin bios-256k.bin bios-microvm.bin sgabios.bin vgabios.bin vg=
abios-cirrus.bin \
 vgabios-stdvga.bin vgabios-vmware.bin vgabios-qxl.bin vgabios-virtio.bin \
 vgabios-ramfb.bin vgabios-bochs-display.bin vgabios-ati.bin \
 ppc_rom.bin openbios-sparc32 openbios-sparc64 openbios-ppc QEMU,tcx.bin QE=
MU,cgthree.bin \
--=20
2.21.0


