Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bxcqP-0006GV-57
	for mharc-qemu-trivial@gnu.org; Fri, 21 Oct 2016 12:38:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36684)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bxcqM-0006FP-Q7
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2016 12:38:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1bxcqL-0005hK-Pf
	for qemu-trivial@nongnu.org; Fri, 21 Oct 2016 12:38:54 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:47390)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1bxcqJ-0005d3-6R; Fri, 21 Oct 2016 12:38:51 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.84_2)
	(envelope-from <pm215@archaic.org.uk>)
	id 1bxcqB-0007Xi-80; Fri, 21 Oct 2016 17:38:43 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@linaro.org,
	Richard Henderson <rth@twiddle.net>
Date: Fri, 21 Oct 2016 17:38:42 +0100
Message-Id: <1477067922-26202-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-trivial] [PATCH] tcg/tcg.h: Improve documentation of TCGv_i32
 etc types
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
X-List-Received-Date: Fri, 21 Oct 2016 16:38:56 -0000

The typedefs we use for the TCGv_i32, TCGv_i64 and TCGv_ptr
types are somewhat confusing, because we define them as
pointers to structs, but the structs themselves are never
defined. Explain in the comments a bit more clearly why
this is OK and what is going on under the hood.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This confused at least two people who cared enough to post to
qemu-devel about it, so it seems worth rewriting and expanding
the comment in an attempt to avoid having to explain it on the
mailing list for a third time :-)

 tcg/tcg.h | 38 ++++++++++++++++++++++++++++++--------
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/tcg/tcg.h b/tcg/tcg.h
index c9949aa..622ace8 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -376,14 +376,36 @@ static inline unsigned get_alignment_bits(TCGMemOp memop)
 
 typedef tcg_target_ulong TCGArg;
 
-/* Define a type and accessor macros for variables.  Using pointer types
-   is nice because it gives some level of type safely.  Converting to and
-   from intptr_t rather than int reduces the number of sign-extension
-   instructions that get implied on 64-bit hosts.  Users of tcg_gen_* don't
-   need to know about any of this, and should treat TCGv as an opaque type.
-   In addition we do typechecking for different types of variables.  TCGv_i32
-   and TCGv_i64 are 32/64-bit variables respectively.  TCGv and TCGv_ptr
-   are aliases for target_ulong and host pointer sized values respectively.  */
+/* Define type and accessor macros for TCG variables.
+
+   TCG variables are the inputs and outputs of TCG ops, as described
+   in tcg/README. Target CPU front-end code uses these types to deal
+   with TCG variables as it emits TCG code via the tcg_gen_* functions.
+   They come in several flavours:
+    * TCGv_i32 : 32 bit integer type
+    * TCGv_i64 : 64 bit integer type
+    * TCGv_ptr : a host pointer type
+    * TCGv : an integer type the same size as target_ulong
+             (an alias for either TCGv_i32 or TCGv_i64)
+   The compiler's type checking will complain if you mix them
+   up and pass the wrong sized TCGv to a function.
+
+   Users of tcg_gen_* don't need to know about any of the internal
+   details of these, and should treat them as opaque types.
+   You won't be able to look inside them in a debugger either.
+
+   Internal implementation details follow:
+
+   Note that there is no definition of the structs TCGv_i32_d etc anywhere.
+   This is deliberate, because the values we store in variables of type
+   TCGv_i32 are not really pointers-to-structures. They're just small
+   integers, but keeping them in pointer types like this means that the
+   compiler will complain if you accidentally pass a TCGv_i32 to a
+   function which takes a TCGv_i64, and so on. Only the internals of
+   TCG need to care about the actual contents of the types, and they always
+   box and unbox via the MAKE_TCGV_* and GET_TCGV_* functions.
+   Converting to and from intptr_t rather than int reduces the number
+   of sign-extension instructions that get implied on 64-bit hosts.  */
 
 typedef struct TCGv_i32_d *TCGv_i32;
 typedef struct TCGv_i64_d *TCGv_i64;
-- 
2.7.4


