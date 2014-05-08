Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WiOVj-0003Mm-G7
	for mharc-qemu-trivial@gnu.org; Thu, 08 May 2014 09:37:19 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54117)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WiOVc-0003AD-GM
	for qemu-trivial@nongnu.org; Thu, 08 May 2014 09:37:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1WiOVX-0006qP-HH
	for qemu-trivial@nongnu.org; Thu, 08 May 2014 09:37:12 -0400
Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230]:44160)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1WiOVN-0006lp-B3; Thu, 08 May 2014 09:36:57 -0400
Received: by mail-wi0-f176.google.com with SMTP id n15so8095761wiw.9
	for <multiple recipients>; Thu, 08 May 2014 06:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ClTjfM2cmRF1bqDG4zJarK3SZWNP6y/jsNZxptwC0SE=;
	b=sa/dlNNynWKwocVgZjQVYJPbkpWd3AVogulvbwJGK47F3AVhGfsT0AvVIWzAY59KKU
	7IxE2uxTtmWDaseucyouLg2oWQ/vTfySTNPDoYVrAP50j6oQzNB6KloLndAqg36hPksa
	LRIh61EODN2sV/zqlhu+4GuKckjaOjt5QQs1bSaxO1yCG3yMAMW7kwrJFI0V5lhzj9Z8
	EsOh3smwGEGqhhMjcdWraJQHnGc0F/2fFRicwc5SHFQIum4TuHPftu8zERHCViUAgogY
	Zfa+9pM+7dxvePD6WchdNEdOgLghzjUxFh4RvaYimZ6bA/GChEOB8zjteQEftSZq+C0H
	SpOw==
X-Received: by 10.194.205.35 with SMTP id ld3mr1920415wjc.82.1399556216192;
	Thu, 08 May 2014 06:36:56 -0700 (PDT)
Received: from playground.com (net-37-117-141-58.cust.vodafonedsl.it.
	[37.117.141.58])
	by mx.google.com with ESMTPSA id ct2sm1353860wjb.33.2014.05.08.06.36.53
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 May 2014 06:36:54 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu,  8 May 2014 15:36:33 +0200
Message-Id: <1399556198-17776-6-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1399556198-17776-1-git-send-email-pbonzini@redhat.com>
References: <1399556198-17776-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::230
Cc: qemu-trivial@nongnu.org, Fam Zheng <famz@redhat.com>, mjt@tls.msk.ru,
	Alon Levy <alevy@redhat.com>
Subject: [Qemu-trivial] [PATCH 05/10] Makefile.target: use $(INSTALL_PROG)
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
X-List-Received-Date: Thu, 08 May 2014 13:37:17 -0000

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



