Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QZl6s-0001aQ-EZ
	for mharc-qemu-trivial@gnu.org; Thu, 23 Jun 2011 10:42:22 -0400
Received: from eggs.gnu.org ([140.186.70.92]:46765)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QZl6o-0001Ym-KM
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 10:42:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>) id 1QZl6n-0007dr-4D
	for qemu-trivial@nongnu.org; Thu, 23 Jun 2011 10:42:18 -0400
Received: from v220110690675601.yourvserver.net ([78.47.199.172]:45627)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <weil@mail.berlios.de>)
	id 1QZl6j-0007cm-0F; Thu, 23 Jun 2011 10:42:13 -0400
Received: from localhost (v220110690675601.yourvserver.net.local [127.0.0.1])
	by v220110690675601.yourvserver.net (Postfix) with ESMTP id
	5EE9B72818A6; Thu, 23 Jun 2011 16:42:11 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at weilnetz.de
Received: from v220110690675601.yourvserver.net ([127.0.0.1])
	by localhost (v220110690675601.yourvserver.net [127.0.0.1])
	(amavisd-new, port 10024)
	with ESMTP id ZyT9WjerhwS3; Thu, 23 Jun 2011 16:42:10 +0200 (CEST)
Received: from flocke.weilnetz.de (p5086FB6F.dip.t-dialin.net [80.134.251.111])
	by v220110690675601.yourvserver.net (Postfix) with ESMTPSA id
	52CB472818A4; Thu, 23 Jun 2011 16:42:10 +0200 (CEST)
Received: from localhost ([127.0.0.1] ident=stefan)
	by flocke.weilnetz.de with esmtp (Exim 4.72)
	(envelope-from <weil@mail.berlios.de>)
	id 1QZl6f-0002WW-HJ; Thu, 23 Jun 2011 16:42:09 +0200
Message-ID: <4E0350C1.5070505@mail.berlios.de>
Date: Thu, 23 Jun 2011 16:42:09 +0200
From: Stefan Weil <weil@mail.berlios.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.16) Gecko/20110505 Iceowl/1.0b1 Icedove/3.0.11
MIME-Version: 1.0
To: Matthew Fernandez <matthew.fernandez@gmail.com>
References: <BANLkTik5z-sZdPrt6+FMJwgvbehR9O2GwA@mail.gmail.com>	
	<4E02CD7B.40307@mail.berlios.de>
	<1308816518.3502.5.camel@Nokia-N900>
In-Reply-To: <1308816518.3502.5.camel@Nokia-N900>
Content-Type: multipart/alternative;
	boundary="------------000101040402050901080406"
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 78.47.199.172
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, paul@codesourcery.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] Fix comment typos
	in hw/armv7m.c
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
X-List-Received-Date: Thu, 23 Jun 2011 14:42:21 -0000

This is a multi-part message in MIME format.
--------------000101040402050901080406
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 23.06.2011 10:08, schrieb Matthew Fernandez:
>
> ----- Original message -----
> > Am 23.06.2011 02:59, schrieb Matthew Fernandez:
> > > Fix a couple of typos in comments.
> > >
> > > Signed-off-by: Matthew Fernandez<matthew.fernandez@gmail.com 
> <mailto:matthew.fernandez@gmail.com>>
> > > ----
> > > This patch doesn't touch any code and should (hopefully) not be
> > > controversial. There doesn't seem to be a maintainer for this file,
> > > but changes are trivial.
> > >
> > >
> > > diff --git a/hw/armv7m.c b/hw/armv7m.c
> > > index 72d010a..83f3393 100644
> > > --- a/hw/armv7m.c
> > > +++ b/hw/armv7m.c
> > > @@ -4,7 +4,7 @@
> > > * Copyright (c) 2006-2007 CodeSourcery.
> > > * Written by Paul Brook
> > > *
> > > - * This code is licenced under the GPL.
> > > + * This code is licensed under the GPL.
> > > */
> > >
>
...
>
> ...
> >
> >
> > Acked-by: Stefan Weil <weil@mail.berlios.de 
> <mailto:weil@mail.berlios.de>>
> >
> >
> > Hi,
> >
> > would you mind sending a patch which fixes all other "licenced", too?
> > There are 65 files which contain this spelling :-)
> >
> > Cheers,
> > Stefan W.
> >
> No problem. Are there any objections to this being a single patch? 
> Don't really fancy sending 40+ patches. Obviously it will touch a lot 
> of files, but won't change any code.
>

I think a single patch is ok for this special case.
All "licenced" are part of (L)GPL license comments with a very low risk 
of merge conflicts,
especially if the patch is accepted and applied soon.

Stefan W.


--------------000101040402050901080406
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
  <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
</head>
<body bgcolor="#ffffff" text="#000000">
Am 23.06.2011 10:08, schrieb Matthew Fernandez:
<blockquote cite="mid:1308816518.3502.5.camel@Nokia-N900" type="cite">
  <meta http-equiv="Context-Type" content="text/html; charset=utf-8">
  <title></title>
  <p>----- Original message -----
  <br>
&gt; Am 23.06.2011 02:59, schrieb Matthew Fernandez:
  <br>
&gt; &gt; Fix a couple of typos in comments.
  <br>
&gt; &gt; <br>
&gt; &gt; Signed-off-by: Matthew Fernandez&lt;<a moz-do-not-send="true"
 href="mailto:matthew.fernandez@gmail.com">matthew.fernandez@gmail.com</a>&gt;
  <br>
&gt; &gt; ----
  <br>
&gt; &gt; This patch doesn't touch any code and should (hopefully) not
be
  <br>
&gt; &gt; controversial. There doesn't seem to be a maintainer for this
file,
  <br>
&gt; &gt; but changes are trivial.
  <br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; diff --git a/hw/armv7m.c b/hw/armv7m.c
  <br>
&gt; &gt; index 72d010a..83f3393 100644
  <br>
&gt; &gt; --- a/hw/armv7m.c
  <br>
&gt; &gt; +++ b/hw/armv7m.c
  <br>
&gt; &gt; @@ -4,7 +4,7 @@
  <br>
&gt; &gt; * Copyright (c) 2006-2007 CodeSourcery.
  <br>
&gt; &gt; * Written by Paul Brook
  <br>
&gt; &gt; *
  <br>
&gt; &gt; - * This code is licenced under the GPL.
  <br>
&gt; &gt; + * This code is licensed under the GPL.
  <br>
&gt; &gt; */
  <br>
&gt; &gt; </p>
</blockquote>
...<br>
<blockquote cite="mid:1308816518.3502.5.camel@Nokia-N900" type="cite">
  <p>...<br>
&gt; <br>
&gt; <br>
&gt; Acked-by: Stefan Weil &lt;<a moz-do-not-send="true"
 href="mailto:weil@mail.berlios.de">weil@mail.berlios.de</a>&gt;
  <br>
&gt; <br>
&gt; <br>
&gt; Hi,
  <br>
&gt; <br>
&gt; would you mind sending a patch which fixes all other "licenced",
too?
  <br>
&gt; There are 65 files which contain this spelling :-)
  <br>
&gt; <br>
&gt; Cheers,
  <br>
&gt; Stefan W.
  <br>
&gt; <br>
No problem. Are there any objections to this being a single patch?
Don't really fancy sending 40+ patches. Obviously it will touch a lot
of files, but won't change any code.<br>
  </p>
</blockquote>
<br>
I think a single patch is ok for this special case.<br>
All "licenced" are part of (L)GPL license comments with a very low risk
of merge conflicts,<br>
especially if the patch is accepted and applied soon.<br>
<br>
Stefan W.<br>
<br>
</body>
</html>

--------------000101040402050901080406--

