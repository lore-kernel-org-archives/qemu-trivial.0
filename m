Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e4V03-0001by-0P
	for mharc-qemu-trivial@gnu.org; Tue, 17 Oct 2017 12:45:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46464)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzy-0001Vz-0G
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzx-0003Am-8a
	for qemu-trivial@nongnu.org; Tue, 17 Oct 2017 12:45:46 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:47826)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e4Uzs-00038r-Ev; Tue, 17 Oct 2017 12:45:40 -0400
Received: by mail-qk0-x244.google.com with SMTP id m189so2832039qke.4;
	Tue, 17 Oct 2017 09:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=EiZMm+i2CXkpEG7QnGVHXDKzBqzqgnUROWX1r1qQPs8=;
	b=uhL4rnUjrfrYlXduHeoy5kgMAibnm/K/YdSq3lrd3exGevb3iMDEmDjI5PJBkPdduH
	Dw7BRYiK5ENRHZKUgitD8yO00w+lYoSStpJOe8e5XX3oYQPqMHh6bkr5nlZhrx7Hu8SE
	/C8Fc7LmH3Y/oTF3Viwoy2/a2LNgJvC1tmjeZrbL0TdktKFxHMlpo29bBg4zqDj+7E1E
	6RGwiYIbz7CQF8WZjX0gdE7ijl8+oZpPU3CVIXg6QAMNJiqRVaG+AN/2kO2ZDmjVZ+D2
	tiEfQSfCtmvMxRyYEdVyhGH4IkJ2eO8mewg7fvQZ9nZhjA1ljV4IKp8aMlGYOw6bLaNA
	SapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=EiZMm+i2CXkpEG7QnGVHXDKzBqzqgnUROWX1r1qQPs8=;
	b=Ty5G85eVFQu06e+2iFOZ5URZ9qyMQZEKXQo0y4kV9C8CWvH5n+C2PpRYYMRHC0uQ8o
	xTMXc+KrqkZox/CWV1wDSUJQAGFFVxQ3HYu5KmTdBQaAtI4YzXQiQwD8FzHyiMhTwu7p
	G1dl5cQXa80ouRHmvowPM/V0HViS0Y9yzZig/EJK27jUHc5qSYyCgx7F0I9HdQVkfhd1
	wCh3p4pihzDUTrrgfNYAWG0/HgBtz4mCM1c3HZAQDuTqnHMumvb0L7F1ffiayOSGBxpV
	dUsPkymNLfWMP9ydiMMEYoRl+X7uO9tO+zFfmIE/y9nbAXi9MRNcT3bOgYp/YenwSNe8
	r1aA==
X-Gm-Message-State: AMCzsaVcqjZbXV6SUYl9jFo5TvOoPgPzK5SVBOJwW2VLjCD7OA40lRHQ
	SJxMtMsJ+Fkp3XH9ecGLQv5POdcK
X-Google-Smtp-Source: ABhQp+RC5jJQpt9nezQmn3009TqViX2C6tCrpy9dTodi0WlJLWzp+mdUSzvwoBjzs4qX2fDoSNv3zA==
X-Received: by 10.55.159.74 with SMTP id i71mr20162052qke.46.1508258739846;
	Tue, 17 Oct 2017 09:45:39 -0700 (PDT)
Received: from x1.local ([181.93.89.178]) by smtp.gmail.com with ESMTPSA id
	q49sm6687653qtq.80.2017.10.17.09.45.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 17 Oct 2017 09:45:39 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Michael Tokarev <mjt@tls.msk.ru>,
	Jason Wang <jasowang@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Tue, 17 Oct 2017 13:43:52 -0300
Message-Id: <20171017164426.25277-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.15.0.rc0
In-Reply-To: <20171017164426.25277-1-f4bug@amsat.org>
References: <20171017164426.25277-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v3 08/42] MAINTAINERS: add missing entry for
 include/hw/net/
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
X-List-Received-Date: Tue, 17 Oct 2017 16:45:47 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Hervé Poussineau <hpoussin@reactos.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 948d99c123..0e926a942b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -982,6 +982,7 @@ Network devices
 M: Jason Wang <jasowang@redhat.com>
 S: Odd Fixes
 F: hw/net/
+F: include/hw/net/
 F: tests/virtio-net-test.c
 T: git git://github.com/jasowang/qemu.git net
 
-- 
2.15.0.rc0


