Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XKo2k-0003Bk-Oc
	for mharc-qemu-trivial@gnu.org; Fri, 22 Aug 2014 08:34:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XKo2e-00032T-5x
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 08:34:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XKo2T-0002PD-93
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 08:34:04 -0400
Received: from mail-lb0-f174.google.com ([209.85.217.174]:63844)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.crosthwaite@petalogix.com>) id 1XKo2S-0002Om-VA
	for qemu-trivial@nongnu.org; Fri, 22 Aug 2014 08:33:53 -0400
Received: by mail-lb0-f174.google.com with SMTP id c11so9356631lbj.19
	for <qemu-trivial@nongnu.org>; Fri, 22 Aug 2014 05:33:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=+HAwno/FYESnksTwIFtOLvaKK4SgNjFe1hp9U86cGQg=;
	b=BLtVlVB1TMHtNsI1W4sUoP7Gf8PgEJbjnN2LKatrVNfaUPta4t2dlxPupAveNo36Rd
	SrV3Ggu0Re+0kv6IwZU2QF5yVlSl9bViLWtdyzShW2ppfP4DiW3ObhuUzMQdNCEmualq
	ZQAyldlmYYZCY3mzE69no1ZIKr5bU3QJsdO2Y68gh7TFxbCpaVAnkyW43U0yVYuxK/L5
	CprY2swD5g0KawoObydFxfUjZ7a3Rpz2nPKZb3p2k1KdCXRwuUM9IxsMAY+plBxYHwsv
	Km2K5ytmdXr0Cjn7E6E71DvA34lJvIBEFCgIVMeWLyLzKb3dn9xJsOL0KOMNjrfnSw61
	lFsA==
X-Gm-Message-State: ALoCoQk87GlgbT9b3xpwSUhD1cgdmObaEAi2sUnYPDceZ/cd6M8U+hIPp4hbY9IzrTyJLJqe0QUS
MIME-Version: 1.0
X-Received: by 10.152.203.232 with SMTP id kt8mr4401039lac.27.1408710831959;
	Fri, 22 Aug 2014 05:33:51 -0700 (PDT)
Sender: peter.crosthwaite@petalogix.com
Received: by 10.25.133.6 with HTTP; Fri, 22 Aug 2014 05:33:51 -0700 (PDT)
In-Reply-To: <1408678700-8284-1-git-send-email-arei.gonglei@huawei.com>
References: <1408678700-8284-1-git-send-email-arei.gonglei@huawei.com>
Date: Fri, 22 Aug 2014 22:33:51 +1000
X-Google-Sender-Auth: T8AlE5DeYN33IiwDv6eg88qmbcs
Message-ID: <CAEgOgz7vNoAcMP8jiT_YKeSZOULzNQOf_KTLaQubzU4GW0PWrQ@mail.gmail.com>
From: Peter Crosthwaite <peter.crosthwaite@xilinx.com>
To: gonglei <arei.gonglei@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.174
Cc: qemu-trivial <qemu-trivial@nongnu.org>,
	"Huangweidong \(C\)" <weidong.huang@huawei.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
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
X-List-Received-Date: Fri, 22 Aug 2014 12:34:08 -0000

On Fri, Aug 22, 2014 at 1:38 PM,  <arei.gonglei@huawei.com> wrote:
> From: Gonglei <arei.gonglei@huawei.com>
>
> Steps:
>
> 1.enable qemu debug print, using simply scprit as below:
>  grep "//#define DEBUG" * -rl | xargs sed -i "s/\/\/#define DEBUG/#define DEBUG/g"
> 2. make -j
> 3. get some warning:
> hw/i2c/pm_smbus.c: In function 'smb_ioport_writeb':
> hw/i2c/pm_smbus.c:142: warning: format '%04x' expects type 'unsigned int', but argument 2 has type 'hwaddr'
> hw/i2c/pm_smbus.c:142: warning: format '%02x' expects type 'unsigned int', but argument 3 has type 'uint64_t'
> hw/i2c/pm_smbus.c: In function 'smb_ioport_readb':
> hw/i2c/pm_smbus.c:209: warning: format '%04x' expects type 'unsigned int', but argument 2 has type 'hwaddr'
> hw/intc/i8259.c: In function 'pic_ioport_read':
> hw/intc/i8259.c:373: warning: format '%02x' expects type 'unsigned int', but argument 2 has type 'hwaddr'
> hw/input/pckbd.c: In function 'kbd_write_command':
> hw/input/pckbd.c:232: warning: format '%02x' expects type 'unsigned int', but argument 2 has type 'uint64_t'
> hw/input/pckbd.c: In function 'kbd_write_data':
> hw/input/pckbd.c:333: warning: format '%02x' expects type 'unsigned int', but argument 2 has type 'uint64_t'
> hw/isa/apm.c: In function 'apm_ioport_writeb':
> hw/isa/apm.c:44: warning: format '%x' expects type 'unsigned int', but argument 2 has type 'hwaddr'
> hw/isa/apm.c:44: warning: format '%02x' expects type 'unsigned int', but argument 3 has type 'uint64_t'
> hw/isa/apm.c: In function 'apm_ioport_readb':
> hw/isa/apm.c:67: warning: format '%x' expects type 'unsigned int', but argument 2 has type 'hwaddr'
> hw/timer/mc146818rtc.c: In function 'cmos_ioport_write':
> hw/timer/mc146818rtc.c:394: warning: format '%02x' expects type 'unsigned int', but argument 3 has type 'uint64_t'
> hw/i386/pc.c: In function 'port92_write':
> hw/i386/pc.c:479: warning: format '%02x' expects type 'unsigned int', but argument 2 has type 'uint64_t'
>
> Fix them.
>
> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  BTW,
>  I have posted three patches for some module which broke QEMU compling in the same way.
>  [PATCH v2] scsi-generic: remove superfluous DPRINTF avoid to break compiling
>  [PATCH v2] monitor: fix debug print compiling error
>  [PATCH] xhci: fix debug print compiling error
>
> And I think this one and above "monitor.." can be included in trivial branch.
> Thanks.
> ---
>  hw/i2c/pm_smbus.c      | 5 +++--
>  hw/i386/pc.c           | 2 +-
>  hw/input/pckbd.c       | 4 ++--
>  hw/intc/i8259.c        | 2 +-
>  hw/isa/apm.c           | 5 +++--
>  hw/timer/mc146818rtc.c | 2 +-
>  6 files changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/hw/i2c/pm_smbus.c b/hw/i2c/pm_smbus.c
> index fedb5fb..98eb71f 100644
> --- a/hw/i2c/pm_smbus.c
> +++ b/hw/i2c/pm_smbus.c
> @@ -139,7 +139,8 @@ static void smb_ioport_writeb(void *opaque, hwaddr addr, uint64_t val,
>  {
>      PMSMBus *s = opaque;
>
> -    SMBUS_DPRINTF("SMB writeb port=0x%04x val=0x%02x\n", addr, val);
> +    SMBUS_DPRINTF("SMB writeb port=0x%04" PRIx64
> +                  " val=0x%02" PRIx64 "\n", addr, val);

HWADDR_PRI here and below.

Regards,
Peter

>      switch(addr) {
>      case SMBHSTSTS:
>          s->smb_stat = (~(val & 0xff)) & s->smb_stat;
> @@ -206,7 +207,7 @@ static uint64_t smb_ioport_readb(void *opaque, hwaddr addr, unsigned width)
>          val = 0;
>          break;
>      }
> -    SMBUS_DPRINTF("SMB readb port=0x%04x val=0x%02x\n", addr, val);
> +    SMBUS_DPRINTF("SMB readb port=0x%04" PRIx64 " val=0x%02x\n", addr, val);
>      return val;
>  }
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 8fa8d2f..0b1ab1f 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -476,7 +476,7 @@ static void port92_write(void *opaque, hwaddr addr, uint64_t val,
>      Port92State *s = opaque;
>      int oldval = s->outport;
>
> -    DPRINTF("port92: write 0x%02x\n", val);
> +    DPRINTF("port92: write 0x%02" PRIx64 "\n", val);
>      s->outport = val;
>      qemu_set_irq(*s->a20_out, (val >> 1) & 1);
>      if ((val & 1) && !(oldval & 1)) {
> diff --git a/hw/input/pckbd.c b/hw/input/pckbd.c
> index ca1cffc..2ab8c87 100644
> --- a/hw/input/pckbd.c
> +++ b/hw/input/pckbd.c
> @@ -229,7 +229,7 @@ static void kbd_write_command(void *opaque, hwaddr addr,
>  {
>      KBDState *s = opaque;
>
> -    DPRINTF("kbd: write cmd=0x%02x\n", val);
> +    DPRINTF("kbd: write cmd=0x%02" PRIx64 "\n", val);
>
>      /* Bits 3-0 of the output port P2 of the keyboard controller may be pulsed
>       * low for approximately 6 micro seconds. Bits 3-0 of the KBD_CCMD_PULSE
> @@ -330,7 +330,7 @@ static void kbd_write_data(void *opaque, hwaddr addr,
>  {
>      KBDState *s = opaque;
>
> -    DPRINTF("kbd: write data=0x%02x\n", val);
> +    DPRINTF("kbd: write data=0x%02" PRIx64 "\n", val);
>
>      switch(s->write_cmd) {
>      case 0:
> diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
> index a563b82..3a62e33 100644
> --- a/hw/intc/i8259.c
> +++ b/hw/intc/i8259.c
> @@ -370,7 +370,7 @@ static uint64_t pic_ioport_read(void *opaque, hwaddr addr,
>              ret = s->imr;
>          }
>      }
> -    DPRINTF("read: addr=0x%02x val=0x%02x\n", addr, ret);
> +    DPRINTF("read: addr=0x%02" PRIx64 " val=0x%02x\n", addr, ret);
>      return ret;
>  }
>
> diff --git a/hw/isa/apm.c b/hw/isa/apm.c
> index 054d529..8f60cb0 100644
> --- a/hw/isa/apm.c
> +++ b/hw/isa/apm.c
> @@ -41,7 +41,8 @@ static void apm_ioport_writeb(void *opaque, hwaddr addr, uint64_t val,
>  {
>      APMState *apm = opaque;
>      addr &= 1;
> -    APM_DPRINTF("apm_ioport_writeb addr=0x%x val=0x%02x\n", addr, val);
> +    APM_DPRINTF("apm_ioport_writeb addr=0x%" PRIx64
> +                " val=0x%02" PRIx64 "\n", addr, val);
>      if (addr == 0) {
>          apm->apmc = val;
>
> @@ -64,7 +65,7 @@ static uint64_t apm_ioport_readb(void *opaque, hwaddr addr, unsigned size)
>      } else {
>          val = apm->apms;
>      }
> -    APM_DPRINTF("apm_ioport_readb addr=0x%x val=0x%02x\n", addr, val);
> +    APM_DPRINTF("apm_ioport_readb addr=0x%" PRIx64 " val=0x%02x\n", addr, val);
>      return val;
>  }
>
> diff --git a/hw/timer/mc146818rtc.c b/hw/timer/mc146818rtc.c
> index 233fc70..340dd92 100644
> --- a/hw/timer/mc146818rtc.c
> +++ b/hw/timer/mc146818rtc.c
> @@ -391,7 +391,7 @@ static void cmos_ioport_write(void *opaque, hwaddr addr,
>      if ((addr & 1) == 0) {
>          s->cmos_index = data & 0x7f;
>      } else {
> -        CMOS_DPRINTF("cmos: write index=0x%02x val=0x%02x\n",
> +        CMOS_DPRINTF("cmos: write index=0x%02x val=0x%02" PRIx64 "\n",
>                       s->cmos_index, data);
>          switch(s->cmos_index) {
>          case RTC_SECONDS_ALARM:
> --
> 1.7.12.4
>
>
>

