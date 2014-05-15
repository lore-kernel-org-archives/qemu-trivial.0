Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WkpP3-0004Pg-Ux
	for mharc-qemu-trivial@gnu.org; Thu, 15 May 2014 02:44:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38448)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WkpOw-0004GL-KA
	for qemu-trivial@nongnu.org; Thu, 15 May 2014 02:44:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WkpOq-0006Yr-GX
	for qemu-trivial@nongnu.org; Thu, 15 May 2014 02:44:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35216)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1WkpOd-0006WT-Un; Thu, 15 May 2014 02:44:04 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4F6i1kE030019
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 15 May 2014 02:44:01 -0400
Received: from redhat.com (ovpn-116-58.ams2.redhat.com [10.36.116.58])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s4F6hwOJ006607; Thu, 15 May 2014 02:43:59 -0400
Date: Thu, 15 May 2014 09:42:54 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20140515064254.GE14456@redhat.com>
References: <20140514200030.E7E842F456@mono.eik.bme.hu>
	<1400136137.2922.16.camel@nilsson.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1400136137.2922.16.camel@nilsson.home.kraxel.org>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>
Subject: Re: [Qemu-trivial] [PATCH v3] serial-pci: Set prog interface field
 of pci config to 16550 compatible
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
X-List-Received-Date: Thu, 15 May 2014 06:44:28 -0000

On Thu, May 15, 2014 at 08:42:17AM +0200, Gerd Hoffmann wrote:
> On Do, 2014-02-27 at 02:05 +0100, BALATON Zoltan wrote:
>        ^^^^^^^^^^
> Looks like your clock is _way_ off.
> 
> > +    if (!pci->compat) {
> > +        pci->dev.config[PCI_CLASS_PROG] = 0x02; /* 16550 compatible */
> > +    }
> 
> >  static Property serial_pci_properties[] = {
> >      DEFINE_PROP_CHR("chardev",  PCISerialState, state.chr),
> > +    DEFINE_PROP_UINT8("compat",  PCISerialState, compat, 0),
> >      DEFINE_PROP_END_OF_LIST(),
> >  };
> 
> > +        {\
> > +            .driver   = "pci-serial",\
> > +            .property = "compat",\
> > +            .value    = stringify(1),\
> > +        },\
> 
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> 
> mst, do you take that through the pci tree?
> 
> cheers,
>   Gerd
> 

Yes but I'd like the property renamed. Agree?


