Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvYlp-0005so-Uf
	for mharc-qemu-trivial@gnu.org; Thu, 09 Feb 2012 13:31:01 -0500
Received: from eggs.gnu.org ([140.186.70.92]:46666)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>) id 1RvYli-0005V8-7d
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 13:31:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>) id 1RvYla-0003Bu-LU
	for qemu-trivial@nongnu.org; Thu, 09 Feb 2012 13:30:50 -0500
Received: from mail-pw0-f45.google.com ([209.85.160.45]:60679)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>)
	id 1RvYlP-0003AI-6M; Thu, 09 Feb 2012 13:30:35 -0500
Received: by pbbro12 with SMTP id ro12so1988263pbb.4
	for <multiple recipients>; Thu, 09 Feb 2012 10:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=YrExd7XF+GZt+kh0gVOA6kj/lCiZmDl4U64QmnGKWc0=;
	b=uwNkPDAO33RlQjBhFfE+zfUrrPOmHDPEwstVKGh38X0K9tcf7RCdUjQCd1xpP/6MCW
	j7UnHrQcVe446c9VH5ZNlMiymyQBfe6/IbS+kk36gkkwKL2ISv9iybhczgNbrVCaOWkJ
	i3m4PeWNCBng/80oJcfPfjDDLRM8FHKekeCLA=
Received: by 10.68.73.103 with SMTP id k7mr7997209pbv.132.1328812233161; Thu,
	09 Feb 2012 10:30:33 -0800 (PST)
MIME-Version: 1.0
Sender: alex.barcelo@gmail.com
Received: by 10.142.208.6 with HTTP; Thu, 9 Feb 2012 10:30:13 -0800 (PST)
From: Alex Barcelo <abarcelo@ac.upc.edu>
Date: Thu, 9 Feb 2012 19:30:13 +0100
X-Google-Sender-Auth: nlwO2iuLUV8j3yw_WbMXEO0L5UA
Message-ID: <CAFKAgTdwXj_XZ3EOgwR0=x_biz6s=SJKVsKX5C+z38=SicWY2A@mail.gmail.com>
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org
Subject: [Qemu-trivial] [TRIVIAL] sas_ss_flags bug for powerpc
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
X-List-Received-Date: Thu, 09 Feb 2012 18:31:00 -0000

Signed-off-by: Alex Barcelo <abarcelo@ac.upc.edu>
---
 linux-user/signal.c |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/linux-user/signal.c b/linux-user/signal.c
index 79a39dc..26e0530 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -4115,7 +4115,7 @@ static target_ulong get_sigframe(struct
target_sigaction *ka,
     oldsp = env->gpr[1];

     if ((ka->sa_flags & TARGET_SA_ONSTACK) &&
-        (sas_ss_flags(oldsp))) {
+        (sas_ss_flags(oldsp)) == 0) {
         oldsp = (target_sigaltstack_used.ss_sp
                  + target_sigaltstack_used.ss_size);
     }
-- 
1.7.5.4

