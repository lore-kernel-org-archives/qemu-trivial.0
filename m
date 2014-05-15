Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WkpYI-0002ka-70
	for mharc-qemu-trivial@gnu.org; Thu, 15 May 2014 02:54:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40942)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WkpYA-0002bD-OH
	for qemu-trivial@nongnu.org; Thu, 15 May 2014 02:54:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1WkpY4-0001nB-Dm
	for qemu-trivial@nongnu.org; Thu, 15 May 2014 02:53:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:63735)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>)
	id 1WkpXr-0001jN-J1; Thu, 15 May 2014 02:53:35 -0400
Received: from int-mx01.intmail.prod.int.phx2.redhat.com
	(int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s4F6rXx9016554
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Thu, 15 May 2014 02:53:33 -0400
Received: from [10.36.116.41] (ovpn-116-41.ams2.redhat.com [10.36.116.41])
	by int-mx01.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id s4F6rUnR014641; Thu, 15 May 2014 02:53:31 -0400
Message-ID: <1400136809.2922.23.camel@nilsson.home.kraxel.org>
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Date: Thu, 15 May 2014 08:53:29 +0200
In-Reply-To: <20140515064254.GE14456@redhat.com>
References: <20140514200030.E7E842F456@mono.eik.bme.hu>
	<1400136137.2922.16.camel@nilsson.home.kraxel.org>
	<20140515064254.GE14456@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.11
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
X-List-Received-Date: Thu, 15 May 2014 06:54:01 -0000

> > >  static Property serial_pci_properties[] = {
> > >      DEFINE_PROP_CHR("chardev",  PCISerialState, state.chr),
> > > +    DEFINE_PROP_UINT8("compat",  PCISerialState, compat, 0),
> > >      DEFINE_PROP_END_OF_LIST(),
> > >  };
> > 
> > mst, do you take that through the pci tree?
> > 
> > cheers,
> >   Gerd
> > 
> 
> Yes but I'd like the property renamed. Agree?

Yes, something more descriptive is reasonable.

cheers,
  Gerd



