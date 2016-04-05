Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1anQju-0001u9-FK
	for mharc-qemu-trivial@gnu.org; Tue, 05 Apr 2016 09:09:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58716)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1anQjp-0001ml-18
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 09:09:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1anQjj-00043N-5k
	for qemu-trivial@nongnu.org; Tue, 05 Apr 2016 09:09:44 -0400
Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244]:35101)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>)
	id 1anQje-00042L-KK; Tue, 05 Apr 2016 09:09:34 -0400
Received: by mail-pa0-x244.google.com with SMTP id zy2so1261311pac.2;
	Tue, 05 Apr 2016 06:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=m7vGUonrob5WfYroTiasdCMlUsLLvJQyK0DXAJ7qZvQ=;
	b=o7enHb1HsuVYGoqVKe67uRUI9qgZUGAWgrWxI2ls8Rw9hMQTtGgYUGpO9mrnrawpi6
	EU3QuIl5Zn4MHolSvf2B5tr63lAVdeXc6OWr0h3HyOMCMkesBO8xpLPpPNYTT+IpGA8p
	aH/Hp1aRx0x6lbq0xtQTxl+ZrCeHbvBtecKFqR3vtReD3CdA56VyYldtshyXy816DuyN
	UkQlXHg91jEaqx7whDZsW6wpYP1LPwJf6m0YTdI7cMVtVqbLyyvQu+40roKcszxDuVBE
	mjBirdS0XOCp0emHNnFoR74IeSre5xUie0ruIMT0eJt/xAueVovRNJVfrSB0I/YiDwGg
	TVoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=m7vGUonrob5WfYroTiasdCMlUsLLvJQyK0DXAJ7qZvQ=;
	b=h+QtPM5vDPQW0WW1GBwoqwWE+9nLfiOI93026iRjUEEZK8iV9lTmriPDTWo3uWynr/
	UV/XIDHFGQnIZZ6c1RZsjhT6k7BRFmdNo84R54D2qQ2e48v9Eophjqp3O9bXfVXLvSGK
	aU4Y9GclgarFUQPB8uKGHr58A8dcBWoddJDngYOUxMyiZLdDA5W4DEFUkCya+WOfchMG
	tToq8z4j9cFnoIomkuvefbJuUY0OCBhD4v4IQJbrmSf15I70/1icxK8xelMQRveCpdQa
	t3Y2P/0a9bSDjHY3SbLhmAoU+WlGKVYULv+wIcr9gJgwh9bX1mmMIBM4YhzLtXr3kAbX
	avRQ==
X-Gm-Message-State: AD7BkJIWp0Dq+OUbl+UYAcWoXtKaCRat0LCovLK7qgLeosmnZvCLa0qL5K0ynIvJ3AaSMg==
X-Received: by 10.66.228.167 with SMTP id sj7mr33022752pac.101.1459861773620; 
	Tue, 05 Apr 2016 06:09:33 -0700 (PDT)
Received: from student-HP-COMPAQ-ELITE-8200-MT-PC.nitk.ac.in ([218.248.46.109])
	by smtp.googlemail.com with ESMTPSA id
	lq10sm7875174pab.36.2016.04.05.06.09.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 05 Apr 2016 06:09:32 -0700 (PDT)
From: Md Haris Iqbal <haris.phnx@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  5 Apr 2016 18:39:03 +0530
Message-Id: <1459861743-4514-1-git-send-email-haris.phnx@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c03::244
Cc: qemu-trivial@nongnu.org, pbonzini@redhat.com,
	Md Haris Iqbal <haris.phnx@gmail.com>, armbru@redhat.com,
	peter.maydell@linaro.org
Subject: [Qemu-trivial] [Qemu-devel] [PATCH v1] Changed malloc to g_malloc,
	free to g_free in bsd-user/qemu.h
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Apr 2016 13:09:48 -0000

Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
---
 bsd-user/qemu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 03b502a..5fac42e 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -357,7 +357,7 @@ static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy
 #ifdef DEBUG_REMAP
     {
         void *addr;
-        addr = malloc(len);
+        addr = g_malloc(len);
         if (copy)
             memcpy(addr, g2h(guest_addr), len);
         else
@@ -383,7 +383,7 @@ static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
         return;
     if (len > 0)
         memcpy(g2h(guest_addr), host_ptr, len);
-    free(host_ptr);
+    g_free(host_ptr);
 #endif
 }
 
-- 
1.9.1


