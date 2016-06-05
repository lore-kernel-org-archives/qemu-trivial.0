Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b9TJe-0003sM-C9
	for mharc-qemu-trivial@gnu.org; Sun, 05 Jun 2016 04:21:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36380)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TJX-0003lE-42
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:21:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1b9TJT-0004Xf-Ub
	for qemu-trivial@nongnu.org; Sun, 05 Jun 2016 04:21:43 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:54412)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1b9TJK-0004Vl-10; Sun, 05 Jun 2016 04:21:30 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 0BBFA40915;
	Sun,  5 Jun 2016 11:21:26 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 3A8B8AF9;
	Sun,  5 Jun 2016 10:43:37 +0300 (MSK)
Received: (nullmailer pid 1162 invoked by uid 1000);
	Sun, 05 Jun 2016 07:43:32 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-trivial@nongnu.org,
	Michael Tokarev <mjt@tls.msk.ru>
Date: Sun,  5 Jun 2016 10:43:12 +0300
Message-Id: <3fdb93d10cfa2505ecd9cae79e8a7265d22f1080.1465112552.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
References: <cover.1465112552.git.mjt@msgid.tls.msk.ru>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Subject: [Qemu-trivial] [PULL 35/52] thunk: Drop unused NO_THUNK_TYPE_SIZE
 guards
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
X-List-Received-Date: Sun, 05 Jun 2016 08:21:49 -0000

From: Peter Maydell <peter.maydell@linaro.org>

The thunk_type_size_array() and thunk_type_align_array() functions
are only provided if NO_THUNK_TYPE_SIZE is not defined. However
nothing in the codebase defines that, and so in fact these functions
are always present. Drop the unnecessary #ifdefs.

(Over a decade ago thunk.h used to be included by some softmmu
files, which defined NO_THUNK_TYPE_SIZE, but these includes are
long gone; see for instance commit f193c7979c2f7.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 include/exec/user/thunk.h | 3 ---
 thunk.c                   | 2 --
 2 files changed, 5 deletions(-)

diff --git a/include/exec/user/thunk.h b/include/exec/user/thunk.h
index ad1d602..57eb358 100644
--- a/include/exec/user/thunk.h
+++ b/include/exec/user/thunk.h
@@ -71,7 +71,6 @@ void thunk_register_struct_direct(int id, const char *name,
                                   const StructEntry *se1);
 const argtype *thunk_convert(void *dst, const void *src,
                              const argtype *type_ptr, int to_host);
-#ifndef NO_THUNK_TYPE_SIZE
 
 extern StructEntry *struct_entries;
 
@@ -178,8 +177,6 @@ static inline int thunk_type_align(const argtype *type_ptr, int is_host)
     }
 }
 
-#endif /* NO_THUNK_TYPE_SIZE */
-
 unsigned int target_to_host_bitmask(unsigned int x86_mask,
                                     const bitmask_transtbl * trans_tbl);
 unsigned int host_to_target_bitmask(unsigned int alpha_mask,
diff --git a/thunk.c b/thunk.c
index f057d86..8aee299 100644
--- a/thunk.c
+++ b/thunk.c
@@ -303,7 +303,6 @@ unsigned int host_to_target_bitmask(unsigned int alpha_mask,
     return(x86_mask);
 }
 
-#ifndef NO_THUNK_TYPE_SIZE
 int thunk_type_size_array(const argtype *type_ptr, int is_host)
 {
     return thunk_type_size(type_ptr, is_host);
@@ -313,7 +312,6 @@ int thunk_type_align_array(const argtype *type_ptr, int is_host)
 {
     return thunk_type_align(type_ptr, is_host);
 }
-#endif /* ndef NO_THUNK_TYPE_SIZE */
 
 void thunk_init(unsigned int max_structs)
 {
-- 
2.1.4


