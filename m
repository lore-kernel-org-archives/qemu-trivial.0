Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmSku-0007cq-VA
	for mharc-qemu-trivial@gnu.org; Sun, 26 Apr 2015 16:02:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56286)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmRx5-0002AR-GO
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 15:10:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmRx4-0006v8-PB
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 15:10:51 -0400
Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c]:35090)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1YmRx2-0006uV-Vq; Sun, 26 Apr 2015 15:10:49 -0400
Received: by pdbqd1 with SMTP id qd1so104897142pdb.2;
	Sun, 26 Apr 2015 12:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=28TG4u9EZwcA984e/auE+gTym7dx+zKGWuSmC+9y+zk=;
	b=L+a9Pugr8hEWN+ELSjo6CSKuUXqpUQWuEPF6ADiJbFmzlMVaSgGoCicbMXVQK4Kfcp
	b5r96I8FpOAvrGNnx0iDLoBZ0ZvS47QAzzC/+Wpr2Ly/ae6CjzVNC5bcjEPqBVzDjnSb
	mLPEc73y29z3jMsosJNsn59kc52IKoJeVuqaFr3icqPf7uNdDi0CGyraxF2cD0gLwFT6
	GKff6/SgZqdUemaFCkKzkx32koYuIBd13bTMs1fEpIA20DAQYKqUm8fafFfFhzsWpo95
	6tp9hVHyz3EGMpntmRIZmx4d088HwcDw3DP8eXgu5m48ST9d8D9d8WTmxrZI7Mx2E//G
	J2RA==
X-Received: by 10.68.173.100 with SMTP id bj4mr15486015pbc.168.1430075448419; 
	Sun, 26 Apr 2015 12:10:48 -0700 (PDT)
Received: from pcrost-laptop.hsd1.ca.comcast.net
	(c-24-5-157-48.hsd1.ca.comcast.net. [24.5.157.48])
	by mx.google.com with ESMTPSA id
	ux4sm16997226pbc.61.2015.04.26.12.10.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Apr 2015 12:10:47 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 26 Apr 2015 12:10:23 -0700
Message-Id: <1430075424-25975-6-git-send-email-crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
References: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::22c
X-Mailman-Approved-At: Sun, 26 Apr 2015 16:02:16 -0400
Cc: qemu-trivial@nongnu.org, edgari@xilinx.com,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PATCH microblaze v1 5/6] mb: cpu: Delete EXCP_NMI
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
X-List-Received-Date: Sun, 26 Apr 2015 19:10:52 -0000

This define is unused. Remove.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 target-microblaze/cpu.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
index f21da2f..6522af7 100644
--- a/target-microblaze/cpu.h
+++ b/target-microblaze/cpu.h
@@ -36,7 +36,6 @@ typedef struct CPUMBState CPUMBState;
 
 #define ELF_MACHINE	EM_MICROBLAZE
 
-#define EXCP_NMI        1
 #define EXCP_MMU        2
 #define EXCP_IRQ        3
 #define EXCP_BREAK      4
-- 
1.9.1


