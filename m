Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1myZOi-0005X3-4N
	for mharc-qemu-trivial@gnu.org; Sat, 18 Dec 2021 08:05:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myZOW-0005LT-B9; Sat, 18 Dec 2021 08:05:01 -0500
Received: from [2a00:1450:4864:20::32d] (port=40796
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1myZOT-0003B1-PZ; Sat, 18 Dec 2021 08:05:00 -0500
Received: by mail-wm1-x32d.google.com with SMTP id
 j140-20020a1c2392000000b003399ae48f58so5915142wmj.5; 
 Sat, 18 Dec 2021 05:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4bKHxb95nFSAADwowuqlt0XUJr9p4AbCeYHUfbFYBto=;
 b=Jf/yaXKR2rvRYppPqyZH4KBsZCy9yQjO+3cxiFjbwawun9yI4JlEECT0nuZl9WcQsd
 El8+wwip2GWXzsPPHfq01s2ZplCCv2UzyutBjegIPwXimuvo3ulGifGUR7n849Q4OoOo
 ZA50E0LPwLCf+9ADJYw7Gmckjy89NxJlZYhPFrwERsOlEx68UCGKwM2+VQClYXNdGFhN
 DfVHg8eZ0YScZZFqQv+Q8TFxtgEhpyx6lpUmlzact6wOkwBSNB+OsLTFRVwEgDnb4J2O
 HJtDFJKWFsXSwYLvU9+fR1tCHzJhnwqpOAglrFmf9jt649KGpq6V0cYX4a2AWyvOpMmY
 FncQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=4bKHxb95nFSAADwowuqlt0XUJr9p4AbCeYHUfbFYBto=;
 b=M54v2kydEl9rRfha8Zu5SRyQIFCyaRjUrcQgRx/5pvHfPvIOXQceZPdWtmQGZwrc9a
 3o97SqCSgvW79y7DvKlTc3/f08saXZLw8dPY1RzxUADukSpjEwADDFVo08ZylMW8NQtH
 Zso1NkneftofeALcOJRqHmqWiOzHggSNTWKFvykTQELNbtu1Z/620iERplSHlLnMy8/z
 pyIY4XWo05NFIMx0uPZE7vWGkLTc+H8Lr763dcxs0xMuCJfEgpwkHMz1/YuKobu1YKZr
 qZGlYL1b5OXJnaTBfnkQNEu51DfKeWC9Bj8cN8TNS2bif/GgpehyHqe4pC8lvKcEkC5N
 xV3w==
X-Gm-Message-State: AOAM533sB+mo/GO+5QFZIorPimANJ9gqRZCVxxGp94dwusC9H1qMxDB5
 k8M/2EfvnIzVKNSpW2ch04xfm005+l4=
X-Google-Smtp-Source: ABdhPJwm3SrZRDIDHIiDb6y2pSTFlCP+bVQURovf3iLgUgeX8U2ojrNb0PH7baXnn5CYjPVZyE44cw==
X-Received: by 2002:a7b:c054:: with SMTP id u20mr6686218wmc.133.1639832693991; 
 Sat, 18 Dec 2021 05:04:53 -0800 (PST)
Received: from x1w.. (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id t8sm13269522wmq.32.2021.12.18.05.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 05:04:53 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Cc: Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-trivial@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v2 3/5] hw/qdev: Correct qdev_connect_gpio_out_named()
 documentation
Date: Sat, 18 Dec 2021 14:04:35 +0100
Message-Id: <20211218130437.1516929-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211218130437.1516929-1-f4bug@amsat.org>
References: <20211218130437.1516929-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
X-List-Received-Date: Sat, 18 Dec 2021 13:05:08 -0000

qdev_connect_gpio_out_named() is described as qdev_connect_gpio_out(),
and referring to itself in an endless loop, which is confusing. Fix.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 include/hw/qdev-core.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index dcf20c69b89..424c48daf6e 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -504,7 +504,8 @@ qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n);
 void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
 
 /**
- * qdev_connect_gpio_out: Connect one of a device's anonymous output GPIO lines
+ * qdev_connect_gpio_out_named: Connect one of a device's named output
+ *                              GPIO lines
  * @dev: Device whose GPIO to connect
  * @name: Name of the output GPIO array
  * @n: Number of the anonymous output GPIO line (which must be in range)
@@ -526,7 +527,7 @@ void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
  * qemu_irqs at once, or to connect multiple outbound GPIOs to the
  * same qemu_irq; see qdev_connect_gpio_out() for details.
  *
- * For named output GPIO lines, use qdev_connect_gpio_out_named().
+ * For anonymous output GPIO lines, use qdev_connect_gpio_out().
  */
 void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
                                  qemu_irq pin);
-- 
2.33.1


