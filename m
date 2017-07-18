Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dXLsR-0001dv-GH
	for mharc-qemu-trivial@gnu.org; Tue, 18 Jul 2017 02:20:59 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60119)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsM-0001YK-RB
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:20:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsM-0000fX-5V
	for qemu-trivial@nongnu.org; Tue, 18 Jul 2017 02:20:54 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:33158)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dXLsM-0000eo-1E; Tue, 18 Jul 2017 02:20:54 -0400
Received: by mail-qk0-x243.google.com with SMTP id u126so448234qka.0;
	Mon, 17 Jul 2017 23:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=kxghq7l6COYjlON0OCg+6sIa4NFFMhsDWoFfSLbXfGU=;
	b=FfbPO5qoUA6aNrF+If8foM8bnUQ5OxJn6PFX5Yt+Q5k5dO+ZY0KJu9S4eEHf6q1AIf
	pk6j7DJLorYi9bL9+mJjTzajYpH05oVSe1uzT5lCZJ9g2gDwX8KGwrypk66EumzV/qsZ
	bJfrPNbMWMhkj1SdMJ3hbjK9kPEUcl1zSeXbzdauDSq7QoJU2qjpI/F5r+Dt3l7yAHyZ
	wBGxXQhh9Anscr243htjlXN9I+AkzFai+9N06Qn5n57mYBEpcA7ifAW5Vo+tWyaKnp5f
	u4uQ0Sp03Eblu23pkyYsCBiBnalYFexWzIPmt7jdm3J/gSmoIN2zZe7X8DkULZA5CZrG
	bQjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=kxghq7l6COYjlON0OCg+6sIa4NFFMhsDWoFfSLbXfGU=;
	b=a3X50DZVx/lBwZOwwlaZwY6N68GzD51f9I/YgXEom0FrtOFK/8Z972WKgqisd1s44U
	vDw5f5pHfVxvadvtJVR+YdcMHiLFTBMBa8b/NQGmIQLd/Qhoe39dzEp83Og858CA64Vi
	zAWmhUrjcDDRWKI85DwIGPHZRWDj5geLoUOUpl5+2KBMjh8VV0P3pcxUXZlFEYsJnMp/
	eUjhBkA++n1bgIjOvqdLeZRT/QkCIKbPb8Dw7ws2IQNFgzzpOrHQ1ul6fpIzrB7JuwBe
	pIUhFw53WOfPmZy5VPXDbl6xbc8AAPcoIgxt0ZOp9wgqydA5vmsyLCNZgsbn2rGdzCLP
	dxXQ==
X-Gm-Message-State: AIVw110VNXnWPpy4Jox1lqgDgGX+MoE8uxq+bU3l9eLwTYQPIcCHJWxB
	7yVW+wkexLwlQg9DByXd1g==
X-Received: by 10.55.152.194 with SMTP id a185mr150722qke.26.1500358853411;
	Mon, 17 Jul 2017 23:20:53 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	l31sm1099862qtc.64.2017.07.17.23.20.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 17 Jul 2017 23:20:52 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-trivial@nongnu.org, Dmitry Fleytman <dmitry@daynix.com>,
	Jason Wang <jasowang@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Date: Tue, 18 Jul 2017 03:09:45 -0300
Message-Id: <20170718061005.29518-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <20170718061005.29518-1-f4bug@amsat.org>
References: <20170718061005.29518-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-trivial] [PATCH 09/29] net: use QEMU_IS_ALIGNED macro
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
X-List-Received-Date: Tue, 18 Jul 2017 06:20:58 -0000

Applied using the Coccinelle semantic patch scripts/coccinelle/use_osdep.cocci

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 net/eth.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/net/eth.c b/net/eth.c
index 5b9ba26a56..187a6812f6 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -332,7 +332,7 @@ eth_setup_ip4_fragmentation(const void *l2hdr, size_t l2hdr_len,
         uint16_t frag_off_units = frag_offset / IP_FRAG_UNIT_SIZE;
         uint16_t new_ip_off;
 
-        assert(frag_offset % IP_FRAG_UNIT_SIZE == 0);
+        assert(QEMU_IS_ALIGNED(frag_offset, IP_FRAG_UNIT_SIZE));
         assert((frag_off_units & ~IP_OFFMASK) == 0);
 
         orig_flags = be16_to_cpu(iphdr->ip_off) & ~(IP_OFFMASK|IP_MF);
-- 
2.13.2


