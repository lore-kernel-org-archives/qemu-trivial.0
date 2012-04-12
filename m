Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1SIFlv-00083c-Tz
	for mharc-qemu-trivial@gnu.org; Thu, 12 Apr 2012 04:52:55 -0400
Received: from eggs.gnu.org ([208.118.235.92]:46875)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SIFlp-00083I-21
	for qemu-trivial@nongnu.org; Thu, 12 Apr 2012 04:52:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1SIFli-0002pg-NQ
	for qemu-trivial@nongnu.org; Thu, 12 Apr 2012 04:52:48 -0400
Received: from mail-ey0-f173.google.com ([209.85.215.173]:51384)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1SIFli-0002pR-ET; Thu, 12 Apr 2012 04:52:42 -0400
Received: by eaaf11 with SMTP id f11so485282eaa.4
	for <multiple recipients>; Thu, 12 Apr 2012 01:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=b1vU4btl3AJ8D24zTXL5629AJoGTZOQumhj7niELH9w=;
	b=uHrxQyBW0iahHy4hIZLGJh78Tg971QCt9AXvT5VBmKq3ZoerfXsmCyHrSQ+YJvoGLC
	1n/6nhleyzlgqK9CVpgwbfSb4GVS4yGTBoChy9QPZ6G8nNYQ30npsSwc8dSw2sKibDTW
	WKw/OHE3Ut/gLewHjTFgHKREc71IFEwczAqnQ5oxt+RXGVB1YMASp0uENcojj3T2/Hwb
	lnm3keE6Wb33PflwLg1BEat6xTClhBxn627b8319GbUlj9tiw2K0mlxGUaGyDTefzQCa
	t0tcXKVte19Div2jUwYZsCleT1x50P19LbACjk+iHq/eZ6AK76fnahIDVFxzW1+1umYM
	rqYg==
Received: by 10.213.10.6 with SMTP id n6mr123843ebn.264.1334220759707;
	Thu, 12 Apr 2012 01:52:39 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice1n1.emea.ibm.com. [195.212.29.67])
	by mx.google.com with ESMTPS id
	p57sm24707872eei.8.2012.04.12.01.52.38
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 12 Apr 2012 01:52:39 -0700 (PDT)
Date: Thu, 12 Apr 2012 09:52:37 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20120412085237.GA20334@stefanha-thinkpad.localdomain>
References: <1332868527-11909-1-git-send-email-sw@weilnetz.de>
	<4F85DBC5.7050607@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4F85DBC5.7050607@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.215.173
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Always set LC_ALL=C for
 makeinfo
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
X-List-Received-Date: Thu, 12 Apr 2012 08:52:54 -0000

On Wed, Apr 11, 2012 at 09:30:13PM +0200, Stefan Weil wrote:
> Am 27.03.2012 19:15, schrieb Stefan Weil:
> >Otherwise the generated file qemu-doc.html will contain "Anhang"
> >instead of "Appendix" with a German locale (de_DE.UTF-8).
> >
> >Signed-off-by: Stefan Weil<sw@weilnetz.de>
> >---
> >  Makefile |    2 +-
> >  1 files changed, 1 insertions(+), 1 deletions(-)
> >
> >diff --git a/Makefile b/Makefile
> >index d8e1f36..b48c019 100644
> >--- a/Makefile
> >+++ b/Makefile
> >@@ -327,7 +327,7 @@ TEXIFLAG=$(if $(V),,--quiet)
> >  	$(call quiet-command,texi2dvi $(TEXIFLAG) -I . $<,"  GEN   $@")
> >
> >  %.html: %.texi
> >-	$(call quiet-command,$(MAKEINFO) $(MAKEINFOFLAGS) --html $<  -o $@, \
> >+	$(call quiet-command,LC_ALL=C $(MAKEINFO) $(MAKEINFOFLAGS) --html $<  -o $@, \
> >  	"  GEN   $@")
> >
> >  %.info: %.texi
> 
> Ping? Please apply this patch to the trivial patches tree.

Thanks, applied to the trivial patches tree:
https://github.com/stefanha/qemu/commits/trivial-patches

Stefan

