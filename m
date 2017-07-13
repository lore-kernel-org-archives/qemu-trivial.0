Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dVh58-0005WO-Sf
	for mharc-qemu-trivial@gnu.org; Thu, 13 Jul 2017 12:35:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43450)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh56-0005Uy-1b
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:35:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@redhat.com>) id 1dVh54-0005vZ-V2
	for qemu-trivial@nongnu.org; Thu, 13 Jul 2017 12:35:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42778)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcandre.lureau@redhat.com>)
	id 1dVh51-0005qz-VK; Thu, 13 Jul 2017 12:35:08 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E7CCDC05681A;
	Thu, 13 Jul 2017 16:35:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com E7CCDC05681A
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=marcandre.lureau@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com E7CCDC05681A
Received: from localhost (ovpn-112-18.ams2.redhat.com [10.36.112.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 2EF0C7A22E;
	Thu, 13 Jul 2017 16:35:02 +0000 (UTC)
From: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
	Eduardo Habkost <ehabkost@redhat.com>
Date: Thu, 13 Jul 2017 18:32:13 +0200
Message-Id: <20170713163219.9024-24-marcandre.lureau@redhat.com>
In-Reply-To: <20170713163219.9024-1-marcandre.lureau@redhat.com>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Thu, 13 Jul 2017 16:35:07 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH v2 23/29] i386/dump: use DIV_ROUND_UP
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
X-List-Received-Date: Thu, 13 Jul 2017 16:35:14 -0000

I used the clang-tidy qemu-round check to generate the fix:
https://github.com/elmarco/clang-tools-extra

Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
---
 target/i386/arch_dump.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/target/i386/arch_dump.c b/target/i386/arch_dump.c
index 1d51bb5206..e081f677fa 100644
--- a/target/i386/arch_dump.c
+++ b/target/i386/arch_dump.c
@@ -77,8 +77,8 @@ static int x86_64_write_elf64_note(WriteCoreDumpFunctio=
n f,
     regs.gs =3D env->segs[R_GS].selector;
=20
     descsz =3D sizeof(x86_64_elf_prstatus);
-    note_size =3D ((sizeof(Elf64_Nhdr) + 3) / 4 + (name_size + 3) / 4 +
-                (descsz + 3) / 4) * 4;
+    note_size =3D (DIV_ROUND_UP(sizeof(Elf64_Nhdr), 4) + DIV_ROUND_UP(na=
me_size, 4) +
+                DIV_ROUND_UP(descsz, 4)) * 4;
     note =3D g_malloc0(note_size);
     note->n_namesz =3D cpu_to_le32(name_size);
     note->n_descsz =3D cpu_to_le32(descsz);
@@ -156,8 +156,8 @@ static int x86_write_elf64_note(WriteCoreDumpFunction=
 f, CPUX86State *env,
=20
     x86_fill_elf_prstatus(&prstatus, env, id);
     descsz =3D sizeof(x86_elf_prstatus);
-    note_size =3D ((sizeof(Elf64_Nhdr) + 3) / 4 + (name_size + 3) / 4 +
-                (descsz + 3) / 4) * 4;
+    note_size =3D (DIV_ROUND_UP(sizeof(Elf64_Nhdr), 4) + DIV_ROUND_UP(na=
me_size, 4) +
+                DIV_ROUND_UP(descsz, 4)) * 4;
     note =3D g_malloc0(note_size);
     note->n_namesz =3D cpu_to_le32(name_size);
     note->n_descsz =3D cpu_to_le32(descsz);
@@ -211,8 +211,8 @@ int x86_cpu_write_elf32_note(WriteCoreDumpFunction f,=
 CPUState *cs,
=20
     x86_fill_elf_prstatus(&prstatus, &cpu->env, cpuid);
     descsz =3D sizeof(x86_elf_prstatus);
-    note_size =3D ((sizeof(Elf32_Nhdr) + 3) / 4 + (name_size + 3) / 4 +
-                (descsz + 3) / 4) * 4;
+    note_size =3D (DIV_ROUND_UP(sizeof(Elf32_Nhdr), 4) + DIV_ROUND_UP(na=
me_size, 4) +
+                DIV_ROUND_UP(descsz, 4)) * 4;
     note =3D g_malloc0(note_size);
     note->n_namesz =3D cpu_to_le32(name_size);
     note->n_descsz =3D cpu_to_le32(descsz);
@@ -338,8 +338,8 @@ static inline int cpu_write_qemu_note(WriteCoreDumpFu=
nction f,
     } else {
         note_head_size =3D sizeof(Elf64_Nhdr);
     }
-    note_size =3D ((note_head_size + 3) / 4 + (name_size + 3) / 4 +
-                (descsz + 3) / 4) * 4;
+    note_size =3D (DIV_ROUND_UP(note_head_size, 4) + DIV_ROUND_UP(name_s=
ize, 4) +
+                DIV_ROUND_UP(descsz, 4)) * 4;
     note =3D g_malloc0(note_size);
     if (type =3D=3D 0) {
         note32 =3D note;
@@ -443,10 +443,10 @@ ssize_t cpu_get_note_size(int class, int machine, i=
nt nr_cpus)
 #endif
     qemu_desc_size =3D sizeof(QEMUCPUState);
=20
-    elf_note_size =3D ((note_head_size + 3) / 4 + (name_size + 3) / 4 +
-                     (elf_desc_size + 3) / 4) * 4;
-    qemu_note_size =3D ((note_head_size + 3) / 4 + (name_size + 3) / 4 +
-                      (qemu_desc_size + 3) / 4) * 4;
+    elf_note_size =3D (DIV_ROUND_UP(note_head_size, 4) + DIV_ROUND_UP(na=
me_size, 4) +
+                     DIV_ROUND_UP(elf_desc_size, 4)) * 4;
+    qemu_note_size =3D (DIV_ROUND_UP(note_head_size, 4) + DIV_ROUND_UP(n=
ame_size, 4) +
+                      DIV_ROUND_UP(qemu_desc_size, 4)) * 4;
=20
     return (elf_note_size + qemu_note_size) * nr_cpus;
 }
--=20
2.13.1.395.gf7b71de06


