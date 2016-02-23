Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aYEKh-0002cN-57
	for mharc-qemu-trivial@gnu.org; Tue, 23 Feb 2016 09:52:59 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37138)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zyimin@linux.vnet.ibm.com>) id 1aY6Hn-00085L-6G
	for qemu-trivial@nongnu.org; Tue, 23 Feb 2016 01:17:28 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zyimin@linux.vnet.ibm.com>) id 1aY6Hi-0005iH-6v
	for qemu-trivial@nongnu.org; Tue, 23 Feb 2016 01:17:27 -0500
Received: from e18.ny.us.ibm.com ([129.33.205.208]:42609)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zyimin@linux.vnet.ibm.com>) id 1aY6Hi-0005hx-1i
	for qemu-trivial@nongnu.org; Tue, 23 Feb 2016 01:17:22 -0500
Received: from localhost
	by e18.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <zyimin@linux.vnet.ibm.com>;
	Tue, 23 Feb 2016 01:17:20 -0500
Received: from d01dlp01.pok.ibm.com (9.56.250.166)
	by e18.ny.us.ibm.com (146.89.104.205) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 23 Feb 2016 01:17:18 -0500
X-IBM-Helo: d01dlp01.pok.ibm.com
X-IBM-MailFrom: zyimin@linux.vnet.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
	[9.57.198.24])
	by d01dlp01.pok.ibm.com (Postfix) with ESMTP id 738F838C803B;
	Tue, 23 Feb 2016 01:17:17 -0500 (EST)
Received: from d01av04.pok.ibm.com (d01av04.pok.ibm.com [9.56.224.64])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
	u1N6HHm020709384; Tue, 23 Feb 2016 06:17:17 GMT
Received: from d01av04.pok.ibm.com (localhost [127.0.0.1])
	by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
	u1N6HGFU009361; Tue, 23 Feb 2016 01:17:16 -0500
Received: from oc0525210443 ([9.115.114.98])
	by d01av04.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with ESMTP id
	u1N6HEWf009263; Tue, 23 Feb 2016 01:17:15 -0500
Date: Tue, 23 Feb 2016 14:17:11 +0800
From: Yi Min Zhao <zyimin@linux.vnet.ibm.com>
To: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <20160223141711.277bfb16@oc0525210443>
In-Reply-To: <56CB09DB.7070604@de.ibm.com>
References: <1455895091-7589-1-git-send-email-richard.weiyang@gmail.com>
	<1455895091-7589-3-git-send-email-richard.weiyang@gmail.com>
	<56CB09DB.7070604@de.ibm.com>
X-Mailer: Claws Mail 3.9.0 (GTK+ 2.24.23; x86_64-redhat-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16022306-0045-0000-0000-0000036818A2
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 129.33.205.208
X-Mailman-Approved-At: Tue, 23 Feb 2016 09:52:58 -0500
Cc: qemu-trivial@nongnu.org, Cornelia Huck <cornelia.huck@de.ibm.com>,
	qemu-devel@nongnu.org, Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [Qemu-trivial] [PATCH 2/2] s390x/pci: use PCI_MSIX_FLAGS on
 retrieving the MSIX entries
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
X-List-Received-Date: Tue, 23 Feb 2016 06:17:28 -0000

=E4=BA=8E Mon, 22 Feb 2016 14:15:07 +0100
Christian Borntraeger <borntraeger@de.ibm.com> =E5=86=99=E9=81=93:

> On 02/19/2016 04:18 PM, Wei Yang wrote:
> > Even PCI_CAP_FLAGS has the same value as PCI_MSIX_FLAGS, the later one =
is
> > the more proper on retrieving MSIX entries.
> >=20
> > This patch uses PCI_MSIX_FLAGS to retrieve the MSIX entries.
> >=20
> > Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
> > CC: Cornelia Huck <cornelia.huck@de.ibm.com>
> > CC: Christian Borntraeger <borntraeger@de.ibm.com>
> > ---
> >  hw/s390x/s390-pci-bus.c |    2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
> > index 132588b..9d40039 100644
> > --- a/hw/s390x/s390-pci-bus.c
> > +++ b/hw/s390x/s390-pci-bus.c
> > @@ -523,7 +523,7 @@ static int s390_pcihost_setup_msix(S390PCIBusDevice=
 *pbdev)
> >          return 0;
> >      }
> >=20
> > -    ctrl =3D pci_host_config_read_common(pbdev->pdev, pos + PCI_CAP_FL=
AGS,
> > +    ctrl =3D pci_host_config_read_common(pbdev->pdev, pos + PCI_MSIX_F=
LAGS,
> >               pci_config_size(pbdev->pdev), sizeof(ctrl));
> >      table =3D pci_host_config_read_common(pbdev->pdev, pos + PCI_MSIX_=
TABLE,
> >               pci_config_size(pbdev->pdev), sizeof(table));
> >=20
>=20
> looks sane.
> Yi Min, can you ack/nack?
>=20
>=20

It looks sane to me. A little change.


