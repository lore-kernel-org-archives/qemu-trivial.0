Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eKP6X-00072d-Ad
	for mharc-qemu-trivial@gnu.org; Thu, 30 Nov 2017 08:42:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40079)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKP6U-0006zh-KT
	for qemu-trivial@nongnu.org; Thu, 30 Nov 2017 08:42:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1eKP6R-0005sE-V2
	for qemu-trivial@nongnu.org; Thu, 30 Nov 2017 08:42:14 -0500
Received: from mx1.redhat.com ([209.132.183.28]:53296)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1eKP6O-0005iU-Fg; Thu, 30 Nov 2017 08:42:08 -0500
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9FACB7AE8B;
	Thu, 30 Nov 2017 13:42:07 +0000 (UTC)
Received: from red.redhat.com (ovpn-122-213.rdu2.redhat.com [10.10.122.213])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 069EA5D6B4;
	Thu, 30 Nov 2017 13:42:05 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>,
	Yongbok Kim <yongbok.kim@mips.com>
Date: Thu, 30 Nov 2017 07:41:58 -0600
Message-Id: <20171130134159.9697-3-eblake@redhat.com>
In-Reply-To: <20171130134159.9697-1-eblake@redhat.com>
References: <20171130134159.9697-1-eblake@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 30 Nov 2017 13:42:07 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: [Qemu-trivial] [PATCH 2/3] mips: Tweak location of ';' in macros
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
X-List-Received-Date: Thu, 30 Nov 2017 13:42:15 -0000

It is more typical to provide the ';' by the caller of a macro
than to embed it in the macro itself; this is because syntax
highlight engines can get confused if a macro is called without
a semicolon before the closing '}'.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 target/mips/msa_helper.c | 34 ++++++++++++++++++----------------
 1 file changed, 18 insertions(+), 16 deletions(-)

diff --git a/target/mips/msa_helper.c b/target/mips/msa_helper.c
index f167a42655..8fb7a369ca 100644
--- a/target/mips/msa_helper.c
+++ b/target/mips/msa_helper.c
@@ -682,13 +682,13 @@ static inline int64_t msa_mod_u_df(uint32_t df, int64_t arg1, int64_t arg2)
     do {                                \
         e = SIGNED_EVEN(a, df);         \
         o = SIGNED_ODD(a, df);          \
-    } while (0);
+    } while (0)

 #define UNSIGNED_EXTRACT(e, o, a, df)   \
     do {                                \
         e = UNSIGNED_EVEN(a, df);       \
         o = UNSIGNED_ODD(a, df);        \
-    } while (0);
+    } while (0)

 static inline int64_t msa_dotp_s_df(uint32_t df, int64_t arg1, int64_t arg2)
 {
@@ -1120,9 +1120,11 @@ void helper_msa_splat_df(CPUMIPSState *env, uint32_t df, uint32_t wd,
 #define MSA_LOOP_COND_D MSA_LOOP_COND(DF_DOUBLE)

 #define MSA_LOOP(DF) \
+    do { \
         for (i = 0; i < (MSA_LOOP_COND_ ## DF) ; i++) { \
-            MSA_DO_ ## DF \
-        }
+            MSA_DO_ ## DF; \
+        } \
+    } while (0)

 #define MSA_FN_DF(FUNC)                                             \
 void helper_msa_##FUNC(CPUMIPSState *env, uint32_t df, uint32_t wd, \
@@ -1135,17 +1137,17 @@ void helper_msa_##FUNC(CPUMIPSState *env, uint32_t df, uint32_t wd, \
     uint32_t i;                                                     \
     switch (df) {                                                   \
     case DF_BYTE:                                                   \
-        MSA_LOOP_B                                                  \
+        MSA_LOOP_B;                                                 \
         break;                                                      \
     case DF_HALF:                                                   \
-        MSA_LOOP_H                                                  \
+        MSA_LOOP_H;                                                 \
         break;                                                      \
     case DF_WORD:                                                   \
-        MSA_LOOP_W                                                  \
+        MSA_LOOP_W;                                                 \
         break;                                                      \
     case DF_DOUBLE:                                                 \
-        MSA_LOOP_D                                                  \
-       break;                                                       \
+        MSA_LOOP_D;                                                 \
+        break;                                                      \
     default:                                                        \
         assert(0);                                                  \
     }                                                               \
@@ -1168,7 +1170,7 @@ void helper_msa_##FUNC(CPUMIPSState *env, uint32_t df, uint32_t wd, \
     do {                                \
         R##DF(pwx, i) = pwt->DF[2*i];   \
         L##DF(pwx, i) = pws->DF[2*i];   \
-    } while (0);
+    } while (0)
 MSA_FN_DF(pckev_df)
 #undef MSA_DO

@@ -1176,7 +1178,7 @@ MSA_FN_DF(pckev_df)
     do {                                \
         R##DF(pwx, i) = pwt->DF[2*i+1]; \
         L##DF(pwx, i) = pws->DF[2*i+1]; \
-    } while (0);
+    } while (0)
 MSA_FN_DF(pckod_df)
 #undef MSA_DO

@@ -1184,7 +1186,7 @@ MSA_FN_DF(pckod_df)
     do {                                \
         pwx->DF[2*i]   = L##DF(pwt, i); \
         pwx->DF[2*i+1] = L##DF(pws, i); \
-    } while (0);
+    } while (0)
 MSA_FN_DF(ilvl_df)
 #undef MSA_DO

@@ -1192,7 +1194,7 @@ MSA_FN_DF(ilvl_df)
     do {                                \
         pwx->DF[2*i]   = R##DF(pwt, i); \
         pwx->DF[2*i+1] = R##DF(pws, i); \
-    } while (0);
+    } while (0)
 MSA_FN_DF(ilvr_df)
 #undef MSA_DO

@@ -1200,7 +1202,7 @@ MSA_FN_DF(ilvr_df)
     do {                                \
         pwx->DF[2*i]   = pwt->DF[2*i];  \
         pwx->DF[2*i+1] = pws->DF[2*i];  \
-    } while (0);
+    } while (0)
 MSA_FN_DF(ilvev_df)
 #undef MSA_DO

@@ -1208,7 +1210,7 @@ MSA_FN_DF(ilvev_df)
     do {                                    \
         pwx->DF[2*i]   = pwt->DF[2*i+1];    \
         pwx->DF[2*i+1] = pws->DF[2*i+1];    \
-    } while (0);
+    } while (0)
 MSA_FN_DF(ilvod_df)
 #undef MSA_DO
 #undef MSA_LOOP_COND
@@ -1222,7 +1224,7 @@ MSA_FN_DF(ilvod_df)
         uint32_t k = (pwd->DF[i] & 0x3f) % (2 * n);                         \
         pwx->DF[i] =                                                        \
             (pwd->DF[i] & 0xc0) ? 0 : k < n ? pwt->DF[k] : pws->DF[k - n];  \
-    } while (0);
+    } while (0)
 MSA_FN_DF(vshf_df)
 #undef MSA_DO
 #undef MSA_LOOP_COND
-- 
2.14.3


