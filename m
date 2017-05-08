Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7sG5-0005G1-Pg
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 19:40:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52863)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sG3-0005Dw-EN
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:40:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sG0-0002TJ-Bf
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 19:40:03 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:35706)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7sFw-0002S4-2J; Mon, 08 May 2017 19:39:56 -0400
Received: by mail-qk0-x244.google.com with SMTP id k74so12355561qke.2;
	Mon, 08 May 2017 16:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kpKcTMScU5Tr3TjjdVHk5QlEU0JfJwSnGnU4djWmxBY=;
	b=P4ZFHKCnk+Ln6aLGB8Fj8l+ioeAaLaB/lhMXrLyQ9oHIacYQlWVUUlIoLzq/g+0kAR
	m2jV1/kLKeSamSCijGnK1wl9l7pNARv4GlvdG707YiE9WJSPAA5zIKjwsGmbhDMYcJsk
	2dnO7nUoecGUxosxxeLUDDTWoHCg71YlmuPXrTD5FLTWQNfu8BRr93xY7VvHHkvZtbVC
	YtHh/R2jEyr/EP19mVIc4meIHp/plZRqEP8DnZg/iS1zloUMvFKvLY1rUjEUuii4G66E
	2O5khJeJaw4K6zbEGYdco8i1saqWlszY7Ea8zaCF1dJ6XYocfZN1cFI8UoO9ArZw3Mc+
	P5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=kpKcTMScU5Tr3TjjdVHk5QlEU0JfJwSnGnU4djWmxBY=;
	b=OL07h8AfJ9AjgQ6mjhvESc7BXDvJD69p6tHmNPwv1guB6IgrweN3KgTBA8aeuwEhBO
	2kibYeXG4HZWedeBTnoBlobGorzyiq/TiUulVKbbVEIzlTDvrfCH/Nn7KdDOhPxps+O6
	/FdHnj2RiRWkVRZiY/wkOdtfWsejluVGc+uPObOya2Pj4KG2pos2PpGc0zwydIO98Yuw
	g0A+atm4yC85Ok0zK3NuBSAcsGdm9inoY/Qle6b3CW7SI20qD8jZbA3CXFLWPf+mEsh8
	cCpwRbWEDtpapkv0WFetePwuXepXlA+lmkc55MkaJSf1aqpbsB5YvfYti3FaF0dcS500
	Ib5w==
X-Gm-Message-State: AN3rC/7xXKHeOFiLHz2PA0Mi2G6Ut+w3b8L9eWcJRwM6mugmFKgsAuFn
	lXV7tfiC/x2sxQ==
X-Received: by 10.55.159.68 with SMTP id i65mr25861251qke.313.1494286795577;
	Mon, 08 May 2017 16:39:55 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	v64sm13556099qkg.38.2017.05.08.16.39.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 16:39:55 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Alistair Francis <alistair.francis@xilinx.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Date: Mon,  8 May 2017 20:39:18 -0300
Message-Id: <20170508233918.9043-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170508233918.9043-1-f4bug@amsat.org>
References: <20170508233918.9043-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 11/11] MAINTAINERS: self-appoint me as
 reviewer of the Register API
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
X-List-Received-Date: Mon, 08 May 2017 23:40:04 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index efdec47319..de32165059 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1431,6 +1431,7 @@ T: git git://repo.or.cz/qemu/armbru.git qapi-next
 
 Register API
 M: Alistair Francis <alistair.francis@xilinx.com>
+R: Philippe Mathieu-Daudé <f4bug@amsat.org>
 S: Maintained
 F: hw/core/register.c
 F: include/hw/register.h
-- 
2.11.0


