Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRe6q-0007bS-0L
	for mharc-qemu-trivial@gnu.org; Wed, 20 Dec 2017 08:08:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41889)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eRe6n-0007bF-OL
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 08:08:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1eRe6j-0000Qn-Iv
	for qemu-trivial@nongnu.org; Wed, 20 Dec 2017 08:08:29 -0500
Received: from mout.kundenserver.de ([212.227.17.13]:57769)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1eRe6j-0000NQ-9D; Wed, 20 Dec 2017 08:08:25 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue104 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 0Mgw4G-1eenFH2B0q-00M5tu; Wed, 20 Dec 2017 14:08:23 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org,
	Laurent Vivier <laurent@vivier.eu>
Date: Wed, 20 Dec 2017 14:08:15 +0100
Message-Id: <20171220130815.20708-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.14.3
X-Provags-ID: V03:K0:Wh3SMR7FbI0jdPf4zo2w4T05WOxvh2CZy+jSfxTn9PgOb76GP8N
	QY5RbLwKy5uYMNozl0myEULh7xIzsEn6v84R18/OBiGt/hb1JWk313qXOoOINyvaOXmXvQ+
	KvEsJrjfQblqjSb6Z6SVYcvuv/IUnEajVyqJvfCv8ZnqATxjZhLQjsBBINConS8Fjh4AP2W
	BrUR3/stcGeS3/h9AkMJA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:lSJNFpLL900=:73aM6lchZydN24jhucJCxD
	Kx9N4F6F7qiN0RnmKn6D9PBRWsmnPfuIJjuCqj5OZ9KT4Zv55ZmDDMbdV/3WJ0tW3lUqEU3H2
	PSvm+4hnsOwZfBR2GX7Jl3fSGBfUfUXwv4zvZkJVsDE+OGurxZrjytJWWtV2SLwA8nAgn09Tg
	9M+5Tym/C0GEuwSLwwT4D3HLVD+9OjIhqC5VreSu/+sYjLqkq7hBad5a3ObBGmntUwcojTt0s
	YjW4VpT8M7OVxDmquhnuL6/TzqttNPxqB0Oh3vylyZQpGLc+qvc1eMPR9X3CgwGRRosI3ZSYN
	H1sjZ4+rELDJ4PMz/meXyHpKFB1x4ZLi8UpGG3U041XOZXobMKXOXyw36A6kxoPiJvVUsgG68
	ZebZDLAQy3ggavGHwB2+2lkiv/B4JePFVM+mLRHZ3reluKuw2sR5BpqEq3pDHjOnS4y8DWX/A
	+EbfigzegKDF3qge4CuXL/uhk/eXWMRtaXa/VYjZ2fCwKp6hrfP7H3vpnPaza9ODE9uvaR5lL
	js9NDBTHXBv0dF53XWEcxgfa0S6XO1phMLq/frJR4cHl6Mb0mekUv84IvLQ9PijF2xRDtk/PX
	+/dnJWqIrJJPW3Z6TAQ9MwFIwuJ6wZ1KXrHvJq2GrD2iKDFLm/J8Va8ttC29lrIbFtQxe2tFY
	VMF1C5bu+A3j+1Vckou7T3yGcSDtSBOV73hA1QGkV9umyvsYw+YlwlBZ/dVi4VhZLK9W6ubGw
	zYA1ON1KIzCYqBP9sHb3QuEZ7DVVJJzO8iyWvg==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.13
Subject: [Qemu-trivial] [PATCH] target/m68k: remove unused variable
 gen_throws_exception
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
X-List-Received-Date: Wed, 20 Dec 2017 13:08:30 -0000

It has been introduced by e6e5906b6e ("ColdFire target."),
but the content is never used.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index b60909222c..dfb2d5dad2 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -181,11 +181,6 @@ static void do_writebacks(DisasContext *s)
 #define IS_USER(s) s->user
 #endif
 
-/* XXX: move that elsewhere */
-/* ??? Fix exceptions.  */
-static void *gen_throws_exception;
-#define gen_last_qop NULL
-
 typedef void (*disas_proc)(CPUM68KState *env, DisasContext *s, uint16_t insn);
 
 #ifdef DEBUG_DISPATCH
@@ -310,7 +305,6 @@ static inline TCGv gen_load(DisasContext * s, int opsize, TCGv addr, int sign)
     default:
         g_assert_not_reached();
     }
-    gen_throws_exception = gen_last_qop;
     return tmp;
 }
 
@@ -331,7 +325,6 @@ static inline void gen_store(DisasContext *s, int opsize, TCGv addr, TCGv val)
     default:
         g_assert_not_reached();
     }
-    gen_throws_exception = gen_last_qop;
 }
 
 typedef enum {
@@ -1001,7 +994,6 @@ static void gen_load_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp)
     }
     tcg_temp_free(tmp);
     tcg_temp_free_i64(t64);
-    gen_throws_exception = gen_last_qop;
 }
 
 static void gen_store_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp)
@@ -1056,7 +1048,6 @@ static void gen_store_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp)
     }
     tcg_temp_free(tmp);
     tcg_temp_free_i64(t64);
-    gen_throws_exception = gen_last_qop;
 }
 
 static void gen_ldst_fp(DisasContext *s, int opsize, TCGv addr,
@@ -5561,7 +5552,6 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb)
     gen_tb_start(tb);
     do {
         pc_offset = dc->pc - pc_start;
-        gen_throws_exception = NULL;
         tcg_gen_insn_start(dc->pc, dc->cc_op);
         num_insns++;
 
-- 
2.14.3


