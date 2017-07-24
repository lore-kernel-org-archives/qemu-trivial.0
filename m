Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi5y-00008A-Np
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:28:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5w-00005w-Oy
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5v-0004po-Rl
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:40 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:35924)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5t-0004on-H8; Mon, 24 Jul 2017 14:28:37 -0400
Received: by mail-qk0-x243.google.com with SMTP id d136so10665960qkg.3;
	Mon, 24 Jul 2017 11:28:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=2VCA6ci3zhhoe80qtBC1tJlOXxnuy9ZJf6/QUBn12bw=;
	b=i3fkuV8Rp7Rli7v2Bcf1vblnI8bGjyAjajDiaTCVaLuKKmECMG1nefcD0Pjm4gu7uQ
	7LfDgyKKvUL5F4SIv8TOOmTlqmLlfdTWrmxGZYWB1Nq/to+U345IpVC4pA0kw4UlWT4A
	eAMhEh0gRB4QI5DKjCFpLdfwvoU+OvxPRpjeO6pYSfSAsfiSBInH+iaquHC+KCBys9ky
	Ux5ZbTT4Td88yuQbOL2DiyrnB8m7Ex4tO5Fof4VGpAgR6STojH9UmuRih8vnS0/0pDUN
	dZmJFL7norn5nJaz/B1QiyD6Pjo9grYbYYRVx2ygPF32lzQuIp1O9354PaRj79FZNcka
	1llw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=2VCA6ci3zhhoe80qtBC1tJlOXxnuy9ZJf6/QUBn12bw=;
	b=Wa4wWJJhuTTRtpuSwHF+fHLFhhOg8M6MgbXJvhWkz6G1ElMPiCRv6qO+HO4LGfU+83
	GuwVmqWavWJNn5zxlDqFyShRJgrVxBOzg+6Qd8wHgEx11J/E1Ae0/GsdIBpls6xLbN33
	9w8afTZRE+kPWcpZ0fmUnPfoAn49XGYm9klrsWi6WA5FUX6t1/Z9Hetu3hU6t2PZS0jv
	Wf7U+ZG1fRVlUKP8/9LPQV0N/kbwg7yESGiVvoernDwyx/Ni7HAaBOI/f++0PkYd50pE
	qPsShbylbhGt5yJG/+rlY/DvysUD9UsOB0w7qpdROFSEWw2A19T7+5a+tmBg+W3b0OIK
	oHaQ==
X-Gm-Message-State: AIVw113utoXcKWZlev3fsreGgkFk9WDEdBCbUq2CxWlv0C2a+qaShiuO
	0WrfuKiyevzwKw==
X-Received: by 10.55.33.77 with SMTP id h74mr22980670qkh.353.1500920917080;
	Mon, 24 Jul 2017 11:28:37 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.28.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:28:36 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:25 -0300
Message-Id: <20170724182751.18261-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH for 2.10 09/35] ui/vnc: fix leak of
 SocketAddress **
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
X-List-Received-Date: Mon, 24 Jul 2017 18:28:41 -0000

Extract the (correct) cleaning code as a new function vnc_free_addresses() then
use it to remove the memory leaks.

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 ui/vnc.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/ui/vnc.c b/ui/vnc.c
index eb91559b6b..651cbb8606 100644
--- a/ui/vnc.c
+++ b/ui/vnc.c
@@ -3521,6 +3521,20 @@ static int vnc_display_get_address(const char *addrstr,
     return ret;
 }
 
+static void vnc_free_addresses(SocketAddress ***retsaddr,
+                               size_t *retnsaddr)
+{
+    size_t i;
+
+    for (i = 0; i < *retnsaddr; i++) {
+        qapi_free_SocketAddress((*retsaddr)[i]);
+    }
+    g_free(*retsaddr);
+
+    *retsaddr = NULL;
+    *retnsaddr = 0;
+}
+
 static int vnc_display_get_addresses(QemuOpts *opts,
                                      bool reverse,
                                      SocketAddress ***retsaddr,
@@ -3538,7 +3552,6 @@ static int vnc_display_get_addresses(QemuOpts *opts,
     bool has_ipv6 = qemu_opt_get(opts, "ipv6");
     bool ipv4 = qemu_opt_get_bool(opts, "ipv4", false);
     bool ipv6 = qemu_opt_get_bool(opts, "ipv6", false);
-    size_t i;
     int displaynum = -1;
     int ret = -1;
 
@@ -3614,16 +3627,8 @@ static int vnc_display_get_addresses(QemuOpts *opts,
     ret = 0;
  cleanup:
     if (ret < 0) {
-        for (i = 0; i < *retnsaddr; i++) {
-            qapi_free_SocketAddress((*retsaddr)[i]);
-        }
-        g_free(*retsaddr);
-        for (i = 0; i < *retnwsaddr; i++) {
-            qapi_free_SocketAddress((*retwsaddr)[i]);
-        }
-        g_free(*retwsaddr);
-        *retsaddr = *retwsaddr = NULL;
-        *retnsaddr = *retnwsaddr = 0;
+        vnc_free_addresses(retsaddr, retnsaddr);
+        vnc_free_addresses(retwsaddr, retnwsaddr);
     }
     return ret;
 }
@@ -3772,7 +3777,6 @@ void vnc_display_open(const char *id, Error **errp)
     int acl = 0;
     int lock_key_sync = 1;
     int key_delay_ms;
-    size_t i;
 
     if (!vd) {
         error_setg(errp, "VNC display not active");
@@ -3993,12 +3997,8 @@ void vnc_display_open(const char *id, Error **errp)
     }
 
  cleanup:
-    for (i = 0; i < nsaddr; i++) {
-        qapi_free_SocketAddress(saddr[i]);
-    }
-    for (i = 0; i < nwsaddr; i++) {
-        qapi_free_SocketAddress(wsaddr[i]);
-    }
+    vnc_free_addresses(&saddr, &nsaddr);
+    vnc_free_addresses(&wsaddr, &nwsaddr);
     return;
 
 fail:
-- 
2.13.3


