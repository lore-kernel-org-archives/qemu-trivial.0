Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QFT6Q-0001bK-TU
	for mharc-qemu-trivial@gnu.org; Thu, 28 Apr 2011 11:26:02 -0400
Received: from eggs.gnu.org ([140.186.70.92]:52766)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT6O-0001YA-DW
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:26:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>) id 1QFT6N-0007f2-G0
	for qemu-trivial@nongnu.org; Thu, 28 Apr 2011 11:26:00 -0400
Received: from moutng.kundenserver.de ([212.227.126.186]:57739)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT6H-0007d7-Or; Thu, 28 Apr 2011 11:25:54 -0400
Received: from flocke.fritz.box (p5086FD13.dip.t-dialin.net [80.134.253.19])
	by mrelayeu.kundenserver.de (node=mrbap0) with ESMTP (Nemesis)
	id 0LhThA-1PSz3Y3Y12-00n4Bc; Thu, 28 Apr 2011 17:20:50 +0200
Received: from stefan by flocke.fritz.box with local (Exim 4.72)
	(envelope-from <stefan@weilnetz.de>)
	id 1QFT1M-0002Bl-0C; Thu, 28 Apr 2011 17:20:48 +0200
From: Stefan Weil <weil@mail.berlios.de>
To: QEMU Developers <qemu-devel@nongnu.org>
Date: Thu, 28 Apr 2011 17:20:37 +0200
Message-Id: <1304004042-8334-13-git-send-email-weil@mail.berlios.de>
X-Mailer: git-send-email 1.7.2.5
In-Reply-To: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
References: <1304004042-8334-1-git-send-email-weil@mail.berlios.de>
X-Provags-ID: V02:K0:eb3/O3QMhv0HVu5pTI7dHAokfm9aJqweAw+IsGUqmEe
	qXCFmuCl/jK2qBvd7j5hGgXHQENjjR6AMFAsCi3euaH3gzUldq
	VHl/mnGmbuOc7ilkBuCP6RDNEsdtenxiURHE5jMxEuHK8pMV3Q
	mrcSNdWcqwBxHuPbfqDuwmLxt0qVPjaRqhOvsT7SveWvmbydYl
	THSECL+qyaJVQve8i8Jq5MflNrKg+uGhck8aXrDYPWCYkCigkI F7ImU9v8OybB3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 212.227.126.186
Cc: qemu-trivial@nongnu.org, Stefan Weil <weil@mail.berlios.de>
Subject: [Qemu-trivial] [PATCH 13/18] Fix typos in comments (neccessary ->
	necessary)
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
X-List-Received-Date: Thu, 28 Apr 2011 15:26:01 -0000

Signed-off-by: Stefan Weil <weil@mail.berlios.de>
---
 bsd-user/qemu.h        |    2 +-
 linux-user/qemu.h      |    2 +-
 target-arm/translate.c |    4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index e343894..1ba2d08 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -323,7 +323,7 @@ abi_long copy_from_user(void *hptr, abi_ulong gaddr, size_t len);
 abi_long copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
 
 /* Functions for accessing guest memory.  The tget and tput functions
-   read/write single values, byteswapping as neccessary.  The lock_user
+   read/write single values, byteswapping as necessary.  The lock_user
    gets a pointer to a contiguous area of guest memory, but does not perform
    and byteswapping.  lock_user may return either a pointer to the guest
    memory, or a temporary buffer.  */
diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index f522f5e..237386c 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -379,7 +379,7 @@ abi_long copy_from_user(void *hptr, abi_ulong gaddr, size_t len);
 abi_long copy_to_user(abi_ulong gaddr, void *hptr, size_t len);
 
 /* Functions for accessing guest memory.  The tget and tput functions
-   read/write single values, byteswapping as neccessary.  The lock_user
+   read/write single values, byteswapping as necessary.  The lock_user
    gets a pointer to a contiguous area of guest memory, but does not perform
    and byteswapping.  lock_user may return either a pointer to the guest
    memory, or a temporary buffer.  */
diff --git a/target-arm/translate.c b/target-arm/translate.c
index a1af436..3119137 100644
--- a/target-arm/translate.c
+++ b/target-arm/translate.c
@@ -7348,7 +7348,7 @@ static void disas_arm_insn(CPUState * env, DisasContext *s)
                     } else if ((insn & 0x000003e0) == 0x00000060) {
                         tmp = load_reg(s, rm);
                         shift = (insn >> 10) & 3;
-                        /* ??? In many cases it's not neccessary to do a
+                        /* ??? In many cases it's not necessary to do a
                            rotate, a shift is sufficient.  */
                         if (shift != 0)
                             tcg_gen_rotri_i32(tmp, tmp, shift * 8);
@@ -8139,7 +8139,7 @@ static int disas_thumb2_insn(CPUState *env, DisasContext *s, uint16_t insn_hw1)
         case 1: /* Sign/zero extend.  */
             tmp = load_reg(s, rm);
             shift = (insn >> 4) & 3;
-            /* ??? In many cases it's not neccessary to do a
+            /* ??? In many cases it's not necessary to do a
                rotate, a shift is sufficient.  */
             if (shift != 0)
                 tcg_gen_rotri_i32(tmp, tmp, shift * 8);
-- 
1.7.2.5


