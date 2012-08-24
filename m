Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T4rB4-0002SB-1R
	for mharc-qemu-trivial@gnu.org; Fri, 24 Aug 2012 06:31:46 -0400
Received: from eggs.gnu.org ([208.118.235.92]:36775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4rB2-0002S3-2n
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 06:31:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1T4rB0-0006JL-Qs
	for qemu-trivial@nongnu.org; Fri, 24 Aug 2012 06:31:44 -0400
Received: from mail-wi0-f181.google.com ([209.85.212.181]:60969)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>)
	id 1T4rB0-0006J8-Kz; Fri, 24 Aug 2012 06:31:42 -0400
Received: by wibhm2 with SMTP id hm2so498822wib.10
	for <multiple recipients>; Fri, 24 Aug 2012 03:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=51arwhsdDcuIqWpYuubF8hq6EM64QJj3l5RBzeYMuJs=;
	b=irzsGdzY4lzNFGsQhpxZwKsDjGBP2AlT2l1k8+S3CDUo7EURAcWAWrTwnEfrS25kiU
	FUQqBaX+qWj/oDEeZISYBTzRkTBbASMDY2jtUi1WhgBIHzxGB8EQ5t9oT+29OXTC5qT0
	5SqADCF58g8MMaUtnUDbZ69Ekit3rLVlTgzljc40/LyLZbg/UOg7/PTOJ1HpK3fv/fht
	wOpsfdNLTtcFsN2WzilG2z45fcD+ungrLTlWWnjCzD7YDTt0f90UgHRLVJ7nPuQ7VsTd
	bC7lBq0aaBWudzh0K9xOfwD7KXv6GGQnnhy/ruh62BkJRaqM+2MGvFokRs7wVtqk0kWS
	IvgQ==
Received: by 10.180.103.4 with SMTP id fs4mr4467238wib.16.1345804301630;
	Fri, 24 Aug 2012 03:31:41 -0700 (PDT)
Received: from localhost (gbibp9ph1--blueice2n1.emea.ibm.com. [195.212.29.75])
	by mx.google.com with ESMTPS id k2sm5587585wiz.7.2012.08.24.03.31.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 24 Aug 2012 03:31:40 -0700 (PDT)
Date: Fri, 24 Aug 2012 11:31:38 +0100
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20120824103138.GB10867@stefanha-thinkpad.localdomain>
References: <1345210444-2292-1-git-send-email-sw@weilnetz.de>
	<87obm9mwxn.fsf@blackfin.pond.sub.org>
	<20120817112111.1231d0f6@doriath.home>
	<87d32plgwx.fsf@blackfin.pond.sub.org>
	<20120817120235.7a725482@doriath.home>
	<502F8164.2060701@weilnetz.de>
	<877gsuav6o.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <877gsuav6o.fsf@blackfin.pond.sub.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.85.212.181
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org, Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] monitor: Fix warning from
	clang
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
X-List-Received-Date: Fri, 24 Aug 2012 10:31:45 -0000

On Mon, Aug 20, 2012 at 09:17:51AM +0200, Markus Armbruster wrote:
> Stefan Weil <sw@weilnetz.de> writes:
> 
> > Am 17.08.2012 17:02, schrieb Luiz Capitulino:
> >> On Fri, 17 Aug 2012 16:41:34 +0200
> >> Markus Armbruster <armbru@redhat.com> wrote:
> >>
> >>> Luiz Capitulino <lcapitulino@redhat.com> writes:
> >>>
> >>>> On Fri, 17 Aug 2012 16:10:12 +0200
> >>>> Markus Armbruster <armbru@redhat.com> wrote:
> >>>>
> >>>>> Stefan Weil <sw@weilnetz.de> writes:
> >>>>>
> >>>>>> ccc-analyzer reports these warnings:
> >>>>>>
> >>>>>> monitor.c:3532:21: warning: Division by zero
> >>>>>>                  val %= val2;
> >>>>>>                      ^
> >>>>>> monitor.c:3530:21: warning: Division by zero
> >>>>>>                  val /= val2;
> >>>>>>                      ^
> >>>>>>
> >>>>>> Rewriting the code fixes this (and also a style issue).
> >>>>>
> >>>>> I'm afraid this doesn't actually fix anything, because...
> >>>>>
> >>>>>> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> >>>>>> ---
> >>>>>>   monitor.c |    7 ++++---
> >>>>>>   1 file changed, 4 insertions(+), 3 deletions(-)
> >>>>>>
> >>>>>> diff --git a/monitor.c b/monitor.c
> >>>>>> index 0c34934..0ea2c14 100644
> >>>>>> --- a/monitor.c
> >>>>>> +++ b/monitor.c
> >>>>>> @@ -3524,12 +3524,13 @@ static int64_t expr_prod(Monitor *mon)
> >>>>>>               break;
> >>>>>>           case '/':
> >>>>>>           case '%':
> >>>>>> -            if (val2 == 0)
> >>>>>> +            if (val2 == 0) {
> >>>>>>                   expr_error(mon, "division by zero");
> >>>>>> -            if (op == '/')
> >>>>>> +            } else if (op == '/') {
> >>>>>>                   val /= val2;
> >>>>>> -            else
> >>>>>> +            } else {
> >>>>>>                   val %= val2;
> >>>>>> +            }
> >>>>>>               break;
> >>>>>>           }
> >>>>>>       }
> >>>>>
> >>>>> ... expr_error() longjmp()s out.  The expression evaluator commonly
> >>>>> exploits that.
> >>>>
> >>>> And that's correct. As far far I understood it's fixing clang, not qemu.
> >>>>
> >>>>> If expr_error() returned, the code would be just as wrong after your
> >>>>> patch as before.
> >>>>
> >>>> Hmm, how? It checks for val2 == 0 first.
> >>>
> >>> It would evaluate A % 0 into A, which is wrong.
> >>
> >> Oh, you're talking about the result that would be returned by expr_prod().
> >> I thought you were saying that val2 == 0 was still possible.
> >>
> >>>
> >>>>> Perhaps the checker can be shut up by making expr_error() QEMU_NORETURN.
> >>>>
> >>>> That's indeed a better solution.
> >>>
> >>> Stefan, could you try that for us?
> >
> >
> > Adding QEMU_NORETURN to function expr_error also
> > fixes the warning from ccc-analyzer.
> >
> > I'll send a patch series which adds this and some more
> > QEMU_NORETURN attributes.
> 
> Thanks!
> 
> > What about using above patch in addition? IMHO it
> > improves readability, and it fixes the coding style.
> 
> Readability: debatable.  The code depends on expr_error() not returning.
> The current code makes that fairly obvious locally.  I think your patch
> makes it less obvious.  Moreover, it changes the way exp_error() is used
> in just one place, making it inconsistent with all the other places.
> 
> Coding style: we generally make coding style changes only to code we
> touch anyway, not just for the sake of it.
> 
> TL;DR: let's drop this patch.

I agree.  Let's add QEMU_NORETURN and leave this code as-is.

Stefan

