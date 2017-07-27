Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYlU-0005YE-Cr
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:43:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54691)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlR-0005VB-Ma
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlQ-0007we-Sb
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:01 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:37538)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlL-0007sO-HD; Wed, 26 Jul 2017 22:42:55 -0400
Received: by mail-qt0-x241.google.com with SMTP id d10so7551490qtb.4;
	Wed, 26 Jul 2017 19:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LFnsM+SIPFmAiVmewUpc9Vn/ZkRY06Gh2wlts65N5d0=;
	b=ZSgW2A9+3y1VA8IiRn81CJPEnw7GtGgi6242ZIr+jwYCPwCz+StCvmeuvsBT7Yc6C0
	FlnFb5eSv9lRd6hHnW9IJFctV70BjkVEXqVZrBi5EwooE+p76O+KVLKcgD5bXZdPxiJu
	tLEDfsy8Z+ximgvD3ucFI+g8/G5/F+ZgGBJ1ORHCZWkePa2Npik2YUtdZ5RZE5myirIy
	UGhxA2ZA6cfCJBmY+ccv1BqEIIRM+5xixKl6iGJfSq5hUL45k8RWm+VwByWKnAzV0sFN
	NYc517E3sIB4Iia6IMDXY2JIc1ctI9ZGJN8lK/hXHnGQv2GLIaY+NgjDAJRUf5znDuXm
	ZmGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=LFnsM+SIPFmAiVmewUpc9Vn/ZkRY06Gh2wlts65N5d0=;
	b=L4nOaPDVf9c2yGMx0ijofc40hbA04Po+bc8kbZNu+gDKsFYRA0hgp9b5WsEw9Wbka+
	tTV5ENmCswJvhF+HOSVKLIA3MgtRj7BItdBtyLMmqi+L+6KuLRD2GZ2DAeqAbtwTcuj4
	2dgkVhXalLVdJwy7AK2w+sCtC6xD4anWrUjVgW4vgxKNss2ABBXVOQBK0CPrG/NtKDaB
	WyHmIQBKgG0fHF3diIMeXDG3JQ/bnRc9B+r2ckK1d+bpbPHF6tfXyY1Tt4aHXj50EnPw
	G0iy8L2C7jM8UAG38PRkfe9ehBWafe1U6lEvkOrkOXUCeZ9idYqha3UG84j0A02NXCDU
	2dhA==
X-Gm-Message-State: AIVw111IQnw8/x+e0pSGB9KPANqOzNYF6upGsZPhThS1RHk270Dz/MrD
	0Sn+9jskXV/eIw==
X-Received: by 10.237.63.67 with SMTP id q3mr4347854qtf.280.1501123374947;
	Wed, 26 Jul 2017 19:42:54 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.42.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:42:54 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Dmitry Fleytman <dmitry@daynix.com>, Jason Wang <jasowang@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 26 Jul 2017 23:42:12 -0300
Message-Id: <20170727024224.22900-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH for 2.10 v2 07/20] net/eth: fix incorrect
 check of iov_to_buf() return value
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
X-List-Received-Date: Thu, 27 Jul 2017 02:43:02 -0000

So we have sizeof(struct in6_address) != sizeof(uintptr_t)
and Clang > Coverity on this, see 4555ca6816c :)

net/eth.c:426:30: warning: The code calls sizeof() on a pointer type. This can produce an unexpected result
        return bytes_read == sizeof(dst_addr);
                             ^     ~~~~~~~~~~
net/eth.c:475:34: warning: The code calls sizeof() on a pointer type. This can produce an unexpected result
            return bytes_read == sizeof(src_addr);
                                 ^     ~~~~~~~~~~

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Dmitry Fleytman <dmitry@daynix.com>
---
 net/eth.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/net/eth.c b/net/eth.c
index 5b9ba26a56..ae5d881aae 100644
--- a/net/eth.c
+++ b/net/eth.c
@@ -423,7 +423,7 @@ _eth_get_rss_ex_dst_addr(const struct iovec *pkt, int pkt_frags,
                                 rthdr_offset + sizeof(*ext_hdr),
                                 dst_addr, sizeof(*dst_addr));
 
-        return bytes_read == sizeof(dst_addr);
+        return bytes_read == sizeof(*dst_addr);
     }
 
     return false;
@@ -472,7 +472,7 @@ _eth_get_rss_ex_src_addr(const struct iovec *pkt, int pkt_frags,
                                     opt_offset + sizeof(opthdr),
                                     src_addr, sizeof(*src_addr));
 
-            return bytes_read == sizeof(src_addr);
+            return bytes_read == sizeof(*src_addr);
         }
 
         opt_offset += optlen;
-- 
2.13.3


