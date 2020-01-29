Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iwscc-00048B-Mk
	for mharc-qemu-trivial@gnu.org; Wed, 29 Jan 2020 14:03:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38495)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iwsca-00046o-JN
 for qemu-trivial@nongnu.org; Wed, 29 Jan 2020 14:03:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iwscZ-0004Vi-N8
 for qemu-trivial@nongnu.org; Wed, 29 Jan 2020 14:03:28 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:56078
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iwscZ-0004VL-KD
 for qemu-trivial@nongnu.org; Wed, 29 Jan 2020 14:03:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580324607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=VvSpx654IyJy8qtmFIUaAm7UgZeOUHxjzj9bbM4ngkI=;
 b=SnlS+8lR+K8wKgRLAl7mqHzNT8KYKdY+2vvUWS8ifY9gnAAka4C09yLu6zERdOMDgfvYwd
 FOOEhgnB+C5R/mFkMgGnr56DV4BfbXSAty6EXyTKDw0bgFQua/mWoo/coj9kkzxt3Y8XvZ
 HQ2EffYIcfaI5yEGJkDgce6EaM0CCqc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-5IbvbSKkNVWBwuP49FokyQ-1; Wed, 29 Jan 2020 14:03:23 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3A8A0107ACC5;
 Wed, 29 Jan 2020 19:03:22 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-184.brq.redhat.com [10.40.205.184])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4FC9D87B06;
 Wed, 29 Jan 2020 19:03:18 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>, qemu-trivial@nongnu.org,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] MAINTAINERS: Cover hppa-softmmu.mak in the HP-PARISC Machines
 section
Date: Wed, 29 Jan 2020 20:03:16 +0100
Message-Id: <20200129190316.16901-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: 5IbvbSKkNVWBwuP49FokyQ-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
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
X-List-Received-Date: Wed, 29 Jan 2020 19:03:29 -0000

Modifications to default-configs/hppa-softmmu.mak should be
reviewed by the hppa-softmmu users (currently a single machine).

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efd3f3875f..2c00a49c42 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -896,6 +896,7 @@ HP B160L
 M: Richard Henderson <rth@twiddle.net>
 R: Helge Deller <deller@gmx.de>
 S: Odd Fixes
+F: default-configs/hppa-softmmu.mak
 F: hw/hppa/
 F: pc-bios/hppa-firmware.img
=20
--=20
2.21.1


