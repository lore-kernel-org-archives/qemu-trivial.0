Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daxwv-0003vK-9C
	for mharc-qemu-trivial@gnu.org; Fri, 28 Jul 2017 01:36:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47299)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwq-0003tD-Qv
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwp-0002rW-UY
	for qemu-trivial@nongnu.org; Fri, 28 Jul 2017 01:36:28 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:33542)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daxwn-0002oa-7V; Fri, 28 Jul 2017 01:36:25 -0400
Received: by mail-qt0-x244.google.com with SMTP id u19so9229740qtc.0;
	Thu, 27 Jul 2017 22:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=wc/wduugkULI74q9uOm2w+aLRMeII7HdAJX8ryTIaTE=;
	b=g5K5lLtnnDI4MbKolRaSo7tcwMfi99Wh/NGdHjJ7PB7HnLHZrl9QxQxcZYB3qvr5zg
	G9PL1pTEZQC8L/sQS964wwAnmZSb/WSw1jrBwuoI/w/NI8JbCjn1eAPq3zyYrk/gzlTj
	qW90k77BAbUnFOOINgwqU75GlvEHENU2kQo/2Fg3/Wb8rWlp88LKKypfm1DTy8o+l4TD
	1wMu8+pK7dcD3YlS94OasHZpapv4QcBVmwsyCjsnlsqW9EbQ9KIlIT6rEe2SgvfecNFv
	fCKj8iLF0CEC4NWaTLFepyoORZmEV6gfE39ceLoQ5tE/Si2D04bYs6r6qEfbMOyR/YwV
	n9Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=wc/wduugkULI74q9uOm2w+aLRMeII7HdAJX8ryTIaTE=;
	b=DIV7/Cb+zrz/aO+IwAICP6QRawa6u8FIpgSKu0pthiGbuzQvc7Ew82f+OagV9S7nAN
	2E7w5b1fJlWlFDAHL4gxecG/SMZKjdVsMSGAl/ckBKa2mGpvKW3+oCphYkSK1D6n0yPp
	8CrWZJa+dSusIh9IefwM3MemJ2jdCHi5OGzLowba6ld9GzWykHfLNhGz0IpYEj+WcCzs
	UELtxIFqXvOrNzWtaG8UhmHcc2GsiKZMz1rg7FWkn1KHUjdM3bAUYZiR6769fkBs6VYW
	adBEOPbmsMYz5I23oTB9MPu2dQReKHDPzfO7tO5vi0gA6jVqJsrGXX0/bmjtO2rPCzVx
	60Jw==
X-Gm-Message-State: AIVw110iUSEJhV9R5etwOhvHGZqHJozK/3+R8aG3VvFdGzTZJIKfapcT
	yVUbf8w1yali/+mb4spRQg==
X-Received: by 10.237.41.135 with SMTP id o7mr9754965qtd.75.1501220184761;
	Thu, 27 Jul 2017 22:36:24 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	h41sm12129560qta.45.2017.07.27.22.36.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 27 Jul 2017 22:36:24 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: 
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 28 Jul 2017 02:35:24 -0300
Message-Id: <20170728053610.15770-2-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170728053610.15770-1-f4bug@amsat.org>
References: <20170728053610.15770-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [RFC PATCH 01/47] MAINTAINERS: add missing entry for
 documentation
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
X-List-Received-Date: Fri, 28 Jul 2017 05:36:30 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---

because having only a "Build system architecture" entry in Documentation seems
odd to me, so RFC.

 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5ea273f899..972118e70b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1886,6 +1886,9 @@ W: http://patchew.org/QEMU/
 
 Documentation
 -------------
+Overall
+F: docs/
+
 Build system architecture
 M: Daniel P. Berrange <berrange@redhat.com>
 S: Odd Fixes
-- 
2.13.3


