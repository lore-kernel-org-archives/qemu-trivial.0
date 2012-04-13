Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SIdMj-0000Z8-Ay
	for mharc-qemu-trivial@gnu.org; Fri, 13 Apr 2012 06:04:29 -0400
Received: from eggs.gnu.org ([208.118.235.92]:55551)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1SIdMb-0000BJ-Md
	for qemu-trivial@nongnu.org; Fri, 13 Apr 2012 06:04:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1SIdMV-0000ER-EA
	for qemu-trivial@nongnu.org; Fri, 13 Apr 2012 06:04:21 -0400
Received: from mail-pz0-f46.google.com ([209.85.210.46]:58493)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1SIdMS-0000Bu-18; Fri, 13 Apr 2012 06:04:12 -0400
Received: by dadz9 with SMTP id z9so4256663dad.33
	for <multiple recipients>; Fri, 13 Apr 2012 03:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=+0JnFDXualoQfYy/OXQ0LV/QHl+/yeLhcNaoIXqJ9Wo=;
	b=jQ6IaZ8713FgTeI+Dg/yfOmEBUqORO+lTf2ZmvsWVGC/0LOgfouU8ujj2+Tdj6Tmii
	1P279KZ3hDokOxxK85R0/Ybev/LoDwf1T+5bFWeedss1SZYvmPLxDhfvzzFOcTet76xQ
	ENRyzf4Fdlw0gB4/QJ+3RFUH9mFBnkx+jgt6SHY8EsY63x+vJatKQkjOZh4/yUn3ujqa
	VSiXJZ2fOeQBo7RRMRAOB8GaJG98Ruwt1/MKjt3FMwxaTe4VI2NN41vGR+bDpiwERgHo
	NODyry8lKROjb5MLtOAS0INbrj8dta5r7+NEBBYN6JE/+H0fnlq+HkJkzjenyMjmjy2B
	k9RA==
Received: by 10.68.240.42 with SMTP id vx10mr3683640pbc.21.1334311449208;
	Fri, 13 Apr 2012 03:04:09 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-182-16.ip50.fastwebnet.it.
	[93.34.182.16])
	by mx.google.com with ESMTPS id pv10sm5534277pbc.4.2012.04.13.03.04.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 13 Apr 2012 03:04:07 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 13 Apr 2012 12:03:46 +0200
Message-Id: <1334311426-5694-1-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.7.9.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.210.46
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [PATCH] fix block_job_set_speed name in documentation
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
X-List-Received-Date: Fri, 13 Apr 2012 10:04:27 -0000

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hmp-commands.hx |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hmp-commands.hx b/hmp-commands.hx
index a6f5a84..461fa59 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -92,8 +92,8 @@ ETEXI
     },
 
 STEXI
-@item block_job_set_stream
-@findex block_job_set_stream
+@item block_job_set_speed
+@findex block_job_set_speed
 Set maximum speed for a background block operation.
 ETEXI
 
-- 
1.7.9.3


