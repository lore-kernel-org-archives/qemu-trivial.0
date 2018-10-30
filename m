Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gHX6o-0004h1-Te
	for mharc-qemu-trivial@gnu.org; Tue, 30 Oct 2018 12:43:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:57802)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1gHX6m-0004dR-5j
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 12:43:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1gHX6k-0005MU-91
	for qemu-trivial@nongnu.org; Tue, 30 Oct 2018 12:43:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45312)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1gHX6b-00052U-Ef; Tue, 30 Oct 2018 12:43:02 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A9099307D96B;
	Tue, 30 Oct 2018 16:42:59 +0000 (UTC)
Received: from work-vm (ovpn-116-177.ams2.redhat.com [10.36.116.177])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 413145DEAA;
	Tue, 30 Oct 2018 16:42:58 +0000 (UTC)
Date: Tue, 30 Oct 2018 16:42:55 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Eric Blake <eblake@redhat.com>
Cc: wangguang <wang.guang55@zte.com.cn>, qemu-devel@nongnu.org,
	qemu-trivial <qemu-trivial@nongnu.org>
Message-ID: <20181030164255.GA7305@work-vm>
References: <1490056074976-474433.post@n7.nabble.com>
	<28d15bd5-1620-b39b-ed92-d8812d1549c8@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28d15bd5-1620-b39b-ed92-d8812d1549c8@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Tue, 30 Oct 2018 16:42:59 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v4]COLO:Fix Colo doc,
 secondeary should be secondary
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 30 Oct 2018 16:43:13 -0000

* Eric Blake (eblake@redhat.com) wrote:
> [adding qemu-trivial]
> 
> On 03/20/2017 07:27 PM, wangguang wrote:
> > Subject: [PATCH] Fix Colo doc secondeary should be secondary 
> 
> This line feels redundant compared to the overall mail's subject line.
> In turn, that subject could use a space after colon.
> 
> > This is an error in COLO-FT.txt. 
> > secondeary-disk0 should be secondary-disk0. 
> > 
> > Signed-off-by: Guang Wang <wang.guang55@zte.com.cn>
> > --- 
> >  docs/COLO-FT.txt | 2 +- 
> >  1 file changed, 1 insertion(+), 1 deletion(-) 
> 
> Reviewed-by: Eric Blake <eblake@redhat.com>
> 
> As it is doc-only, it is safe for hard freeze, but also not the end of
> the world if it doesn't go in until 2.10.

Manually applied and queued for migration
(ahem a little late)

Dave

> > 
> > diff --git a/docs/COLO-FT.txt b/docs/COLO-FT.txt 
> > index e289be2..bec7547 100644 
> > --- a/docs/COLO-FT.txt 
> > +++ b/docs/COLO-FT.txt 
> > @@ -139,7 +139,7 @@ Secondary: 
> >  { 'execute': 'nbd-server-start', 
> >    'arguments': {'addr': {'type': 'inet', 'data': {'host': 'xx.xx.xx.xx',
> > 'port': '8889'} } } 
> >  } 
> > -{'execute': 'nbd-server-add', 'arguments': {'device': 'secondeary-disk0',
> > 'writable': true } } 
> > +{'execute': 'nbd-server-add', 'arguments': {'device': 'secondary-disk0',
> > 'writable': true } } 
> >   
> >  Note: 
> >    a. The qmp command nbd-server-start and nbd-server-add must be run 
> > 
> 
> -- 
> Eric Blake   eblake redhat com    +1-919-301-3266
> Libvirt virtualization library http://libvirt.org
> 


--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

