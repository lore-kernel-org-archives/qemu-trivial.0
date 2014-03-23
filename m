Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WRiHo-0004Vq-AO
	for mharc-qemu-trivial@gnu.org; Sun, 23 Mar 2014 09:18:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33212)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WReik-0002D9-LX
	for qemu-trivial@nongnu.org; Sun, 23 Mar 2014 05:29:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>) id 1WReic-0003rT-8Q
	for qemu-trivial@nongnu.org; Sun, 23 Mar 2014 05:29:34 -0400
Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236]:40378)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prasadjoshi.linux@gmail.com>)
	id 1WReiG-0003kr-C5; Sun, 23 Mar 2014 05:29:04 -0400
Received: by mail-pd0-f182.google.com with SMTP id y10so4080793pdj.41
	for <multiple recipients>; Sun, 23 Mar 2014 02:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Bbx2Y49lkRJ+RP7Vne3mdMi0VXh8WaYHikApcbnFYnc=;
	b=LrRrxzKIusMJikVeFYLOIPj2not5mK2NRFIjsJ6HSVG/pR1Xb8q8pbd6N56XxTpLO/
	jgwlPakRxRaTaDsbw9IZb3JhI2mjIXVMHonRg9l6kdZRAlJs4XzJH6a8wKaVfUQmqb82
	mbeCAVx6Kodz2ZzyJOYvlEUELdG8o+3RDn+Pbe+xKjRlDOB+Dk3s1DUpToKE6xybQcFl
	ygNAWn90UaD4p32B2Y0tM0E3hW+ql44bV8W0DM3KNsbEW+Mk4XhDuzjZiKkwBGR/1XAq
	cNphfwnSShgujmmXspI6snezktjm7HvrzuzhIbNds81ogbkXVnNwoW/Uu0X1NNHI7ale
	qEgw==
X-Received: by 10.68.244.229 with SMTP id xj5mr66132939pbc.108.1395566942374; 
	Sun, 23 Mar 2014 02:29:02 -0700 (PDT)
Received: from prasad-desktop ([117.195.29.155])
	by mx.google.com with ESMTPSA id
	wp3sm21077965pbc.67.2014.03.23.02.28.55 for <multiple recipients>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 23 Mar 2014 02:29:01 -0700 (PDT)
Received: by prasad-desktop (Postfix, from userid 1000)
	id D71D9A0064B; Sun, 23 Mar 2014 14:58:50 +0530 (IST)
From: Prasad Joshi <prasadjoshi.linux@gmail.com>
To: prasadjoshi.linux@gmail.com
Date: Sun, 23 Mar 2014 14:58:42 +0530
Message-Id: <1395566923-5074-5-git-send-email-prasadjoshi.linux@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
References: <1395566923-5074-1-git-send-email-prasadjoshi.linux@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::236
X-Mailman-Approved-At: Sun, 23 Mar 2014 09:17:59 -0400
Cc: peter.maydell@linaro.org, stefanha@redhat.com, v.maffione@gmail.com,
	aik@ozlabs.ru, jan.kiszka@siemens.com, riku.voipio@iki.fi,
	agraf@suse.de, qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	av1474@comtv.ru, kraxel@redhat.com, aliguori@amazon.com,
	pbonzini@redhat.com, g.lettieri@iet.unipi.it, alex@alex.org.uk,
	rizzo@iet.unipi.it, afaerber@suse.de
Subject: [Qemu-trivial] [PATCH 5/6] linux-user: remove duplicate statement
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
X-List-Received-Date: Sun, 23 Mar 2014 09:29:43 -0000

Signed-off-by: Prasad Joshi <prasadjoshi.linux@gmail.com>
---
 linux-user/signal.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index e5fb933..7d6246f 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -4043,8 +4043,6 @@ static void setup_rt_frame(int sig, struct target_sigaction *ka,
     struct target_rt_sigframe *frame;
     abi_ulong info_addr, uc_addr;
 
-    frame_addr = get_sigframe(ka, env, sizeof *frame);
-
     frame_addr = get_sigframe(ka, env, sizeof(*frame));
     if (!lock_user_struct(VERIFY_WRITE, frame, frame_addr, 0)) {
         goto give_sigsegv;
-- 
1.8.1.2


