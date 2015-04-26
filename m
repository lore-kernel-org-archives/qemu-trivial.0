Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmSku-0007bt-Jn
	for mharc-qemu-trivial@gnu.org; Sun, 26 Apr 2015 16:02:20 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56264)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmRx3-000265-Od
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 15:10:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1YmRx3-0006ub-1s
	for qemu-trivial@nongnu.org; Sun, 26 Apr 2015 15:10:49 -0400
Received: from mail-pd0-x234.google.com ([2607:f8b0:400e:c02::234]:34750)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1YmRx1-0006tI-6P; Sun, 26 Apr 2015 15:10:47 -0400
Received: by pdbqa5 with SMTP id qa5so104783757pdb.1;
	Sun, 26 Apr 2015 12:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=HeBJAI67wnZuiU8X/lkneZwQo5cXj7qHNKxRM9vlqtk=;
	b=mI/YvCpKXu8bSQKxeRGpGgNAYTqnxOhfb38GbItuWhOtQkvgE3xXJ/bFVzVKdJmTl6
	m0e8k1jF20Maz7fF34J+Ht/FtJ1bUHrHGVJO1di9jrSS+ukncnvfJOlCEhLn1rZ7Nyn8
	6QJuQo+Ee2ckpCa/RSO3oEKc7qUBZt+mFiwGufiEC5Y5vTlcmIlvBq7x+D0r2fiPbmNk
	6XIpHjoyVXRCYDz3UkqxHOUpx82Wr8O2qFB3O1K6e5pvALyhUMtCyHlkXar9Zf3lLV3v
	zbxwN/HIqvLNZ7pqYVs8Wik/51hZ4eVqwN4ffQUJVmt/Qdd6TBXxg0zG907k2w0eP5dg
	JrJw==
X-Received: by 10.68.57.237 with SMTP id l13mr15539107pbq.100.1430075446604;
	Sun, 26 Apr 2015 12:10:46 -0700 (PDT)
Received: from pcrost-laptop.hsd1.ca.comcast.net
	(c-24-5-157-48.hsd1.ca.comcast.net. [24.5.157.48])
	by mx.google.com with ESMTPSA id
	ux4sm16997226pbc.61.2015.04.26.12.10.45
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 26 Apr 2015 12:10:45 -0700 (PDT)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 26 Apr 2015 12:10:22 -0700
Message-Id: <1430075424-25975-5-git-send-email-crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
References: <1430075424-25975-1-git-send-email-crosthwaite.peter@gmail.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c02::234
X-Mailman-Approved-At: Sun, 26 Apr 2015 16:02:16 -0400
Cc: qemu-trivial@nongnu.org, edgari@xilinx.com,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Subject: [Qemu-trivial] [PATCH microblaze v1 4/6] mb: cpu: Remove unused
	CC_OP enum
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
X-List-Received-Date: Sun, 26 Apr 2015 19:10:50 -0000

This enum is not used by anything. Remove.

Signed-off-by: Peter Crosthwaite <crosthwaite.peter@gmail.com>
---
 target-microblaze/cpu.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target-microblaze/cpu.h b/target-microblaze/cpu.h
index 2c18b49..f21da2f 100644
--- a/target-microblaze/cpu.h
+++ b/target-microblaze/cpu.h
@@ -284,12 +284,6 @@ int cpu_mb_exec(CPUMBState *s);
 int cpu_mb_signal_handler(int host_signum, void *pinfo,
                           void *puc);
 
-enum {
-    CC_OP_DYNAMIC, /* Use env->cc_op  */
-    CC_OP_FLAGS,
-    CC_OP_CMP,
-};
-
 /* FIXME: MB uses variable pages down to 1K but linux only uses 4k.  */
 #define TARGET_PAGE_BITS 12
 #define MMAP_SHIFT TARGET_PAGE_BITS
-- 
1.9.1


