Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cB2oK-0003UV-Bl
	for mharc-qemu-trivial@gnu.org; Sun, 27 Nov 2016 12:00:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55493)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bunk@stusta.de>) id 1cB2Jz-0007Wd-9O
	for qemu-trivial@nongnu.org; Sun, 27 Nov 2016 11:28:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <bunk@stusta.de>) id 1cB2Jy-00085q-Fz
	for qemu-trivial@nongnu.org; Sun, 27 Nov 2016 11:28:55 -0500
Received: from welho-filter2.welho.com ([83.102.41.24]:38618)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <bunk@stusta.de>)
	id 1cB2Ju-0007yg-3X; Sun, 27 Nov 2016 11:28:50 -0500
Received: from localhost (localhost [127.0.0.1])
	by welho-filter2.welho.com (Postfix) with ESMTP id 9E7D514EE9;
	Sun, 27 Nov 2016 18:28:19 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at pp.htv.fi
Received: from welho-smtp1.welho.com ([IPv6:::ffff:83.102.41.84])
	by localhost (welho-filter2.welho.com [::ffff:83.102.41.24])
	(amavisd-new, port 10024)
	with ESMTP id h_AUN7e39h6O; Sun, 27 Nov 2016 18:28:19 +0200 (EET)
Received: from localhost.pp.htv.fi (82-181-244-249.bb.dnainternet.fi
	[82.181.244.249])
	by welho-smtp1.welho.com (Postfix) with ESMTP id 066C3289;
	Sun, 27 Nov 2016 18:28:19 +0200 (EET)
From: Adrian Bunk <bunk@stusta.de>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Sun, 27 Nov 2016 18:28:17 +0200
Message-Id: <20161127162817.15144-1-bunk@stusta.de>
X-Mailer: git-send-email 2.10.2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 83.102.41.24
X-Mailman-Approved-At: Sun, 27 Nov 2016 12:00:14 -0500
Subject: [Qemu-trivial] [PATCH] rules.mak: Use -r instead of -Wl,
 -r to fix building when PIE is default
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
X-List-Received-Date: Sun, 27 Nov 2016 16:28:56 -0000

Building qemu fails in distributions where gcc enables PIE
by default (e.g. Debian unstable) with:
/usr/bin/ld: -r and -pie may not be used together

-r and -pie cannot be used together in the linker,
and position independent is already relocatable.

Use -r instead of -Wl,-r to avoid gcc passing -r to the
linker when PIE is enabled.

Signed-off-by: Adrian Bunk <bunk@stusta.de>
---
 rules.mak | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rules.mak b/rules.mak
index 0333ae3..545ebd9 100644
--- a/rules.mak
+++ b/rules.mak
@@ -93,7 +93,7 @@ module-common.o: CFLAGS += $(DSO_OBJ_CFLAGS)
 	$(if $(findstring /,$@),$(call quiet-command,cp $@ $(subst /,-,$@),"CP","$(subst /,-,$@)"))
 
 
-LD_REL := $(CC) -nostdlib -Wl,-r $(LD_REL_FLAGS)
+LD_REL := $(CC) -nostdlib -r $(LD_REL_FLAGS)
 
 %.mo:
 	$(call quiet-command,$(LD_REL) -o $@ $^,"LD","$(TARGET_DIR)$@")
-- 
2.10.2


