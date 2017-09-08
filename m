Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqNEM-0007WS-UX
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2017 13:38:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39160)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNEJ-0007Ru-0j
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:38:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNEI-0007a3-AJ
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:38:11 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:33306)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNEI-0007ZE-5x; Fri, 08 Sep 2017 13:38:10 -0400
Received: by mail-qk0-x244.google.com with SMTP id g128so1924642qke.0;
	Fri, 08 Sep 2017 10:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:mime-version:content-transfer-encoding;
	bh=D4YeFqMFj+KSssb7wqhLRkOXPRDYThP+ZJ2CeS2sT/g=;
	b=mD8k4q/hI1OyGleR7FxitjBq8np+vTxyGi0HkQ9BZObmmMJ91kTL7vnox1gLlKIcMP
	SYsYm0ZEo8HSt0CTSnNEDnJItpidl21h0o5jrKrK42k2WqbJDpPUSur0aot5AFUYJKC6
	FjBZJhTF81SUiJHz8i9fRubkscktEROlepR5uBor7OawuIGmIaLQX6MkwCnC94DsgFgT
	nY1qNNEK1/5N5FjxbSzCM6Qs6thjFQG/SNNbQ4wsabbgmE5P/yS9EtCb753+mM+Vd9nG
	pG5bELVFmkKOxX9+tTcsdMVgc5SHau4RmmA5E2U+7u1OIxCJskxIvpQtTI3aXZJ6Fj61
	C7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:mime-version
	:content-transfer-encoding;
	bh=D4YeFqMFj+KSssb7wqhLRkOXPRDYThP+ZJ2CeS2sT/g=;
	b=Jf8LDvti3ILVRi0nmMsfV63TrAuCxZGTQCxFFmegu5fFlwF7VBLf7TCWvHuVo+/9es
	KWTzF5BvlaqUh9/zzUJMgv5of+Z+tjyegL1quxiEceAQ07X5GxVTEYfwWho7mHX02SCS
	/cgj1NSpRWK1nUQ6sMlGYhdRW/ziIRyAS1uhRsSDKTp9pKzbk4XyA9qmt0vJYnscaLpO
	7VosG7iVyWTrqCeqCnFxakbQ+bT96WEUBaY1SwzA6FkXXfWagyDCuu4ofoAgQ1B3KlC/
	cLFma2gqrzWwaob7vV6fPTEF6N23IrVt4xPWLf1CjtvtDdKcPr+HeJNX15EmJJqfhXJd
	Ta3Q==
X-Gm-Message-State: AHPjjUj6qgP3eQv8Jawy/hL3i4kn3ugd49dK6LK9d/c0Jsl2qUczLAis
	kW5KN7aGL8OFQY/hNgVTsw==
X-Google-Smtp-Source: AOwi7QBqkdvJ6eQ5zvvdoDGQfDtqcnlNvIG6Zmc3pgFLOa/LU5DiEzcrFkPYmR+K1yXXaT0dCjr3Vg==
X-Received: by 10.55.35.69 with SMTP id j66mr4996259qkj.141.1504892287303;
	Fri, 08 Sep 2017 10:38:07 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f4sm1605859qtg.35.2017.09.08.10.38.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 10:38:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	"Daniel P . Berrange" <berrange@redhat.com>,
	Longpeng <longpeng2@huawei.com>
Date: Fri,  8 Sep 2017 14:36:30 -0300
Message-Id: <20170908173632.6711-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908173632.6711-1-f4bug@amsat.org>
References: <20170908173632.6711-1-f4bug@amsat.org>
In-Reply-To: <20170908173146.6446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 13/15] MAINTAINERS: add missing
 Cryptography entry
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
X-List-Received-Date: Fri, 08 Sep 2017 17:38:12 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Daniel P. Berrange <berrange@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8024a3880b..53891bd36e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1540,6 +1540,7 @@ S: Maintained
 F: crypto/
 F: include/crypto/
 F: tests/test-crypto-*
+F: tests/benchmark-crypto-*
 F: qemu.sasl
 
 Coroutines
-- 
2.14.1


