Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iHaUd-00075G-EZ
	for mharc-qemu-trivial@gnu.org; Mon, 07 Oct 2019 17:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45511)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ehabkost@redhat.com>) id 1iHaUY-000729-SR
 for qemu-trivial@nongnu.org; Mon, 07 Oct 2019 17:24:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1iHaUX-0002nG-MI
 for qemu-trivial@nongnu.org; Mon, 07 Oct 2019 17:24:30 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45634)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>)
 id 1iHaUN-0002jH-Nb; Mon, 07 Oct 2019 17:24:19 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1D45B85363;
 Mon,  7 Oct 2019 21:24:17 +0000 (UTC)
Received: from localhost (ovpn-116-88.gru2.redhat.com [10.97.116.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2420D6060D;
 Mon,  7 Oct 2019 21:24:08 +0000 (UTC)
Date: Mon, 7 Oct 2019 18:24:06 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Igor Mammedov <imammedo@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH 00/11] hw: Convert various reset() handler to DeviceReset
Message-ID: <20191007212406.GU4084@habkost.net>
References: <20190926151733.25349-1-philmd@redhat.com>
 <20191005174531-mutt-send-email-mst@kernel.org>
 <9a20b4a9-b255-95e9-1e27-94e294e21042@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <9a20b4a9-b255-95e9-1e27-94e294e21042@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Mon, 07 Oct 2019 21:24:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 07 Oct 2019 21:24:32 -0000

On Mon, Oct 07, 2019 at 12:01:54PM +0200, Philippe Mathieu-Daud=E9 wrote:
> Hi Michael,
>=20
> On 10/5/19 11:46 PM, Michael S. Tsirkin wrote:
> > On Thu, Sep 26, 2019 at 05:17:22PM +0200, Philippe Mathieu-Daud=E9 wr=
ote:
> > > Hi.
> > >=20
> > > Following the thread discussion between Peter/Markus/Damien about
> > > reset handlers:
> > > https://www.mail-archive.com/qemu-devel@nongnu.org/msg617103.html
> > > I started to remove qemu_register_reset() calls from few qdevified
> > > devices (the trivial ones).
> > >=20
> > > Regards,
> > >=20
> > > Phil.
> >=20
> > How do you want these patches merged? Trivial tree?
>=20
> I was hoping Eduardo would take them but he is busy and I even forgot t=
o Cc
> him. They might go via Trivial or else via Paolo's Misc...

I can merge them if somebody reviews the series.  How exactly are
we making sure device_reset() is really being called for all
devices touched by this series?  Are all buses guaranteed to be
children of main-system-bus?

>=20
> > > Philippe Mathieu-Daud=E9 (11):
> > >    hw/acpi/piix4: Convert reset handler to DeviceReset
> > >    hw/ide/piix: Convert reset handler to DeviceReset
> > >    hw/isa/piix4: Convert reset handler to DeviceReset
> > >    hw/pci-host/piix: Convert reset handler to DeviceReset
> > >    hw/ide/sii3112: Convert reset handler to DeviceReset
> > >    hw/ide/via82c: Convert reset handler to DeviceReset
> > >    hw/isa/vt82c686: Convert reset handler to DeviceReset
> > >    hw/input/lm832x: Convert reset handler to DeviceReset
> > >    hw/pci-host/bonito: Convert reset handler to DeviceReset
> > >    hw/timer/etraxfs: Convert reset handler to DeviceReset
> > >    hw/misc/vmcoreinfo: Convert reset handler to DeviceReset

--=20
Eduardo

