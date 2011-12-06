Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RXsVb-0005dM-R9
	for mharc-qemu-trivial@gnu.org; Tue, 06 Dec 2011 05:44:23 -0500
Received: from eggs.gnu.org ([140.186.70.92]:41815)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RXsVW-0005dD-RN
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 05:44:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1RXsVR-0002Hn-6a
	for qemu-trivial@nongnu.org; Tue, 06 Dec 2011 05:44:18 -0500
Received: from mail-bw0-f45.google.com ([209.85.214.45]:34759)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1RXsVQ-0002Hf-Qb; Tue, 06 Dec 2011 05:44:13 -0500
Received: by bkaq10 with SMTP id q10so5975115bka.4
	for <multiple recipients>; Tue, 06 Dec 2011 02:44:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=W2O88q4bjUmZ5+gFtQ0PYAf5d45LlUmoVd7ONZjc45g=;
	b=uzmEP2oA9a9qb/xZsT83kmYBE1InqZYeLKfdfFpWVavB+mtyxa9u23BcovLvTZJuB8
	ALkFoyvnnTKPIwnFQWeXwZ5i6o1fpk/AL9K/D7Y3xC5vxPHU7/rzOlqzdasycF7WUv6I
	WqZBQh6bygXInGV7mupNmmWhI6HRuEePer3Sc=
Received: by 10.180.75.204 with SMTP id e12mr16434354wiw.61.1323168251665;
	Tue, 06 Dec 2011 02:44:11 -0800 (PST)
Received: from localhost (gbibp9ph1--blueice3n2.emea.ibm.com. [195.212.29.84])
	by mx.google.com with ESMTPS id di5sm8542585wib.3.2011.12.06.02.44.10
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Dec 2011 02:44:10 -0800 (PST)
Date: Tue, 6 Dec 2011 10:44:09 +0000
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20111206104409.GB10165@stefanha-thinkpad.localdomain>
References: <CAMOKqh+d7d56d+3jgaAH2yncMJSq-Z23dVZO7YHVgw9xTesBZQ@mail.gmail.com>
	<m3y5vha1n3.fsf@blackfin.pond.sub.org>
	<CAMOKqhKB_JD91CRGie7WMKz24OgGW55W=XOMkAZQFJ=gNEkL-Q@mail.gmail.com>
	<4EDAA251.6090305@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4EDAA251.6090305@weilnetz.de>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.214.45
Cc: qemu-trivial <qemu-trivial@nongnu.org>, rui chen <chennrui@gmail.com>,
	qemu-devel@nongnu.org, aurelien@aurel32.net,
	Paul Brook <paul@codesourcery.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] endless loop when use
 qemu-system-mipsel to load bios
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
X-List-Received-Date: Tue, 06 Dec 2011 10:44:23 -0000

On Sat, Dec 03, 2011 at 11:27:29PM +0100, Stefan Weil wrote:
> Am 16.11.2011 16:21, schrieb rui chen:
> >sorry, here is my new patch file:
> >
> >From 05f4abe8d8c37f1585f2bb7cb89b15426044bb65 Mon Sep 17 00:00:00 2001
> >From: Chen Rui <chennrui@gmail.com <mailto:chennrui@gmail.com>>
> >Date: Sun, 13 Nov 2011 19:42:42 +0800
> >Subject: [PATCH] resolve an endless loop when use
> >qemu-system-mipsel to load bios
> >
> >
> >Signed-off-by: Chen Rui <chennrui@gmail.com <mailto:chennrui@gmail.com>>
> >---
> > hw/mips_malta.c |    1 +
> > 1 files changed, 1 insertions(+), 0 deletions(-)
> >
> >diff --git a/hw/mips_malta.c b/hw/mips_malta.c
> >index bb49749..e7dfbd6 100644
> >--- a/hw/mips_malta.c
> >+++ b/hw/mips_malta.c
> >@@ -911,6 +911,7 @@ void mips_malta_init (ram_addr_t ram_size,
> >             uint32_t *end = addr + bios_size;
> >             while (addr < end) {
> >                 bswap32s(addr);
> >+                addr++;
> >             }
> >         }
> > #endif
> >-- 
> >1.7.1
> 
> This patch fixes a regression introduced by commit
> d758525180e0efff8a59cfea11f5f8348014ff6a
> (More phys_ram_base elimination).
> 
> Please apply it to QEMU git master (with a modified subject, s/use/using/).
> 
> Tested-by: Stefan Weil <sw@weilnetz.de>

Thanks, applied to the trivial patches -next tree.

Stefan

