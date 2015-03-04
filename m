Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YTCuh-0000w5-C9
	for mharc-qemu-trivial@gnu.org; Wed, 04 Mar 2015 12:16:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38667)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTCua-0000bX-Uv
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:16:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YTCuZ-0000zl-Gw
	for qemu-trivial@nongnu.org; Wed, 04 Mar 2015 12:16:44 -0500
Received: from isrv.corpit.ru ([86.62.121.231]:39544)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YTCuO-0000vL-J3; Wed, 04 Mar 2015 12:16:32 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0A89F408A2;
	Wed,  4 Mar 2015 20:16:32 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.corpit.ru (Postfix) with SMTP id 5B4B4968;
	Wed,  4 Mar 2015 20:07:10 +0300 (MSK)
Received: (nullmailer pid 17563 invoked by uid 1000);
	Wed, 04 Mar 2015 17:07:05 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Wed,  4 Mar 2015 20:06:56 +0300
Message-Id: <0badf8eba3d9d7d7eaf737d309225d35585d5ff1.1425488753.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
References: <cover.1425488753.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	Michael Tokarev <mjt@tls.msk.ru>
Subject: [Qemu-trivial] [PULL 39/47] disas/arm: Fix warnings caused by
	missing 'static' attribute
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 04 Mar 2015 17:16:49 -0000

From: Stefan Weil <sw@weilnetz.de>

Warnings from the Sparse static analysis tool:

disas/arm.c:1552:15: warning:
 symbol 'last_type' was not declared. Should it be static?
disas/arm.c:1553:5: warning:
 symbol 'last_mapping_sym' was not declared. Should it be static?
disas/arm.c:1554:9: warning:
 symbol 'last_mapping_addr' was not declared. Should it be static?

Instead of adding 'static', the unused variables and the unused code which
refers to those variables (which was deactivated a long time ago in
commit 4b0f1a8b) are removed.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 disas/arm.c | 128 ------------------------------------------------------------
 1 file changed, 128 deletions(-)

diff --git a/disas/arm.c b/disas/arm.c
index 76e97a8..6165246 100644
--- a/disas/arm.c
+++ b/disas/arm.c
@@ -1549,10 +1549,6 @@ enum map_type {
   MAP_DATA
 };
 
-enum map_type last_type;
-int last_mapping_sym = -1;
-bfd_vma last_mapping_addr = 0;
-
 /* Decode a bitfield of the form matching regexp (N(-N)?,)*N(-N)?.
    Returns pointer to following character of the format string and
    fills in *VALUEP and *WIDTHP with the extracted value and number of
@@ -3878,135 +3874,11 @@ print_insn_arm (bfd_vma pc, struct disassemble_info *info)
   int           is_data = false;
   unsigned int	size = 4;
   void	 	(*printer) (bfd_vma, struct disassemble_info *, long);
-#if 0
-  bfd_boolean   found = false;
-
-  if (info->disassembler_options)
-    {
-      parse_disassembler_options (info->disassembler_options);
-
-      /* To avoid repeated parsing of these options, we remove them here.  */
-      info->disassembler_options = NULL;
-    }
-
-  /* First check the full symtab for a mapping symbol, even if there
-     are no usable non-mapping symbols for this address.  */
-  if (info->symtab != NULL
-      && bfd_asymbol_flavour (*info->symtab) == bfd_target_elf_flavour)
-    {
-      bfd_vma addr;
-      int n;
-      int last_sym = -1;
-      enum map_type type = MAP_ARM;
-
-      if (pc <= last_mapping_addr)
-	last_mapping_sym = -1;
-      is_thumb = (last_type == MAP_THUMB);
-      found = false;
-      /* Start scanning at the start of the function, or wherever
-	 we finished last time.  */
-      n = info->symtab_pos + 1;
-      if (n < last_mapping_sym)
-	n = last_mapping_sym;
-
-      /* Scan up to the location being disassembled.  */
-      for (; n < info->symtab_size; n++)
-	{
-	  addr = bfd_asymbol_value (info->symtab[n]);
-	  if (addr > pc)
-	    break;
-	  if ((info->section == NULL
-	       || info->section == info->symtab[n]->section)
-	      && get_sym_code_type (info, n, &type))
-	    {
-	      last_sym = n;
-	      found = true;
-	    }
-	}
-
-      if (!found)
-	{
-	  n = info->symtab_pos;
-	  if (n < last_mapping_sym - 1)
-	    n = last_mapping_sym - 1;
-
-	  /* No mapping symbol found at this address.  Look backwards
-	     for a preceding one.  */
-	  for (; n >= 0; n--)
-	    {
-	      if (get_sym_code_type (info, n, &type))
-		{
-		  last_sym = n;
-		  found = true;
-		  break;
-		}
-	    }
-	}
-
-      last_mapping_sym = last_sym;
-      last_type = type;
-      is_thumb = (last_type == MAP_THUMB);
-      is_data = (last_type == MAP_DATA);
-
-      /* Look a little bit ahead to see if we should print out
-	 two or four bytes of data.  If there's a symbol,
-	 mapping or otherwise, after two bytes then don't
-	 print more.  */
-      if (is_data)
-	{
-	  size = 4 - (pc & 3);
-	  for (n = last_sym + 1; n < info->symtab_size; n++)
-	    {
-	      addr = bfd_asymbol_value (info->symtab[n]);
-	      if (addr > pc)
-		{
-		  if (addr - pc < size)
-		    size = addr - pc;
-		  break;
-		}
-	    }
-	  /* If the next symbol is after three bytes, we need to
-	     print only part of the data, so that we can use either
-	     .byte or .short.  */
-	  if (size == 3)
-	    size = (pc & 1) ? 1 : 2;
-	}
-    }
-
-  if (info->symbols != NULL)
-    {
-      if (bfd_asymbol_flavour (*info->symbols) == bfd_target_coff_flavour)
-	{
-	  coff_symbol_type * cs;
-
-	  cs = coffsymbol (*info->symbols);
-	  is_thumb = (   cs->native->u.syment.n_sclass == C_THUMBEXT
-		      || cs->native->u.syment.n_sclass == C_THUMBSTAT
-		      || cs->native->u.syment.n_sclass == C_THUMBLABEL
-		      || cs->native->u.syment.n_sclass == C_THUMBEXTFUNC
-		      || cs->native->u.syment.n_sclass == C_THUMBSTATFUNC);
-	}
-      else if (bfd_asymbol_flavour (*info->symbols) == bfd_target_elf_flavour
-	       && !found)
-	{
-	  /* If no mapping symbol has been found then fall back to the type
-	     of the function symbol.  */
-	  elf_symbol_type *  es;
-	  unsigned int       type;
-
-	  es = *(elf_symbol_type **)(info->symbols);
-	  type = ELF_ST_TYPE (es->internal_elf_sym.st_info);
-
-	  is_thumb = (type == STT_ARM_TFUNC) || (type == STT_ARM_16BIT);
-	}
-    }
-#else
   int little;
 
   little = (info->endian == BFD_ENDIAN_LITTLE);
   is_thumb |= (pc & 1);
   pc &= ~(bfd_vma)1;
-#endif
 
   if (force_thumb)
     is_thumb = true;
-- 
2.1.4


