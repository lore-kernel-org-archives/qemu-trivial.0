Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QQ0mj-00013C-Sn
	for mharc-qemu-trivial@gnu.org; Fri, 27 May 2011 13:25:17 -0400
Received: from eggs.gnu.org ([140.186.70.92]:33214)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QQ0mh-0000yH-I4
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:25:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QQ0mg-0003hq-Rd
	for qemu-trivial@nongnu.org; Fri, 27 May 2011 13:25:15 -0400
Received: from mail-qy0-f173.google.com ([209.85.216.173]:40388)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QQ0mf-0003hY-CN; Fri, 27 May 2011 13:25:13 -0400
Received: by qyk36 with SMTP id 36so3938014qyk.4
	for <multiple recipients>; Fri, 27 May 2011 10:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references:mime-version:content-type
	:content-transfer-encoding;
	bh=MWKyLRqBMRL4guMrBPhcXnZBO3Xj531DW8oTE3MzW1M=;
	b=S1NUOdcAJWTPNbuFTLDHgMRqDlTq5apNjfxrwl2kywJMLjJZ98um5G48qpNPGIIKGd
	TocvBnFUWq6955+XW0iXDkMIV91ek1n4f1opiDBOu2JMDJuVTBG9Cy0ybYJ8ERWR9S6E
	LchJCQRHIun2ZrJNCJN2siyzmk9tFAqjCFBfk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding;
	b=SGXOKtJGD1WucWknYLnuR/5DMhtXE3veTRi8sIR0oY/wad133p8BQN65TZZpJK6BAA
	soXt0ndiSNAbSZlblkjfY/E3rT9QR02iR9Gppr3Rs/+5v+FaNWy542Z1+KcZg2qfqEcn
	Zi1rkejq/FcQmIW3kBZbzN+PmFM5MO1SISN84=
Received: by 10.229.176.170 with SMTP id be42mr1632821qcb.258.1306517113023;
	Fri, 27 May 2011 10:25:13 -0700 (PDT)
Received: from localhost.localdomain (modemcable055.201-23-96.mc.videotron.ca
	[96.23.201.55])
	by mx.google.com with ESMTPS id e28sm1198569qck.30.2011.05.27.10.25.11
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 May 2011 10:25:12 -0700 (PDT)
From: Alexandre Raymond <cerbere@gmail.com>
To: qemu-devel@nongnu.org
Date: Fri, 27 May 2011 13:22:29 -0400
Message-Id: <1306516951-31105-5-git-send-email-cerbere@gmail.com>
X-Mailer: git-send-email 1.7.5
In-Reply-To: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
References: <1306516951-31105-1-git-send-email-cerbere@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org, Alexandre Raymond <cerbere@gmail.com>
Subject: [Qemu-trivial] [PATCH 4/6] Fix missing prototype under cocoa for
	qemu_main
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
X-List-Received-Date: Fri, 27 May 2011 17:25:16 -0000

The following error message was encountered when compiling
with cocoa support because qemu_main did not have a prototype.

-----8<-----
qemu/vl.c:2037: warning: no previous prototype for ‘qemu_main’
-----8<-----

Add its prototype in the COCOA ifdef, similar to what is done for SDL.

Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
---
 vl.c |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/vl.c b/vl.c
index b362871..b983646 100644
--- a/vl.c
+++ b/vl.c
@@ -107,6 +107,7 @@ int main(int argc, char **argv)
 #endif /* CONFIG_SDL */
 
 #ifdef CONFIG_COCOA
+int qemu_main(int argc, char **argv, char **envp);
 #undef main
 #define main qemu_main
 #endif /* CONFIG_COCOA */
-- 
1.7.5


