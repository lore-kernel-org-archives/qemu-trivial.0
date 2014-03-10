Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WN82E-0005Il-I3
	for mharc-qemu-trivial@gnu.org; Mon, 10 Mar 2014 17:46:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33795)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WN827-00057y-Ve
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 17:46:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1WN822-0002U9-PO
	for qemu-trivial@nongnu.org; Mon, 10 Mar 2014 17:46:51 -0400
Received: from mx1.redhat.com ([209.132.183.28]:63400)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1WN81s-0002Sl-QF; Mon, 10 Mar 2014 17:46:37 -0400
Received: from int-mx12.intmail.prod.int.phx2.redhat.com
	(int-mx12.intmail.prod.int.phx2.redhat.com [10.5.11.25])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s2ALkYAm014646
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Mon, 10 Mar 2014 17:46:34 -0400
Received: from redhat.com (vpn1-5-84.ams2.redhat.com [10.36.5.84])
	by int-mx12.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id s2ALkV9A007546; Mon, 10 Mar 2014 17:46:32 -0400
Date: Mon, 10 Mar 2014 23:46:36 +0200
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Stefan Weil <sw@weilnetz.de>
Message-ID: <20140310214636.GA5202@redhat.com>
References: <1394478649-9453-1-git-send-email-peter.maydell@linaro.org>
	<1394478649-9453-4-git-send-email-peter.maydell@linaro.org>
	<531E1A7C.3010706@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <531E1A7C.3010706@weilnetz.de>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.25
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-ppc@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 03/12] hw/pci/pci_host.c:
 Avoid shifting left into sign bit
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
X-List-Received-Date: Mon, 10 Mar 2014 21:46:57 -0000

On Mon, Mar 10, 2014 at 09:03:08PM +0100, Stefan Weil wrote:
> Am 10.03.2014 20:10, schrieb Peter Maydell:
> > Add U suffix to avoid undefined behaviour.
> > 
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >  hw/pci/pci_host.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
> > index 77c7d1f..2c17916 100644
> > --- a/hw/pci/pci_host.c
> > +++ b/hw/pci/pci_host.c
> > @@ -142,8 +142,9 @@ static uint64_t pci_host_data_read(void *opaque,
> >  {
> >      PCIHostState *s = opaque;
> >      uint32_t val;
> > -    if (!(s->config_reg & (1 << 31)))
> > +    if (!(s->config_reg & (1u << 31))) {
> >          return 0xffffffff;
> 
> I suggest fixing that 0xffffffff, too. Do we expect here a 32 bit value
> (-1) which is expanded to a 64 bit value? Then 0xffffffffffffffffULL
> would be correct. Otherwise 0xffffffffU is clearer.

Hmm why is this clearer?  The spec says:

	The type of an integer constant is the first of the corresponding list
	in which its value can be represented.

Basically 0x<anything> is always a positive value and when cast to
uint64_t is not sign extended.


> Michael, are 8 byte reads possible here? If yes, the current code is wrong.

AFAIK they aren't possible on any platform we support.
So since we discard high bits 0 seems cleaner.

> > +    }
> >      val = pci_data_read(s->bus, s->config_reg | (addr & 3), len);
> >      PCI_DPRINTF("read addr " TARGET_FMT_plx " len %d val %x\n",
> >                  addr, len, val);
> > 
> 
> What about using the BIT macro from qemu/bitops.h? I think that BIT(31)
> looks better than (1u << 31).
> 
> Stefan

I slightly prefer 1u << 31 personally, standard C as opposed to qemu macros.


-- 
MST

