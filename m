Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCGvQ-000428-AB
	for mharc-qemu-trivial@gnu.org; Tue, 07 Nov 2017 22:21:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37882)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCGvN-00040M-Dp
	for qemu-trivial@nongnu.org; Tue, 07 Nov 2017 22:21:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCGvM-0007BQ-HC
	for qemu-trivial@nongnu.org; Tue, 07 Nov 2017 22:21:09 -0500
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:52745)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCGvG-000763-4g; Tue, 07 Nov 2017 22:21:02 -0500
Received: by mail-qt0-x242.google.com with SMTP id 31so1708888qtz.9;
	Tue, 07 Nov 2017 19:21:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=7X4JkbWcCaGOwKbrNSwqOz6aaiC47k8Xg90493k9CXg=;
	b=J6t58hKDSoox1ThBcjaZ3apSOBCz2tck0sJOy84gtoZp4wBlFRvDOY1yOGwe4wF4hk
	7PUcX8uLBjurbePLIUx8yKZufLmURccKFmqNoNRGmcY98tlucz+q4V/Td4HHcNMbS5i0
	rjkf9UV5aT2sa0RBBkLrde9v8iMEJCYkhnHUxzkj2YN4UNN1OOWJEIchDROZRxkUQrMH
	6LIwAWJ20idiovfqMOvvTh0OfkLO8+F9umCIM5L8gi5UBEN2S2LvWhjdbt7eAl72bFGs
	Kz4dA5xfiyW73LjDOUtpQUl8icyC1CNuBE8v0k4qj18s7uBHZ/eLOwQbyCa+zV5coIoA
	cT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=7X4JkbWcCaGOwKbrNSwqOz6aaiC47k8Xg90493k9CXg=;
	b=HiN3KtOz34YC7ek+KKCgby6xT0aC3NgfzHmcTW/UPTfnOasaUA7zzdOi+N+d77pSin
	9Y8YaOyP1sZllUwSe3VqIHrNc39evK/iVnXQw0h2c7ohkuCzCg68j9gMY9Tu5Q7ud07S
	7fHKP1JE1ujSC0SPpPTAzEReqt1XtBFhclWq3dlJ8hgJWUdUWaBVZVhwKyCu6Zp+ealx
	aOnvKJpNL0G1ZT4QCS/HmraMOS8syEJZxbv897LYUJieHt4P9g1rsH+uvJpyxee0LuW1
	LpzI60RsRPcP+Dd0m5kTpFw3NmKX1BXwHKeEHCct/Znje/+H9KJkuJLFcsj1Pf6pwC/I
	Emew==
X-Gm-Message-State: AJaThX5MM7W1P2ItZpkFvwq0yd7taIfAzxBZML1ElJiCaToLSv4T1Sxe
	nUYHm7ccDXg7ax/zC1as2J0=
X-Google-Smtp-Source: ABhQp+TxfiIE0BpFjP3bEZtMvyFy4Oek3RhnD5XnfVqpr8WoO5ePTKKqyknn1VfYaO3UrCxqADnHXg==
X-Received: by 10.200.8.53 with SMTP id u50mr1494178qth.260.1510111261530;
	Tue, 07 Nov 2017 19:21:01 -0800 (PST)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	d193sm2034176qke.21.2017.11.07.19.20.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Nov 2017 19:21:00 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>, Fam Zheng <famz@redhat.com>,
	Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Date: Wed,  8 Nov 2017 00:20:52 -0300
Message-Id: <20171108032052.20029-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
Subject: [Qemu-trivial] [PATCH] Makefile: simpler/faster "make help"
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
X-List-Received-Date: Wed, 08 Nov 2017 03:21:10 -0000

Using obscure black magic introduced in eaa2ddbb767 :)

In an out-of-tree directory, running "../configure && make help" will generate
some required files (.mak), then clone some submodules, compile at least
the capstone submodule, generate QMP and Trace files, and finally display
the help.

On an outdated computer (Sun Blade workstation), running "make help" took
more than 5h :) With this patch it took roughly 37min.

Suggested-by: Daniel P. Berrange <berrange@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

before:

$ make help
  GEN     config-host.h
  CC      cs.o
  CC      utils.o
  CC      SStream.o
  CC      MCInstrDesc.o
  CC      MCRegisterInfo.o
  CC      arch/ARM/ARMDisassembler.o
  CC      arch/ARM/ARMInstPrinter.o
  CC      arch/ARM/ARMMapping.o
  CC      arch/ARM/ARMModule.o
  CC      arch/AArch64/AArch64BaseInfo.o
  CC      arch/AArch64/AArch64Disassembler.o
  CC      arch/AArch64/AArch64InstPrinter.o
  CC      arch/AArch64/AArch64Mapping.o
  CC      arch/AArch64/AArch64Module.o
  CC      arch/Mips/MipsDisassembler.o
  CC      arch/Mips/MipsInstPrinter.o
  CC      arch/Mips/MipsMapping.o
  CC      arch/Mips/MipsModule.o
  CC      arch/PowerPC/PPCDisassembler.o
  CC      arch/PowerPC/PPCInstPrinter.o
  CC      arch/PowerPC/PPCMapping.o
  CC      arch/PowerPC/PPCModule.o
  CC      arch/Sparc/SparcDisassembler.o
  CC      arch/Sparc/SparcInstPrinter.o
  CC      arch/Sparc/SparcMapping.o
  CC      arch/Sparc/SparcModule.o
  CC      arch/SystemZ/SystemZDisassembler.o
  CC      arch/SystemZ/SystemZInstPrinter.o
  CC      arch/SystemZ/SystemZMapping.o
  CC      arch/SystemZ/SystemZModule.o
  CC      arch/SystemZ/SystemZMCTargetDesc.o
  CC      arch/X86/X86DisassemblerDecoder.o
  CC      arch/X86/X86Disassembler.o
  CC      arch/X86/X86IntelInstPrinter.o
  CC      arch/X86/X86ATTInstPrinter.o
  CC      arch/X86/X86Mapping.o
  CC      arch/X86/X86Module.o
  CC      arch/XCore/XCoreDisassembler.o
  CC      arch/XCore/XCoreInstPrinter.o
  CC      arch/XCore/XCoreMapping.o
  CC      arch/XCore/XCoreModule.o
  CC      MCInst.o
  AR      libcapstone.a
ar: creating capstone/libcapstone.a
  GEN     trace/generated-tcg-tracers.h
  GEN     trace/generated-helpers-wrappers.h
  GEN     trace/generated-helpers.h
  GEN     trace/generated-helpers.c
  GEN     module_block.h
make[1]: 'capstone/libcapstone.a' is up to date.
Generic targets:
  all             - Build all
  dir/file.o      - Build specified target only
  install         - Install QEMU, documentation and tools
  ctags/TAGS      - Generate tags file for editors
  cscope          - Generate cscope index
[...]

after:

$ make help
Generic targets:
  all             - Build all
  dir/file.o      - Build specified target only
  install         - Install QEMU, documentation and tools
  ctags/TAGS      - Generate tags file for editors
  cscope          - Generate cscope index
[...]

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 0496c5057a..7850ca5928 100644
--- a/Makefile
+++ b/Makefile
@@ -6,7 +6,7 @@ BUILD_DIR=$(CURDIR)
 # Before including a proper config-host.mak, assume we are in the source tree
 SRC_PATH=.
 
-UNCHECKED_GOALS := %clean TAGS cscope ctags docker docker-%
+UNCHECKED_GOALS := %clean TAGS cscope ctags docker docker-% help
 
 # All following code might depend on configuration variables
 ifneq ($(wildcard config-host.mak),)
-- 
2.15.0


