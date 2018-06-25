Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fXQs4-000316-QG
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jun 2018 08:45:28 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55335)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQrz-0002vg-Si
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:26 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQry-0008Tp-KG
	for qemu-trivial@nongnu.org; Mon, 25 Jun 2018 08:45:23 -0400
Received: from mail-qk0-x229.google.com ([2607:f8b0:400d:c09::229]:40523)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fXQru-0008PS-2i; Mon, 25 Jun 2018 08:45:18 -0400
Received: by mail-qk0-x229.google.com with SMTP id b129-v6so7361430qke.7;
	Mon, 25 Jun 2018 05:45:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=BCxunVxWmwIk0FC6wcum33vfzo3NHW+vyJKJixCB1Ls=;
	b=NNuZvtdkhsmwhoBikzH4F7yv3Zo9U0f6vazwKZvnr0GndKID0GLHJrCvH+eT2SjcLe
	xontHW5Y8aHjx/oTNOVzt8AH7I7+f/cJabFHJZyeUQ1aEeRdC2Du3cMetBFGrcmtv7GB
	BIACBxAefQv43Q0ODgDNiPtX/ZgaooknfllZyRimaLpbdNIWeS2huD5mIKT2SMTUyAyN
	WU3ns8gGZSd7qE76IegWrpGY0SEg2vz882OzLP42YQt7yicuckWCJYWxBtosOkEZxDhd
	rNgyS1B4v/8f4xTvD0RpRVSdJkX1E1574emSalum3IX0G1dhjd4VtEVPKYFsnpi1CSDP
	sfTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=BCxunVxWmwIk0FC6wcum33vfzo3NHW+vyJKJixCB1Ls=;
	b=IRzfNu16w3CC0nm97k23acPKXRNppTP+eTtiwLYNhVdIwhSrRTL0GhFT8lu1vcYlWx
	P0QwFNgXs3Tl/UaFkLsgtl3+LmYKvJldWSYZsUmlUbnZrHicg7JgHBOaE6HU+3DP6tI7
	DXmdi3ZhuRL+SIIju87V8014wKilfWK+eBBS8Qe/p3i6uNoEQ0UFwkt9oOK/tIhBYMPU
	dsT9cKhqZOvUR7+c+QG9Czdgwj6tvTUFJl6109NjhnOUEKjOHqs1KTCjxYURwQ/YpG46
	M0DAQnHmqyqr7r0D7zMcXBZZvaxjDZJgBtvzJy4snjJzNJRYsd/k4ZdVgrdSoEnIwsyU
	NEdA==
X-Gm-Message-State: APt69E2T2f8bGHvzOA9ylCgf4G3NTXRXC8QcqUgIRp9SoKgH68rPMO+N
	qszIaXxycAJWBf1KVx+ns8I=
X-Google-Smtp-Source: ADUXVKL942NhWWbs802rgHh6Q1ZmM5dQlN719c6JgYvB2qjTsDHcqMhHLfbyV23WXr8WhQKQviDXXQ==
X-Received: by 2002:a37:c20b:: with SMTP id
	i11-v6mr10613722qkm.316.1529930717531; 
	Mon, 25 Jun 2018 05:45:17 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	m15-v6sm12549562qtm.84.2018.06.25.05.45.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jun 2018 05:45:17 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
	Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	=?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Date: Mon, 25 Jun 2018 09:42:36 -0300
Message-Id: <20180625124238.25339-45-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180625124238.25339-1-f4bug@amsat.org>
References: <20180625124238.25339-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::229
Subject: [Qemu-trivial] [PATCH v5 44/46] tests/crypto: Use the IEC binary
 prefix definitions
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
X-List-Received-Date: Mon, 25 Jun 2018 12:45:27 -0000

It eases code review, unit is explicit.

Patch generated using:

  $ git grep -n '[<>][<>]= ?[1-5]0'

and modified manually.

Suggested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/benchmark-crypto-cipher.c | 6 +++---
 tests/benchmark-crypto-hash.c   | 5 +++--
 tests/benchmark-crypto-hmac.c   | 6 +++---
 3 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/tests/benchmark-crypto-cipher.c b/tests/benchmark-crypto-cipher.c
index cf98443468..f5a0d0bc32 100644
--- a/tests/benchmark-crypto-cipher.c
+++ b/tests/benchmark-crypto-cipher.c
@@ -11,6 +11,7 @@
  * top-level directory.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "crypto/init.h"
 #include "crypto/cipher.h"
 
@@ -56,8 +57,7 @@ static void test_cipher_speed(const void *opaque)
         total += chunk_size;
     } while (g_test_timer_elapsed() < 5.0);
 
-    total /= 1024 * 1024; /* to MB */
-
+    total /= MiB;
     g_print("cbc(aes128): ");
     g_print("Testing chunk_size %zu bytes ", chunk_size);
     g_print("done: %.2f MB in %.2f secs: ", total, g_test_timer_last());
@@ -78,7 +78,7 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
     g_assert(qcrypto_init(NULL) == 0);
 
-    for (i = 512; i <= (64 * 1204); i *= 2) {
+    for (i = 512; i <= 64 * KiB; i *= 2) {
         memset(name, 0 , sizeof(name));
         snprintf(name, sizeof(name), "/crypto/cipher/speed-%zu", i);
         g_test_add_data_func(name, (void *)i, test_cipher_speed);
diff --git a/tests/benchmark-crypto-hash.c b/tests/benchmark-crypto-hash.c
index 122bfb6b85..9b6f7a9155 100644
--- a/tests/benchmark-crypto-hash.c
+++ b/tests/benchmark-crypto-hash.c
@@ -11,6 +11,7 @@
  * top-level directory.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "crypto/init.h"
 #include "crypto/hash.h"
 
@@ -39,7 +40,7 @@ static void test_hash_speed(const void *opaque)
         total += chunk_size;
     } while (g_test_timer_elapsed() < 5.0);
 
-    total /= 1024 * 1024; /* to MB */
+    total /= MiB;
     g_print("sha256: ");
     g_print("Testing chunk_size %zu bytes ", chunk_size);
     g_print("done: %.2f MB in %.2f secs: ", total, g_test_timer_last());
@@ -57,7 +58,7 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
     g_assert(qcrypto_init(NULL) == 0);
 
-    for (i = 512; i <= (64 * 1204); i *= 2) {
+    for (i = 512; i <= 64 * KiB; i *= 2) {
         memset(name, 0 , sizeof(name));
         snprintf(name, sizeof(name), "/crypto/hash/speed-%zu", i);
         g_test_add_data_func(name, (void *)i, test_hash_speed);
diff --git a/tests/benchmark-crypto-hmac.c b/tests/benchmark-crypto-hmac.c
index c30250df3e..f1dfa240cb 100644
--- a/tests/benchmark-crypto-hmac.c
+++ b/tests/benchmark-crypto-hmac.c
@@ -11,6 +11,7 @@
  * top-level directory.
  */
 #include "qemu/osdep.h"
+#include "qemu/units.h"
 #include "crypto/init.h"
 #include "crypto/hmac.h"
 
@@ -53,8 +54,7 @@ static void test_hmac_speed(const void *opaque)
         total += chunk_size;
     } while (g_test_timer_elapsed() < 5.0);
 
-    total /= 1024 * 1024; /* to MB */
-
+    total /= MiB;
     g_print("hmac(sha256): ");
     g_print("Testing chunk_size %zu bytes ", chunk_size);
     g_print("done: %.2f MB in %.2f secs: ", total, g_test_timer_last());
@@ -72,7 +72,7 @@ int main(int argc, char **argv)
     g_test_init(&argc, &argv, NULL);
     g_assert(qcrypto_init(NULL) == 0);
 
-    for (i = 512; i <= (64 * 1204); i *= 2) {
+    for (i = 512; i <= 64 * KiB; i *= 2) {
         memset(name, 0 , sizeof(name));
         snprintf(name, sizeof(name), "/crypto/hmac/speed-%zu", i);
         g_test_add_data_func(name, (void *)i, test_hmac_speed);
-- 
2.18.0


