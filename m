Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCGOq-0006cQ-9k
	for mharc-qemu-trivial@gnu.org; Tue, 07 Nov 2017 21:47:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55590)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCGOo-0006bS-Vd
	for qemu-trivial@nongnu.org; Tue, 07 Nov 2017 21:47:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCGOo-0003sK-7K
	for qemu-trivial@nongnu.org; Tue, 07 Nov 2017 21:47:31 -0500
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:55497)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eCGOj-0003ra-Vl; Tue, 07 Nov 2017 21:47:26 -0500
Received: by mail-qt0-x243.google.com with SMTP id v41so1628765qtv.12;
	Tue, 07 Nov 2017 18:47:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tw4xbl/cMmYLLLTpjONKwr/0txVWJienEZseh67zLp0=;
	b=EiRh8qh71qxDQJMthnnW4pGLgyrUNrhv5tmYJ+6vQI8cphlkZn3+jQjKDQ1cQopANh
	a/31SObT+sDu7WXMboog3cRKyADNY+QChHrdYETlwxhhTOHjZ7BJaNuiMRV/GviKKQoh
	vACZREFC9J2IsbjH3AdyOJXtIK7zQbn2k3/ji1lyvW/mss0/4RThV8BWFjkST90W81Lw
	vGavY/9KhiKJKuoWymxg2VtJHezGZCx7pynluiNnfWOIvt3//vOi+/MFk/ueWDdR6zbA
	q4d3a65BcAc9jUqBVwoPfHXpMDGUUF8U7jwdztrqkcGR+eOv4mrn0Q8P00xwKt7sqIFb
	hpIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=tw4xbl/cMmYLLLTpjONKwr/0txVWJienEZseh67zLp0=;
	b=aWvprbU7Fuw8DA0XM0YaTqtbCn+07fzpHpJwhPkeMLPXA3z5PxbIFWDCh2lxfJNkS/
	ndxI22+7UEHWgUbu19B9U3lOxOGsSG6HtFkeMK+CWql0nTUSeQbXShIPFgpB2zDGaIXF
	IoJzoSsdFoG00urKFMiUZl42RHNT1HTnoNQ7AOo+Qoelcvy4nPSW66FQXrFqzO9IShJr
	sX3Nsjy4YwucmBpY4byN2/YqY2J64WP1tLuJirpHKuBZSIQo8cCb9jVRsMzMGi4rk8vy
	SvW6nCx+t42TeOrh6Blp5ByQjX7wZ2dRocYXk7KkKgm1rmz5oFUjuwZtr11o81dsT9r2
	/MKQ==
X-Gm-Message-State: AJaThX541utiOrHcj24KTWv3K/AGiYKZ0ZbYJMbOKNjYPdxRNuc/uxGI
	6yv+9KeG9ReUD2YL09ezOjo=
X-Google-Smtp-Source: ABhQp+QYiNeCqTPxkexe4fZkT1EiEYOMjy4M164RDQm3HzGN1VlzKo4aPL2TuJqQ9Z6FWJTsZWfG/Q==
X-Received: by 10.200.3.87 with SMTP id w23mr1333393qtg.98.1510109245359;
	Tue, 07 Nov 2017 18:47:25 -0800 (PST)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	j19sm2084493qkh.38.2017.11.07.18.47.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Nov 2017 18:47:24 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	"Daniel P . Berrange" <berrange@redhat.com>, Fam Zheng <famz@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue,  7 Nov 2017 23:47:19 -0300
Message-Id: <20171108024719.8389-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH] docker: correctly escape $BACKEND in the
 help output
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
X-List-Received-Date: Wed, 08 Nov 2017 02:47:31 -0000

In Makefiles the $ must be escaped as $$ in shell uses.

Since 8a2390a4f47:

 $ make docker
     [...]
     NETWORK=1            Enable virtual network interface with default backend.
     NETWORK=ACKEND     Enable virtual network interface with ACKEND.

Once escaped:

 $ make docker
     [...]
     NETWORK=1            Enable virtual network interface with default backend.
     NETWORK=$BACKEND     Enable virtual network interface with $BACKEND.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 tests/docker/Makefile.include | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
index f1a398e9fa..de87341528 100644
--- a/tests/docker/Makefile.include
+++ b/tests/docker/Makefile.include
@@ -109,7 +109,7 @@ docker:
 	@echo '    DEBUG=1              Stop and drop to shell in the created container'
 	@echo '                         before running the command.'
 	@echo '    NETWORK=1            Enable virtual network interface with default backend.'
-	@echo '    NETWORK=$BACKEND     Enable virtual network interface with $BACKEND.'
+	@echo '    NETWORK=$$BACKEND     Enable virtual network interface with $$BACKEND.'
 	@echo '    NOUSER               Define to disable adding current user to containers passwd.'
 	@echo '    NOCACHE=1            Ignore cache when build images.'
 	@echo '    EXECUTABLE=<path>    Include executable in image.'
-- 
2.15.0


