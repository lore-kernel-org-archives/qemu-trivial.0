Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YbbVT-0004ZI-Md
	for mharc-qemu-trivial@gnu.org; Fri, 27 Mar 2015 17:09:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57182)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YbbVQ-0004X2-TC
	for qemu-trivial@nongnu.org; Fri, 27 Mar 2015 17:09:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YbbVN-0004Rf-Nb
	for qemu-trivial@nongnu.org; Fri, 27 Mar 2015 17:09:28 -0400
Received: from out2-smtp.messagingengine.com ([66.111.4.26]:44053)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1YbbVN-0004RS-HB
	for qemu-trivial@nongnu.org; Fri, 27 Mar 2015 17:09:25 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 47F2A208D1
	for <qemu-trivial@nongnu.org>; Fri, 27 Mar 2015 17:09:21 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
	by compute5.internal (MEProxy); Fri, 27 Mar 2015 17:09:24 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=braap.org; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:subject:to:x-sasl-enc:x-sasl-enc; s=
	mesmtp; bh=mel7o8SCr16ApMmCoMLHimQ7zH8=; b=2rSYWAnczsBk2j9kcUzba
	fZcnjI/MoSDe/nita6IN5Ly5mx4pYAdAsZN5epdqyLKh0ouZc/2sP+SGmM5KPirJ
	hIOZDhc5AECKTKYPgPnTJRpYsTDsX0pXGYoiAIH9YvFb6Xae9Ilg8WVd5189vOMr
	UAFq4ItGRvIg0nTYmflKzo=
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:subject:to
	:x-sasl-enc:x-sasl-enc; s=smtpout; bh=mel7o8SCr16ApMmCoMLHimQ7zH
	8=; b=SVqr4N+g9edN+cjijEJ/dSQ+9z6LAFjgwo0zTRJFROQ+qwsevbKI1tLycY
	CExx5kBF8gac26h1Zu+pqlbHoz4iDBXnS3N5iXswcD0Ji/oD2lqj1l6oU3D9F0dA
	L78jHbfrWpw/BL7FmuN2Ranr/29XiKMp+OxV5mz5C7K0pf/yk=
X-Sasl-enc: awcDdGzSdcciZs1Xs2xigMiYVyWVnjK3Upl32mEq5V8o 1427490563
Received: from localhost (unknown [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id DCE7F6801C2;
	Fri, 27 Mar 2015 17:09:23 -0400 (EDT)
Date: Fri, 27 Mar 2015 17:09:32 -0400
From: "Emilio G. Cota" <cota@braap.org>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Richard Henderson <rth@twiddle.net>
Message-ID: <20150327210932.GA17458@flamenco>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <55156FFE.9050806@twiddle.net>
 <87y4mibw94.fsf@linaro.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.111.4.26
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg: optimise memory layout
	of TCGTemp
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
X-List-Received-Date: Fri, 27 Mar 2015 21:09:30 -0000

On Fri, Mar 27, 2015 at 09:55:03 +0000, Alex Bennée wrote:
> Have you been able to measure any performance improvement with these new
> structures? In theory, if aligned with cache lines, performance should
> improve but real numbers would be nice.

I haven't benchmarked anything, which makes me very uneasy. All
I've checked is that the system boots, and FWIW I appreciate no
difference in boot time.

Is there a benchmark suite to test TCG changes?

Until proper benchmarking I wouldn't want to see this merged. For now I
propose to merge the initial change (remove 8-byte hole in 64-bit),
which is uncontroversial.

> > The appended adds macros to prevent us from mistakenly overflowing
> > the bitfields when more elements are added to the corresponding
> > enums/macros.
> 
> I can see the defines but I can't see any checks. Should we be able to
> do a compile time check if TCG_TYPE_COUNT doesn't fit into
> TCG_TYPE_NR_BITS?

> > +#define TEMP_VAL_NR_BITS 2
> 
> A similar compile time check could be added here.

Ack, addressed below.

On Fri, Mar 27, 2015 at 07:58:06 -0700, Richard Henderson wrote:
> On 03/25/2015 12:50 PM, Emilio G. Cota wrote:
> > +#define TCG_TYPE_NR_BITS 1
> 
> I'd rather you moved TCG_TYPE_COUNT out of the enum and into a define.  Perhaps
> even as (1 << TCG_TYPE_NR_BITS).
(snip)
> > +#define TEMP_VAL_NR_BITS 2
> 
> And make this an enumeration.
> 
> >  typedef struct TCGTemp {
(snip)
> > +    unsigned int base_type:TCG_TYPE_NR_BITS;
> > +    unsigned int type:TCG_TYPE_NR_BITS;
> 
> And do *not* change these from the enumeration to an unsigned int.
> 
> I know why you did this -- to keep the compiler from warning that the TCGType
> enum didn't fit in the bitfield, because of TCG_TYPE_COUNT being an enumerator,
> rather than an unrelated number.  Except that's exactly the warning we want to
> keep, on the off-chance that someone modifies the enums without modifying the
> _NR_BITS defines.

Agreed, please see below.

Thanks,

		E.

[No signoff due to lack of provable perf improvement, see above.]

diff --git a/tcg/tcg.h b/tcg/tcg.h
index add7f75..afd3f94 100644
--- a/tcg/tcg.h
+++ b/tcg/tcg.h
@@ -193,7 +193,6 @@ typedef struct TCGPool {
 typedef enum TCGType {
     TCG_TYPE_I32,
     TCG_TYPE_I64,
-    TCG_TYPE_COUNT, /* number of different types */
 
     /* An alias for the size of the host register.  */
 #if TCG_TARGET_REG_BITS == 32
@@ -217,6 +216,10 @@ typedef enum TCGType {
 #endif
 } TCGType;
 
+/* used for bitfield packing to save space */
+#define TCG_TYPE_NR_BITS	1
+#define TCG_TYPE_COUNT		BIT(TCG_TYPE_NR_BITS)
+
 /* Constants for qemu_ld and qemu_st for the Memory Operation field.  */
 typedef enum TCGMemOp {
     MO_8     = 0,
@@ -417,20 +420,21 @@ static inline TCGCond tcg_high_cond(TCGCond c)
     }
 }
 
-#define TEMP_VAL_DEAD  0
-#define TEMP_VAL_REG   1
-#define TEMP_VAL_MEM   2
-#define TEMP_VAL_CONST 3
+typedef enum TCGTempVal {
+    TEMP_VAL_DEAD,
+    TEMP_VAL_REG,
+    TEMP_VAL_MEM,
+    TEMP_VAL_CONST,
+} TCGTempVal;
+
+#define TEMP_VAL_NR_BITS 2
 
-/* XXX: optimize memory layout */
 typedef struct TCGTemp {
-    TCGType base_type;
-    TCGType type;
-    int val_type;
-    int reg;
-    tcg_target_long val;
-    int mem_reg;
-    intptr_t mem_offset;
+    unsigned int reg:8;
+    unsigned int mem_reg:8;
+    TCGTempVal val_type:TEMP_VAL_NR_BITS;
+    TCGType base_type:TCG_TYPE_NR_BITS;
+    TCGType type:TCG_TYPE_NR_BITS;
     unsigned int fixed_reg:1;
     unsigned int mem_coherent:1;
     unsigned int mem_allocated:1;
@@ -438,6 +442,9 @@ typedef struct TCGTemp {
                                   basic blocks. Otherwise, it is not
                                   preserved across basic blocks. */
     unsigned int temp_allocated:1; /* never used for code gen */
+
+    tcg_target_long val;
+    intptr_t mem_offset;
     const char *name;
 } TCGTemp;
 

