Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RZ9kV-0003Qu-2J
	for mharc-qemu-trivial@gnu.org; Fri, 09 Dec 2011 18:21:03 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48042)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RZ9kS-0003Gm-3D
	for qemu-trivial@nongnu.org; Fri, 09 Dec 2011 18:21:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1RZ9kQ-0000b6-F7
	for qemu-trivial@nongnu.org; Fri, 09 Dec 2011 18:20:59 -0500
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:46491)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1RZ9kM-0000Xa-Mi; Fri, 09 Dec 2011 18:20:55 -0500
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	8DEC67281C27; Sat, 10 Dec 2011 00:20:32 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id KpWa4Gpa3jXv; Sat, 10 Dec 2011 00:19:58 +0100 (CET)
Received: by v220110690675601.yourvserver.net (Postfix, from userid 1000)
	id 54842728188E; Sat, 10 Dec 2011 00:19:58 +0100 (CET)
From: Stefan Weil <sw@weilnetz.de>
To: qemu-devel@nongnu.org
Date: Sat, 10 Dec 2011 00:19:41 +0100
Message-Id: <1323472786-26821-2-git-send-email-sw@weilnetz.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1323472786-26821-1-git-send-email-sw@weilnetz.de>
References: <1323472786-26821-1-git-send-email-sw@weilnetz.de>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>
Subject: [Qemu-trivial] [PATCH 1/6] Add spelling exceptions for codespell
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
X-List-Received-Date: Fri, 09 Dec 2011 23:21:02 -0000

This file can be used with codespell to suppress wrong
misspelling reports.

Signed-off-by: Stefan Weil <sw@weilnetz.de>
---
 scripts/codespell.exclude |  215 +++++++++++++++++++++++++++++++++++++++++++++
 1 files changed, 215 insertions(+), 0 deletions(-)
 create mode 100644 scripts/codespell.exclude

diff --git a/scripts/codespell.exclude b/scripts/codespell.exclude
new file mode 100644
index 0000000..d69c946
--- /dev/null
+++ b/scripts/codespell.exclude
@@ -0,0 +1,215 @@
+  .rela.bss      : { *(.rela.bss)               }
+  .rela.bss      : { *(.rela.bss)		}
+  .rela.bss       : { *(.rela.bss .rela.bss.* .rela.gnu.linkonce.b.*) }
+      *(.rela.bss .rela.bss.* .rela.gnu.linkonce.b.*)
+      *(.rela.ctors)
+  .rela.ctors     : { *(.rela.ctors) }
+  .rela.ctors    : { *(.rela.ctors)     }
+  .rela.ctors    : { *(.rela.ctors)	}
+  .rela.data     :
+  .rela.data      : { *(.rela.data .rela.data.* .rela.gnu.linkonce.d.*) }
+      *(.rela.data .rela.data.* .rela.gnu.linkonce.d.*)
+    { *(.rela.data) *(.rela.gnu.linkonce.d*) }
+  .rela.data.rel.ro   : { *(.rela.data.rel.ro* .rela.gnu.linkonce.d.rel.ro.*) }
+      *(.rela.dtors)
+  .rela.dtors     : { *(.rela.dtors) }
+  .rela.dtors    : { *(.rela.dtors)     }
+  .rela.dtors    : { *(.rela.dtors)	}
+  .rela.dyn       :
+      *(.rela.fini)
+  .rela.fini      : { *(.rela.fini) }
+  .rela.fini     : { *(.rela.fini)      }
+  .rela.fini     : { *(.rela.fini)	}
+      *(.rela.got)
+  .rela.got1           : { *(.rela.got1) }
+  .rela.got2           : { *(.rela.got2) }
+  .rela.got       : { *(.rela.got) }
+  .rela.got      : { *(.rela.got)               }
+  .rela.got      : { *(.rela.got)		}
+  .rela.IA_64.pltoff   : { *(.rela.IA_64.pltoff) }
+      *(.rela.init)
+  .rela.init      : { *(.rela.init) }
+  .rela.init     : { *(.rela.init)      }
+  .rela.init     : { *(.rela.init)	}
+    *(.rela.iplt)
+      *(.rela.opd)
+    *(.rela.plt)
+  .rela.plt       :
+  .rela.plt       : { *(.rela.plt) }
+  .rela.plt      : { *(.rela.plt)               }
+  .rela.plt      : { *(.rela.plt)		}
+  .rela.rodata   :
+    { *(.rela.rodata) *(.rela.gnu.linkonce.r*) }
+      *(.rela.rodata .rela.rodata.* .rela.gnu.linkonce.r.*)
+  .rela.rodata    : { *(.rela.rodata .rela.rodata.* .rela.gnu.linkonce.r.*) }
+      *(.rela.sbss2 .rela.sbss2.* .rela.gnu.linkonce.sb2.*)
+  .rela.sbss2     : { *(.rela.sbss2 .rela.sbss2.* .rela.gnu.linkonce.sb2.*) }
+      *(.rela.sbss .rela.sbss.* .rela.gnu.linkonce.sb.*)
+  .rela.sbss      : { *(.rela.sbss .rela.sbss.* .rela.gnu.linkonce.sb.*) }
+      *(.rela.sdata2 .rela.sdata2.* .rela.gnu.linkonce.s2.*)
+  .rela.sdata2    : { *(.rela.sdata2 .rela.sdata2.* .rela.gnu.linkonce.s2.*) }
+      *(.rela.sdata .rela.sdata.* .rela.gnu.linkonce.s.*)
+  .rela.sdata     : { *(.rela.sdata .rela.sdata.* .rela.gnu.linkonce.s.*) }
+      *(.rela.tbss .rela.tbss.* .rela.gnu.linkonce.tb.*)
+  .rela.tbss     : { *(.rela.tbss .rela.tbss.* .rela.gnu.linkonce.tb.*) }
+  .rela.tbss	  : { *(.rela.tbss .rela.tbss.* .rela.gnu.linkonce.tb.*) }
+      *(.rela.tdata .rela.tdata.* .rela.gnu.linkonce.td.*)
+  .rela.tdata    : { *(.rela.tdata .rela.tdata.* .rela.gnu.linkonce.td.*) }
+  .rela.tdata	  : { *(.rela.tdata .rela.tdata.* .rela.gnu.linkonce.td.*) }
+  .rela.text     :
+    { *(.rela.text) *(.rela.gnu.linkonce.t*) }
+      *(.rela.text .rela.text.* .rela.gnu.linkonce.t.*)
+  .rela.text      : { *(.rela.text .rela.text.* .rela.gnu.linkonce.t.*) }
+      *(.rela.toc)
+  .rela.tocbss	  : { *(.rela.tocbss) }
+               aSign
+                  aSign ?
+            aSign = 0;
+            aSign, aExp + 0x3C00, ( aSig | LIT64( 0x0010000000000000 ) )<<11 );
+                                          aSign, aExp, aSig, 0 STATUS_VAR );
+    aSign = extractFloat128Sign( a );
+            aSign = extractFloat128Sign( a );
+    aSign = extractFloat16Sign(a);
+    aSign = extractFloat32Sign(a);
+    aSign = extractFloat32Sign( a );
+        aSign = extractFloat32Sign( a );
+    aSign = extractFloat64Sign(a);
+    aSign = extractFloat64Sign( a );
+        aSign = extractFloat64Sign( a );
+    aSign = extractFloat ## s ## Sign(a);                               \
+    aSign = extractFloat ## s ## Sign( a );                                  \
+    aSign = extractFloatx80Sign( a );
+        aSign = extractFloatx80Sign( a );
+          aSign ? le128( b.high, b.low, a.high, a.low )
+            aSign ? LIT64( 0x8000000000000000 ) : LIT64( 0x3FF0000000000000 ));
+          aSign ? lt128( b.high, b.low, a.high, a.low )
+                      aSign ? packFloat128( 1, 0, 0, 0 )
+                      aSign ? packFloat128( 1, 0x3FFF, 0, 0 )
+                  aSign ? packFloatx80( 1, 0, 0 )
+    flag aSign;
+    flag aSign, bSign;
+    flag aSign, bSign;                                                       \
+    flag aSign, bSign;                                                  \
+    flag aSign, bSign, cSign, zSign;
+    flag aSign, bSign, zSign;
+    flag aSign, zSign;
+    if ( ( aExp == 0x7FF ) && aSig ) aSign = 0;
+        if ( ( aExp == 0x7FF ) && aSig ) aSign = 0;
+    if ( ( aExp == 0x7FFF ) && ( aSig0 | aSig1 ) ) aSign = 0;
+        if ( ( aExp == 0x7FFF ) && aSig0 ) aSign = 0;
+    if ( ( aExp == 0x7FFF ) && (uint64_t) ( aSig<<1 ) ) aSign = 0;
+        if ( ( aExp == 0x7FFF ) && (uint64_t) ( aSig<<1 ) ) aSign = 0;
+    if ( ( aExp == 0xFF ) && aSig ) aSign = 0;
+        if ( ( aSig0 | aSig1 ) == 0 ) return packFloatx80( aSign, 0, 0 );
+        if ( aSig == 0 ) return packFloat128( aSign, 0, 0, 0 );
+        if ( aSig == 0 ) return packFloat64( aSign, 0, 0 );
+        if ( aSig == 0 ) return packFloatx80( aSign, 0, 0 );
+    if ( aSign ) {
+            if (    ! aSign
+                if (    ! aSign
+            if ( ! aSign || ( ( aExp == 0x7FFF ) && aSig ) ) {
+                if ( ! aSign || ( ( aExp == 0x7FFF ) && ( aSig0 | aSig1 ) ) ) {
+        if ( ! aSign || ( ( aExp == 0xFF ) && aSig ) ) {
+            if ( ! aSign || ( ( aExp == 0xFF ) && aSig ) ) {
+            if ( ! aSign || ( ( aExp == 0xFF ) && aSig ) ) return 0x7FFFFFFF;
+    if (aSign != bSign) {                                               \
+    if ( aSign == bSign ) {
+    if ( aSign != bSign ) {
+    if ( aSign != bSign ) {                                                  \
+    if ( aSign != bSign ) return aSign || ( (uint32_t) ( ( av | bv )<<1 ) == 0 );
+    if ( aSign != bSign ) return aSign && ( (uint32_t) ( ( av | bv )<<1 ) != 0 );
+    if ( aSign != bSign ) return aSign || ( (uint64_t) ( ( av | bv )<<1 ) == 0 );
+    if ( aSign != bSign ) return aSign && ( (uint64_t) ( ( av | bv )<<1 ) != 0 );
+        if ( ! aSign ) return a;
+    if ( aSign ) z = - z;
+    if ( ( (int16_t)z < 0 ) ^ aSign ) {
+    if ( ( z < 0 ) ^ aSign ) {
+            increment = aSign ? 0 : mask;
+            increment = aSign ? mask : 0;
+        normalizeRoundAndPackFloat128( aSign ^ zSign, bExp - 4, aSig0, aSig1 STATUS_VAR );
+                    packFloatx80( aSign, 0x3FFF, LIT64( 0x8000000000000000 ) );
+    pSign = aSign ^ bSign;
+            return 1 - (2 * aSign);
+            return 1 - (2 * aSign);                                          \
+            return 1 - 2 * (aSign ^ ( av < bv ));                            \
+            return 1 - 2 * (aSign ^ ( lt128( a.high, a.low, b.high, b.low ) ));
+        return addFloat128Sigs( a, b, aSign STATUS_VAR );
+        return addFloat32Sigs( a, b, aSign STATUS_VAR );
+        return addFloat32Sigs( a, b, aSign STATUS_VAR);
+        return addFloat64Sigs( a, b, aSign STATUS_VAR );
+        return addFloatx80Sigs( a, b, aSign STATUS_VAR );
+            return aSign ? a : b;                                       \
+            return (aSign ^ (av < bv)) ? a : b;                         \
+            return (aSign ^ (av < bv)) ? b : a;                         \
+            return aSign ? b : a;                                       \
+        return (aSign) ? float32_zero : a;
+        return aSign ? (int32_t) 0x80000000 : 0x7FFFFFFF;
+        return aSign ? (int32_t) 0xffff8000 : 0x7FFF;
+    return ( av == bv ) || ( aSign ^ ( av < bv ) );
+    return ( av != bv ) && ( aSign ^ ( av < bv ) );
+            return make_float32(aSign ? 0x80000000 : 0x3F800000);
+            return make_float32(aSign ? 0xBF800000 : 0);
+            return make_float64(aSign ? LIT64( 0xBFF0000000000000 ) : 0);
+    return normalizeRoundAndPackFloat128( aSign, aExp, aSig0, aSig1
+    return normalizeRoundAndPackFloat32( aSign, aExp, aSig STATUS_VAR );
+    return normalizeRoundAndPackFloat32( aSign ^ zSign, bExp, aSig STATUS_VAR );
+    return normalizeRoundAndPackFloat64( aSign, aExp, aSig STATUS_VAR );
+    return normalizeRoundAndPackFloat64( aSign ^ zSign, bExp, aSig STATUS_VAR );
+            return packFloat128( aSign, 0, 0, 0 );
+                    return packFloat128( aSign, 0x3FFF, 0, 0 );
+        return packFloat128( aSign, 0x7FFF, 0, 0 );
+    return packFloat128( aSign, aExp + 0x3C00, zSig0, zSig1 );
+    return packFloat128( aSign, aExp + 0x3F80, ( (uint64_t) aSig )<<25, 0 );
+    return packFloat128( aSign, aExp, zSig0, zSig1 );
+        return packFloat16(aSign, 0, 0);
+                return packFloat16(aSign, 0, 0);
+        return packFloat16(aSign, 0x1f, 0);
+            return packFloat16(aSign, 0x1f, 0);
+            return packFloat16(aSign, 0x1f, 0x3ff);
+    return packFloat16(aSign, aExp + 14, aSig >> 13);
+        return packFloat32( aSign, 0, 0 );
+            return packFloat32(aSign, 0, 0);
+                return packFloat32( aSign, 0x7F, 0 );
+        return packFloat32( aSign, 0xFF, 0 );
+        return packFloat32(aSign, 0xff, aSig << 13);
+    return packFloat32( aSign, aExp + 0x70, aSig << 13);
+        return packFloat64( aSign, 0, 0 );
+                return packFloat64( aSign, 0x3FF, 0 );
+        return packFloat64( aSign, 0x7FF, 0 );
+    return packFloat64( aSign, aExp + 0x380, ( (uint64_t) aSig )<<29 );
+        return packFloatx80( aSign, 0, 0 );
+        return packFloatx80( aSign, 0x7FFF, LIT64( 0x8000000000000000 ) );
+    return packFloatx80( aSign, aExp + 0x3F80, ( (uint64_t) aSig )<<40 );
+    return roundAndPackFloat32( aSign, aExp, aSig STATUS_VAR );
+    return roundAndPackFloat32( aSign, aExp, zSig STATUS_VAR );
+    return roundAndPackFloat64( aSign, aExp, aSig0 STATUS_VAR );
+    return roundAndPackFloat64( aSign, aExp, zSig STATUS_VAR );
+    return roundAndPackFloatx80( 80, aSign, aExp, aSig0, aSig1 STATUS_VAR );
+    return roundAndPackInt32( aSign, aSig0 STATUS_VAR );
+    return roundAndPackInt32( aSign, aSig64 STATUS_VAR );
+    return roundAndPackInt32( aSign, aSig STATUS_VAR );
+    return roundAndPackInt64( aSign, aSig0, aSig1 STATUS_VAR );
+    return roundAndPackInt64( aSign, aSig64, aSigExtra STATUS_VAR );
+    return roundAndPackInt64( aSign, aSig, aSigExtra STATUS_VAR );
+        return subFloat128Sigs( a, b, aSign STATUS_VAR );
+        return subFloat32Sigs( a, b, aSign STATUS_VAR );
+        return subFloat64Sigs( a, b, aSign STATUS_VAR );
+        return subFloatx80Sigs( a, b, aSign STATUS_VAR );
+    zSign = aSign;
+    zSign = aSign ^ bSign;
+    char        creator[8]; // "conectix"
+    if (buf_size >= 8 && !strncmp((char *)buf, "conectix", 8))
+    if (strncmp(footer->creator, "conectix", 8))
+    memcpy(footer->creator, "conectix", 8);
+void *xtensa_get_extint(CPUState *env, unsigned extint)
+    if (extint < env->config->nextint) {
+        unsigned irq = env->config->extint[extint];
+                __func__, extint);
+    unsigned extint[MAX_NINTERRUPT];
+void *xtensa_get_extint(CPUState *env, unsigned extint);
+    .extint = EXTINTS
+         * LINT0 delivery mode on CPU #0 is set to ExtInt at initialization
+    case 0x23:	/* APON */
+		    type = SVM_EVTINJ_TYPE_EXEPT;
+        case SVM_EVTINJ_TYPE_EXEPT:
+                qemu_log_mask(CPU_LOG_TB_IN_ASM, "EXEPT");
-- 
1.7.2.5


