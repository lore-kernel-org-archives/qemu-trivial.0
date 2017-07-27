Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYlQ-0005UL-Rs
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:43:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54605)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlL-0005Pd-G0
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:42:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlK-0007rg-Lq
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:42:55 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:35730)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlI-0007pS-AK; Wed, 26 Jul 2017 22:42:52 -0400
Received: by mail-qk0-x244.google.com with SMTP id k2so9706205qkf.2;
	Wed, 26 Jul 2017 19:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uMhJsprUfIipSWPgYk/cacjQNmO4tf0E9YDL1FuqcSw=;
	b=cE5BHJ1yibbtREmYdiUxHDtl7qYKdxRronc0m9urSqDZ/j/VYjOLg/bHztKNXqadTu
	149++NTM0pWe0io/Q14jYj0DIrq+m1/ZyweZajZQx21+Tyu37dD9ucu2215CIzM7W+sN
	m1laDpWWpyTG22XvbW/0nNZHqDl2U+dgOYmYV90pJN3cti5+I7jJQ74Aszi4yYNCLDGv
	ZfSWld9/NTF03Yw0YKcfX4ydFeyUYgGXe29wVOrHpnVqlY+gHDIdHjY7A3u8RZzauxHK
	Ue5HpVAQCKtkfQLopzVJgIMXegDKyuswCvPkYJvNUlyw57lHBCYUcWqCLNVVn+vke2Qk
	mZBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=uMhJsprUfIipSWPgYk/cacjQNmO4tf0E9YDL1FuqcSw=;
	b=JZ4YRZ/WjF5UjLa33Gwb3PIDaPfuddv9q/EMf7ysy1cSa7kV11OZvQy0HlKoCEjnXT
	9fIJoQuiN9iyYh5mAmzOMKBUNCaK3iHDW6pAjIPXUPGZS8w8jiiM72n+6/SfW18eLHjZ
	NxdqS6QfndYbrX8q5nbRGsbj5MjbCKhaID7xoXjtBTAvBDtm3JQeyll5Pgs0uN2pBmtc
	/bckTGSTo88i4PHr6AQumchUaqcOeWSalsIRfLvzjynhpwLoHRUkIBYkt2yoW8FAjIRV
	4V23Jx1cjbk3ttJ7fI9tQHjw04RwImVI3fbeLZYnx2vwUJd7fwq8tfZ16FIp0+FE/eHP
	nqQA==
X-Gm-Message-State: AIVw111c/eZqKKnNzinJVQLBy/YfsX+99kckMn+1qYFqS95xpJaPmbVT
	Qvey0sf7QZCPRA==
X-Received: by 10.55.212.157 with SMTP id s29mr3692719qks.222.1501123371818;
	Wed, 26 Jul 2017 19:42:51 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.42.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:42:51 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 26 Jul 2017 23:42:11 -0300
Message-Id: <20170727024224.22900-7-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH for 2.10 v2 06/20] ui/vnc: fix leak of
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
X-List-Received-Date: Thu, 27 Jul 2017 02:42:58 -0000

Extract the (correct) cleaning code as a new function vnc_free_addresses() then
use it to remove the memory leaks.

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Daniel P. Berrange <berrange@redhat.com>
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


