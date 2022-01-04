Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n4l52-00084C-Or
	for mharc-qemu-trivial@gnu.org; Tue, 04 Jan 2022 09:46:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49742)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedaabouzied44@gmail.com>)
 id 1n4l4x-00083Q-7W
 for qemu-trivial@nongnu.org; Tue, 04 Jan 2022 09:46:24 -0500
Received: from mail-ed1-f47.google.com ([209.85.208.47]:45934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedaabouzied44@gmail.com>)
 id 1n4l4v-0002RO-Nt
 for qemu-trivial@nongnu.org; Tue, 04 Jan 2022 09:46:22 -0500
Received: by mail-ed1-f47.google.com with SMTP id j6so149301376edw.12
 for <qemu-trivial@nongnu.org>; Tue, 04 Jan 2022 06:46:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kxYvO6vytvThSJJhNF/SYLJHX4z9Qoey16/6hwLNNOU=;
 b=F5i7Ly9BPz7+ExxmyS5RcneMj/tpR3caLEnOVijze2EgBmMjF4CrwwhKRYOkaQOymu
 uH8t3oougtI/Bj8ir9z9kEUd1lkKoS8LzPLxbTSZpoc38OLqDdL4nlurdZgB8hOcA6SR
 +74cD+YNHip8GVyRIWgJxyNdhEmVpY0hT2nJMDkF+wS5ME7cwKd9b5MtXT7pJH45LoPY
 CKFo549euWyoRKOvpAypiZJDjpRoE/JIVKub4DMxC1KkZ4zY9OEK5Kdy9/R4tuiEmsXV
 UG/EqJRWLf/KwB5ARWWa2RG4ZQXp+BPxdpNOxzIGucHUicu5Y6+Ij+HKIejUrW9xeSyD
 uK3A==
X-Gm-Message-State: AOAM533UAYHO3NK/0iBSIgp5h6oBGCoxgDck0yN1NyGlCHJZfpB2iynv
 eigyfzts07uWTvpuKwJ2zTsS6UeATfka+aoC
X-Google-Smtp-Source: ABdhPJz+14dMjoASMTdR/xWm1fkPryUBtTtDaBEsh8GB2b/OevxsLviLfVx61e8Y0uV8Z03gEisqMg==
X-Received: by 2002:a17:907:6e0d:: with SMTP id
 sd13mr39583017ejc.90.1641307579878; 
 Tue, 04 Jan 2022 06:46:19 -0800 (PST)
Received: from pythagoras.localdomain ([154.190.100.93])
 by smtp.googlemail.com with ESMTPSA id
 qw20sm11591030ejc.185.2022.01.04.06.46.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 06:46:19 -0800 (PST)
From: Ahmed Abouzied <email@aabouzied.com>
To: qemu-trivial@nongnu.org
Cc: Ahmed Abouzied <email@aabouzied.com>
Subject: [PATCH] linux-user/syscall.c: malloc to g_try_malloc
Date: Tue,  4 Jan 2022 16:46:02 +0200
Message-Id: <20220104144602.25300-1-email@aabouzied.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.208.47;
 envelope-from=ahmedaabouzied44@gmail.com; helo=mail-ed1-f47.google.com
X-Spam_score_int: 7
X-Spam_score: 0.7
X-Spam_bar: /
X-Spam_report: (0.7 / 5.0 requ) FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Jan 2022 14:46:24 -0000

Use g_try_malloc instead of malloc to alocate the target ifconfig.
Also replace the corresponding free with g_free.

Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
---

Hello, 

I noticed that there was a `malloc` call in this file. It seems that it
was added by the commit 22e4a267 (3 years ago) which was after the commit
0e173b24 (6 years ago) that replaced malloc calls with glib alternative calls.

There is no issue for this on Gitlab. Should I have created an issue
first? 

Best regards,

 linux-user/syscall.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 56a3e17183..715f9430e1 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -4867,7 +4867,7 @@ static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
              * We can't fit all the extents into the fixed size buffer.
              * Allocate one that is large enough and use it instead.
              */
-            host_ifconf = malloc(outbufsz);
+            host_ifconf = g_try_malloc(outbufsz);
             if (!host_ifconf) {
                 return -TARGET_ENOMEM;
             }
@@ -4915,7 +4915,7 @@ static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
     }
 
     if (free_buf) {
-        free(host_ifconf);
+        g_free(host_ifconf);
     }
 
     return ret;
-- 
2.25.1


