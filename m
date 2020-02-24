Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j6KqD-0005dI-PB
	for mharc-qemu-trivial@gnu.org; Mon, 24 Feb 2020 16:00:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52705)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j6KqA-0005Vn-3S
 for qemu-trivial@nongnu.org; Mon, 24 Feb 2020 16:00:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j6Kq8-0006gz-SD
 for qemu-trivial@nongnu.org; Mon, 24 Feb 2020 16:00:33 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:27146
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j6Kq8-0006gV-Nj
 for qemu-trivial@nongnu.org; Mon, 24 Feb 2020 16:00:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1582578032;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EyHoT0Qb2y3urabGTzLY9V8OCntZ8ljZmUDxRnm6IFA=;
 b=CTKJMnNhTNZWpA982mq0hXkzIDRAvEcfIZgTOTWhK0yCKk0Pg1H+0b/x7n9OW9vbE5817w
 gZpZQkS6NsCPEaYrx7EugMg7LlazGVj0Z3UfvQu6XrkdbBD5RSeKaGLk1CsmwrW8NYdyoI
 UPWRg9xrI5QFAbMJCzEKFNIvCPPThNE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-137-a_m10qtTNKiPziwI6xmWdQ-1; Mon, 24 Feb 2020 16:00:30 -0500
X-MC-Unique: a_m10qtTNKiPziwI6xmWdQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BD60DBA6;
 Mon, 24 Feb 2020 21:00:26 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-205-162.brq.redhat.com [10.40.205.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9F76F5C241;
 Mon, 24 Feb 2020 21:00:11 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Kevin Wolf <kwolf@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 qemu-block@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Joel Stanley <joel@jms.id.au>, qemu-ppc@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Magnus Damm <magnus.damm@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Jason Wang <jasowang@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Laurent Vivier <laurent@vivier.eu>, Palmer Dabbelt <palmer@dabbelt.com>,
 Peter Chubb <peter.chubb@nicta.com.au>, Max Reitz <mreitz@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
 Michael Walle <michael@walle.cc>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Richard Henderson <rth@twiddle.net>,
 David Gibson <david@gibson.dropbear.id.au>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-riscv@nongnu.org,
 Fabien Chouteau <chouteau@adacore.com>, qemu-trivial@nongnu.org
Subject: [PATCH RESEND v2 19/32] hw/i386/pc_sysfw: Remove unused 'ram_size'
 argument
Date: Mon, 24 Feb 2020 21:55:20 +0100
Message-Id: <20200224205533.23798-20-philmd@redhat.com>
In-Reply-To: <20200224205533.23798-1-philmd@redhat.com>
References: <20200224205533.23798-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Mon, 24 Feb 2020 21:00:35 -0000

While named 'ram_size', this argument holds the size of the
flash. Since it is unused, remove it.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
Cc: qemu-trivial@nongnu.org

 hw/i386/pc_sysfw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index e864c09ea8..07b35ee9d9 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -51,8 +51,7 @@
 #define FLASH_SECTOR_SIZE 4096
=20
 static void pc_isa_bios_init(MemoryRegion *rom_memory,
-                             MemoryRegion *flash_mem,
-                             int ram_size)
+                             MemoryRegion *flash_mem)
 {
     uint64_t isa_bios_size;
     MemoryRegion *isa_bios =3D g_new(MemoryRegion, 1);
@@ -182,7 +181,7 @@ static void pc_system_flash_map(PCMachineState *pcms,
=20
         if (i =3D=3D 0) {
             flash_mem =3D pflash_cfi01_get_memory(system_flash);
-            pc_isa_bios_init(rom_memory, flash_mem, size);
+            pc_isa_bios_init(rom_memory, flash_mem);
=20
             /* Encrypt the pflash boot ROM */
             if (kvm_memcrypt_enabled()) {
--=20
2.21.1


