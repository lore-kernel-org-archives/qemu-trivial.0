Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dqNER-0007bc-5w
	for mharc-qemu-trivial@gnu.org; Fri, 08 Sep 2017 13:38:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39242)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNEO-0007Xx-5r
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:38:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNEL-0007ce-IZ
	for qemu-trivial@nongnu.org; Fri, 08 Sep 2017 13:38:16 -0400
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:35963)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dqNEL-0007cR-EB; Fri, 08 Sep 2017 13:38:13 -0400
Received: by mail-qk0-x241.google.com with SMTP id i14so1909064qke.3;
	Fri, 08 Sep 2017 10:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:mime-version:content-transfer-encoding;
	bh=tYrh61x4lp1cB4xqkyKCLVDSB5X+V56wjbBtC3q33UE=;
	b=jhAupHKR3H3spsAMBRF9vlwuXRR9Kl6+IYJcxEpknwFwDV431+BZmJ+fF7d+BNIcUD
	NFZZo1NC4okCfX91AsH648My3KC96TPL/xIJckPhfPLlgCKPWEN7+P7L4cfomSiAaTNJ
	VyVvGkKlQKbDc5LheThNYohE5YY3+UX68o0dIocBxumNKN8JPEzLEDdeyKPEetcA1kGj
	pQWqwMs+YVD7fB8Fb5euhVOJIU1XzRy7zBzmgwZYOfD0FFzlJXLCLdSkDxO9PmZCdosg
	uyQO50BA0Euf2Y0u4qep7Yvy3dirYr8Uks9A9iyPn0kHE+nbYpVHULncXgDltuzRPmFR
	sByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:in-reply-to:mime-version
	:content-transfer-encoding;
	bh=tYrh61x4lp1cB4xqkyKCLVDSB5X+V56wjbBtC3q33UE=;
	b=VWvq5J9TlymqYb+j66PAFyyOEVq25kCxewv5Qxliw8fTWhpY90GEujkmHk5BBtq/3I
	YhSqoomAi36DJ52JFJU3y6rLWqzPrE2O+ic0jOQQYAYp5xB8vUnM5u2+2SEyw/Xd683t
	Uoo6AWDku869YSwFHat4USfA8SnAMqMIUahq1xcycMDUFQsgAgbIg52qvjnmNYkcuEkY
	N7AV5jGN1asyxZry1WAg979VpW5E7QhwdkWcd7qPrMKXo+IvZDJ/fe3uNN6gHIkCEGIH
	IvQwzSbBQU6A77MmW7yMwDS7kE4y6WK21m0W9NFZukzE0nW0gydSQM+wJ1K3fTCIoqst
	iXTA==
X-Gm-Message-State: AHPjjUiV18Mfz7QDFzww9g5G5HLX+CwuzmG5e6TyLvWrjvOdYKnhdjcb
	zPWB248pcThq9l0UVN98rw==
X-Google-Smtp-Source: AOwi7QAsp3necQIjKtdXeErgLpza07FNr9tv8LC4UBW6bTUU6Adbkktx+ydQX1WqNKq/hkzGNDgTgg==
X-Received: by 10.55.165.81 with SMTP id o78mr4649344qke.313.1504892292655;
	Fri, 08 Sep 2017 10:38:12 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id f4sm1605859qtg.35.2017.09.08.10.38.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Sep 2017 10:38:11 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
	Fam Zheng <famz@redhat.com>, John Snow <jsnow@redhat.com>,
	qemu-block@nongnu.org
Date: Fri,  8 Sep 2017 14:36:32 -0300
Message-Id: <20170908173632.6711-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170908173632.6711-1-f4bug@amsat.org>
References: <20170908173632.6711-1-f4bug@amsat.org>
In-Reply-To: <20170908173146.6446-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: [Qemu-trivial] [PATCH v3 15/15] MAINTAINERS: update docs/interop/
 entries
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
X-List-Received-Date: Fri, 08 Sep 2017 17:38:17 -0000

moved in commit 7746cf8aab68

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Acked-by: Fam Zheng <famz@redhat.com>
Acked-by: John Snow <jsnow@redhat.com>
---
 MAINTAINERS | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f8630561de..99f3681842 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1259,7 +1259,7 @@ F: block/dirty-bitmap.c
 F: include/qemu/hbitmap.h
 F: include/block/dirty-bitmap.h
 F: tests/test-hbitmap.c
-F: docs/bitmaps.md
+F: docs/interop/bitmaps.rst
 T: git git://github.com/famz/qemu.git bitmaps
 T: git git://github.com/jnsnow/qemu.git bitmaps
 
@@ -1837,7 +1837,7 @@ M: Denis V. Lunev <den@openvz.org>
 L: qemu-block@nongnu.org
 S: Supported
 F: block/parallels.c
-F: docs/specs/parallels.txt
+F: docs/interop/parallels.txt
 
 qed
 M: Stefan Hajnoczi <stefanha@redhat.com>
-- 
2.14.1


