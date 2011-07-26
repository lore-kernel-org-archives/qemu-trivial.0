Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QlYlM-0006iA-KA
	for mharc-qemu-trivial@gnu.org; Mon, 25 Jul 2011 23:56:56 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QlYlJ-0006UC-1l
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 23:56:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cerbere@gmail.com>) id 1QlYlH-0006Tp-Oa
	for qemu-trivial@nongnu.org; Mon, 25 Jul 2011 23:56:52 -0400
Received: from mail-qy0-f173.google.com ([209.85.216.173]:59343)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cerbere@gmail.com>)
	id 1QlYlF-0006Sn-C1; Mon, 25 Jul 2011 23:56:49 -0400
Received: by qyk10 with SMTP id 10so1360336qyk.4
	for <multiple recipients>; Mon, 25 Jul 2011 20:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	bh=DNQP7gpLfASnq1/ZVKq5ExDFnDCqhg6QivKEf84jLVQ=;
	b=NR/xSZOnYlm3+KLTKkgWZ9nlvlIN6jFE1j8I315IviFotskNUe4RKB17Xp9zwDEC23
	L70RzEn0DZHXQdKWR/M/nDOaCdk8VFZb0gzzE8fjqaCqZ9tJei63jg3VgOUCH+FBdRFA
	3la3y5VaZnn81UW8Mo4hJELnU9IhOip6sOgIg=
Received: by 10.229.247.203 with SMTP id md11mr3718557qcb.268.1311652608279;
	Mon, 25 Jul 2011 20:56:48 -0700 (PDT)
Received: from localhost.localdomain (modemcable055.201-23-96.mc.videotron.ca
	[96.23.201.55])
	by mx.google.com with ESMTPS id p15sm62804qct.22.2011.07.25.20.56.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 25 Jul 2011 20:56:47 -0700 (PDT)
From: Alexandre Raymond <cerbere@gmail.com>
To: Qemu Developers <qemu-devel@nongnu.org>
Date: Mon, 25 Jul 2011 23:56:02 -0400
Message-Id: <1311652562-10794-3-git-send-email-cerbere@gmail.com>
X-Mailer: git-send-email 1.7.5
In-Reply-To: <1311652562-10794-1-git-send-email-cerbere@gmail.com>
References: <1311652562-10794-1-git-send-email-cerbere@gmail.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org, Alexandre Raymond <cerbere@gmail.com>
Subject: [Qemu-trivial] [PATCH 2/2] Makefile: delete config.log in distclean
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
X-List-Received-Date: Tue, 26 Jul 2011 03:56:54 -0000

Distclean should remove anything created by the configure script.

Signed-off-by: Alexandre Raymond <cerbere@gmail.com>
---
 Makefile |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 878402e..9f65d86 100644
--- a/Makefile
+++ b/Makefile
@@ -224,6 +224,7 @@ distclean: clean
 	rm -f qemu-doc.fn qemu-doc.fns qemu-doc.info qemu-doc.ky qemu-doc.kys
 	rm -f qemu-doc.log qemu-doc.pdf qemu-doc.pg qemu-doc.toc qemu-doc.tp
 	rm -f qemu-doc.vr
+	rm -f config.log
 	rm -f qemu-tech.info qemu-tech.aux qemu-tech.cp qemu-tech.dvi qemu-tech.fn qemu-tech.info qemu-tech.ky qemu-tech.log qemu-tech.pdf qemu-tech.pg qemu-tech.toc qemu-tech.tp qemu-tech.vr
 	for d in $(DEFAULT_TARGET_LIST) $(QEMULIBS); do \
 	rm -rf $$d || exit 1 ; \
-- 
1.7.5


