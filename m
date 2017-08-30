Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dnAxo-0005NG-6f
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 17:55:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48792)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxl-0005JN-QQ
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:55:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxl-0007bM-37
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 17:55:53 -0400
Received: from mail-qk0-x244.google.com ([2607:f8b0:400d:c09::244]:37968)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1dnAxi-0007aP-E3; Wed, 30 Aug 2017 17:55:50 -0400
Received: by mail-qk0-x244.google.com with SMTP id o63so6387434qkb.5;
	Wed, 30 Aug 2017 14:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ITEpxEDG44shDXDL3/1XZ9ECo2KalxWoHyQwVPe/ing=;
	b=Rd6vLbhEmbrnIUfmlJDm4hT3OXgwWigG14/c/x4fy84xVfZnld49qg0aqrMKC451AP
	n4nWU8SL4kmU2OREKReAkuozv5dHCwrYs2c1CbYO+up94IRN6+x5oCPcEBxjX7v8HSQu
	UokeTF1CZBkJVAHDKqnYBX8T/oxeUVwT2L9hl2VFxlzZy2Rz1vwAheIBJK2Buaoahae+
	GWFsrsCB9Rd+Jy94NgUv33qjwhGtDdwhj/NaXGr/hrQJzDlPemXrAsQ370mEWdQ/24Ik
	v5v0RA9NI5fkgCAH10GcKTcEiSyXwTcVWTq4fPN2RqOouh8yJ8gy0O+vj7c1DLcF1Iyb
	Cl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	bh=ITEpxEDG44shDXDL3/1XZ9ECo2KalxWoHyQwVPe/ing=;
	b=mFQmIOz9sfILyeMORE7iZpluVd+4bYlBWXKJ7zHM9cxAMx4NhfYeNbXQJGGhbKkf7l
	lA/XS9u2Ayw54Jw2C9bMF++XXh9MadZz5o07s9yJ0LUNS/yqMhM2A87pg0bh8++Qmpd9
	2coIw/QOK0hfSGx2ZtQsJjhMUX9cFVYhJISQL3UgjKUkW6/7ZYBvVfhPq36LJlksEa76
	U18+3Hw5shAlkrcuIsU0wczojCYR9hHsrej4T3rnMSnjyFczk0TRQgGejdXG6/tvD9kz
	jYQPTE6WdaCu7NQfvo5UB6mY+7cIVrN7ser65K5BaoV7Z37rOd8jSYiq5VvbO5wR8O2X
	OeFQ==
X-Gm-Message-State: AHPjjUj5+kdPhwf6AiF1wf3StSD8zBSJve2eM96PT/NoiRjiH/rdPTdV
	vF5eLn/8P0ltP0XQ97KmbQ==
X-Received: by 10.55.79.205 with SMTP id d196mr984481qkb.313.1504130149831;
	Wed, 30 Aug 2017 14:55:49 -0700 (PDT)
Received: from yoga.offpageads.com ([181.93.89.178])
	by smtp.gmail.com with ESMTPSA id
	w131sm4298690qkb.85.2017.08.30.14.55.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Aug 2017 14:55:49 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Wed, 30 Aug 2017 18:55:10 -0300
Message-Id: <20170830215523.25278-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170830215523.25278-1-f4bug@amsat.org>
References: <20170830215523.25278-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::244
Subject: [Qemu-trivial] [PATCH v2 04/17] MAINTAINERS: add missing entry for
 vhost
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
X-List-Received-Date: Wed, 30 Aug 2017 21:55:55 -0000

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8c75ce477a..223591c231 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1029,6 +1029,7 @@ vhost
 M: Michael S. Tsirkin <mst@redhat.com>
 S: Supported
 F: hw/*/*vhost*
+F: docs/interop/vhost-user.txt
 
 virtio
 M: Michael S. Tsirkin <mst@redhat.com>
-- 
2.14.1


