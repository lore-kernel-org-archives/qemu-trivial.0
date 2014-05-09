Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wiry1-0006tT-IT
	for mharc-qemu-trivial@gnu.org; Fri, 09 May 2014 17:04:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34842)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Wirxp-0006Y4-Ca
	for qemu-trivial@nongnu.org; Fri, 09 May 2014 17:04:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Wirxj-0005fS-Mo
	for qemu-trivial@nongnu.org; Fri, 09 May 2014 17:04:17 -0400
Received: from mail-ee0-x232.google.com ([2a00:1450:4013:c00::232]:38662)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WirxZ-0005c7-Dc; Fri, 09 May 2014 17:04:01 -0400
Received: by mail-ee0-f50.google.com with SMTP id e51so2983472eek.23
	for <multiple recipients>; Fri, 09 May 2014 14:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ClTjfM2cmRF1bqDG4zJarK3SZWNP6y/jsNZxptwC0SE=;
	b=J4HHOSTrbg7cGU9KEIi3Pm6qY/ajuQIDVmg3m5NR+Q+/RwY/zxiC7kw1m2FUyEtoZN
	aNHNIDLx0tQa5sSPxYI9Div4EgLi1lZZooKdn+sXBkZNVwiRqoaSmFqZxnMQT/VArzQ8
	mkgFei4nIbZqcLRjpsrEindeoaoIHzvo1fbv6JbJT2+24JJr+m54Djcf62vtIdIph0Tk
	zyNpVegtxlVZOTiEmyhFwNRItB6ACm1GIuw3RNbiBEP0tsFCPXUZD5EWt8i1FsZvCUWL
	2fKnfBIObwnLdey26wMfX4UaP7J+3qusA/r1lz8dp/VolDkyzZvbg+WdbOiZqe87H7oi
	/8ag==
X-Received: by 10.14.4.70 with SMTP id 46mr7091263eei.116.1399669440529;
	Fri, 09 May 2014 14:04:00 -0700 (PDT)
Received: from playground.lan (net-37-117-141-58.cust.vodafonedsl.it.
	[37.117.141.58])
	by mx.google.com with ESMTPSA id u46sm13823876eel.1.2014.05.09.14.03.58
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 09 May 2014 14:03:59 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri,  9 May 2014 23:03:39 +0200
Message-Id: <1399669424-29676-6-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1399669424-29676-1-git-send-email-pbonzini@redhat.com>
References: <1399669424-29676-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::232
Cc: qemu-trivial@nongnu.org, Fam Zheng <famz@redhat.com>, mjt@tls.msk.ru,
	Alon Levy <alevy@redhat.com>
Subject: [Qemu-trivial] [PULL 05/10] Makefile.target: use $(INSTALL_PROG)
	for installing, not $(INSTALL)
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
X-List-Received-Date: Fri, 09 May 2014 21:04:22 -0000

From: Michael Tokarev <mjt@tls.msk.ru>

$(INSTALL_PROG) is evaluated to libtool if using libtool, while
$(INSTALL) is not.  Use $(INSTALL_PROG) so that libtool is used
with target too when necessary.  This allows, for example, to
link qemu with shared libcacard.

Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Cc: Fam Zheng <famz@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Alon Levy <alevy@redhat.com>
Cc: qemu-trivial@nongnu.org
--
This is done on top of previous patch (using $(STRIP)), but it can
be used by its own.
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 Makefile.target | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile.target b/Makefile.target
index 8fc606f..9986047 100644
--- a/Makefile.target
+++ b/Makefile.target
@@ -183,7 +183,7 @@ endif
 
 install: all
 ifneq ($(PROGS),)
-	$(INSTALL) -m 755 $(PROGS) "$(DESTDIR)$(bindir)"
+	$(INSTALL_PROG) $(PROGS) "$(DESTDIR)$(bindir)"
 ifneq ($(STRIP),)
 	$(STRIP) $(PROGS:%="$(DESTDIR)$(bindir)/%")
 endif
-- 
1.8.3.1



