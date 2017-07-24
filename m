Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dZi63-0000DR-Hk
	for mharc-qemu-trivial@gnu.org; Mon, 24 Jul 2017 14:28:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50314)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi61-0000B7-ID
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi60-0004sA-OH
	for qemu-trivial@nongnu.org; Mon, 24 Jul 2017 14:28:45 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:34194)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dZi5w-0004pz-Cy; Mon, 24 Jul 2017 14:28:40 -0400
Received: by mail-qt0-x244.google.com with SMTP id i19so2260718qte.1;
	Mon, 24 Jul 2017 11:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=HeLvrmgwsCLM/mAlPUrAzgq/PIseiLcehgwY5T3ei10=;
	b=KK12STfJDh+fBiPb1g3m6jlBPdFKv6Vs86cbGSzhi9toc1Pj+hAsE+F5igYxtEczkO
	eb7b9QQ4skcH5TH1jlCgenYdAuvz8BT2ejQ2qAsWOeyDK+MS57oIS/RdrJj/ChgtQHs5
	9u697kY6OrhVnjlqaZtKLDvf6WU/XuNSAF1WvGsLiNwFf9jo/p024Ojjoqg1IFvWJ8lL
	tzzn1jKQcM8i/JGofROWj5ymRbcQ3Nd6iCDwPYltyVWUELBjgeQjCsxBeHLoY6Z4gFTv
	NDWrfz0nKKg6zprouebim7ddatGoicnanpu3nh0LBgge+DooLEcnKAEFseSrPX0Kf4cF
	pkQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=HeLvrmgwsCLM/mAlPUrAzgq/PIseiLcehgwY5T3ei10=;
	b=ZDuZaDZtwqsShlbnKBoL8v8bXKqYvFv9PaKD5D4Xl3WLbAsuTzbkGu72/De0yRjhil
	L7V1WxlfTZo3dvLzPhB/Y0U/VYLTVv5LhA3XfJgObQ7z8NkYGhlN5y+TyCDYXO2uCLPN
	msT8Y7GWk5NiSWY4IhG8J5T8VePHYwsjhikxvNUhOYaC0zTALbNl69Lt/lhYYx8ZwjAZ
	nK5XyOCgCCGwTpjW1+1i5Eo/9Q0kuRPrsl01LFziM8ZvqQ821b6yo9ZC+Kk7lyNmOk17
	pyo/+jxHoq85k5lhUl4Y64H1pP1nh79up9gL/wLSLoh+cdoodoG0FQWIiGZLvhguqnNV
	LRuQ==
X-Gm-Message-State: AIVw112tf+QUAVjNoDaMYrvGZ4RQ39qLqJnNlolPpsWct/3I1ZzM2WeA
	asDBphDvIDLglQlVE5I=
X-Received: by 10.237.53.44 with SMTP id a41mr11358227qte.231.1500920919969;
	Mon, 24 Jul 2017 11:28:39 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	t57sm9033799qtt.18.2017.07.24.11.28.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 24 Jul 2017 11:28:39 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Dmitry Fleytman <dmitry@daynix.com>, Jason Wang <jasowang@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Mon, 24 Jul 2017 15:27:26 -0300
Message-Id: <20170724182751.18261-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170724182751.18261-1-f4bug@amsat.org>
References: <20170724182751.18261-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-trivial] [PATCH for 2.10 10/35] net/eth: fix incorrect check
 of iov_to_buf() return value
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
X-List-Received-Date: Mon, 24 Jul 2017 18:28:46 -0000

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


