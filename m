Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxxL-0004KO-KU
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:36:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47781)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxH-0004Fd-W9
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxG-0003LT-SO
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:56 -0400
Received: from mail-qk0-x242.google.com ([2607:f8b0:400d:c09::242]:33166)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxxD-0003HJ-IZ; Fri, 28 Jul 2017 01:36:51 -0400
Received: by mail-qk0-x242.google.com with SMTP id d145so17726071qkc.0;
	Thu, 27 Jul 2017 22:36:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=1aH+cyGyyysvS25J6trMQfe/I9oJCvM15TaOEW4avEI=;
	b=XMCpdO+UiEjpCgP1eiY31ktjFl+jHr0wFo0qpsnFPJmX7aVra3kW/nW+8SbA0rDuhU
	QHFJy0zFXIBXIaspq8uN6jPIgEM/5tMhy5iRnnRuzMED63xE7XlE9ijtGFZL+0b1myCQ
	63T1TWxFU1Tqto++Q1Lk8929twO+h5opoBkWsev3uchsXZ4GvPqS+bZfG6k07128ttju
	TqCzcwCoozatKYB6MGYruiuiSxyDyqro8aTPjYjBIXEiSwNaYSyp2jT4crUosnL+f4aE
	FREgLGv3M83vtALyvwfxu9+t4qJAf2olTnT4YLh390q1RfsXeMPCjFkeD6sgVziA9Gap
	Qwmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=1aH+cyGyyysvS25J6trMQfe/I9oJCvM15TaOEW4avEI=;
	b=j/VrJsZqVotwUL7LeO4evll+31GUrUWriCO9IxLNQQMakxm1dbrZ3Bpjzmb5/fJ6vk
	uxphuz7WmHBVsI7i4ymAV5bU6LxkpWjuwJnMWlnw94gjcHu6YFB/pFktso4IlJG7ITrJ
	yyRtT8TuZVyr7C62rttUVDygbNim//Mzw1rHgYaQLfOr+wbyHfZ0qLEreTX25B1h63KS
	FmFXXVJmWkYU7wz1as6ll/+aAaMAIq/iO7b5qLRT+o8BXcN2dTCS0KwOCPQwon6/wRrS
	ku/Yr5fy9F8JZLRvLts5p9fbIEcAyI4W7T4phcSEE9DISzY+N7Zpz8QIWejBY/jAdEBu
	4/jA==
X-Gm-Message-State: AIVw113+tuChao3p8rpHk2TqLI/hRB0W1z532eoIA4TVxjBMJ9shI9V+
	yB5j7ywVQWQxjd9kUYAwtA==
X-Received: by 10.55.166.150 with SMTP id p144mr8237783qke.269.1501220211025; 
	Thu, 27 Jul 2017 22:36:51 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.36.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:36:50 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:35 -0300
Message-Id: <20170728053610.15770-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::242
Subject: [Qemu-trivial] [PATCH 12/47] MAINTAINERS: add missing entry for
 virtio/input
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
X-List-Received-Date: Fri, 28 Jul 2017 05:36:57 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bfdb2f8928..a9f950248a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1084,6 +1084,7 @@ M: Gerd Hoffmann <kraxel@redhat.com>
 S: Maintained
 F: hw/input/virtio-input*.c
 F: include/hw/virtio/virtio-input.h
+F: include/standard-headers/linux/virtio_input.h
 
 virtio-serial
 M: Amit Shah <amit@kernel.org>
-- 
2.13.3


