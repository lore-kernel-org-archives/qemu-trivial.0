Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YXAa5-0000o7-GE
	for mharc-qemu-trivial@gnu.org; Sun, 15 Mar 2015 11:35:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50779)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YXAZx-0000jk-U5
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 11:35:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YXAZq-0004hj-0z
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 11:35:49 -0400
Received: from mail-wi0-f172.google.com ([209.85.212.172]:37944)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jhindin@daynix.com>) id 1YXAZp-0004hZ-R2
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 11:35:41 -0400
Received: by wifj2 with SMTP id j2so23605759wif.1
	for <qemu-trivial@nongnu.org>; Sun, 15 Mar 2015 08:35:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=uBqUV/+8EjUx3A2PAu/F9AdN7y6Imjn7Ywdwfuv1B+k=;
	b=YZ8WCRmjjzeyj/J/OfAq6QvurgKZ78FwcPhQp3/7YLXcFSBspDdHPVRIOcBW8u1tx3
	Avr22cwG6QSICnJrieMS2vibVA4YwPrF3DwU3AYECa/4OB80Etw/fCSzGEWWqH9tRW3y
	zYFwJBcB7Ns+z3uglofrox2r0ml1jmNxusruUfKuaeOZnj0ebni1V2OWFWBO4+Fp9BnV
	idCokqXmP3mcmvOpSsHusBPVTtiHrPs4039JHVyMQffMf2lRpi6JpBFlFhZ4JuEVBvVJ
	6rl/Zbnya4WoD0fK/hmP/fRmjjvGx0XaeYdBiGsbLVe6kLmEIPTEv+22aooQN5NRp6Yk
	0U7Q==
X-Gm-Message-State: ALoCoQlueOuFw0BG8hgo8BDLMKKaaLxUBHAOoxVth0pDQWxBRspd4pVS4FSsdoa5Kj0rlOR7u+DP
X-Received: by 10.180.84.133 with SMTP id z5mr113454448wiy.25.1426433741211;
	Sun, 15 Mar 2015 08:35:41 -0700 (PDT)
Received: from Snarl.daynix ([91.205.155.63]) by mx.google.com with ESMTPSA id
	ax10sm11423599wjc.26.2015.03.15.08.35.39
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Mar 2015 08:35:40 -0700 (PDT)
From: Joseph Hindin <jhindin@daynix.com>
To: qemu-devel@nongnu.org
Date: Sun, 15 Mar 2015 17:35:26 +0200
Message-Id: <1426433726-21414-2-git-send-email-jhindin@daynix.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1426433726-21414-1-git-send-email-jhindin@daynix.com>
References: <1426433726-21414-1-git-send-email-jhindin@daynix.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.212.172
Cc: qemu-trivial@nongnu.org, Joseph Hindin <jhindin@daynix.com>
Subject: [Qemu-trivial] [PATCH] gemu-ga-win: configure script may add
	-fstack-protector-strong option instead of -fstack-protector-all,
	depending on availability ( see commit 63678e17c ). Both options have
	to by filtered out for qga-vss.dll
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
X-List-Received-Date: Sun, 15 Mar 2015 15:35:55 -0000

Signed-off-by: Joseph Hindin <jhindin@daynix.com>
---
 qga/vss-win32/Makefile.objs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/qga/vss-win32/Makefile.objs b/qga/vss-win32/Makefile.objs
index 6a69d50..7c96c6b 100644
--- a/qga/vss-win32/Makefile.objs
+++ b/qga/vss-win32/Makefile.objs
@@ -3,7 +3,7 @@
 qga-vss-dll-obj-y += requester.o provider.o install.o
 
 obj-qga-vss-dll-obj-y = $(addprefix $(obj)/, $(qga-vss-dll-obj-y))
-$(obj-qga-vss-dll-obj-y): QEMU_CXXFLAGS = $(filter-out -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Wold-style-declaration -Wold-style-definition -Wredundant-decls -fstack-protector-all, $(QEMU_CFLAGS)) -Wno-unknown-pragmas -Wno-delete-non-virtual-dtor
+$(obj-qga-vss-dll-obj-y): QEMU_CXXFLAGS = $(filter-out -Wstrict-prototypes -Wmissing-prototypes -Wnested-externs -Wold-style-declaration -Wold-style-definition -Wredundant-decls -fstack-protector-all -fstack-protector-strong, $(QEMU_CFLAGS)) -Wno-unknown-pragmas -Wno-delete-non-virtual-dtor
 
 $(obj)/qga-vss.dll: LDFLAGS = -shared -Wl,--add-stdcall-alias,--enable-stdcall-fixup -lole32 -loleaut32 -lshlwapi -luuid -static
 $(obj)/qga-vss.dll: $(obj-qga-vss-dll-obj-y) $(SRC_PATH)/$(obj)/qga-vss.def
-- 
2.1.0


