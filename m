Return-Path: <qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C97ACA9EDE
	for <qemu-trivial@archiver.kernel.org>; Mon, 12 Oct 2026 17:39:11 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-trivial-bounces@nongnu.org>)
	id 1xGJyx-00029L-DV; Mon, 12 Oct 2026 13:38:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <filip.hejsek@gmail.com>)
 id 1xGJys-00027F-MF
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2026 13:38:36 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <filip.hejsek@gmail.com>)
 id 1xGJyq-0003e9-8q
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2026 13:38:33 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4a1880e1bf1so20038015e9.1
 for <qemu-trivial@nongnu.org>; Mon, 12 Oct 2026 10:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791826710; x=1792431510; darn=nongnu.org;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=usZFRkws+j7TzH9xq3wKZiKiY9W93M5uvsiD1aeslcY=;
 b=Y3E+LyLPzaoAU0AceUM76NubHnfbK2pW9g4XAKJ8F8QQCbvDfj9EJy3gG6uzXklaHz
 ib/x6KYhiZcTDYO5QAeZXZHEosmuUy2bLFE5/fkytD+kop9YfCAeROyfoc4B+qe4DaJs
 ep4ziroAPc4LWchJB9XU2B6qfpY3C/7igHHdD7ZMggKO+tSTrM12tktVHdgeskGMj1sX
 D2HCurGojoC5yHKn6GyUm3VEp+ocecYmV0NtC8UnasNGE1NubZmdz3qQVdog7MfTpawI
 jjxnZ8u4rSxwKkws0jOOiwHTTvsAfqx8snOPYIRnMYGJQMSGikuF5JrtzWCo0wd9Mmk+
 oDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791826710; x=1792431510;
 h=cc:to:message-id:content-transfer-encoding:content-type
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=usZFRkws+j7TzH9xq3wKZiKiY9W93M5uvsiD1aeslcY=;
 b=EBLw7Qwf+x2XkfL+U98x+JXIpikeADy3YG3WZmsnQv3PrA+xwIGFQOSvrxqC18dkuw
 PTAXQbW9GtPOdPG4LdAHhwcW1CShhVJNbBp5UVmkp6LgMvrmMbJo8dcs4leG+opu6C2d
 ge57vi5X3v0QNnwoJ3IFSmNKMm14NVu9vOrJJGw9fwOhxNE0vk9JyC6gTpuF9yxHtjPi
 /K2rEKO1x/ZCxdt+srTxzTPrjJLGfgdF647i/HuxCwI29Gi2JMSseXifKRRPYC+pUMSU
 Gvi7ydZn8nm++suHd3oNaoc4G92am0tIhcB4rWc/LhSLLv0KdnDOU5J1ke2cLEFHgKiv
 EKDw==
X-Forwarded-Encrypted: i=1;
 AKwUvBwC7vht9hCzgsj9MWIL1vgAapnZAqlFZv0oXTzYM/5x0+fFT94JFmxNsXkvqBJula5Febl5Urh0GujA1G0=@nongnu.org
X-Gm-Message-State: AFq9FYLkftE4eqAXtpFvTZnzhyXfvm5XhQlDgntEXI4lzrW7XKnhlaFz
 JU5pGjUBdTi7LlcQhqJPxMAKqKDAsABNcFhY8OhDDfM3i6Nr8Yyz5kOZ
X-Gm-Gg: AYBFou0S6Vq1C4GCmFjJDG3mVLUyWUzJd3+ClVVBuzU5Om/xpd+u/uwUrnOU8FoPIYl
 h6SAH7hmuzNwX51/xKOMMP0CWuAmGVlWkYdDMdlTm/595rlufoYxj/TNIpQxphTNvto3EIVPD4A
 U5rKaMwa5dJk3jVQaqXaXoG6qpWEAFP/w6mKOrw4B4cYTYa5UHZcHq7r3M6R9w2nplSBowZ9Hq+
 Jv6fquPhMNvkty0SKrKp6eq0f7KOfX9apF0+xp2tXB7/9JmYP8ZVXEA4Y//TGp4LA+/Tw4FQE8b
 lfy6qawNTBO4sQQxGC4gCQLVaDT6wtX4Imo0+Oc+9P2ByUIseX542Jlvel4WYn7GchyAot7dskh
 vmBdSN2fpdkrM+sQ36+tWHEJmRjNI5vhgYUaeDwMVrBeOzO5L1wGxaZ+sde6sDwODyxnLqEHiUb
 6ym0sdS1d4wza1NCJDQao8Wrt9S52TnUz6Gb4599g1xqPzqzuLMQs78fYjb48maLcVChIflCdkk
 Dn9gRl5paJIWmeyOGx6jw8IXbY=
X-Received: by 2002:a05:600c:348f:b0:49c:fc6e:8caf with SMTP id
 5b1f17b1804b1-4a18e4c05e5mr200478805e9.19.1791826710489; 
 Mon, 12 Oct 2026 10:38:30 -0700 (PDT)
Received: from localhost (mem-185.47.220.165.jmnet.cz. [185.47.220.165])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4a18bf1358asm307493095e9.4.2026.10.12.10.38.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2026 10:38:29 -0700 (PDT)
From: Filip Hejsek <filip.hejsek@gmail.com>
Date: Mon, 12 Oct 2026 19:38:14 +0200
Subject: [PATCH TRIVIAL] io: avoid potential double close of
 qio_channel_file's fd
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-fix-double-close-v1-1-d37f2224dcb0@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA0Mj3bTMCt2U/NKknFTd5Jz84lRd86Rk0yRDE5PkZEsTJaC2gqJUoBq
 wkdFKIUGeYZ6OPkqxEIni0qSs1OQSkIFKtbUAQdbsh30AAAA=
X-Change-ID: 20261012-fix-double-close-7bc5b144cc94
To: qemu-devel@nongnu.org
Cc: =?utf-8?q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>, 
 qemu-trivial@nongnu.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791826708; l=1494;
 i=filip.hejsek@gmail.com; s=20250912; h=from:subject:message-id;
 bh=5dvrwQ9mqfHO4Xa7PXXmIvECRDsR2GyNuRN5/WgwZ5g=;
 b=taQ/jvVmUm682R0Usl8bWtHO2OWnlAbyhnPdRoKkyxjuIP3FTh5/AVG5udufnr0uAcwtwNmij
 fYTApx2gPZ7B1t9n5vGMM8ELsPEjnZ1lEZO6YozdjJ4heeo5oWnVqoT
X-Developer-Key: i=filip.hejsek@gmail.com; a=ed25519;
 pk=nakB8gEK3oi+Q/5dBTMCy/LgZL47NP60z1jeDR6O/WU=
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=filip.hejsek@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
Errors-To: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org
Sender: qemu-trivial-bounces+qemu-trivial=archiver.kernel.org@nongnu.org

Make qio_channel_file_close() set fd to -1 even if qemu_close() returns
an error so that qio_channel_file_finalize() doesn't call close again.

On Linux, close() always closes the fd, even when it returns an error.
Because the fd can be reused after it is closed, the close must not
be retried.

Signed-off-by: Filip Hejsek <filip.hejsek@gmail.com>
---
 io/channel-file.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/io/channel-file.c b/io/channel-file.c
index 5cef75a67c..afc9640518 100644
--- a/io/channel-file.c
+++ b/io/channel-file.c
@@ -255,12 +255,18 @@ static int qio_channel_file_close(QIOChannel *ioc,
 {
     QIOChannelFile *fioc = QIO_CHANNEL_FILE(ioc);
 
-    if (qemu_close(fioc->fd) < 0) {
+    int ret = qemu_close(fioc->fd);
+    /*
+     * The fd should now have been closed even if we got an error. There are
+     * obscure systems where this isn't always the case, but an fd leak on
+     * obscure systems is less bad than double close on common systems.
+     */
+    fioc->fd = -1;
+    if (ret < 0) {
         error_setg_errno(errp, errno,
-                         "Unable to close file");
+                         "Got an error while closing file");
         return -1;
     }
-    fioc->fd = -1;
     return 0;
 }
 

---
base-commit: 615ece3c406b262996e569f29ea6eed0d81c4d8d
change-id: 20261012-fix-double-close-7bc5b144cc94

Best regards,
--  
Filip Hejsek <filip.hejsek@gmail.com>


