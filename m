Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fqrQU-0007Vm-HF
	for mharc-qemu-trivial@gnu.org; Fri, 17 Aug 2018 22:57:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59522)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqrQQ-0007U7-6C
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2018 22:57:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqrQP-0002Qq-BV
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2018 22:57:14 -0400
Received: from mail-vk0-x244.google.com ([2607:f8b0:400c:c05::244]:39808)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fqrQJ-0002ML-Br; Fri, 17 Aug 2018 22:57:07 -0400
Received: by mail-vk0-x244.google.com with SMTP id e139-v6so4101959vkf.6;
	Fri, 17 Aug 2018 19:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=zZp8sws8Jom7wHnaY9m6i2pwewPlZSa16z6KmBFeE00=;
	b=Cz2YvptXJ0CgTkOdDxMNcaG6FljIhr1QPm5KRxgrdI9AqmsODb4UkS8JcPDeYDcQGX
	QFi1z+CWC/7N1ohfo52omgC+mU9zOKoREEnXXrGdr+7w4IcBmkqQ0VqeUpReTRq/9Yga
	7VfzEQLAh5CgzhoRJ1h6ATkFYS6ekS1uRXzjcr1fuZoWFKsEc/w1c9VSZ7u/jWaPO1Ij
	GeCf07VPZSIJ/HRswxL02SWVeiDRjvTH9KinV7teUO6/a2iFw7trSzwXnLw61kH8plyO
	rsW9bVVUHYSZC1OnDVypzgZQIBZzC/hG6Hebndt14u2LVWgQOzwOKSGiUtLlTgZZsEZx
	7+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=zZp8sws8Jom7wHnaY9m6i2pwewPlZSa16z6KmBFeE00=;
	b=Lqe7SCTk4mSSuQaXFdhgqzqZjz0sMFq2TG+QL1MYXKdbB/gX92MNRmv3To1loHkBDt
	8wX0YXlXFTTjvD2QBsrVEshII8oG/MgA+EmUmwTJiurtRI3jQmR0j3mt2ON0n1Rml7T7
	UkryRKSZRLDnqs8gS41BMcdtt6LTnJebD79LANod/Mp36AKGkUQz6HomFBloyRxiUDev
	+sWjNVxX8y5zjJcNxVcTGluHgE1WOFq+L38zV1Tc+Po/LxttOb97deZu/zBUDdwBHJeO
	yXKuZ9RjNJvMZLN4ekUxYSZbYLYzhfZBafQBsfD3bb/Kj1ZKN6MrkQwUYkI6EdYfWBhS
	f9ew==
X-Gm-Message-State: AOUpUlFi4JMkQnnYV9/UtMomEhbxbYU3NusYVu73T2ot+SNfKDO9JAIO
	tj83Io/ZnmYIYX/15/pMZDI=
X-Google-Smtp-Source: AA+uWPzjFJuf/wyWvJm+j1m7sxloyyiIW+zfS+vMCNuifap/ONg7sg2/W9fzxHsGpWk7l28JyfGSKg==
X-Received: by 2002:a1f:b60f:: with SMTP id
	g15-v6mr24603054vkf.27.1534561026922; 
	Fri, 17 Aug 2018 19:57:06 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	j7-v6sm1383374vka.43.2018.08.17.19.57.03
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 17 Aug 2018 19:57:06 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Juan Quintela <quintela@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	David Hildenbrand <david@redhat.com>, Howard Spoelstra <hsp.cat7@gmail.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Date: Fri, 17 Aug 2018 23:56:53 -0300
Message-Id: <20180818025653.21192-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::244
Subject: [Qemu-trivial] [PATCH] migration: Replace strncpy() by g_strlcpy()
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
X-List-Received-Date: Sat, 18 Aug 2018 02:57:17 -0000

Fedora 29 comes with GCC 8.1 which added the 'stringop-truncation' checks.

Replace the strncpy() calls by g_strlcpy() to avoid the following warning:

  migration/global_state.c: In function 'global_state_store_running':
  migration/global_state.c:45:5: error: 'strncpy' specified bound 100 equals destination size [-Werror=stringop-truncation]
       strncpy((char *)global_state.runstate,
       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              state, sizeof(global_state.runstate));
              ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Reported-by: Howard Spoelstra <hsp.cat7@gmail.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
See http://lists.nongnu.org/archive/html/qemu-devel/2018-07/msg03723.html

 migration/global_state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/migration/global_state.c b/migration/global_state.c
index 8e8ab5c51e..d5df502cd5 100644
--- a/migration/global_state.c
+++ b/migration/global_state.c
@@ -42,7 +42,7 @@ int global_state_store(void)
 void global_state_store_running(void)
 {
     const char *state = RunState_str(RUN_STATE_RUNNING);
-    strncpy((char *)global_state.runstate,
+    g_strlcpy((char *)global_state.runstate,
            state, sizeof(global_state.runstate));
 }
 
-- 
2.18.0


