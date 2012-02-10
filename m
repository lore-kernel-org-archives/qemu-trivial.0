Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RvnDX-0004Vq-9S
	for mharc-qemu-trivial@gnu.org; Fri, 10 Feb 2012 04:56:35 -0500
Received: from eggs.gnu.org ([140.186.70.92]:48278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>) id 1RvnDP-00044b-4W
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2012 04:56:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>) id 1RvnDI-00023z-9A
	for qemu-trivial@nongnu.org; Fri, 10 Feb 2012 04:56:25 -0500
Received: from mail-pw0-f45.google.com ([209.85.160.45]:35048)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.barcelo@gmail.com>)
	id 1RvnD5-00022G-7C; Fri, 10 Feb 2012 04:56:07 -0500
Received: by pbbro12 with SMTP id ro12so2596659pbb.4
	for <multiple recipients>; Fri, 10 Feb 2012 01:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:from:date:x-google-sender-auth:message-id
	:subject:to:cc:content-type;
	bh=OoXfL+n9Oemvrw3EDJvH7lCia5LCNGgUBNmp4m1XGZA=;
	b=J9ySkEk1rm5QI7JYuw4wG4WXVGedLAQCmPW+6aZJ2FvmIIVUTyJ/r+BINzRMD5rwnt
	glkqGsqxn9fO9vP3LpaWAc/RdlXbbV7WvTB/YXpnxNVBSy/D+ffQetgN4UiQU/IUsgO0
	s9/sNyRzIw1pr7f9E2S+lIWk7MVqjJbME6n5k=
Received: by 10.68.222.169 with SMTP id qn9mr14637979pbc.30.1328867766178;
	Fri, 10 Feb 2012 01:56:06 -0800 (PST)
MIME-Version: 1.0
Sender: alex.barcelo@gmail.com
Received: by 10.142.208.6 with HTTP; Fri, 10 Feb 2012 01:55:46 -0800 (PST)
From: Alex Barcelo <abarcelo@ac.upc.edu>
Date: Fri, 10 Feb 2012 10:55:46 +0100
X-Google-Sender-Auth: uNA7HNU8QBU20JWtHPFZLE_VR3M
Message-ID: <CAFKAgTcgMqVpopxTw8+8N005OSOoNM33L2a8DLJvn7Tpa-BGvQ@mail.gmail.com>
To: qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.160.45
Cc: qemu-trivial@nongnu.org, Riku Voipio <riku.voipio@iki.fi>
Subject: [Qemu-trivial] [TRIVIAL v2] Bad zero comparison for sas_ss_flags on
	powerpc
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
X-List-Received-Date: Fri, 10 Feb 2012 09:56:34 -0000

This is v2 of the patch "sas_ss_flags bug for powerpc", which had a
horrible name and no description.

All architectures work the same way, and all check for sas_ss_flags ==
0. The powerpc lines are wrong, and do the check the other way round
(it's a qemu internal check, which is done wrong only for this
architecture, it's more a typo than a bug). It's NOT ppc specific,
it's POSIX standard (sigaltstack) and qemu internal.

I have a test source that I will send in a follow-up (it's longer than
I would have wished, I'm sure that a better test case can be written
if needed)

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

