Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fMBpH-0002tO-Bn
	for mharc-qemu-trivial@gnu.org; Fri, 25 May 2018 08:28:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjc@sifive.com>) id 1fM75e-0007Ps-MR
	for qemu-trivial@nongnu.org; Fri, 25 May 2018 03:24:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjc@sifive.com>) id 1fM75b-0000E1-H9
	for qemu-trivial@nongnu.org; Fri, 25 May 2018 03:24:42 -0400
Received: from mail-pl0-x231.google.com ([2607:f8b0:400e:c01::231]:43127)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <mjc@sifive.com>) id 1fM75b-0000Do-Ay
	for qemu-trivial@nongnu.org; Fri, 25 May 2018 03:24:39 -0400
Received: by mail-pl0-x231.google.com with SMTP id c41-v6so2619017plj.10
	for <qemu-trivial@nongnu.org>; Fri, 25 May 2018 00:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=SwN8fIjB9yfKzXXaQ/eoSa8nfo4u0X9R2veRVypPCyY=;
	b=PCMB++92Qd1lchjPipzvz62XzGA+5PvMHmGbewPDRqqL2qUtwoXxuha67KLiB0ME1j
	A+LwLbO7VmwFnCbfHJe25YkiCj+vaCDtXhRnIUidmoA0EQGuwMEu/oo6Rb7i/Jx5meFL
	ybHQHCdN5QCCf8/LfPAeT8N98DFSSEe18j7MwLgodkE4hZ1CpfADF3JGkXK7PIjO3E6h
	RUTieN/TA3GqQ/V76pYGcz1oEwaYzq5esVDNZRCI7UWns3CmcxPGLdvGEVpTxpcJVTzN
	2ykzdBVWw5Kuq1glS6WXUgZ+pHL1i/ekDgFr5rKM5vo9/j+3cURCorzTBzXO/gxMcuB8
	Op5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=SwN8fIjB9yfKzXXaQ/eoSa8nfo4u0X9R2veRVypPCyY=;
	b=UyfoyAgU1PvlRsNw8M0HlUsxQL7gNJkT4IeHEN7AxKV95d20PT/goSKBcAgkbQRd2l
	+g0Mk/b2gcIsxrQWlaTgV6qbwB3Sy+yu4vtHEDKaXpEg/yAn76YGVFKBwai4x5PQyPeV
	ocYeZXT32AQz3i9YwHulKUgjkvkB6lR1xjMTiNXyB9XeJUMIBkaR2wH2R5p1CJnahho1
	rcV93KelqSfaXaeYl6THOg0BJPVhLqidcZdw2EIWVwuNURkexDt9NYme3ALUeWNnQVwu
	+W4ANEeVspwvYgkC6RHdE5nUFST+2v42JHPViJbxIA0SHLmhhH32Wu66qy31Tq5KQ0BH
	0Jjw==
X-Gm-Message-State: ALKqPwcchbg5sPIT7m17iOwDKxWl+tllowmLxf7vZ/4oQj4J4EAtoSS1
	iQp29rT9QFKKfVvUMPFo2DbYng==
X-Google-Smtp-Source: AB8JxZo6DfjQsDgefkh+cNJILcAsovpy9ld7+Ji1igUV/jtN78kvBM5WPT4sNUvyfHvme+7TIt7HDw==
X-Received: by 2002:a17:902:7109:: with SMTP id
	a9-v6mr1408629pll.271.1527233078486; 
	Fri, 25 May 2018 00:24:38 -0700 (PDT)
Received: from localhost.localdomain (122-58-167-22-fibre.bb.spark.co.nz.
	[122.58.167.22]) by smtp.gmail.com with ESMTPSA id
	u13-v6sm1662459pfn.59.2018.05.25.00.24.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 25 May 2018 00:24:37 -0700 (PDT)
From: Michael Clark <mjc@sifive.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Cc: patches@groups.riscv.org, Michael Clark <mjc@sifive.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <Alistair.Francis@wdc.com>
Date: Fri, 25 May 2018 19:22:40 +1200
Message-Id: <1527232960-51123-1-git-send-email-mjc@sifive.com>
X-Mailer: git-send-email 2.7.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::231
X-Mailman-Approved-At: Fri, 25 May 2018 08:28:06 -0400
Subject: [Qemu-trivial] [PATCH v2] elf: Add RISC-V PSABI ELF header defines
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
X-List-Received-Date: Fri, 25 May 2018 07:24:43 -0000

Refer to the RISC-V PSABI specification for details:

- https://github.com/riscv/riscv-elf-psabi-doc/blob/master/riscv-elf.md

Cc: Michael Tokarev <mjt@tls.msk.ru>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Alistair Francis <Alistair.Francis@wdc.com>
Signed-off-by: Michael Clark <mjc@sifive.com>
---
 include/elf.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/elf.h b/include/elf.h
index 934dbbd6b3ae..bd0493f43d19 100644
--- a/include/elf.h
+++ b/include/elf.h
@@ -1285,6 +1285,14 @@ typedef struct {
 #define R_IA64_DTPREL64LSB	0xb7	/* @dtprel(sym + add), data8 LSB */
 #define R_IA64_LTOFF_DTPREL22	0xba	/* @ltoff(@dtprel(s+a)), imm22 */
 
+/* RISC-V specific definitions.  */
+#define EF_RISCV_RVC 0x0001
+#define EF_RISCV_FLOAT_ABI_SINGLE 0x0002
+#define EF_RISCV_FLOAT_ABI_DOUBLE 0x0004
+#define EF_RISCV_FLOAT_ABI_QUAD 0x0006
+#define EF_RISCV_RVE 0x0008
+#define EF_RISCV_TSO 0x0010
+
 typedef struct elf32_rel {
   Elf32_Addr	r_offset;
   Elf32_Word	r_info;
-- 
2.7.0


