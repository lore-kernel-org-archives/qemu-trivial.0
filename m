Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T2O3n-0005S8-1u
	for mharc-qemu-trivial@gnu.org; Fri, 17 Aug 2012 11:02:03 -0400
Received: from eggs.gnu.org ([208.118.235.92]:43095)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T2O3k-0005RP-I5
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2012 11:02:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>) id 1T2O3f-0003F8-NN
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2012 11:02:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44717)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lcapitulino@redhat.com>)
	id 1T2O3f-0003F2-D1; Fri, 17 Aug 2012 11:01:55 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7HF1sKO032428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 17 Aug 2012 11:01:54 -0400
Received: from doriath.home (ovpn-113-87.phx2.redhat.com [10.3.113.87])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id q7HF1pFB022008; Fri, 17 Aug 2012 11:01:52 -0400
Date: Fri, 17 Aug 2012 12:02:35 -0300
From: Luiz Capitulino <lcapitulino@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20120817120235.7a725482@doriath.home>
In-Reply-To: <87d32plgwx.fsf@blackfin.pond.sub.org>
References: <1345210444-2292-1-git-send-email-sw@weilnetz.de>
	<87obm9mwxn.fsf@blackfin.pond.sub.org>
	<20120817112111.1231d0f6@doriath.home>
	<87d32plgwx.fsf@blackfin.pond.sub.org>
Organization: Red Hat
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
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
X-List-Received-Date: Fri, 17 Aug 2012 15:02:01 -0000

On Fri, 17 Aug 2012 16:41:34 +0200
Markus Armbruster <armbru@redhat.com> wrote:

> Luiz Capitulino <lcapitulino@redhat.com> writes:
> 
> > On Fri, 17 Aug 2012 16:10:12 +0200
> > Markus Armbruster <armbru@redhat.com> wrote:
> >
> >> Stefan Weil <sw@weilnetz.de> writes:
> >> 
> >> > ccc-analyzer reports these warnings:
> >> >
> >> > monitor.c:3532:21: warning: Division by zero
> >> >                 val %= val2;
> >> >                     ^
> >> > monitor.c:3530:21: warning: Division by zero
> >> >                 val /= val2;
> >> >                     ^
> >> >
> >> > Rewriting the code fixes this (and also a style issue).
> >> 
> >> I'm afraid this doesn't actually fix anything, because...
> >> 
> >> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
> >> > ---
> >> >  monitor.c |    7 ++++---
> >> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >> >
> >> > diff --git a/monitor.c b/monitor.c
> >> > index 0c34934..0ea2c14 100644
> >> > --- a/monitor.c
> >> > +++ b/monitor.c
> >> > @@ -3524,12 +3524,13 @@ static int64_t expr_prod(Monitor *mon)
> >> >              break;
> >> >          case '/':
> >> >          case '%':
> >> > -            if (val2 == 0)
> >> > +            if (val2 == 0) {
> >> >                  expr_error(mon, "division by zero");
> >> > -            if (op == '/')
> >> > +            } else if (op == '/') {
> >> >                  val /= val2;
> >> > -            else
> >> > +            } else {
> >> >                  val %= val2;
> >> > +            }
> >> >              break;
> >> >          }
> >> >      }
> >> 
> >> ... expr_error() longjmp()s out.  The expression evaluator commonly
> >> exploits that.
> >
> > And that's correct. As far far I understood it's fixing clang, not qemu.
> >
> >> If expr_error() returned, the code would be just as wrong after your
> >> patch as before.
> >
> > Hmm, how? It checks for val2 == 0 first.
> 
> It would evaluate A % 0 into A, which is wrong.

Oh, you're talking about the result that would be returned by expr_prod().
I thought you were saying that val2 == 0 was still possible.

> 
> >> Perhaps the checker can be shut up by making expr_error() QEMU_NORETURN.
> >
> > That's indeed a better solution.
> 
> Stefan, could you try that for us?
> 


