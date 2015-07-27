Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZJpQW-0002Dx-IY
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jul 2015 16:55:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ZJpQT-00029h-S5
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 16:55:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mst@redhat.com>) id 1ZJpQS-00046Y-UK
	for qemu-trivial@nongnu.org; Mon, 27 Jul 2015 16:55:09 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50645)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mst@redhat.com>)
	id 1ZJpQO-0003j1-3A; Mon, 27 Jul 2015 16:55:04 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 33B8F8EA45;
	Mon, 27 Jul 2015 20:55:03 +0000 (UTC)
Received: from redhat.com (ovpn-116-20.ams2.redhat.com [10.36.116.20])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with SMTP
	id t6RKsxJU018638; Mon, 27 Jul 2015 16:55:00 -0400
Date: Mon, 27 Jul 2015 23:54:59 +0300
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <20150727235416-mutt-send-email-mst@redhat.com>
References: <cover.1438026619.git.mjt@msgid.tls.msk.ru>
	<be66680e8320d612f1c96096a217e642e458f47b.1438026619.git.mjt@msgid.tls.msk.ru>
	<20150727234906-mutt-send-email-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150727234906-mutt-send-email-mst@redhat.com>
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Subject: Re: [Qemu-trivial] [PULL 01/10] hw/acpi/ich9: clear smi_en on reset
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
X-List-Received-Date: Mon, 27 Jul 2015 20:55:10 -0000

On Mon, Jul 27, 2015 at 11:50:08PM +0300, Michael S. Tsirkin wrote:
> On Mon, Jul 27, 2015 at 10:54:04PM +0300, Michael Tokarev wrote:
> > From: Laszlo Ersek <lersek@redhat.com>
> > 
> > Otherwise on reboot firmware might think (due to APMC_EN remaining set
> > from the previous boot) that SMI support is absent.
> > 
> > Cc: "Michael S. Tsirkin" <mst@redhat.com>
> > Cc: Igor Mammedov <imammedo@redhat.com>
> > Cc: Gerd Hoffmann <kraxel@redhat.com>
> > Cc: Paolo Bonzini <pbonzini@redhat.com>
> > Cc: qemu-trivial@nongnu.org
> > Signed-off-by: Laszlo Ersek <lersek@redhat.com>
> > Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> > Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> 
> 
> Confused.  Why are you merging these patches through your tree?
> I was preparing a pull request myself, while likely git
> will figure it out fine, this commit will appear twice in
> history and it's kind of messy.
> 
> I guess I could drop this - but it's more work ...
> 

Oh I see it's because Laszlo said in the cover letter
they are trivial. Never mind.

> > ---
> >  hw/acpi/ich9.c | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/hw/acpi/ich9.c b/hw/acpi/ich9.c
> > index f04f6dc..8da5a2d 100644
> > --- a/hw/acpi/ich9.c
> > +++ b/hw/acpi/ich9.c
> > @@ -221,6 +221,7 @@ static void pm_reset(void *opaque)
> >      acpi_pm_tmr_reset(&pm->acpi_regs);
> >      acpi_gpe_reset(&pm->acpi_regs);
> >  
> > +    pm->smi_en = 0;
> >      if (!pm->smm_enabled) {
> >          /* Mark SMM as already inited to prevent SMM from running. KVM does not
> >           * support SMM mode. */
> > -- 
> > 2.1.4

