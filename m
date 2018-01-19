Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ecV6R-0005UK-5A
	for mharc-qemu-trivial@gnu.org; Fri, 19 Jan 2018 06:44:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42382)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ecV6O-0005U1-VG
	for qemu-trivial@nongnu.org; Fri, 19 Jan 2018 06:44:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1ecV6K-0005UW-Vc
	for qemu-trivial@nongnu.org; Fri, 19 Jan 2018 06:44:56 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:60890)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1ecV6K-0005RV-Ky; Fri, 19 Jan 2018 06:44:52 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue003 [212.227.15.167]) with ESMTPSA
	(Nemesis)
	id 0M8dKp-1eyYBl06FP-00wCKV; Fri, 19 Jan 2018 12:44:50 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>
Date: Fri, 19 Jan 2018 12:44:44 +0100
Message-Id: <20180119114444.7590-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.14.3
X-Provags-ID: V03:K0:85YeNUue5ht7VrByot7p/Ej8C82Pv1tU1G4TuqBRC5DEW2Ulcxr
	56O2TFVwTTymqFTZgPn2jSioQYwKS9gzu/wXmZVpPseEzMQn+rNYNM2nbpijbESEfCAWgpv
	MtpqJ+2xADcR/UHM1WjV5WMDK13sMeyFoRWIGnvFW8TbXx3QLy9aUGY64FXplB1VMwEBh8I
	li/cvHXBdacpbResxL8KQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:gHMGw1Kv2g8=:HUpEvyi3U39lQgYfx61fCy
	Oun+1wqwnTkJsif7eADq3ySdp4nlS5t6rUWdGgYqGRQ488p937M/JKZ26HQpHlK0SG/+dE1uU
	2JxW0iS8LzU/rmfcqc5dgMYCeCoc4U7NynbZQYyGTultl3aa+q/8Nmr6GVkjW80zwxn78SEVk
	bIiUH5Uo1yIHbxAT6I8GNZf+3f8NZ6cbAPn4bU/xGgCThkBPPu/w6MTugqKfS2rf7YbLweSFs
	fbV8PGyEdG8/Ja+A2Ztr+J+OdCo62zgQOEQw6fw53wHG9ms33QSCE4N8T7FwdlO07wCNHQ+6g
	4Lq3ozp4kdBbwSM6TLwDU73jabwpQjHI6oHr8c2VQtLsmXg34iPMRpiOEX+EKC3NlSzWwHNZp
	94ZiHnDT9wUm1lGI5DmAoKqdANdO+VcpjQ2cTLtXWwzHWLlteB7TI4o1lpSEWcOOk9lYRo+VU
	8QRjKsfIzQXt1T3L26CWt5jsCoAnELCN6sbbtDnN40M0sfsBz0P34OSOziTHnJOgtyHBzjQce
	FMOhZVtlwsgc14B5m1HvPIc8PzlpzQt8IBACe3G7GqEwb/5d22Przbz0MhnDy2SmMi+hgfozD
	hSwXp5BxBNeV3ZNHuhxYIO125Vmpf8lz2A/5bPhuRaMKVLaBTGiPsIlNoZem5yEUcvSrG4nBf
	RwninzCBo5+2lBPwm4CT+kIZkNlffqmMyFj28o3XTzChRt4QjjVklaUAL+RFhUDWtE0sHgaq/
	0PJA59PNX9iWLDM7fv1GsTDDHxwI03hkyyN8ug==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.134
Subject: [Qemu-trivial] [PATCH] target/m68k: fix TCG variable double free
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
X-List-Received-Date: Fri, 19 Jan 2018 11:44:57 -0000

t64 is also unconditionally freed after the switch () { ... }

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index f0e86a73d4..ea18df940a 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -969,7 +969,6 @@ static void gen_load_fp(DisasContext *s, int opsize, TCGv addr, TCGv_ptr fp)
     case OS_DOUBLE:
         tcg_gen_qemu_ld64(t64, addr, index);
         gen_helper_extf64(cpu_env, fp, t64);
-        tcg_temp_free_i64(t64);
         break;
     case OS_EXTENDED:
         if (m68k_feature(s->env, M68K_FEATURE_CF_FPU)) {
-- 
2.14.3


