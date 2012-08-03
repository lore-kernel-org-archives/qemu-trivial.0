Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Sx873-0002mf-Dh
	for mharc-qemu-trivial@gnu.org; Thu, 02 Aug 2012 22:59:41 -0400
Received: from eggs.gnu.org ([208.118.235.92]:47998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1Sx86x-0002WG-LM
	for qemu-trivial@nongnu.org; Thu, 02 Aug 2012 22:59:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <akong@redhat.com>) id 1Sx86w-0004Ur-H7
	for qemu-trivial@nongnu.org; Thu, 02 Aug 2012 22:59:35 -0400
Received: from mx4-phx2.redhat.com ([209.132.183.25]:44352)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <akong@redhat.com>)
	id 1Sx86u-0004Tn-2S; Thu, 02 Aug 2012 22:59:32 -0400
Received: from zmail13.collab.prod.int.phx2.redhat.com
	(zmail13.collab.prod.int.phx2.redhat.com [10.5.83.15])
	by mx4-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id q732xTNq022242;
	Thu, 2 Aug 2012 22:59:29 -0400
Date: Thu, 2 Aug 2012 22:59:29 -0400 (EDT)
From: Amos Kong <akong@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <1248253671.7451894.1343962769761.JavaMail.root@redhat.com>
In-Reply-To: <876292g7dr.fsf@blackfin.pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.66.112.218]
X-Mailer: Zimbra 7.2.0_GA_2669 (ZimbraWebClient - GC18 (Linux)/7.2.0_GA_2669)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 3)
X-Received-From: 209.132.183.25
Cc: qemu-trivial@nongnu.org, aliguori@us.ibm.com, qemu-devel@nongnu.org,
	quintela@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [RESEND PATCH 1/3] socket:
	remove	redundant check
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
X-List-Received-Date: Fri, 03 Aug 2012 02:59:39 -0000

----- Original Message -----
> Stefan Hajnoczi <stefanha@gmail.com> writes:
> 
> > On Wed, Aug 01, 2012 at 04:59:01PM +0800, Amos Kong wrote:
> >> It's aleady in the end of loop, error should be set.
> >> 
> >> Signed-off-by: Amos Kong <akong@redhat.com>
> >> ---
> >>  qemu-sockets.c |    4 +---
> >>  1 files changed, 1 insertions(+), 3 deletions(-)
> >> 
> >> diff --git a/qemu-sockets.c b/qemu-sockets.c
> >> index 668fa93..c636882 100644
> >> --- a/qemu-sockets.c
> >> +++ b/qemu-sockets.c
> >> @@ -181,9 +181,7 @@ int inet_listen_opts(QemuOpts *opts, int
> >> port_offset, Error **errp)
> >>                  fprintf(stderr,"%s: bind(%s,%s,%d): %s\n",
> >>                  __FUNCTION__,
> >>                          inet_strfamily(e->ai_family), uaddr,
> >>                          inet_getport(e),
> >>                          strerror(errno));
> >> -                if (!e->ai_next) {
> >> -                    error_set(errp, QERR_SOCKET_BIND_FAILED);
> >> -                }
> >> +                error_set(errp, QERR_SOCKET_BIND_FAILED);
> >>              }
> >>          }
> >>          closesocket(slisten);
> >
> > This isn't obvious.  It looks like the intent of the if
> > (!e->ai_next) is
> > to suppress the error so that the next iteration of the *outer*
> > loop can
> > succeed.
> >
> > Why is it okay to set QERR_SOCKET_BIND_FAILED?  We may have more
> > addrinfos left to try in the outer loop.  They may succeed so we
> > don't
> > want an error in that case.
> 
> You are correct, and the patch is wrong.


Yeah, will drop this patch from this thread.
Thanks.

> See also related
> http://lists.nongnu.org/archive/html/qemu-devel/2012-02/msg00772.html
> 
> 

