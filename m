Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daYlk-0005n8-Of
	for mharc-qemu-trivial@gnu.org; Wed, 26 Jul 2017 22:43:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54916)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYli-0005ks-Ju
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYlh-0008Au-Tv
	for qemu-trivial@nongnu.org; Wed, 26 Jul 2017 22:43:18 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:35840)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daYle-00088R-PV; Wed, 26 Jul 2017 22:43:14 -0400
Received: by mail-qt0-x241.google.com with SMTP id c15so3483513qta.3;
	Wed, 26 Jul 2017 19:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=cLrqu4rahS0olIV1A73338Pv0g+NkbJ8cRUvsbimbyk=;
	b=fknPEmPfTwmDzLDZ+GR+KPlbLhXLIyqNgZX6kfwk9mJuwr1V1WqOLwMvnFvRS8UaVy
	j7phGdxHBhjFTvHAI5WTPv3NmBXR1eY1OvtjJbK3HlPlgZt6Nq1MxmzWWSB1XNxzkASu
	Nn0vyWXnc6giXqeItVG7JwX0yzu2/tuCyHze5urZn5mLYYo8k+9rt7BFwzYafbrbj7vP
	bJ8lL90zy0nwZdx1AfO32q5c6MuWojAisajCOnPznOvfqmUubgFJehGET4tSnWDc3JIj
	TzaRodWJIueLZK2hyicUbgM9ZWhj50JnOPg6/vFRddx0IyUJcRilpO6Na5XJqPCD/lha
	tmxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=cLrqu4rahS0olIV1A73338Pv0g+NkbJ8cRUvsbimbyk=;
	b=WPH/qemrBfOT0flhl9oZCeAAgxPjq5tIdfSPcDQDvJBk7rOHxnXNsSR+z/Et3194lp
	MGAC62clpcNYKxY55D7ro1//tTMMGNr/enJljKBifZN67jKWRW/xBCTpGOGHA8Cp+BST
	uN0GFVj2UjeofULXp2CZyNT37hr37NVBoGRWsCDcAl1esMls/wrijaJvEgyYA/wccd3v
	DrQAWUGZSs5PuLDOgczp/FmDHguJ6rc4fjTwRfZbh8jV3s+5YdLZLNmaCruwYuJQ7sEo
	6+qesuSK50Gy6b+qfnAufsRZcjxnV8WqzgybplEgAF4E+s72L5UFCV5RbwbqpCbWeDrv
	rIuw==
X-Gm-Message-State: AIVw110cniYBGYZ3XRqfkLC0eaNMSowv/xy05r0/BB5Otoj1+LLhHhrE
	OUf5mLzcqMLT10HrIr67rA==
X-Received: by 10.200.40.210 with SMTP id j18mr4277331qtj.172.1501123394301;
	Wed, 26 Jul 2017 19:43:14 -0700 (PDT)
Received: from yoga.offpageads.com ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	g27sm13221147qtg.84.2017.07.26.19.43.11
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 19:43:13 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 26 Jul 2017 23:42:18 -0300
Message-Id: <20170727024224.22900-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.13.3
In-Reply-To: <20170727024224.22900-1-f4bug@amsat.org>
References: <20170727024224.22900-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: [Qemu-trivial] [PATCH for 2.10 v2 13/20] syscall: fix use of
 uninitialized values
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
X-List-Received-Date: Thu, 27 Jul 2017 02:43:19 -0000

linux-user/syscall.c:1627:35: warning: 1st function call argument is an uninitialized value
        target_saddr->sa_family = tswap16(addr->sa_family);
                                  ^~~~~~~~~~~~~~~~~~~~~~~~
linux-user/syscall.c:1629:25: warning: The left operand of '==' is a garbage value
    if (addr->sa_family == AF_NETLINK && len >= sizeof(struct sockaddr_nl)) {
        ~~~~~~~~~~~~~~~ ^

Reported-by: Clang Static Analyzer
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 71d45a9963..81f52f7483 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1622,6 +1622,7 @@ static inline abi_long host_to_target_sockaddr(abi_ulong target_addr,
     if (len == 0) {
         return 0;
     }
+    assert(addr);
 
     target_saddr = lock_user(VERIFY_WRITE, target_addr, len, 0);
     if (!target_saddr)
-- 
2.13.3


