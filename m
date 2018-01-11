Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eZhjo-0000QZ-7f
	for mharc-qemu-trivial@gnu.org; Thu, 11 Jan 2018 13:38:04 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1eZhjl-0000Q1-CI
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 13:38:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1eZhji-000790-1g
	for qemu-trivial@nongnu.org; Thu, 11 Jan 2018 13:38:01 -0500
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:42434)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <malbarbo@gmail.com>)
	id 1eZhjh-00078j-Td; Thu, 11 Jan 2018 13:37:57 -0500
Received: by mail-qk0-x243.google.com with SMTP id q1so5519797qkb.9;
	Thu, 11 Jan 2018 10:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=QjaHhgh0ATJteAcPZzJsL//adrGSJrHcPZAXBzlSO48=;
	b=pbSoHPb8vg5W7SlV3wRUulubZqgw/Gorr6K6g6a+xEkC6cU3+WFZnd/8Obv0/AXpZF
	VxBlB3nvlkHv0DIIr1QjQhGl726VB4wUR5J1VaUyJQUirfaeN6TUFh1FoGIHvQ4Wb0iq
	w+Lm6nW8tALTYBcmxndFM3KZz4teOx5xFFU7KeEeV4aNLw50T294ojdLfhj6D0bGWUFx
	iPfP0ZM+xK9oME9wH7pST17FKgHa33OKmMKsVph6dGuBOL+GkWpw9vOTaJ1l2LF8VhVA
	CilKJE98pPpyHbH02B8a9FA35fOpx0+nbtBApVta67vmHUdsz/JVDyfZ4qF4DQOapM9v
	2+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QjaHhgh0ATJteAcPZzJsL//adrGSJrHcPZAXBzlSO48=;
	b=lff8WElJPx6V8+uMONhqpTXOag73BnCteG+4+xLZRqcSbrebdQqjZk4oeKXD0AldQn
	SXy4HSRAJNvYV1qRMJ04CbOhxHAg5xhgMIysxZlrve1ovaoA/xst2X10naDYkj4lxul9
	daqWg3NR/cwyqejlAIRofRxzur4ttiEmZwh2qxVN/4gUsLJX/u0eEg1AeefYYqZqSiQp
	Bc+CCbRlibpRb9ZEOhjCRLY18zRPeajAPJrzouv6LiljUvQoQqtfdpiGQBM4SrGHfdL+
	G3Ns0xbVPNkN7GHQYsfuKreJI4sQ6GDlf/taEGpsgzWWvFlMYsU40UkG68Q1yzqwI2Dj
	A+3A==
X-Gm-Message-State: AKwxytd2t94dgT7I3Y7il1Nxv1dth7icQU/SvkLPklisPMHeFATfoX4P
	bW9ExHzMdmlWOJI2Vra9nHJaZA==
X-Google-Smtp-Source: ACJfBotppNyZtSrwSUSkIWr1FzSSn2a0NyeMwCqFpO8DMmQJgWq5Rs5VaIFXUyBw//SvqQ3CoNFFQw==
X-Received: by 10.55.42.12 with SMTP id q12mr33096463qkh.354.1515695876911;
	Thu, 11 Jan 2018 10:37:56 -0800 (PST)
Received: from localhost.localdomain ([177.220.175.217])
	by smtp.googlemail.com with ESMTPSA id
	130sm10971733qkg.80.2018.01.11.10.37.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 Jan 2018 10:37:56 -0800 (PST)
From: Marco A L Barbosa <malbarbo@gmail.com>
To: qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu, 11 Jan 2018 16:37:14 -0200
Message-Id: <20180111183714.22834-2-malbarbo@gmail.com>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH v2] linux-user: Add AT_SECURE auxval
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
X-List-Received-Date: Thu, 11 Jan 2018 18:38:02 -0000

---
 linux-user/elfload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/linux-user/elfload.c b/linux-user/elfload.c
index 20f3d8c2c3..32a47674e6 100644
--- a/linux-user/elfload.c
+++ b/linux-user/elfload.c
@@ -1354,7 +1354,7 @@ struct exec
                                  ~(abi_ulong)(TARGET_ELF_EXEC_PAGESIZE-1))
 #define TARGET_ELF_PAGEOFFSET(_v) ((_v) & (TARGET_ELF_EXEC_PAGESIZE-1))
 
-#define DLINFO_ITEMS 14
+#define DLINFO_ITEMS 15
 
 static inline void memcpy_fromfs(void * to, const void * from, unsigned long n)
 {
@@ -1786,6 +1786,7 @@ static abi_ulong create_elf_tables(abi_ulong p, int argc, int envc,
     NEW_AUX_ENT(AT_HWCAP, (abi_ulong) ELF_HWCAP);
     NEW_AUX_ENT(AT_CLKTCK, (abi_ulong) sysconf(_SC_CLK_TCK));
     NEW_AUX_ENT(AT_RANDOM, (abi_ulong) u_rand_bytes);
+    NEW_AUX_ENT(AT_SECURE, (abi_ulong) qemu_getauxval(AT_SECURE));
 
 #ifdef ELF_HWCAP2
     NEW_AUX_ENT(AT_HWCAP2, (abi_ulong) ELF_HWCAP2);
-- 
2.11.0


