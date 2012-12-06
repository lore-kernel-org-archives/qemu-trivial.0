Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TgaOt-00008w-If
	for mharc-qemu-trivial@gnu.org; Thu, 06 Dec 2012 07:17:59 -0500
Received: from eggs.gnu.org ([208.118.235.92]:58739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1TgaOi-00086T-OJ
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 07:17:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alevy@redhat.com>) id 1TgaOc-0007tz-T2
	for qemu-trivial@nongnu.org; Thu, 06 Dec 2012 07:17:48 -0500
Received: from mx4-phx2.redhat.com ([209.132.183.25]:50181)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alevy@redhat.com>)
	id 1TgaOM-0007rG-Fz; Thu, 06 Dec 2012 07:17:26 -0500
Received: from zmail15.collab.prod.int.phx2.redhat.com
	(zmail15.collab.prod.int.phx2.redhat.com [10.5.83.17])
	by mx4-phx2.redhat.com (8.13.8/8.13.8) with ESMTP id qB6CHN1m024903;
	Thu, 6 Dec 2012 07:17:23 -0500
Date: Thu, 6 Dec 2012 07:17:23 -0500 (EST)
From: Alon Levy <alevy@redhat.com>
To: Orit Wasserman <owasserm@redhat.com>
Message-ID: <208105688.43842791.1354796243900.JavaMail.root@redhat.com>
In-Reply-To: <50C08B66.5030607@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.36.6.33]
X-Mailer: Zimbra 7.2.0_GA_2669 (ZimbraWebClient - FF3.0 (Linux)/7.2.0_GA_2669)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x
X-Received-From: 209.132.183.25
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] arch_init/ram_load: add
 error message for block length mismatch
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
X-List-Received-Date: Thu, 06 Dec 2012 12:17:58 -0000

> On 12/06/2012 02:02 PM, Alon Levy wrote:
> > Signed-off-by: Alon Levy <alevy@redhat.com>
> > ---
> >  arch_init.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/arch_init.c b/arch_init.c
> > index e6effe8..84bca99 100644
> > --- a/arch_init.c
> > +++ b/arch_init.c
> > @@ -808,8 +808,10 @@ static int ram_load(QEMUFile *f, void *opaque,
> > int version_id)
> >                      QLIST_FOREACH(block, &ram_list.blocks, next) {
> >                          if (!strncmp(id, block->idstr,
> >                          sizeof(id))) {
> >                              if (block->length != length) {
> > +                                fprintf(stderr, "Length mismatch:
> > %s: %d "
> > +                                        "in != %d\n", id, length,
> > +                                        block->length);
> >                                  ret =  -EINVAL;
> > -                                goto done;
> >                              }
> >                              break;
> >                          }
> > 
> Reviewed-by: Orit Wasserman <owasserm@redhat.com>
> 
> But the real question is what did we break this time? can it be
> fixed?

qxl - we changed the rom bar size for all revisions of the device. I'm checking the upstream fix and will send it when I'm happy.

> 
> Orit
> 
> 

