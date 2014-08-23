Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XLBxz-0004Eg-Sr
	for mharc-qemu-trivial@gnu.org; Sat, 23 Aug 2014 10:06:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52568)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@hotmail.com>) id 1XL3HW-0007e7-9u
	for qemu-trivial@nongnu.org; Sat, 23 Aug 2014 00:50:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@hotmail.com>) id 1XL3HQ-0002dZ-7Q
	for qemu-trivial@nongnu.org; Sat, 23 Aug 2014 00:50:26 -0400
Received: from blu004-omc2s13.hotmail.com ([65.55.111.88]:64491)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@hotmail.com>)
	id 1XL3HD-0002QG-Aw; Sat, 23 Aug 2014 00:50:07 -0400
Received: from BLU436-SMTP144 ([65.55.111.72]) by BLU004-OMC2S13.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(7.5.7601.22712);
	Fri, 22 Aug 2014 21:50:06 -0700
X-TMN: [Rv640+EKri97ePEViROxmYBROSFWz2PL]
X-Originating-Email: [arei.gonglei@hotmail.com]
Message-ID: <BLU436-SMTP144B331AC7F0EC4AB6E88739FD10@phx.gbl>
Received: from AreiPC ([58.100.191.250]) by BLU436-SMTP144.smtp.hotmail.com
	over TLS secured channel with Microsoft SMTPSVC(8.0.9200.16384);
	Fri, 22 Aug 2014 21:50:04 -0700
From: Gonglei <arei.gonglei@hotmail.com>
To: "'Peter Crosthwaite'" <peter.crosthwaite@xilinx.com>,
	"'gonglei'" <arei.gonglei@huawei.com>
References: <1408678700-8284-1-git-send-email-arei.gonglei@huawei.com>
	<CAEgOgz7vNoAcMP8jiT_YKeSZOULzNQOf_KTLaQubzU4GW0PWrQ@mail.gmail.com>
In-Reply-To: <CAEgOgz7vNoAcMP8jiT_YKeSZOULzNQOf_KTLaQubzU4GW0PWrQ@mail.gmail.com>
Date: Sat, 23 Aug 2014 12:49:30 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: Ac++BX0Z9CirmDvvSy6wC9aqkTc9dwAh+xOg
Content-Language: zh-cn
X-OriginalArrivalTime: 23 Aug 2014 04:50:04.0951 (UTC)
	FILETIME=[B4C50270:01CFBE8D]
X-detected-operating-system: by eggs.gnu.org: Windows 7 or 8 [fuzzy]
X-Received-From: 65.55.111.88
X-Mailman-Approved-At: Sat, 23 Aug 2014 10:06:50 -0400
Cc: 'qemu-trivial' <qemu-trivial@nongnu.org>,
	"'Huangweidong \(C\)'" <weidong.huang@huawei.com>, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH trivial] Fix debug print
	warning
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
X-List-Received-Date: Sat, 23 Aug 2014 04:50:32 -0000

> Subject: Re: [Qemu-devel] [PATCH trivial] Fix debug print warning
>=20
> On Fri, Aug 22, 2014 at 1:38 PM,  <arei.gonglei@huawei.com> wrote:
> > From: Gonglei <arei.gonglei@huawei.com>
> >
> > Steps:
> >
> > 1.enable qemu debug print, using simply scprit as below:
> >  grep "//#define DEBUG" * -rl | xargs sed -i "s/\/\/#define =
DEBUG/#define
> DEBUG/g"
> > 2. make -j
> > 3. get some warning:
> > hw/i2c/pm_smbus.c: In function 'smb_ioport_writeb':
> > hw/i2c/pm_smbus.c:142: warning: format '%04x' expects type 'unsigned =
int',
> but argument 2 has type 'hwaddr'
> > hw/i2c/pm_smbus.c:142: warning: format '%02x' expects type 'unsigned =
int',
> but argument 3 has type 'uint64_t'
> > hw/i2c/pm_smbus.c: In function 'smb_ioport_readb':
> > hw/i2c/pm_smbus.c:209: warning: format '%04x' expects type 'unsigned =
int',
> but argument 2 has type 'hwaddr'
> > hw/intc/i8259.c: In function 'pic_ioport_read':
> > hw/intc/i8259.c:373: warning: format '%02x' expects type 'unsigned =
int', but
> argument 2 has type 'hwaddr'
> > hw/input/pckbd.c: In function 'kbd_write_command':
> > hw/input/pckbd.c:232: warning: format '%02x' expects type 'unsigned =
int',
> but argument 2 has type 'uint64_t'
> > hw/input/pckbd.c: In function 'kbd_write_data':
> > hw/input/pckbd.c:333: warning: format '%02x' expects type 'unsigned =
int',
> but argument 2 has type 'uint64_t'
> > hw/isa/apm.c: In function 'apm_ioport_writeb':
> > hw/isa/apm.c:44: warning: format '%x' expects type 'unsigned int', =
but
> argument 2 has type 'hwaddr'
> > hw/isa/apm.c:44: warning: format '%02x' expects type 'unsigned int', =
but
> argument 3 has type 'uint64_t'
> > hw/isa/apm.c: In function 'apm_ioport_readb':
> > hw/isa/apm.c:67: warning: format '%x' expects type 'unsigned int', =
but
> argument 2 has type 'hwaddr'
> > hw/timer/mc146818rtc.c: In function 'cmos_ioport_write':
> > hw/timer/mc146818rtc.c:394: warning: format '%02x' expects type =
'unsigned
> int', but argument 3 has type 'uint64_t'
> > hw/i386/pc.c: In function 'port92_write':
> > hw/i386/pc.c:479: warning: format '%02x' expects type 'unsigned =
int', but
> argument 2 has type 'uint64_t'
> >
> > Fix them.
> >
> > Cc: qemu-trivial@nongnu.org
> > Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> > ---
> >  BTW,
> >  I have posted three patches for some module which broke QEMU =
compling
> in the same way.
> >  [PATCH v2] scsi-generic: remove superfluous DPRINTF avoid to break
> compiling
> >  [PATCH v2] monitor: fix debug print compiling error
> >  [PATCH] xhci: fix debug print compiling error
> >
> > And I think this one and above "monitor.." can be included in =
trivial branch.
> > Thanks.
> > ---
> >  hw/i2c/pm_smbus.c      | 5 +++--
> >  hw/i386/pc.c           | 2 +-
> >  hw/input/pckbd.c       | 4 ++--
> >  hw/intc/i8259.c        | 2 +-
> >  hw/isa/apm.c           | 5 +++--
> >  hw/timer/mc146818rtc.c | 2 +-
> >  6 files changed, 11 insertions(+), 9 deletions(-)
> >
> > diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
> > index fedb5fb..98eb71f 100644
> > --- a/hw/i2c/pm_smbus.c
> > +++ b/hw/i2c/pm_smbus.c
> > @@ -139,7 +139,8 @@ static void smb_ioport_writeb(void *opaque, =
hwaddr
> addr, uint64_t val,
> >  {
> >      PMSMBus *s =3D opaque;
> >
> > -    SMBUS_DPRINTF("SMB writeb port=3D0x%04x val=3D0x%02x\n", addr, =
val);
> > +    SMBUS_DPRINTF("SMB writeb port=3D0x%04" PRIx64
> > +                  " val=3D0x%02" PRIx64 "\n", addr, val);
>=20
> HWADDR_PRI here and below.
>=20
Got it. Thanks! Peter.

Best regards,
-Gonglei

> Regards,
> Peter
>=20
> >      switch(addr) {
> >      case SMBHSTSTS:
> >          s->smb_stat =3D (~(val & 0xff)) & s->smb_stat;
> > @@ -206,7 +207,7 @@ static uint64_t smb_ioport_readb(void *opaque,
> hwaddr addr, unsigned width)
> >          val =3D 0;
> >          break;
> >      }
> > -    SMBUS_DPRINTF("SMB readb port=3D0x%04x val=3D0x%02x\n", addr, =
val);
> > +    SMBUS_DPRINTF("SMB readb port=3D0x%04" PRIx64 " =
val=3D0x%02x\n",
> addr, val);
> >      return val;
> >  }
> >
> > diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> > index 8fa8d2f..0b1ab1f 100644
> > --- a/hw/i386/pc.c
> > +++ b/hw/i386/pc.c
> > @@ -476,7 +476,7 @@ static void port92_write(void *opaque, hwaddr =
addr,
> uint64_t val,
> >      Port92State *s =3D opaque;
> >      int oldval =3D s->outport;
> >
> > -    DPRINTF("port92: write 0x%02x\n", val);
> > +    DPRINTF("port92: write 0x%02" PRIx64 "\n", val);
> >      s->outport =3D val;
> >      qemu_set_irq(*s->a20_out, (val >> 1) & 1);
> >      if ((val & 1) && !(oldval & 1)) {
> > diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> > index ca1cffc..2ab8c87 100644
> > --- a/hw/input/pckbd.c
> > +++ b/hw/input/pckbd.c
> > @@ -229,7 +229,7 @@ static void kbd_write_command(void *opaque,
> hwaddr addr,
> >  {
> >      KBDState *s =3D opaque;
> >
> > -    DPRINTF("kbd: write cmd=3D0x%02x\n", val);
> > +    DPRINTF("kbd: write cmd=3D0x%02" PRIx64 "\n", val);
> >
> >      /* Bits 3-0 of the output port P2 of the keyboard controller =
may be
> pulsed
> >       * low for approximately 6 micro seconds. Bits 3-0 of the
> KBD_CCMD_PULSE
> > @@ -330,7 +330,7 @@ static void kbd_write_data(void *opaque, hwaddr
> addr,
> >  {
> >      KBDState *s =3D opaque;
> >
> > -    DPRINTF("kbd: write data=3D0x%02x\n", val);
> > +    DPRINTF("kbd: write data=3D0x%02" PRIx64 "\n", val);
> >
> >      switch(s->write_cmd) {
> >      case 0:
> > diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> > index a563b82..3a62e33 100644
> > --- a/hw/intc/i8259.c
> > +++ b/hw/intc/i8259.c
> > @@ -370,7 +370,7 @@ static uint64_t pic_ioport_read(void *opaque,
> hwaddr addr,
> >              ret =3D s->imr;
> >          }
> >      }
> > -    DPRINTF("read: addr=3D0x%02x val=3D0x%02x\n", addr, ret);
> > +    DPRINTF("read: addr=3D0x%02" PRIx64 " val=3D0x%02x\n", addr, =
ret);
> >      return ret;
> >  }
> >
> > diff --git a/hw/isa/apm.c b/hw/isa/apm.c
> > index 054d529..8f60cb0 100644
> > --- a/hw/isa/apm.c
> > +++ b/hw/isa/apm.c
> > @@ -41,7 +41,8 @@ static void apm_ioport_writeb(void *opaque, hwaddr
> addr, uint64_t val,
> >  {
> >      APMState *apm =3D opaque;
> >      addr &=3D 1;
> > -    APM_DPRINTF("apm_ioport_writeb addr=3D0x%x val=3D0x%02x\n", =
addr,
> val);
> > +    APM_DPRINTF("apm_ioport_writeb addr=3D0x%" PRIx64
> > +                " val=3D0x%02" PRIx64 "\n", addr, val);
> >      if (addr =3D=3D 0) {
> >          apm->apmc =3D val;
> >
> > @@ -64,7 +65,7 @@ static uint64_t apm_ioport_readb(void *opaque,
> hwaddr addr, unsigned size)
> >      } else {
> >          val =3D apm->apms;
> >      }
> > -    APM_DPRINTF("apm_ioport_readb addr=3D0x%x val=3D0x%02x\n", =
addr,
> val);
> > +    APM_DPRINTF("apm_ioport_readb addr=3D0x%" PRIx64 " =
val=3D0x%02x\n",
> addr, val);
> >      return val;
> >  }
> >
> > diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c
> > index 233fc70..340dd92 100644
> > --- a/hw/timer/mc146818rtc.c
> > +++ b/hw/timer/mc146818rtc.c
> > @@ -391,7 +391,7 @@ static void cmos_ioport_write(void *opaque, =
hwaddr
> addr,
> >      if ((addr & 1) =3D=3D 0) {
> >          s->cmos_index =3D data & 0x7f;
> >      } else {
> > -        CMOS_DPRINTF("cmos: write index=3D0x%02x val=3D0x%02x\n",
> > +        CMOS_DPRINTF("cmos: write index=3D0x%02x val=3D0x%02" =
PRIx64
> "\n",
> >                       s->cmos_index, data);
> >          switch(s->cmos_index) {
> >          case RTC_SECONDS_ALARM:
> > --
> > 1.7.12.4
> >
> >
> >



