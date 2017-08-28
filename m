Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dmIMf-0002CO-Qo
	for mharc-qemu-trivial@gnu.org; Mon, 28 Aug 2017 07:37:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dmIMd-0002Aw-KA
	for qemu-trivial@nongnu.org; Mon, 28 Aug 2017 07:37:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dmIMc-0000tP-E9
	for qemu-trivial@nongnu.org; Mon, 28 Aug 2017 07:37:55 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33457)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dmIMX-0000r3-O5; Mon, 28 Aug 2017 07:37:49 -0400
Received: by mail-qt0-x244.google.com with SMTP id q53so186487qtq.0;
	Mon, 28 Aug 2017 04:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=BzVhGwmGLtnf+FWL9OtTYiv8cvL/yH/Q4Wm7ld9N/nU=;
	b=b2XCaLQHD1yOnja/vYRBHll46nAIL7g0glaXaZjUY+GBP5uzUmaLZVTClqHBVTa1Pd
	qT0zJRSjhyhYG7Fn2XHwrXV98FJnx0RgC1q9zM4zu6bsIbOzzdOOXnUEGBs7sLDtBQHJ
	g/T/7SlJycxHGfBQVVEAfzWOyuf6PfmrE0bIP5pVdOuJ3z9ElMr1f6yOrzmUmvQQT+yI
	dn0d9y6OiFlBvQ2FNuQJ0GQfjv28YVTDnp194PB4swub06umoXDdwohfFsMQ5YZgVgrj
	XD2MZ7B+IEgsSJUFAGgT5NZhJffyokCBBw5EfAvcpaiebu6qQRY4QcCgyKG84U7iCXRW
	HsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=BzVhGwmGLtnf+FWL9OtTYiv8cvL/yH/Q4Wm7ld9N/nU=;
	b=RusRdzsE+a1PybHDceXA7V7Oynuitp3cYoWnYwK/yHIVToEGuoc0x6F9k+TQnsPSVX
	/wp4ERMJUBDgqcGzudhRcLXCVkSmOm3kY+V9mftExFpZtrk3XJxi3mIPeJPHtZ6DBbRs
	Sz0mTAA/BVEdzbBATljb2ARh6LpjnpLN166ToIZ6pniZbu14RMsgNKZzb95WGYSNW/el
	EVam5uz/F1dTHNjacuEQzcJdAiyWjAq6wKZQfIxRH7GcPydZdOuRHBC3ROBkecmN1jee
	hYUc8QwxAdAY3w7BA/fpAcblyfM8+MWUN9R2VLDCJTtIlULJL05zrBxJIGZej4h3cM0i
	4Bzg==
X-Gm-Message-State: AHYfb5hkpKjQEJW7gycvbv73Km3J7jMAF/EagAbvY2/gtMZwVGq4r0xU
	w/3YDR2b/kUseQ==
X-Received: by 10.200.51.87 with SMTP id u23mr339566qta.144.1503920267826;
	Mon, 28 Aug 2017 04:37:47 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id b5sm99595qkj.81.2017.08.28.04.37.45
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 28 Aug 2017 04:37:47 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Daniel P . Berrange" <berrange@redhat.com>,
	Longpeng <longpeng2@huawei.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 28 Aug 2017 08:37:37 -0300
Message-Id: <20170828113737.12199-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH] tests: fix incorrect size_t format in
 benchmark-crypto
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
X-List-Received-Date: Mon, 28 Aug 2017 11:37:56 -0000

  $ make check-speed
  tests/benchmark-crypto-hash.c: In function 'test_hash_speed':
  tests/benchmark-crypto-hash.c:44:5: error: format '%ld' expects argument of type 'long int', but argument 2 has type 'size_t' [-Werror=format=]
       g_print("Testing chunk_size %ld bytes ", chunk_size);
       ^
  tests/benchmark-crypto-hash.c: In function 'main':
  tests/benchmark-crypto-hash.c:62:9: error: format '%lu' expects argument of type 'long unsigned int', but argument 4 has type 'size_t' [-Werror=format=]
           snprintf(name, sizeof(name), "/crypto/hash/speed-%lu", i);
           ^
  cc1: all warnings being treated as errors
  rules.mak:66: recipe for target 'tests/benchmark-crypto-hash.o' failed
  make: *** [tests/benchmark-crypto-hash.o] Error 1

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
testing v2.10.0-rc4

 tests/benchmark-crypto-cipher.c | 4 ++--
 tests/benchmark-crypto-hash.c   | 4 ++--
 tests/benchmark-crypto-hmac.c   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/tests/benchmark-crypto-cipher.c b/tests/benchmark-crypto-cipher.c
index c6a40929e4..cf98443468 100644
--- a/tests/benchmark-crypto-cipher.c
+++ b/tests/benchmark-crypto-cipher.c
@@ -59,7 +59,7 @@ static void test_cipher_speed(const void *opaque)
     total /= 1024 * 1024; /* to MB */
 
     g_print("cbc(aes128): ");
-    g_print("Testing chunk_size %ld bytes ", chunk_size);
+    g_print("Testing chunk_size %zu bytes ", chunk_size);
     g_print("done: %.2f MB in %.2f secs: ", total, g_test_timer_last());
     g_print("%.2f MB/sec\n", total / g_test_timer_last());
 
@@ -80,7 +80,7 @@ int main(int argc, char **argv)
 
     for (i = 512; i <= (64 * 1204); i *= 2) {
         memset(name, 0 , sizeof(name));
-        snprintf(name, sizeof(name), "/crypto/cipher/speed-%lu", i);
+        snprintf(name, sizeof(name), "/crypto/cipher/speed-%zu", i);
         g_test_add_data_func(name, (void *)i, test_cipher_speed);
     }
 
diff --git a/tests/benchmark-crypto-hash.c b/tests/benchmark-crypto-hash.c
index 6769d2a11b..122bfb6b85 100644
--- a/tests/benchmark-crypto-hash.c
+++ b/tests/benchmark-crypto-hash.c
@@ -41,7 +41,7 @@ static void test_hash_speed(const void *opaque)
 
     total /= 1024 * 1024; /* to MB */
     g_print("sha256: ");
-    g_print("Testing chunk_size %ld bytes ", chunk_size);
+    g_print("Testing chunk_size %zu bytes ", chunk_size);
     g_print("done: %.2f MB in %.2f secs: ", total, g_test_timer_last());
     g_print("%.2f MB/sec\n", total / g_test_timer_last());
 
@@ -59,7 +59,7 @@ int main(int argc, char **argv)
 
     for (i = 512; i <= (64 * 1204); i *= 2) {
         memset(name, 0 , sizeof(name));
-        snprintf(name, sizeof(name), "/crypto/hash/speed-%lu", i);
+        snprintf(name, sizeof(name), "/crypto/hash/speed-%zu", i);
         g_test_add_data_func(name, (void *)i, test_hash_speed);
     }
 
diff --git a/tests/benchmark-crypto-hmac.c b/tests/benchmark-crypto-hmac.c
index 72408be987..c30250df3e 100644
--- a/tests/benchmark-crypto-hmac.c
+++ b/tests/benchmark-crypto-hmac.c
@@ -56,7 +56,7 @@ static void test_hmac_speed(const void *opaque)
     total /= 1024 * 1024; /* to MB */
 
     g_print("hmac(sha256): ");
-    g_print("Testing chunk_size %ld bytes ", chunk_size);
+    g_print("Testing chunk_size %zu bytes ", chunk_size);
     g_print("done: %.2f MB in %.2f secs: ", total, g_test_timer_last());
     g_print("%.2f MB/sec\n", total / g_test_timer_last());
 
@@ -74,7 +74,7 @@ int main(int argc, char **argv)
 
     for (i = 512; i <= (64 * 1204); i *= 2) {
         memset(name, 0 , sizeof(name));
-        snprintf(name, sizeof(name), "/crypto/hmac/speed-%lu", i);
+        snprintf(name, sizeof(name), "/crypto/hmac/speed-%zu", i);
         g_test_add_data_func(name, (void *)i, test_hmac_speed);
     }
 
-- 
2.14.1


