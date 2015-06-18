Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Z5WbC-0003Ci-Tc
	for mharc-qemu-trivial@gnu.org; Thu, 18 Jun 2015 05:59:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59165)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fziglio@redhat.com>) id 1Z5WbA-00039V-Et
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 05:59:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <fziglio@redhat.com>) id 1Z5Wb9-0001Lo-Lo
	for qemu-trivial@nongnu.org; Thu, 18 Jun 2015 05:59:04 -0400
Received: from mx6-phx2.redhat.com ([209.132.183.39]:34187)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <fziglio@redhat.com>)
	id 1Z5Wb4-0001JW-Bc; Thu, 18 Jun 2015 05:58:58 -0400
Received: from zmail25.collab.prod.int.phx2.redhat.com
	(zmail25.collab.prod.int.phx2.redhat.com [10.5.83.31])
	by mx6-phx2.redhat.com (8.14.4/8.14.4) with ESMTP id t5I9wuB7017746;
	Thu, 18 Jun 2015 05:58:56 -0400
Date: Thu, 18 Jun 2015 05:58:56 -0400 (EDT)
From: Frediano Ziglio <fziglio@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <834587703.17443662.1434621536154.JavaMail.zimbra@redhat.com>
In-Reply-To: <5581CA0E.6080906@msgid.tls.msk.ru>
References: <1434028677-26160-1-git-send-email-fziglio@redhat.com>
	<1434028677-26160-2-git-send-email-fziglio@redhat.com>
	<5581CA0E.6080906@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.36.7.76]
X-Mailer: Zimbra 8.0.6_GA_5922 (ZimbraWebClient - FF38 (Linux)/8.0.6_GA_5922)
Thread-Topic: Check value for invalid negative values
Thread-Index: YwJljRucI4dW5NK3k7C+6gHNG0ztgA==
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.39
Cc: qemu-trivial@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] Check value for
	invalid	negative values
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
X-List-Received-Date: Thu, 18 Jun 2015 09:59:05 -0000

For the same reason there is the v >= l test.
The v >= l test state that the value can be out of range so it not always a constant in the range.
Adding the v < 0 check for every invalid value. As these are executed only for logging should not be a performance penalty.
I also hope the compiler is able to optimize

if (v < 0 || v >= l)

with 

if ((unsigned) v >= l)

Frediano

> 
> 11.06.2015 16:17, Frediano Ziglio wrote:
> > In qxl_v2n check that value is not negative.
> 
> Why do you think it is necessary?
> 
> Thanks,
> 
> /mjt
> 
> > Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
> > ---
> >  hw/display/qxl-logger.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/hw/display/qxl-logger.c b/hw/display/qxl-logger.c
> > index d944d3f..faed869 100644
> > --- a/hw/display/qxl-logger.c
> > +++ b/hw/display/qxl-logger.c
> > @@ -93,7 +93,7 @@ static const char *const spice_cursor_type[] = {
> >  
> >  static const char *qxl_v2n(const char *const n[], size_t l, int v)
> >  {
> > -    if (v >= l || !n[v]) {
> > +    if (v < 0 || v >= l || !n[v]) {
> >          return "???";
> >      }
> >      return n[v];
> 
> 
> 
> 

