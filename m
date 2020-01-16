Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1is1Da-000229-Qz
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jan 2020 04:13:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36174)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1is1DY-00020q-0R
 for qemu-trivial@nongnu.org; Thu, 16 Jan 2020 04:13:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1is1DW-0002XC-IZ
 for qemu-trivial@nongnu.org; Thu, 16 Jan 2020 04:13:31 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38591
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1is1DW-0002Wn-Ek
 for qemu-trivial@nongnu.org; Thu, 16 Jan 2020 04:13:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579166009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=/UpAN3DhoJ3BUGURReP4AJ8K6hzzG8vCFofr0nVySu8=;
 b=FH1hQqZnRoe6NaFIxN72pUhNvZeC4rXO5DPSpM9saP9/TDI3b7mEgMOQZKLMw8Haoj1a8J
 E/34WkV4MYvrFfBvIRlPOeqZEhSBrvHcjuiYhauQrXqPIArNCLQPAciL6XvuAafSD/QCSv
 wI+SeqhOpCZ6KnyBDGn2hBpjhRt4UhI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-108-WUlVjE-HM3WgwypU-RxD3w-1; Thu, 16 Jan 2020 04:13:26 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E0F29800A02;
 Thu, 16 Jan 2020 09:13:24 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-187.brq.redhat.com [10.40.205.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0E1B888894;
 Thu, 16 Jan 2020 09:13:16 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefan Hajnoczi <stefanha@redhat.com>, qemu-trivial@nongnu.org,
 Alexey Kardashevskiy <aik@ozlabs.ru>, Laurent Vivier <lvivier@redhat.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH] Makefile: Keep trace-events-subdirs ordered
Date: Thu, 16 Jan 2020 10:13:14 +0100
Message-Id: <20200116091314.25024-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: WUlVjE-HM3WgwypU-RxD3w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
X-List-Received-Date: Thu, 16 Jan 2020 09:13:33 -0000

To ease review and reduce likelihood of merge failures (see [*]),
keep trace-events-subdirs ordered when possible, following eb7ccb3c0.

[*] https://www.mail-archive.com/qemu-devel@nongnu.org/msg671007.html
    Duplicate trace-events-subdirs entries generates duplicated
    symbols when using the LTTng Userspace Tracer library.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
"Fixes: 26b8e6dc & 8d5d515a0"

To be even safer we should use $(sort $(trace-events-subdirs))
---
 Makefile.objs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile.objs b/Makefile.objs
index 7c1e50f9d6..d62f908965 100644
--- a/Makefile.objs
+++ b/Makefile.objs
@@ -142,8 +142,8 @@ trace-events-subdirs +=3D nbd
 trace-events-subdirs +=3D scsi
 endif
 ifeq ($(CONFIG_SOFTMMU),y)
-trace-events-subdirs +=3D chardev
 trace-events-subdirs +=3D audio
+trace-events-subdirs +=3D chardev
 trace-events-subdirs +=3D hw/9pfs
 trace-events-subdirs +=3D hw/acpi
 trace-events-subdirs +=3D hw/alpha
@@ -191,6 +191,7 @@ trace-events-subdirs +=3D migration
 trace-events-subdirs +=3D net
 trace-events-subdirs +=3D ui
 endif
+trace-events-subdirs +=3D hw/core
 trace-events-subdirs +=3D hw/display
 trace-events-subdirs +=3D qapi
 trace-events-subdirs +=3D qom
@@ -203,7 +204,6 @@ trace-events-subdirs +=3D target/riscv
 trace-events-subdirs +=3D target/s390x
 trace-events-subdirs +=3D target/sparc
 trace-events-subdirs +=3D util
-trace-events-subdirs +=3D hw/core
=20
 trace-events-files =3D $(SRC_PATH)/trace-events $(trace-events-subdirs:%=
=3D$(SRC_PATH)/%/trace-events)
=20
--=20
2.21.1


