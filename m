Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqNEB-0007Il-FF
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2017 13:38:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39063)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNE9-0007GH-Jk
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:38:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNE8-0007Uj-Ic
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:38:01 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:33282)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNE8-0007U1-Ep; Fri, 08 Sep 2017 13:38:00 -0400
Received: by mail-qt0-x243.google.com with SMTP id h15so1961137qta.0;
	Fri, 08 Sep 2017 10:38:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:mime-version:content-transfer-encoding;
	bh=zgCkt+3FqV7RLROugIaZsuRifghxdnnpR+De5+6Cp8w=;
	b=sLwkbHcI7FhjH8mHx5ntwLgk9MLznln3TlMmSfKp1ox5kM0kabRSiL0h2/bChB5mBx
	pIZyTTJV0FShzU+wd6TbmPD1kSIOo8xtzByGCJc19FxEzAqlohcqFnYv5x56hCmhbni0
	wxmA8Tcyiwq3SpeNF3ve4KQkUTq9Oit/aijoeDQi3RbUDWvAd4fhLQH769z4w0LdUCOG
	hjZCUCf5OzGZGtfhRqmQvJmin9Xz7hR5MrhJWdM/tOv6X3vuWbjjGQrCtQ+Sx/UXwBha
	7GiGdM98a4X6xh1WkdWbKtodgjLhUoSvEHVlCYsjumAJqreWBHcpUd7bCeeeUcQHuWLO
	eRvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:mime-version
	:content-transfer-encoding;
	bh=zgCkt+3FqV7RLROugIaZsuRifghxdnnpR+De5+6Cp8w=;
	b=KHLPEHKx32XogHrQip2evjwieJz4bXfGT7G3xo0AoTwTRabIB+BxPkz5KBNgFO1J71
	sB+QT73XxfwX5kWkmr1UlxXIM+BLLOP9mqLECTHvmdiNEna7Cwe/3Rbj8pcIJHDFgtHN
	JADT5NSlVaTZkwIphEURKaVb7Wl1F/0Hgq9f9KiMEM7/ZWLUyKNeeVA8flG/L/uk/qKH
	+f+saSBosagJHAY1kcueO3fTiChCqxCWwrKrcAgf7WF5zbf/ghzz66TSyZfVD+TKVp+h
	BdP9AiuXmkOTjnmoCAcTkLBSzv1EJWu5glIWT1+E57I2k1/uKKftPXjBHuzxXOQfCHhX
	f7jQ==
X-Gm-Message-State: AHPjjUgAPgtuj/RH7D7qwA6iv2p9LvUAdw2Qa6miFLvkRM7bR2hIt1RX
	kMSJo1MrzUBuClDkuCgkig==
X-Google-Smtp-Source: AOwi7QC90rbVIwGwym4ugM+Hyy3/9tu1/05+k7f6Ym/aso7IAW8chCX4ZcBG0OOQIR1nJ4xShHQEEA==
X-Received: by 10.200.39.24 with SMTP id g24mr5108836qtg.230.1504892279674;
	Fri, 08 Sep 2017 10:37:59 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f4sm1605859qtg.35.2017.09.08.10.37.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 10:37:58 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Alberto Garcia <berto@igalia.com>, Stefan Hajnoczi <stefanha@redhat.com>
Date: Fri,  8 Sep 2017 14:36:27 -0300
Message-Id: <20170908173632.6711-9-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908173632.6711-1-f4bug@amsat.org>
References: <20170908173632.6711-1-f4bug@amsat.org>
In-Reply-To: <20170908173146.6446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-trivial] [PATCH v3 10/15] MAINTAINERS: add missing entries
 for throttling infra
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
X-List-Received-Date: Fri, 08 Sep 2017 17:38:02 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Alberto Garcia <berto@igalia.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 517c8f95d7..4e05831bda 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1574,8 +1574,10 @@ M: Alberto Garcia <berto@igalia.com>
 S: Supported
 F: block/throttle-groups.c
 F: include/block/throttle-groups.h
-F: include/qemu/throttle.h
+F: include/qemu/throttle*.h
 F: util/throttle.c
+F: docs/throttle.txt
+F: tests/test-throttle.c
 L: qemu-block@nongnu.org
 
 UUID
-- 
2.14.1


