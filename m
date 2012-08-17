Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T2Nk8-00071O-Bt
	for mharc-qemu-trivial@gnu.org; Fri, 17 Aug 2012 10:41:44 -0400
Received: from eggs.gnu.org ([208.118.235.92]:37630)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1T2Nk5-0006rg-1R
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2012 10:41:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1T2Nk3-0000Gp-Ok
	for qemu-trivial@nongnu.org; Fri, 17 Aug 2012 10:41:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:25730)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1T2Nk1-0000F8-83; Fri, 17 Aug 2012 10:41:37 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id q7HEfaLX023191
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 17 Aug 2012 10:41:36 -0400
Received: from blackfin.pond.sub.org (ovpn-116-71.ams2.redhat.com
	[10.36.116.71])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id q7HEfZ2n000580; Fri, 17 Aug 2012 10:41:36 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 115562005D; Fri, 17 Aug 2012 16:41:35 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Luiz Capitulino <lcapitulino@redhat.com>
References: <1345210444-2292-1-git-send-email-sw@weilnetz.de>
	<87obm9mwxn.fsf@blackfin.pond.sub.org>
	<20120817112111.1231d0f6@doriath.home>
Date: Fri, 17 Aug 2012 16:41:34 +0200
In-Reply-To: <20120817112111.1231d0f6@doriath.home> (Luiz Capitulino's message
	of "Fri, 17 Aug 2012 11:21:11 -0300")
Message-ID: <87d32plgwx.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
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
X-List-Received-Date: Fri, 17 Aug 2012 14:41:43 -0000

Luiz Capitulino <lcapitulino@redhat.com> writes:

> On Fri, 17 Aug 2012 16:10:12 +0200
> Markus Armbruster <armbru@redhat.com> wrote:
>
>> Stefan Weil <sw@weilnetz.de> writes:
>> 
>> > ccc-analyzer reports these warnings:
>> >
>> > monitor.c:3532:21: warning: Division by zero
>> >                 val %= val2;
>> >                     ^
>> > monitor.c:3530:21: warning: Division by zero
>> >                 val /= val2;
>> >                     ^
>> >
>> > Rewriting the code fixes this (and also a style issue).
>> 
>> I'm afraid this doesn't actually fix anything, because...
>> 
>> > Signed-off-by: Stefan Weil <sw@weilnetz.de>
>> > ---
>> >  monitor.c |    7 ++++---
>> >  1 file changed, 4 insertions(+), 3 deletions(-)
>> >
>> > diff --git a/monitor.c b/monitor.c
>> > index 0c34934..0ea2c14 100644
>> > --- a/monitor.c
>> > +++ b/monitor.c
>> > @@ -3524,12 +3524,13 @@ static int64_t expr_prod(Monitor *mon)
>> >              break;
>> >          case '/':
>> >          case '%':
>> > -            if (val2 == 0)
>> > +            if (val2 == 0) {
>> >                  expr_error(mon, "division by zero");
>> > -            if (op == '/')
>> > +            } else if (op == '/') {
>> >                  val /= val2;
>> > -            else
>> > +            } else {
>> >                  val %= val2;
>> > +            }
>> >              break;
>> >          }
>> >      }
>> 
>> ... expr_error() longjmp()s out.  The expression evaluator commonly
>> exploits that.
>
> And that's correct. As far far I understood it's fixing clang, not qemu.
>
>> If expr_error() returned, the code would be just as wrong after your
>> patch as before.
>
> Hmm, how? It checks for val2 == 0 first.

It would evaluate A % 0 into A, which is wrong.

>> Perhaps the checker can be shut up by making expr_error() QEMU_NORETURN.
>
> That's indeed a better solution.

Stefan, could you try that for us?

