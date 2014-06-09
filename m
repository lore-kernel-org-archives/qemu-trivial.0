Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wu8YX-0007CU-CO
	for mharc-qemu-trivial@gnu.org; Mon, 09 Jun 2014 19:00:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42726)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Wu8YP-00078Y-92
	for qemu-trivial@nongnu.org; Mon, 09 Jun 2014 19:00:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kroosec@gmail.com>) id 1Wu8YJ-0005qw-4M
	for qemu-trivial@nongnu.org; Mon, 09 Jun 2014 19:00:37 -0400
Received: from mail-wi0-x22e.google.com ([2a00:1450:400c:c05::22e]:57643)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kroosec@gmail.com>)
	id 1Wu8Y6-0005nT-PE; Mon, 09 Jun 2014 19:00:18 -0400
Received: by mail-wi0-f174.google.com with SMTP id r20so5115120wiv.7
	for <multiple recipients>; Mon, 09 Jun 2014 16:00:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=Q2wV59jaEbKQsu3BFskQ8/WnVXQeuZG5mGdHW4Ax3PY=;
	b=UW9HaoP1vZRkd5XbTC/hp74Du0+2o2Xpe8TNFpqEM+yHMExUbcbINqyxIzzvoC44da
	xAcn7iRfnRTrAoc4Oet92xVH2EmUdbR+mHhtVPq+gq7nif5PzNNQKlS9IFK4+ASKctlv
	cpBUwP0WdaIsezMxzTbOAP7pSn5jYZUUCvQiRu0r3PemnEhxuAQEO9VH0QljsHTH3P4U
	m+ErdBVkAV57wWGwghDyneBNpIR41v5lOCVCjLiqJJ90jnJ+zpA1ixf7EBt1Mn42qSxH
	HQBYh1X8dM2ScyppjdKo/TFSu/IEnoVzo60QvQTh9qpAPNZjORTrBkvQ1V6DaP+ElrrB
	dTsA==
X-Received: by 10.180.37.198 with SMTP id a6mr23903650wik.58.1402354817458;
	Mon, 09 Jun 2014 16:00:17 -0700 (PDT)
Received: from Inspiron-3521 ([41.103.47.63])
	by mx.google.com with ESMTPSA id p3sm6701868wjw.13.2014.06.09.16.00.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Mon, 09 Jun 2014 16:00:16 -0700 (PDT)
Date: Tue, 10 Jun 2014 00:00:10 +0100
From: Hani Benhabiles <kroosec@gmail.com>
To: Luiz Capitulino <lcapitulino@redhat.com>
Message-ID: <20140609230010.GA22765@Inspiron-3521>
References: <1401623615-7548-1-git-send-email-kroosec@gmail.com>
	<20140609163232.5d0fc6ed@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140609163232.5d0fc6ed@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::22e
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH] readline: Clear screen on form feed.
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
X-List-Received-Date: Mon, 09 Jun 2014 23:00:43 -0000

On Mon, Jun 09, 2014 at 04:32:32PM -0400, Luiz Capitulino wrote:
> On Sun,  1 Jun 2014 12:53:35 +0100
> Hani Benhabiles <kroosec@gmail.com> wrote:
> 
> > Signed-off-by: Hani Benhabiles <hani@linux.com>
> > ---
> >  util/readline.c | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/util/readline.c b/util/readline.c
> > index 8baec55..08d07e3 100644
> > --- a/util/readline.c
> > +++ b/util/readline.c
> > @@ -345,6 +345,12 @@ static void readline_completion(ReadLineState *rs)
> >      }
> >  }
> >  
> > +static void readline_clear_screen(ReadLineState *rs)
> > +{
> > +    rs->printf_func(rs->opaque, "\033[2J\033[1;1H");
> 
> That's a smart way of doing it and I can't suggest anything better. But
> what happens on Windows?

Sorry, I have no experience with Windows and I can't give a definite answer about it.

But as Michael pointed out, readline is already using similar escape sequences.

> 
> > +    readline_show_prompt(rs);
> > +}
> > +
> >  /* return true if command handled */
> >  void readline_handle_byte(ReadLineState *rs, int ch)
> >  {
> > @@ -363,6 +369,9 @@ void readline_handle_byte(ReadLineState *rs, int ch)
> >          case 9:
> >              readline_completion(rs);
> >              break;
> > +        case 12:
> > +            readline_clear_screen(rs);
> > +            break;
> >          case 10:
> >          case 13:
> >              rs->cmd_buf[rs->cmd_buf_size] = '\0';
> 

