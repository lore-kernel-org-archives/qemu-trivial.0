Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAyE-0005qI-1b
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:56:22 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49143)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAyB-0005na-QW
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAyB-0007wb-5Q
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:56:19 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:36869)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAy8-0007vb-Bk; Wed, 30 Aug 2017 17:56:16 -0400
Received: by mail-qk0-x241.google.com with SMTP id m4so6406112qke.4;
	Wed, 30 Aug 2017 14:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=/9ndusWjiLy4iSHUhFoNFuAfA+wppFNbPjjqlf4Jwwg=;
	b=QQNAIJ/QwoG75CBNk3YM1wkJk4Gt1opN1UrBjWkuPV1/5VseuhcLstgejydd2R+bdG
	l3lYcjm/X8U+u5RC6VHI9UhhQiCvLIpT9hTHx1idZv/O7l6YaOwEt2VQV9r8xdzt9beS
	NQTeUVK5ZScfGbNzv+AZkUL/XRiYzlObqBoJ7w+HZGAHQiN2URWYNHl3SWZVHWAk/PWU
	7h1dwlOd1mkRpk++UCbMQD0UU6Le5/TUrvMg+dERQEUk7SknoZBZ/QpCc6nz6nCiyxTs
	pKdjSNcXPZSQ3DFkWgKyWOg+eeWBcpymOvPJxfpGgX2kpHv8ApSAuUA2Vg5079ry6rye
	mwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=/9ndusWjiLy4iSHUhFoNFuAfA+wppFNbPjjqlf4Jwwg=;
	b=FYE6a/h6ZdkzqzXHeD5bGnjbnI7+fBf0JmJ9WfA/RxKorPpUBXHJUg5AQtqi44bEgQ
	GUzRTLMDNMJcdONzWPMh0uNhGFAj+hZeY1lmqSCOBoNgDElWLYpE5EkyzcuTX7vJNqHL
	7d9QK4//WAtxmwF7XkyRyv3oj0b9MKNJFFjpznbu8P/7kvrfbSFBBTKv7WcLwebNRVkg
	/YMQ875Ewye2GRv9HSPz11dlJ0HF1+888jcADi9Ha9DY8asq+qWvu3m4i2MKXhxWJJA9
	hZFkpMy1UcS4dCMsO1uvMcT0eJoCdbY9rVzciDmuXw4X/RlA3lTLDj+0G5fyV2gHzqMD
	IgRw==
X-Gm-Message-State: AHYfb5hxzSKdfhP/SDTPkd+P/+k+NcJ8BwBNVdMJGlHi1zIMcKg6szmL
	eKS2kZE72t9yJA==
X-Received: by 10.55.73.202 with SMTP id w193mr1110658qka.228.1504130175827;
	Wed, 30 Aug 2017 14:56:15 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.56.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:56:15 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair.francis@xilinx.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 30 Aug 2017 18:55:20 -0300
Message-Id: <20170830215523.25278-15-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v2 14/17] MAINTAINERS: add missing entry for
 Generic Loader
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
X-List-Received-Date: Wed, 30 Aug 2017 21:56:20 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a48f633cad..0b77590dc8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1164,6 +1164,7 @@ M: Alistair Francis <alistair.francis@xilinx.com>
 S: Maintained
 F: hw/core/generic-loader.c
 F: include/hw/core/generic-loader.h
+F: docs/generic-loader.txt
 
 CHRP NVRAM
 M: Thomas Huth <thuth@redhat.com>
-- 
2.14.1


