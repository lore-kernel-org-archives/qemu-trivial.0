Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVh2Z-0002EC-O9
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2017 12:32:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42054)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh2W-0002Bq-Tf
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:32:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh2V-0003uQ-Vc
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:32:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60120)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dVh2S-0003sv-Oj; Thu, 13 Jul 2017 12:32:28 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9FBB8C0272CE;
	Thu, 13 Jul 2017 16:32:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 9FBB8C0272CE
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx07.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=marcandre.lureau@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 9FBB8C0272CE
Received: from localhost (ovpn-112-18.ams2.redhat.com [10.36.112.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 483087EA5D;
	Thu, 13 Jul 2017 16:32:25 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Thu, 13 Jul 2017 18:31:51 +0200
Message-Id: <20170713163219.9024-2-marcandre.lureau@redhat.com>
In-Reply-To: <20170713163219.9024-1-marcandre.lureau@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Thu, 13 Jul 2017 16:32:27 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 01/29] i386: use ROUND_UP macro
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
X-List-Received-Date: Thu, 13 Jul 2017 16:32:34 -0000

I used the clang-tidy qemu-round check (with the option OnlyAlignUp)
to generate the fix:
https://github.com/elmarco/clang-tools-extra

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 target/i386/arch_dump.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/i386/arch_dump.c b/target/i386/arch_dump.c
index fe0aa36932..1d51bb5206 100644
--- a/target/i386/arch_dump.c
+++ b/target/i386/arch_dump.c
@@ -84,9 +84,9 @@ static int x86_64_write_elf64_note(WriteCoreDumpFunctio=
n f,
     note->n_descsz =3D cpu_to_le32(descsz);
     note->n_type =3D cpu_to_le32(NT_PRSTATUS);
     buf =3D (char *)note;
-    buf +=3D ((sizeof(Elf64_Nhdr) + 3) / 4) * 4;
+    buf +=3D ROUND_UP(sizeof(Elf64_Nhdr), 4);
     memcpy(buf, name, name_size);
-    buf +=3D ((name_size + 3) / 4) * 4;
+    buf +=3D ROUND_UP(name_size, 4);
     memcpy(buf + 32, &id, 4); /* pr_pid */
     buf +=3D descsz - sizeof(x86_64_user_regs_struct)-sizeof(target_ulon=
g);
     memcpy(buf, &regs, sizeof(x86_64_user_regs_struct));
@@ -163,9 +163,9 @@ static int x86_write_elf64_note(WriteCoreDumpFunction=
 f, CPUX86State *env,
     note->n_descsz =3D cpu_to_le32(descsz);
     note->n_type =3D cpu_to_le32(NT_PRSTATUS);
     buf =3D (char *)note;
-    buf +=3D ((sizeof(Elf64_Nhdr) + 3) / 4) * 4;
+    buf +=3D ROUND_UP(sizeof(Elf64_Nhdr), 4);
     memcpy(buf, name, name_size);
-    buf +=3D ((name_size + 3) / 4) * 4;
+    buf +=3D ROUND_UP(name_size, 4);
     memcpy(buf, &prstatus, sizeof(prstatus));
=20
     ret =3D f(note, note_size, opaque);
@@ -218,9 +218,9 @@ int x86_cpu_write_elf32_note(WriteCoreDumpFunction f,=
 CPUState *cs,
     note->n_descsz =3D cpu_to_le32(descsz);
     note->n_type =3D cpu_to_le32(NT_PRSTATUS);
     buf =3D (char *)note;
-    buf +=3D ((sizeof(Elf32_Nhdr) + 3) / 4) * 4;
+    buf +=3D ROUND_UP(sizeof(Elf32_Nhdr), 4);
     memcpy(buf, name, name_size);
-    buf +=3D ((name_size + 3) / 4) * 4;
+    buf +=3D ROUND_UP(name_size, 4);
     memcpy(buf, &prstatus, sizeof(prstatus));
=20
     ret =3D f(note, note_size, opaque);
@@ -353,9 +353,9 @@ static inline int cpu_write_qemu_note(WriteCoreDumpFu=
nction f,
         note64->n_type =3D 0;
     }
     buf =3D note;
-    buf +=3D ((note_head_size + 3) / 4) * 4;
+    buf +=3D ROUND_UP(note_head_size, 4);
     memcpy(buf, name, name_size);
-    buf +=3D ((name_size + 3) / 4) * 4;
+    buf +=3D ROUND_UP(name_size, 4);
     memcpy(buf, &state, sizeof(state));
=20
     ret =3D f(note, note_size, opaque);
--=20
2.13.1.395.gf7b71de06


