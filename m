Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aina4-0005MC-8X
	for mharc-qemu-trivial@gnu.org; Wed, 23 Mar 2016 14:32:32 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1aina2-0005I7-3Y
	for qemu-trivial@nongnu.org; Wed, 23 Mar 2016 14:32:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>) id 1aina1-00075E-AU
	for qemu-trivial@nongnu.org; Wed, 23 Mar 2016 14:32:30 -0400
Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242]:34764)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <haris.phnx@gmail.com>)
	id 1ainZx-00074g-31; Wed, 23 Mar 2016 14:32:25 -0400
Received: by mail-pf0-x242.google.com with SMTP id n5so4836225pfn.1;
	Wed, 23 Mar 2016 11:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Y73iUPM0oWRZcetmB64+vVotLD4dkjDQbuNBa8JYFqU=;
	b=BA6iw7PJGBKr7bpKfFGOKWiWr8+LYfnEgCH0czjJ12+xlGoUtKO3ONNOYM3Di0D9RM
	tJTHHGeKpk5B1Fkc3TUZr3/EMCNcpNaVGsTHes5+eO/H610rUZafg66nBzm6iXY1TmrC
	LNvnTc44UAIeeGbueTPMzK672SBifgIsbQvck1FhqGVV+5Ss87/LECX141iStxK8InZ1
	sAiwjkEegFNnPp/cf+BK/EVWxeJiJHHqDq5dhw4BJf5D4h/I9GRTIMHuS29EKJsNxBhY
	U8v0B5aNJa2y8bDtTbZB/mTJo9uS1eEK1KCeuKlNsxI+XVyclW3LxPo3yMIFHSigo7Ai
	H90A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y73iUPM0oWRZcetmB64+vVotLD4dkjDQbuNBa8JYFqU=;
	b=U07ztP8HAjjXqedolRBl2saG0zr3kCmPeal2EaOV5rU6bCgOXN4FQDJlinwd1hVASq
	Cb03nJtFUFBAT6R45PyFhwkhhrJ5/OfzxL0tD8dmV5vbMMt5HyRPOdpa+SCxQlwcorIZ
	6PZCaD1B8ApvZvIFyX/P4FIC8W1IQC8NYJY8/tu9LJ+MiG5CtOEVaOGDrMq4v/QxpIjw
	k6An4nBiSCUuVXcd5+rdTSXrOL2omi31CJ+HftwsV4K6ATa6lAawDyFOFFFHbkN5loEA
	18zY5Zx44oxwG9o4mQoUBGTPIl+2YiZQ/eTStC2+q3ogIY2c0voyMxZnjnQfvLMmdiJt
	fTpQ==
X-Gm-Message-State: AD7BkJIbXfaE2D2BPAN1XezXpiBOfDKXV59E+zF9YkB/UgW75w72CT/NdB0CFPhORebX/A==
X-Received: by 10.98.72.218 with SMTP id q87mr6344037pfi.117.1458757943936;
	Wed, 23 Mar 2016 11:32:23 -0700 (PDT)
Received: from student-HP-COMPAQ-ELITE-8200-MT-PC.nitk.ac.in ([218.248.46.110])
	by smtp.googlemail.com with ESMTPSA id
	w27sm5758957pfa.67.2016.03.23.11.32.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 23 Mar 2016 11:32:23 -0700 (PDT)
From: Md Haris Iqbal <haris.phnx@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 24 Mar 2016 00:02:03 +0530
Message-Id: <1458757923-11362-1-git-send-email-haris.phnx@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400e:c00::242
Cc: qemu-trivial@nongnu.org, Md Haris Iqbal <haris.phnx@gmail.com>
Subject: [Qemu-trivial] [Qemu-Devel] [PATCH] Changed malloc to g_malloc,
	free to g_free in linux-user/qemu.h
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
X-List-Received-Date: Wed, 23 Mar 2016 18:32:30 -0000

Signed-off-by: Md Haris Iqbal <haris.phnx@gmail.com>
---
 linux-user/qemu.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index 26b0ba2..3c3fd15 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -381,7 +381,7 @@ static inline void *lock_user(int type, abi_ulong guest_addr, long len, int copy
 #ifdef DEBUG_REMAP
     {
         void *addr;
-        addr = malloc(len);
+        addr = g_malloc(len);
         if (copy)
             memcpy(addr, g2h(guest_addr), len);
         else
@@ -407,7 +407,7 @@ static inline void unlock_user(void *host_ptr, abi_ulong guest_addr,
         return;
     if (len > 0)
         memcpy(g2h(guest_addr), host_ptr, len);
-    free(host_ptr);
+    g_free(host_ptr);
 #endif
 }
 
-- 
1.9.1


