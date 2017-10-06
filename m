Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0cP5-0007Uq-P6
	for mharc-qemu-trivial@gnu.org; Fri, 06 Oct 2017 19:51:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41045)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cP3-0007Sj-If
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cP3-0005BI-0O
	for qemu-trivial@nongnu.org; Fri, 06 Oct 2017 19:51:37 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:34128)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1e0cP0-00059t-7I; Fri, 06 Oct 2017 19:51:34 -0400
Received: by mail-qk0-x244.google.com with SMTP id b124so10270753qke.1;
	Fri, 06 Oct 2017 16:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=QVC3eP0uaa6JRVEUr+10A6WFP1HbkFbL6pE/vQqyJMY=;
	b=Di76LoR2mMsUSG0GyihqyJ6K4gYrNHJpIebaaGvFvQC9bG4mqspsG3F5MT3rFP581k
	f3snin8GnbHfv9ahUTtLdoQd/JFRZnK/52QEUxWHkcea5V0S6SidZKPC7pO5K3BePGwV
	AE6GuIua5GXX8p0pfa1QXMdckdyQyAq0y4AIV8UJg32YG/dwlRKq271mRWPUlAqii9x7
	B6u0KJ77mpRP9BEtD/BtLUrtGXhSpmO+Pk/khQUjrzBgVCJDJkbHgYM+9fillPKI+ob7
	7sa6nYZCRbNGkVI4T3NIo384YS+jnGbp/+5NPcz9w+35pya+UpD9Nq4UHpW+ZqknW2Ld
	Wd7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=QVC3eP0uaa6JRVEUr+10A6WFP1HbkFbL6pE/vQqyJMY=;
	b=KIrRrwv1nAa4qov/XBzhaLOm28XOoEt0nrzx4rmn/jZ2nGVb0Pw+SZqBmifRZ2wmYa
	F7x3lxWdKzIfrttKa9+N6haIx3Nruq2KOKhqzCLi2F46nauyoLKeQbtFNHL1GOrCXopt
	Hx8b90pPWXZtbt+HJ1vn+lLqn/EwC/z1azPS9PiPBsUVjlXuWb82L7uNbnhUNgW2UAk5
	0Z1OqXQgkXphXfz8R7K0p7lbslTPhSo3pP/vwfwTuP6Z/jbmJKzEvPh6hEB4IoCJbjc5
	0ebqdHAd+USIerayZN4q/nX4jJgcRyPqL/eXX6zgSt0/wcPuNTatvbSour/2j1gjzbLA
	kpUw==
X-Gm-Message-State: AMCzsaXHmyZHoxygiiZRJ4+IxDuJgwb2WTyXZYjWdjErCTbir0H/F8Yr
	DdfsX6+WFL0SG54OKP7OQUY=
X-Google-Smtp-Source: AOwi7QBvNnrb5YoM3sbXWFeZo628QPEIiQXSgqI3bL/mwcSsykwVwMFBDIt7C0RuWPqMVjMgJ9iCgA==
X-Received: by 10.55.3.133 with SMTP id 127mr791062qkd.42.1507333893705;
	Fri, 06 Oct 2017 16:51:33 -0700 (PDT)
Received: from yoga.lan ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id g1sm1705226qta.95.2017.10.06.16.51.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 06 Oct 2017 16:51:33 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Date: Fri,  6 Oct 2017 20:49:12 -0300
Message-Id: <20171006235023.11952-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.2
In-Reply-To: <20171006235023.11952-1-f4bug@amsat.org>
References: <20171006235023.11952-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH 17/88] Memory API: use g_new() family of
 functions
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
X-List-Received-Date: Fri, 06 Oct 2017 23:51:38 -0000

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 memory.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/memory.c b/memory.c
index 5e6351a6c1..40d30640eb 100644
--- a/memory.c
+++ b/memory.c
@@ -2762,7 +2762,7 @@ void memory_region_invalidate_mmio_ptr(MemoryRegion *mr, hwaddr offset,
     }
 
     if (!invalidate_data) {
-        invalidate_data = g_malloc0(sizeof(MMIOPtrInvalidate));
+        invalidate_data = g_new0(MMIOPtrInvalidate, 1);
         invalidate_data->allocated = 1;
     }
 
-- 
2.14.2


