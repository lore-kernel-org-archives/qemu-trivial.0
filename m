Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WzgHF-0003f3-RP
	for mharc-qemu-trivial@gnu.org; Wed, 25 Jun 2014 02:01:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45293)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WzgH4-0003Vr-BB
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 02:01:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WzgGy-00058P-JU
	for qemu-trivial@nongnu.org; Wed, 25 Jun 2014 02:01:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58723)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1WzgGl-00054e-Ul; Wed, 25 Jun 2014 02:01:21 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s5P61Flp004761
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Wed, 25 Jun 2014 02:01:15 -0400
Received: from redhat.com (ovpn-116-41.ams2.redhat.com [10.36.116.41])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s5P61BhQ003038; Wed, 25 Jun 2014 02:01:12 -0400
Date: Wed, 25 Jun 2014 09:01:40 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20140625060140.GA21752@redhat.com>
References: <1403650675-3368-1-git-send-email-ehabkost@redhat.com>
	<20140625060059.GC21553@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140625060059.GC21553@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
	qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH] pc: Fix "prog_if" typo on PC_COMPAT_2_0
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
X-List-Received-Date: Wed, 25 Jun 2014 06:01:44 -0000

On Wed, Jun 25, 2014 at 09:00:59AM +0300, Michael S. Tsirkin wrote:
> On Tue, Jun 24, 2014 at 07:57:55PM -0300, Eduardo Habkost wrote:
> > The property name is "prog_if", not "prof_if".
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > Cc: BALATON Zoltan <balaton@eik.bme.hu>
> 
> Should be reported-by, by the way.
> Cc: means "I have notified this person just in case".

Fixed up on my branch no need to repost.

> > ---
> >  include/hw/i386/pc.h | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> > index 486e98f..1331d5a 100644
> > --- a/include/hw/i386/pc.h
> > +++ b/include/hw/i386/pc.h
> > @@ -358,7 +358,7 @@ bool e820_get_entry(int, uint32_t, uint64_t *, uint64_t *);
> >          },\
> >          {\
> >              .driver   = "pci-serial-2x",\
> > -            .property = "prof_if",\
> > +            .property = "prog_if",\
> >              .value    = stringify(0),\
> >          },\
> >          {\
> > -- 
> > 1.9.3

