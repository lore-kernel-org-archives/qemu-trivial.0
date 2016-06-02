Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1b8UXp-0001dN-40
	for mharc-qemu-trivial@gnu.org; Thu, 02 Jun 2016 11:28:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b8UXl-0001aR-VD
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2016 11:28:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1b8UXk-0002ML-T8
	for qemu-trivial@nongnu.org; Thu, 02 Jun 2016 11:28:21 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:57477)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b8UXi-0002GW-D3; Thu, 02 Jun 2016 11:28:18 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1b8UXg-0008Jg-Q9; Thu, 02 Jun 2016 16:28:16 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org
Date: Thu,  2 Jun 2016 16:28:16 +0100
Message-Id: <1464881296-9618-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] thunk: Drop unused NO_THUNK_TYPE_SIZE guards
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
X-List-Received-Date: Thu, 02 Jun 2016 15:28:23 -0000

The thunk_type_size_array() and thunk_type_align_array() functions
are only provided if NO_THUNK_TYPE_SIZE is not defined. However
nothing in the codebase defines that, and so in fact these functions
are always present. Drop the unnecessary #ifdefs.

(Over a decade ago thunk.h used to be included by some softmmu
files, which defined NO_THUNK_TYPE_SIZE, but these includes are
long gone; see for instance commit f193c7979c2f7.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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
1.9.1


