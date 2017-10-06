Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cPi-0008Dr-Dq
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:52:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41545)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPg-0008CG-AC
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPf-0005mD-GW
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:52:16 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:51467)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cPb-0005hg-2C; Fri, 06 Oct 2017 19:52:11 -0400
Received: by mail-qt0-x241.google.com with SMTP id q4so34329897qtq.8;
	Fri, 06 Oct 2017 16:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=Diko5qXOLF4sVroZHpITLZhVtWKNf7zhiL/atUuRpcM=;
	b=J6KIVncI35prZDDEwyDTplK2lFech/TMfuubUeDEzSpnJfMqEbuv9S1cJecUK5lcWi
	vn2ipmSUbnZoCKo+c3t9ux7+u30PhiUB5SFo7BHMiQwQpd+ZV8/A/A/FP+L0uL7IanMh
	UhZ1xxfrbjoK41EzNiE0IxM+z8Rrmw26rr6WJggfWTR1Z5iaBNx2DKr0sjLJTLV7WVw3
	QZOcJypWMI1kCwbiC+higqs7fu+Q1fuP/sJggYAB2RKv7eoStK5rfr26uNdWOivIEYzN
	RQaQrD1FS246S65wnrv+wLhs0243rR7nMpxKmDRbYwW2J+WdgG/He23mH+d/uZNZjqiz
	qyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=Diko5qXOLF4sVroZHpITLZhVtWKNf7zhiL/atUuRpcM=;
	b=Zx2Fk5oiFBe/5R40UkIPVrhnydAhs+9PrC6EBC1+Hi5ty76M4YTIuXzMb/BUpupvPc
	HsX7Ta3e8I/TYziyx944y4a0a5f7D7mdAFRR/hwrl3tdz8jzzmUtIVHgfFWy9rBhg4jA
	iaBoDd/uv2QfOddPkamttQd4irBy9L2yzKGq/ea2W9pzFE1ei5wNLPOxt49sIFWfV1JF
	veCJHO9efv61yPWDj59T1YBbEpWvxfXny6BFvqxVo9I4zxieXC8qoQFFZpI3X0G7y+rC
	kpgfoT5YCc+ydcU3w0Eww+g22T9QpaBiCmT1TeAg7Q4ZjbNCAVPqjDXrEi89g52q3GFZ
	oLcw==
X-Gm-Message-State: AMCzsaV7gtLr61XpbRrsPjZQcb3fGelWPAhYlN94PsKXCUcm9TBagj6C
	epXjvj3PFPS7qGZYlLIOTsE=
X-Google-Smtp-Source: AOwi7QCuTZ7NwFuV3ZlKbUh6+A1+vz6E+DWlQxsc9JB5eW/Zm7krg7wCB5fpWHuSnW2/+1kd4nkr/w==
X-Received: by 10.200.25.137 with SMTP id u9mr5696740qtj.81.1507333930544;
	Fri, 06 Oct 2017 16:52:10 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.52.06
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:52:10 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Artyom Tarasenko <atar4qemu@gmail.com>, Chris Wulff <crwulff@gmail.com>,
	Marek Vasut <marex@denx.de>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Fri,  6 Oct 2017 20:49:23 -0300
Message-Id: <20171006235023.11952-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH 28/88] disas: use g_new() family of functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:52:17 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
[PMD: fixed const cast, squashed M68K + NiosII + SPARC, renamed subject "disas"]
---
 disas/m68k.c  | 3 +--
 disas/nios2.c | 3 +--
 disas/sparc.c | 3 +--
 3 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/disas/m68k.c b/disas/m68k.c
index 61b689ef3e..31cf6ea5f9 100644
--- a/disas/m68k.c
+++ b/disas/m68k.c
@@ -1886,8 +1886,7 @@ print_insn_m68k (bfd_vma memaddr, disassemble_info *info)
 
       /* Then create a sorted table of pointers
 	 that point into the unsorted table.  */
-      opc_pointer[0] = malloc (sizeof (struct m68k_opcode *)
-                               * m68k_numopcodes);
+      opc_pointer[0] = g_new(const struct m68k_opcode *, m68k_numopcodes);
       opcodes[0] = opc_pointer[0];
 
       for (i = 1; i < 16; i++)
diff --git a/disas/nios2.c b/disas/nios2.c
index b342936d21..9e6e1e6a1f 100644
--- a/disas/nios2.c
+++ b/disas/nios2.c
@@ -2625,8 +2625,7 @@ nios2_init_opcode_hash (nios2_disassembler_state *state)
 
 	if (bucket)
 	  {
-	    new_hash =
-	      (nios2_opcode_hash *) malloc (sizeof (nios2_opcode_hash));
+	    new_hash = g_new(nios2_opcode_hash, 1);
 	    if (new_hash == NULL)
 	      {
 		fprintf (stderr,
diff --git a/disas/sparc.c b/disas/sparc.c
index f120f4e86d..6d0adab8a7 100644
--- a/disas/sparc.c
+++ b/disas/sparc.c
@@ -2684,8 +2684,7 @@ print_insn_sparc (bfd_vma memaddr, disassemble_info *info)
       current_arch_mask = compute_arch_mask (info->mach);
 
       if (!opcodes_initialized)
-        sorted_opcodes =
-          malloc (sparc_num_opcodes * sizeof (sparc_opcode *));
+        sorted_opcodes = g_new(const sparc_opcode *, sparc_num_opcodes);
       /* Reset the sorted table so we can resort it.  */
       for (i = 0; i < sparc_num_opcodes; ++i)
         sorted_opcodes[i] = &sparc_opcodes[i];
-- 
2.14.2


