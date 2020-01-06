Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iobls-0000Xr-W8
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jan 2020 18:26:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45914)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <danielhb413@gmail.com>) id 1ioX4Z-0002j5-KX
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 13:25:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <danielhb413@gmail.com>) id 1ioX4Y-0004c9-KK
 for qemu-trivial@nongnu.org; Mon, 06 Jan 2020 13:25:51 -0500
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:34262)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <danielhb413@gmail.com>)
 id 1ioX4W-0004a8-JT; Mon, 06 Jan 2020 13:25:48 -0500
Received: by mail-qk1-x744.google.com with SMTP id j9so40690522qkk.1;
 Mon, 06 Jan 2020 10:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CkaRW9GkcqQi8J8yq9bVtroJ/RDDzEhUPcZDuYcLtVI=;
 b=THZ+VBYYtFliiVYANai24SLT6IuIr98gBcUYXtT44BxIf9LmqYCPtB+2Z7xsj1vLrp
 C8EdITVO5MbvcLZJqlsQFMm09UdSZL+MlnrCmfGyun1SbdBQpsiK7EC8Zid51x2kH6xP
 ooPpOlHPNt+vsQKIkffhiO7qORT+csTUw4eFo/MT4EsfBCqpMj9zlkotHadecCiKW1JI
 6Vkac2vshedLgJP9lEU1ABl4L6nR4s2KI0KQWjtD1RNr4DBUrilbRDqAon8BeztN3kKV
 7qurbXz+bygD/ok5+fnqitSdFtktz4GkPWoub89oxyX+2e34VyEAmmLpB0cldlkK0pnh
 knMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CkaRW9GkcqQi8J8yq9bVtroJ/RDDzEhUPcZDuYcLtVI=;
 b=H021zkB8N3jwijj+lQqDZ1olfm1yue9AMRKdz8BmaHeoQXsIKqeKYVBsO97YPhhVxB
 QjJAmkbQcjE8PZDhSf8Dc8iTxp0RAMUDXSLAPMTMWDq+QqqBVmFCK11jEzVg7OVVw/OB
 iTszSjpMtd45HpIK6EYgo70E3njOBPgz6dlWajhTGy2v2CPCF6rCEW+7vOv4B9gkcNrU
 vtygPB5uoXPxUdAlmc2We+varI54UJ5P2VQteCGo0nYbUowFw596BWeeQ2FZiTT/PW3O
 9apqN2YVpHX3L9WdkoqjBzKn6teyYr15S10twKXkv3oLg25fmHVR69NG/inr2G643g6C
 5rIQ==
X-Gm-Message-State: APjAAAXxRHKUSxFOhA6ymUDolQkjaHDgFWUvAi2QIgeUr/t0t6abGtRF
 zzvR0qZDe+BgRUUoFtWyrBESgvPY
X-Google-Smtp-Source: APXvYqwn+VqbjFcIZj2wWG/ZmvQIU2j6SovxRbLRfHDACElrSjqiPVjK7h8ipfumIYTJ68eww7+OXA==
X-Received: by 2002:a05:620a:6b8:: with SMTP id
 i24mr86401008qkh.9.1578335148022; 
 Mon, 06 Jan 2020 10:25:48 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c6:655b:9e1c:e865:3705:e1df])
 by smtp.gmail.com with ESMTPSA id b81sm21026522qkc.135.2020.01.06.10.25.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jan 2020 10:25:47 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v1 31/59] util/aio-posix.c: remove unneeded 'out' label in
 aio_epoll
Date: Mon,  6 Jan 2020 15:23:57 -0300
Message-Id: <20200106182425.20312-32-danielhb413@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106182425.20312-1-danielhb413@gmail.com>
References: <20200106182425.20312-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
X-Mailman-Approved-At: Mon, 06 Jan 2020 18:26:41 -0500
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Jan 2020 18:25:53 -0000

'out' can be replaced by 'return ret'.

CC: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 util/aio-posix.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/util/aio-posix.c b/util/aio-posix.c
index a4977f538e..7c4cfea8ce 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -121,7 +121,7 @@ static int aio_epoll(AioContext *ctx, GPollFD *pfds,
                          ARRAY_SIZE(events),
                          timeout);
         if (ret <= 0) {
-            goto out;
+            return ret;
         }
         for (i = 0; i < ret; i++) {
             int ev = events[i].events;
@@ -132,7 +132,6 @@ static int aio_epoll(AioContext *ctx, GPollFD *pfds,
                 (ev & EPOLLERR ? G_IO_ERR : 0);
         }
     }
-out:
     return ret;
 }
 
-- 
2.24.1


