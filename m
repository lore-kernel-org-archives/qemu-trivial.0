Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAxw-0005Ws-Dx
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:56:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48895)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxu-0005UM-4k
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxt-0007kH-E2
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:02 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:37872)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxq-0007g2-Og; Wed, 30 Aug 2017 17:55:58 -0400
Received: by mail-qk0-x241.google.com with SMTP id m4so6405556qke.4;
	Wed, 30 Aug 2017 14:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=WLvinwo/d/mixKN/3VGx4kvb1J3qeeIw4IjHkbpdnFA=;
	b=tmuGq48xM57lOPUNAvy6ZSfz8VNYxUNnTW7o6ktK6/JkgKvYmbO6psll+Bnr8G4dFz
	U+zBcBRFFzpSBHl6NUTCkjyc4ENnB1u7ZxjCFxLcpYAngJ6uO/FhzCHZxRM8osbJ7C9C
	8Cd4auV6Ldp9XROIGvbNwnFI2uTqJmp/5k+HOxiCFNDxR9aLXiFXaq5pvfUwfQIFCl/n
	6HoVUGvgELEPBJl92P+i2yNZYCOTblDCcd+cS8ak3HCkYd9YDrxkIAn/FpsGPTNpAKPC
	4PWQ6C0JWMDpJnZ3TESqPJPXRNpCGq2vv2MAhZ+wqMT9GStRPxoS0+bcAWRBOcpC5Ad/
	OENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=WLvinwo/d/mixKN/3VGx4kvb1J3qeeIw4IjHkbpdnFA=;
	b=KWQx/JWbXngOqLndvNDGp9yHhw16NnkDbh8riP7hXYmrh6iYjeO+DTmrwUahsfq3Db
	GL5lfn5o2IgUGZdD4eBkueP6fbcNHa0yRa+to/Wr36du8bb/0HMKIiCvjNrfkNq+oztR
	ATppqAZzjqYqdq94gG3D6AnS5G+w2Evwb3xzUsYsQiKOuajWsWw+Cc5dPaRjnLqENjYp
	OizA6JL7FOpyX12CJtEq0ouwa5C4/qDU8QMjmzREQePOPccxOvPlMQQMZnKH5hnqwxP4
	WnY7PZuB8Tr+gGsCFdXJ+UPnjVntyUs2D6/Pel/gIT2u6FtnCPZ22qWrExDY/4zDyB5k
	0I4w==
X-Gm-Message-State: AHPjjUh23WckfsIB9+edmZh1nx1G5u91YWfInn7An8FM7xp9+QNFlrZn
	sR+7mfTz8gB1Mg==
X-Received: by 10.55.73.65 with SMTP id w62mr938807qka.255.1504130158219;
	Wed, 30 Aug 2017 14:55:58 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.55.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:55:57 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org, qemu-block@nongnu.org
Date: Wed, 30 Aug 2017 18:55:13 -0300
Message-Id: <20170830215523.25278-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v2 07/17] MAINTAINERS: add missing qcow2 entry
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
X-List-Received-Date: Wed, 30 Aug 2017 21:56:03 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f4e07173c8..eb20365fbb 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1841,6 +1841,7 @@ M: Max Reitz <mreitz@redhat.com>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/qcow2*
+F: docs/interop/qcow2.txt
 
 qcow
 M: Kevin Wolf <kwolf@redhat.com>
-- 
2.14.1


