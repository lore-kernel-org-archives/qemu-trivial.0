Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAxt-0005Ts-Tv
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:56:01 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48833)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxp-0005OU-1B
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxo-0007ec-BU
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:55:57 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:37970)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxl-0007bL-CB; Wed, 30 Aug 2017 17:55:53 -0400
Received: by mail-qk0-x241.google.com with SMTP id o63so6387496qkb.5;
	Wed, 30 Aug 2017 14:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=w02zc7fraXpT3Y+sT7uAxUpoSiUd/Rbq7Hj/E8RYt7Y=;
	b=a/0pVvRh/yC9QaBqMJtCmJx+4kpvWz0IA5urlquihsaUadnJstQRd11JjSUXIqV530
	EVeNPr8sLfjq4CNGRnGphF767v7qHs2Ql9pIA1DU9umO+1DDFkSaSaqcazWjZjB5fI75
	e7o5YQQx5gcJU6YlugP1yg+uWQbkf1pVPg6ctqqXUcZg0Q5Fj9wDxEeGSd61vt4OllMo
	u0D/psNt/Be7fIAxg0W6dWFIU/hGH7A5W9lu25Ai3HqVbvQ0wda+FxFD1XE5hdHpYuV8
	rgh019kKUEWUcVMWjMFPQkZ+8UlU6M6iV6ql8jr+oDqCUkJBefOgNNXmANro1FxlAJjJ
	r6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=w02zc7fraXpT3Y+sT7uAxUpoSiUd/Rbq7Hj/E8RYt7Y=;
	b=OxCsy/mA+bvupuj/fCaxejcMhkmCDEU6H/7tlKY3BSdzbRFEZ9wuGEEmG0d/L40/bG
	LUybQwehO4sLQvm4PF16nauqg+ccSUqqwv22L1jmB/+K79C/yWzlL+hP+p1dhQUHmH1w
	18dmzCwIIAzTbi5yBDUtK8HhU7L24IuT7IgQzxutThRHRQDaiKQbOAIufhgPaF+Bz7Y1
	STdC+YGjMw5awuMoVds/5V8WSnQjvU9M5jztulqBvZLjDhkOxdZ761FYIGzziPKevnVp
	yTEQQhnez74Nu2rMwS8efMFP3BkcAnmFyhBxmR55I2knX0lk7Tt9L4AoXIIDqjuBoiQF
	qMdQ==
X-Gm-Message-State: AHYfb5g29HQn7ddO8mJFXFrYt287mt1cqJt+A9dfgcqwmUadCcKhsbKj
	DprnIOHz/fpHgg==
X-Received: by 10.55.165.199 with SMTP id o190mr1005165qke.105.1504130152766; 
	Wed, 30 Aug 2017 14:55:52 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.55.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:55:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Dmitry Fleytman <dmitry@daynix.com>,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 30 Aug 2017 18:55:11 -0300
Message-Id: <20170830215523.25278-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v2 05/17] MAINTAINERS: add missing VMWare
 entry
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
X-List-Received-Date: Wed, 30 Aug 2017 21:56:00 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Dmitry Fleytman <dmitry@daynix.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 223591c231..aa185c1edd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1126,6 +1126,7 @@ M: Dmitry Fleytman <dmitry@daynix.com>
 S: Maintained
 F: hw/net/vmxnet*
 F: hw/scsi/vmw_pvscsi*
+F: tests/vmxnet3-test.c
 
 Rocker
 M: Jiri Pirko <jiri@resnulli.us>
-- 
2.14.1


