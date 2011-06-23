Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZeyE-0006b8-DI
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2011 04:09:02 -0400
Received: from eggs.gnu.org ([140.186.70.92]:49247)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <matthew.fernandez@gmail.com>) id 1QZeyB-0006aT-TW
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 04:09:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <matthew.fernandez@gmail.com>) id 1QZeyA-0000vv-GG
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 04:08:59 -0400
Received: from mail-iy0-f173.google.com ([209.85.210.173]:58120)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <matthew.fernandez@gmail.com>)
	id 1QZey4-0000v1-BQ; Thu, 23 Jun 2011 04:08:52 -0400
Received: by iyb3 with SMTP id 3so1633808iyb.4
	for <multiple recipients>; Thu, 23 Jun 2011 01:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:reply-to:to:cc:subject:x-mailer:references
	:in-reply-to:content-type:date:message-id:mime-version;
	bh=pEcdnILUq7XNVXnMzeJFGLoE1XGAXePzPrmWbleqTsg=;
	b=issbpa2fZn34ua6j72wZoylzJxjbW2GwDHqxarfRZJWofNffERchcz98pYqzESZ722
	ebzaFeOPFbs7mrWasA6yauks/rhU0fJTC7tOeTE0GiKJygbiaRuuYRLnvYOT8w9rKlj+
	THTNWRS71NYvNY4hQllXtfg7JioS2SPuyYDLQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:reply-to:to:cc:subject:x-mailer:references:in-reply-to
	:content-type:date:message-id:mime-version;
	b=lAR18z9op/iOZ7mFb8EGetZIMKo2F5h/T+E/Tnlakbu90AftcaSRqzm1C1x2cKc+Og
	tMjLW/axMzTws+FM2rz+OblKaK6DaOM8iiKB174fFoYbgEWuCpKOMGe2j/rtZZ7X08jj
	9BS+HBHLjeJPJ9ZUwPryWjMhwTXMy1Oc7EjXA=
Received: by 10.42.133.71 with SMTP id g7mr1641242ict.355.1308816530942;
	Thu, 23 Jun 2011 01:08:50 -0700 (PDT)
Received: from [10.242.146.241] ([58.145.143.104])
	by mx.google.com with ESMTPS id e1sm1401541icv.8.2011.06.23.01.08.47
	(version=SSLv3 cipher=OTHER); Thu, 23 Jun 2011 01:08:49 -0700 (PDT)
From: Matthew Fernandez <matthew.fernandez@gmail.com>
To: Stefan Weil <weil@mail.berlios.de>
X-Mailer: Modest 3.2
References: <BANLkTik5z-sZdPrt6+FMJwgvbehR9O2GwA@mail.gmail.com>
	<4E02CD7B.40307@mail.berlios.de>
In-Reply-To: <4E02CD7B.40307@mail.berlios.de>
Content-Type: multipart/alternative; boundary="=-NyjTxAKp2UYOwDfemKe5"
Date: Thu, 23 Jun 2011 18:08:38 +1000
Message-Id: <1308816518.3502.5.camel@Nokia-N900>
Mime-Version: 1.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, paul@codesourcery.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] Fix comment typos
	in hw/armv7m.c
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
Reply-To: Matthew Fernandez <matthew.fernandez@gmail.com>
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Jun 2011 08:09:01 -0000


--=-NyjTxAKp2UYOwDfemKe5
Content-Type: text/plain; charset=utf-8
Content-ID: <1308816517.3502.2.camel@Nokia-N900>
Content-Transfer-Encoding: 8bit

----- Original message -----
> Am 23.06.2011 02:59, schrieb Matthew Fernandez:
> > Fix a couple of typos in comments.
> > 
> > Signed-off-by: Matthew Fernandez<matthew.fernandez@gmail.com>
> > ----
> > This patch doesn't touch any code and should (hopefully) not be
> > controversial. There doesn't seem to be a maintainer for this file,
> > but changes are trivial.
> > 
> > 
> > diff --git a/hw/armv7m.c b/hw/armv7m.c
> > index 72d010a..83f3393 100644
> > --- a/hw/armv7m.c
> > +++ b/hw/armv7m.c
> > @@ -4,7 +4,7 @@
> > * Copyright (c) 2006-2007 CodeSourcery.
> > * Written by Paul Brook
> > *
> > - * This code is licenced under the GPL.
> > + * This code is licensed under the GPL.
> > */
> > 
> > #include "sysbus.h"
> > @@ -14,7 +14,7 @@
> > 
> > /* Bitbanded IO.   Each word corresponds to a single bit.   */
> > 
> > -/* Get the byte address of the real memory for a bitband acess.   */
> > +/* Get the byte address of the real memory for a bitband access.   */
> > static inline uint32_t bitband_addr(void * opaque, uint32_t addr)
> > {
> > uint32_t res;
> 
> 
> Acked-by: Stefan Weil <weil@mail.berlios.de>
> 
> 
> Hi,
> 
> would you mind sending a patch which fixes all other "licenced", too?
> There are 65 files which contain this spelling :-)
> 
> Cheers,
> Stefan W.
> 
No problem. Are there any objections to this being a single patch? Don't really fancy sending 40+ patches. Obviously it will touch a lot of files, but won't change any code.

--=-NyjTxAKp2UYOwDfemKe5
Content-Type: text/html; charset=utf-8
Content-ID: <1308816517.3502.4.camel@Nokia-N900>
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html><head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="generator" content="Osso Notes">
    <title></title></head>
<body>
<p>----- Original message -----
<br>&gt; Am 23.06.2011 02:59, schrieb Matthew Fernandez:
<br>&gt; &gt; Fix a couple of typos in comments.
<br>&gt; &gt; 
<br>&gt; &gt; Signed-off-by: Matthew Fernandez&lt;<a href="mailto:matthew.fernandez@gmail.com">matthew.fernandez@gmail.com</a>&gt;
<br>&gt; &gt; ----
<br>&gt; &gt; This patch doesn't touch any code and should (hopefully) not be
<br>&gt; &gt; controversial. There doesn't seem to be a maintainer for this file,
<br>&gt; &gt; but changes are trivial.
<br>&gt; &gt; 
<br>&gt; &gt; 
<br>&gt; &gt; diff --git a/hw/armv7m.c b/hw/armv7m.c
<br>&gt; &gt; index 72d010a..83f3393 100644
<br>&gt; &gt; --- a/hw/armv7m.c
<br>&gt; &gt; +++ b/hw/armv7m.c
<br>&gt; &gt; @@ -4,7 +4,7 @@
<br>&gt; &gt; * Copyright (c) 2006-2007 CodeSourcery.
<br>&gt; &gt; * Written by Paul Brook
<br>&gt; &gt; *
<br>&gt; &gt; - * This code is licenced under the GPL.
<br>&gt; &gt; + * This code is licensed under the GPL.
<br>&gt; &gt; */
<br>&gt; &gt; 
<br>&gt; &gt; #include "sysbus.h"
<br>&gt; &gt; @@ -14,7 +14,7 @@
<br>&gt; &gt; 
<br>&gt; &gt; /* Bitbanded IO.&nbsp; &#32;Each word corresponds to a single bit.&nbsp; &#32;*/
<br>&gt; &gt; 
<br>&gt; &gt; -/* Get the byte address of the real memory for a bitband acess.&nbsp; &#32;*/
<br>&gt; &gt; +/* Get the byte address of the real memory for a bitband access.&nbsp; &#32;*/
<br>&gt; &gt; static inline uint32_t bitband_addr(void * opaque, uint32_t addr)
<br>&gt; &gt; {
<br>&gt; &gt; uint32_t res;
<br>&gt; 
<br>&gt; 
<br>&gt; Acked-by: Stefan Weil &lt;<a href="mailto:weil@mail.berlios.de">weil@mail.berlios.de</a>&gt;
<br>&gt; 
<br>&gt; 
<br>&gt; Hi,
<br>&gt; 
<br>&gt; would you mind sending a patch which fixes all other "licenced", too?
<br>&gt; There are 65 files which contain this spelling :-)
<br>&gt; 
<br>&gt; Cheers,
<br>&gt; Stefan W.
<br>&gt; 
<br>No problem. Are there any objections to this being a single patch? Don't really fancy sending 40+ patches. Obviously it will touch a lot of files, but won't change any code.<br></p>
</body>
</html>

--=-NyjTxAKp2UYOwDfemKe5--


