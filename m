Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gj4Wr-0007lF-9W
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jan 2019 10:51:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48542)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gj4Wo-0007ib-9p
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 10:51:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1gj4Wm-0002t3-Ai
	for qemu-trivial@nongnu.org; Mon, 14 Jan 2019 10:51:54 -0500
Received: from mx1.redhat.com ([209.132.183.28]:36772)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <mst@redhat.com>)
	id 1gj4Wd-000245-H9; Mon, 14 Jan 2019 10:51:43 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 5B45FC004EB7;
	Mon, 14 Jan 2019 15:51:36 +0000 (UTC)
Received: from redhat.com (ovpn-123-100.rdu2.redhat.com [10.10.123.100])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 72EE35F7C1;
	Mon, 14 Jan 2019 15:51:32 +0000 (UTC)
Date: Mon, 14 Jan 2019 10:51:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: Fei Li <lifei1214@126.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Jiri Slaby <jslaby@suse.cz>, qemu-devel@nongnu.org, shirley17fei@gmail.com
Message-ID: <20190114105015-mutt-send-email-mst@kernel.org>
References: <20190114131015.52967-1-lifei1214@126.com>
	<ac0015a7-5fcf-f5f6-a1a5-6c3846459b8c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <ac0015a7-5fcf-f5f6-a1a5-6c3846459b8c@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Mon, 14 Jan 2019 15:51:36 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2] hw/misc/edu: add msi_uninit() for
 pci_edu_uninit()
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
X-List-Received-Date: Mon, 14 Jan 2019 15:51:56 -0000

On Mon, Jan 14, 2019 at 02:28:39PM +0100, Philippe Mathieu-Daud=E9 wrote:
> Cc'ing qemu-trivial
>=20
> On 1/14/19 2:10 PM, Fei Li wrote:
> > From: Fei Li <shirley17fei@gmail.com>
> >=20
> > Let's supplement the msi_uninit() when failing to realize
> > the pci edu device.
> >=20
> > Reported-by: Markus Armbruster <armbru@redhat.com>
> > Signed-off-by: Fei Li <shirley17fei@gmail.com>
> > Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> > Reviewed-by: Philippe Mathieu-Daud=E9 <philmd@redhat.com>
> > Reviewed-by: Peter Xu <peterx@redhat.com>
> > ---
> >  hw/misc/edu.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/hw/misc/edu.c b/hw/misc/edu.c
> > index cdcf550dd7..ceaf688bfb 100644
> > --- a/hw/misc/edu.c
> > +++ b/hw/misc/edu.c
> > @@ -377,6 +377,7 @@ static void pci_edu_uninit(PCIDevice *pdev)
> >      qemu_mutex_destroy(&edu->thr_mutex);
> > =20
> >      timer_del(&edu->dma_timer);
> > +    msi_uninit(pdev);
> >  }
> > =20
> >  static void edu_obj_uint64(Object *obj, Visitor *v, const char *name=
,
> >=20

That's not trivial material IMHO. I put it in my tree for now.

--=20
MST

