Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XEux3-0000vj-8Y
	for mharc-qemu-trivial@gnu.org; Wed, 06 Aug 2014 02:43:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54754)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XEqKj-0008RR-7O
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 21:48:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XEqKc-0008I4-Uz
	for qemu-trivial@nongnu.org; Tue, 05 Aug 2014 21:48:05 -0400
Received: from szxga03-in.huawei.com ([119.145.14.66]:42976)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XEqKb-0008Ei-LC; Tue, 05 Aug 2014 21:47:58 -0400
Received: from 172.24.2.119 (EHLO SZXEMA409-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id ASN49634; Wed, 06 Aug 2014 09:47:34 +0800 (CST)
Received: from SZXEMA503-MBS.china.huawei.com ([169.254.6.21]) by
	SZXEMA409-HUB.china.huawei.com ([10.82.72.41]) with mapi id
	14.03.0158.001; Wed, 6 Aug 2014 09:47:25 +0800
From: "Gonglei (Arei)" <arei.gonglei@huawei.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Thread-Topic: [PATCH v3 for-2.2 0/8] don't use Yoda conditions
Thread-Index: AQHPrVy/DFmftsm/qUqePfpss/2e95vBixMAgAFEyAA=
Date: Wed, 6 Aug 2014 01:47:24 +0000
Message-ID: <33183CC9F5247A488A2544077AF1902086C27807@SZXEMA503-MBS.china.huawei.com>
References: <1406879176-4008-1-git-send-email-arei.gonglei@huawei.com>
	<20140805140256.GA16091@redhat.com>
In-Reply-To: <20140805140256.GA16091@redhat.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-cr-hashedpuzzle: =?us-ascii?Q?LB2w_flLS_0KCC_6J6t_AA5l7A=3D=3D_ABFLIg=3D=3D_AFkqBQ=3D=3D_A?=
	=?us-ascii?B?R0E4cUE9PSBBTUVkRFE9PSBBTnhiWkE9PSBBUTZWeGc9PSBBVDBFQUE9PSBB?=
	=?us-ascii?B?VlN0alE9PSBBWGdKRmc9PSBBWHJQQWc9PSBBYURsNVE9PTsxODtZUUJtQUdF?=
	=?us-ascii?Q?AZQByAGIAZQByAEAAcwB1AHMAZQAuAGQAZQA7AGEAbABpAGcAdQBvAHIAaQB?=
	=?us-ascii?Q?AAGEAbQBhAHoAbwBuAC4AYwBvAG0AOwBhAHIAbQBiAHIAdQBAAHIAZQBkAGg?=
	=?us-ascii?Q?AYQB0AC4AYwBvAG0AOwBhAHYAMQA0ADcANABAAGMAbwBtAHQAdgAuAHIAdQA?=
	=?us-ascii?Q?7AGQAZwBpAGwAYgBlAHIAdABAAHIAZQBkAGgAYQB0AC4AYwBvAG0AOwBkAG0?=
	=?us-ascii?Q?AaQB0AHIAeQBAAGQAYQB5AG4AaQB4AC4AYwBvAG0AOwBlAGIAbABhAGsAZQB?=
	=?us-ascii?Q?AAHIAZQBkAGgAYQB0AC4AYwBvAG0AOwBpAG0AYQBtAG0AZQBkAG8AQAByAGU?=
	=?us-ascii?Q?AZABoAGEAdAAuAGMAbwBtADsAawByAGEAeABlAGwAQAByAGUAZABoAGEAdAA?=
	=?us-ascii?Q?uAGMAbwBtADsAbABjAGEAcABpAHQAdQBsAGkAbgBvAEAAcgBlAGQAaABhAHQ?=
	=?us-ascii?Q?ALgBjAG8AbQA7AG0AYQByAGMAZQBsAC4AYQBAAHIAZQBkAGgAYQB0AC4AYwB?=
	=?us-ascii?Q?vAG0AOwBtAHMAdABAAHIAZQBkAGgAYQB0AC4AYwBvAG0AOwBwAGIAbwBuAHo?=
	=?us-ascii?Q?AaQBuAGkAQAByAGUAZABoAGEAdAAuAGMAbwBtADsAcABlAHQAZQByAC4AYwB?=
	=?us-ascii?Q?yAG8AcwB0AGgAdwBhAGkAdABlAEAAeABpAGwAaQBuAHgALgBjAG8AbQA7AHA?=
	=?us-ascii?Q?AZQB0AGUAcgAuAG0AYQB5AGQAZQBsAGwAQABsAGkAbgBhAHIAbwAuAG8AcgB?=
	=?us-ascii?Q?nADsAcQBlAG0AdQAtAGQAZQB2AGUAbABAAG4AbwBuAGcAbgB1AC4AbwByAGc?=
	=?us-ascii?Q?AOwBxAGUAbQB1AC0AdAByAGkAdgBpAGEAbABAAG4AbwBuAGcAbgB1AC4AbwB?=
	=?us-ascii?Q?yAGcAOwBzAHQAZQBmAGEAbgBoAGEAQAByAGUAZABoAGEAdAAuAGMAbwBtAA?=
	=?us-ascii?Q?=3D=3D; Sosha1=5Fv1; 7;
	{F13F11E4-04A2-4DE3-821F-CF6C5819166F}; ?=
	=?us-ascii?Q?YQByAGUAaQAuAGcAbwBuAGcAbABlAGkAQABoAHUAYQB3AGUAaQAuAGMAbwBt?=
	=?us-ascii?Q?AA=3D=3D; Wed,_06_Aug_2014_01:46:52_GMT;
	UgBFADoAIABbAFAAQQBUA?=
	=?us-ascii?Q?EMASAAgAHYAMwAgAGYAbwByAC0AMgAuADIAIAAwAC8AOABdACAAZABvAG4AJ?=
	=?us-ascii?Q?wB0ACAAdQBzAGUAIABZAG8AZABhACAAYwBvAG4AZABpAHQAaQBvAG4AcwA?=
	=?us-ascii?Q?=3D?=
x-cr-puzzleid: {F13F11E4-04A2-4DE3-821F-CF6C5819166F}
x-originating-ip: [10.177.19.102]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020204.53E18938.00CF,ss=1,re=0.000,fgs=0,
	ip=169.254.6.21, so=2013-05-26 15:14:31,
	dmn=2011-05-27 18:58:46
X-Mirapoint-Loop-Id: 85644c562ef40713cdbb50bc2a5a4136
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
X-Mailman-Approved-At: Wed, 06 Aug 2014 02:43:55 -0400
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	"peter.crosthwaite@xilinx.com" <peter.crosthwaite@xilinx.com>,
	"Huangweidong \(C\)" <weidong.huang@huawei.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"marcel.a@redhat.com" <marcel.a@redhat.com>,
	"qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	Luonengjun <luonengjun@huawei.com>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"av1474@comtv.ru" <av1474@comtv.ru>,
	"kraxel@redhat.com" <kraxel@redhat.com>,
	"aliguori@amazon.com" <aliguori@amazon.com>,
	"imammedo@redhat.com" <imammedo@redhat.com>,
	"dmitry@daynix.com" <dmitry@daynix.com>,
	"pbonzini@redhat.com" <pbonzini@redhat.com>, "Huangpeng
	\(Peter\)" <peter.huangpeng@huawei.com>,
	"lcapitulino@redhat.com" <lcapitulino@redhat.com>,
	"eblake@redhat.com" <eblake@redhat.com>,
	"afaerber@suse.de" <afaerber@suse.de>,
	"dgilbert@redhat.com" <dgilbert@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v3 for-2.2 0/8] don't use Yoda conditions
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
X-List-Received-Date: Wed, 06 Aug 2014 01:48:12 -0000

Hi,

> >
> > $WHATEVER: don't use 'Yoda conditions'
> >
> > 'Yoda conditions' are not part of idiomatic QEMU coding
> > style, so rewrite them in the more usual order.
>=20
>=20
> OK but why stop at these files? How about this
> instead?
>=20
I just search c files by using key words like "NULL =3D=3D" etc.

I don't think we should change conditional statements like ">" and ">=3D".

BTW, just using like "value =3D=3D NULL" instead of "NULL =3D=3D value" in =
all files
is not a good idea, which we have discussed in my patch serials v2. So, I p=
osted
v3, add change log " imitate nearby code about using '!value' or 'value =3D=
=3D NULL' at
every patch " .

So, maybe you can post patches for those files I have missed in the serials=
,=20
but not simply instead all by semantic script IMO, thanks!

Best regards,
-Gonglei

> --->
>=20
> style: fix up Yoda coding style
>=20
> Find and fix up all Yoda conditions in code.
> Generated using the following semantic patch:
>=20
> @ disable commneq @
> expression E;
> constant C;
> @@
> - C !=3D E
> + E !=3D C
> @ disable commeq @
> expression E;
> constant C;
> @@
> - C =3D=3D E
> + E =3D=3D C
> @ disable commeq @
> expression E;
> constant C;
> @@
> - C =3D=3D E
> + E =3D=3D C
> @ disable gtr_lss @
> expression E;
> constant C;
> @@
> - C > E
> + E < C
> @ disable gtr_lss_eq @
> expression E;
> constant C;
> @@
> - C >=3D E
> + E <=3D C
>=20
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>=20
> ---
>=20
>  audio/ossaudio.c                     |    2 +-
>  block/raw-posix.c                    |    4 ++--
>  hw/audio/gus.c                       |    2 +-
>  hw/audio/hda-codec.c                 |    2 +-
>  hw/audio/sb16.c                      |   10 +++++-----
>  hw/block/m25p80.c                    |    2 +-
>  hw/bt/sdp.c                          |    4 ++--
>  hw/dma/i8257.c                       |   12 ++++++------
>  hw/dma/pl330.c                       |    2 +-
>  hw/isa/isa-bus.c                     |    2 +-
>  hw/net/vmxnet3.c                     |   22 +++++++++++-----------
>  hw/net/vmxnet_tx_pkt.c               |    6 +++---
>  hw/ssi/xilinx_spips.c                |    2 +-
>  hw/timer/a9gtimer.c                  |    2 +-
>  hw/usb/bus.c                         |    2 +-
>  hw/usb/ccid-card-passthru.c          |    2 +-
>  hw/usb/dev-audio.c                   |    2 +-
>  hw/usb/dev-mtp.c                     |    4 ++--
>  hw/usb/hcd-ehci.c                    |    2 +-
>  hw/xen/xen_backend.c                 |    4 ++--
>  hw/xenpv/xen_machine_pv.c            |    2 +-
>  linux-user/arm/nwfpe/double_cpdo.c   |    2 +-
>  linux-user/arm/nwfpe/extended_cpdo.c |    2 +-
>  linux-user/arm/nwfpe/fpa11_cpdo.c    |    2 +-
>  linux-user/arm/nwfpe/single_cpdo.c   |    2 +-
>  linux-user/flatload.c                |    6 +++---
>  qdev-monitor.c                       |    2 +-
>  qemu-char.c                          |    2 +-
>  slirp/slirp.c                        |    2 +-
>  trace/control.c                      |    4 ++--
>  ui/spice-core.c                      |    4 ++--
>  util/qemu-sockets.c                  |   14 +++++++-------
>  32 files changed, 67 insertions(+), 67 deletions(-)
>=20
> diff -u -p a/trace/control.c b/trace/control.c
> --- a/trace/control.c
> +++ b/trace/control.c
> @@ -121,10 +121,10 @@ static void trace_init_events(const char
>          size_t len =3D strlen(line_buf);
>          if (len > 1) {              /* skip empty lines */
>              line_buf[len - 1] =3D '\0';
> -            if ('#' =3D=3D line_buf[0]) { /* skip commented lines */
> +            if (line_buf[0] =3D=3D '#') { /* skip commented lines */
>                  continue;
>              }
> -            const bool enable =3D ('-' !=3D line_buf[0]);
> +            const bool enable =3D (line_buf[0] !=3D '-');
>              char *line_ptr =3D enable ? line_buf : line_buf + 1;
>              if (trace_event_is_pattern(line_ptr)) {
>                  TraceEvent *ev =3D NULL;
> diff -u -p a/util/qemu-sockets.c b/util/qemu-sockets.c
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -437,7 +437,7 @@ int inet_dgram_opts(QemuOpts *opts, Erro
>      if (qemu_opt_get_bool(opts, "ipv6", 0))
>          ai.ai_family =3D PF_INET6;
>=20
> -    if (0 !=3D (rc =3D getaddrinfo(addr, port, &ai, &peer))) {
> +    if ((rc =3D getaddrinfo(addr, port, &ai, &peer)) !=3D 0) {
>          error_setg(errp, "address resolution failed for %s:%s: %s", addr=
,
> port,
>                     gai_strerror(rc));
>  	return -1;
> @@ -457,7 +457,7 @@ int inet_dgram_opts(QemuOpts *opts, Erro
>      if (!port || strlen(port) =3D=3D 0)
>          port =3D "0";
>=20
> -    if (0 !=3D (rc =3D getaddrinfo(addr, port, &ai, &local))) {
> +    if ((rc =3D getaddrinfo(addr, port, &ai, &local)) !=3D 0) {
>          error_setg(errp, "address resolution failed for %s:%s: %s", addr=
,
> port,
>                     gai_strerror(rc));
>          goto err;
> @@ -488,7 +488,7 @@ int inet_dgram_opts(QemuOpts *opts, Erro
>      return sock;
>=20
>  err:
> -    if (-1 !=3D sock)
> +    if (sock !=3D -1)
>          closesocket(sock);
>      if (local)
>          freeaddrinfo(local);
> @@ -513,20 +513,20 @@ InetSocketAddress *inet_parse(const char
>      if (str[0] =3D=3D ':') {
>          /* no host given */
>          host[0] =3D '\0';
> -        if (1 !=3D sscanf(str, ":%32[^,]%n", port, &pos)) {
> +        if (sscanf(str, ":%32[^,]%n", port, &pos) !=3D 1) {
>              error_setg(errp, "error parsing port in address '%s'", str);
>              goto fail;
>          }
>      } else if (str[0] =3D=3D '[') {
>          /* IPv6 addr */
> -        if (2 !=3D sscanf(str, "[%64[^]]]:%32[^,]%n", host, port, &pos))=
 {
> +        if (sscanf(str, "[%64[^]]]:%32[^,]%n", host, port, &pos) !=3D 2)=
 {
>              error_setg(errp, "error parsing IPv6 address '%s'", str);
>              goto fail;
>          }
>          addr->ipv6 =3D addr->has_ipv6 =3D true;
>      } else {
>          /* hostname or IPv4 addr */
> -        if (2 !=3D sscanf(str, "%64[^:]:%32[^,]%n", host, port, &pos)) {
> +        if (sscanf(str, "%64[^:]:%32[^,]%n", host, port, &pos) !=3D 2) {
>              error_setg(errp, "error parsing address '%s'", str);
>              goto fail;
>          }
> @@ -732,7 +732,7 @@ int unix_connect_opts(QemuOpts *opts, Er
>      ConnectState *connect_state =3D NULL;
>      int sock, rc;
>=20
> -    if (NULL =3D=3D path) {
> +    if (path =3D=3D NULL) {
>          error_setg(errp, "unix connect: no path specified");
>          return -1;
>      }
> diff -u -p a/hw/dma/i8257.c b/hw/dma/i8257.c
> --- a/hw/dma/i8257.c
> +++ b/hw/dma/i8257.c
> @@ -88,7 +88,7 @@ static void write_page (void *opaque, ui
>      int ichan;
>=20
>      ichan =3D channels[nport & 7];
> -    if (-1 =3D=3D ichan) {
> +    if (ichan =3D=3D -1) {
>          dolog ("invalid channel %#x %#x\n", nport, data);
>          return;
>      }
> @@ -101,7 +101,7 @@ static void write_pageh (void *opaque, u
>      int ichan;
>=20
>      ichan =3D channels[nport & 7];
> -    if (-1 =3D=3D ichan) {
> +    if (ichan =3D=3D -1) {
>          dolog ("invalid channel %#x %#x\n", nport, data);
>          return;
>      }
> @@ -114,7 +114,7 @@ static uint32_t read_page (void *opaque,
>      int ichan;
>=20
>      ichan =3D channels[nport & 7];
> -    if (-1 =3D=3D ichan) {
> +    if (ichan =3D=3D -1) {
>          dolog ("invalid channel read %#x\n", nport);
>          return 0;
>      }
> @@ -127,7 +127,7 @@ static uint32_t read_pageh (void *opaque
>      int ichan;
>=20
>      ichan =3D channels[nport & 7];
> -    if (-1 =3D=3D ichan) {
> +    if (ichan =3D=3D -1) {
>          dolog ("invalid channel read %#x\n", nport);
>          return 0;
>      }
> @@ -275,7 +275,7 @@ static void write_cont(void *opaque, hwa
>      }
>=20
>  #ifdef DEBUG_DMA
> -    if (0xc !=3D iport) {
> +    if (iport !=3D 0xc) {
>          linfo ("write_cont: nport %#06x, ichan % 2d, val %#06x\n",
>                 nport, ichan, data);
>      }
> @@ -380,7 +380,7 @@ static void DMA_run (void)
>=20
>              mask =3D 1 << ichan;
>=20
> -            if ((0 =3D=3D (d->mask & mask)) && (0 !=3D (d->status & (mas=
k << 4))))
> {
> +            if (((d->mask & mask) =3D=3D 0) && ((d->status & (mask << 4)=
) !=3D 0))
> {
>                  channel_run (icont, ichan);
>                  rearm =3D 1;
>              }
> diff -u -p a/hw/dma/pl330.c b/hw/dma/pl330.c
> --- a/hw/dma/pl330.c
> +++ b/hw/dma/pl330.c
> @@ -23,7 +23,7 @@
>  #endif
>=20
>  #define DB_PRINT_L(lvl, fmt, args...) do {\
> -    if (PL330_ERR_DEBUG >=3D lvl) {\
> +    if (lvl <=3D PL330_ERR_DEBUG) {\
>          fprintf(stderr, "PL330: %s:" fmt, __func__, ## args);\
>      } \
>  } while (0);
> diff -u -p a/hw/xenpv/xen_machine_pv.c b/hw/xenpv/xen_machine_pv.c
> --- a/hw/xenpv/xen_machine_pv.c
> +++ b/hw/xenpv/xen_machine_pv.c
> @@ -81,7 +81,7 @@ static void xen_init_pv(MachineState *ma
>=20
>      /* configure nics */
>      for (i =3D 0; i < nb_nics; i++) {
> -        if (!nd_table[i].model || 0 !=3D strcmp(nd_table[i].model, "xen"=
))
> +        if (!nd_table[i].model || strcmp(nd_table[i].model, "xen") !=3D =
0)
>              continue;
>          xen_config_dev_nic(nd_table + i);
>      }
> diff -u -p a/hw/xen/xen_backend.c b/hw/xen/xen_backend.c
> --- a/hw/xen/xen_backend.c
> +++ b/hw/xen/xen_backend.c
> @@ -104,7 +104,7 @@ int xenstore_read_int(const char *base,
>      int rc =3D -1;
>=20
>      val =3D xenstore_read_str(base, node);
> -    if (val && 1 =3D=3D sscanf(val, "%d", ival)) {
> +    if (val && sscanf(val, "%d", ival) =3D=3D 1) {
>          rc =3D 0;
>      }
>      g_free(val);
> @@ -117,7 +117,7 @@ int xenstore_read_uint64(const char *bas
>      int rc =3D -1;
>=20
>      val =3D xenstore_read_str(base, node);
> -    if (val && 1 =3D=3D sscanf(val, "%"SCNu64, uval)) {
> +    if (val && sscanf(val, "%"SCNu64, uval) =3D=3D 1) {
>          rc =3D 0;
>      }
>      g_free(val);
> diff -u -p a/hw/block/m25p80.c b/hw/block/m25p80.c
> --- a/hw/block/m25p80.c
> +++ b/hw/block/m25p80.c
> @@ -30,7 +30,7 @@
>  #endif
>=20
>  #define DB_PRINT_L(level, ...) do { \
> -    if (M25P80_ERR_DEBUG > (level)) { \
> +    if ((level) < M25P80_ERR_DEBUG) { \
>          fprintf(stderr,  ": %s: ", __func__); \
>          fprintf(stderr, ## __VA_ARGS__); \
>      } \
> diff -u -p a/hw/bt/sdp.c b/hw/bt/sdp.c
> --- a/hw/bt/sdp.c
> +++ b/hw/bt/sdp.c
> @@ -309,7 +309,7 @@ static ssize_t sdp_attr_get(struct bt_l2
>              }
>              len +=3D record->attribute_list[i].len;
>          }
> -    if (0 >=3D start) {
> +    if (start <=3D 0) {
>         lst[0] =3D SDP_DTYPE_SEQ | SDP_DSIZE_NEXT2;
>         lst[1] =3D (len + start - 3) >> 8;
>         lst[2] =3D (len + start - 3) & 0xff;
> @@ -463,7 +463,7 @@ static ssize_t sdp_svc_search_attr_get(s
>          }
>      if (len =3D=3D 3 - start)
>          len -=3D 3;
> -    else if (0 >=3D start) {
> +    else if (start <=3D 0) {
>         lst[0] =3D SDP_DTYPE_SEQ | SDP_DSIZE_NEXT2;
>         lst[1] =3D (len + start - 3) >> 8;
>         lst[2] =3D (len + start - 3) & 0xff;
> diff -u -p a/hw/timer/a9gtimer.c b/hw/timer/a9gtimer.c
> --- a/hw/timer/a9gtimer.c
> +++ b/hw/timer/a9gtimer.c
> @@ -30,7 +30,7 @@
>  #endif
>=20
>  #define DB_PRINT_L(level, ...) do { \
> -    if (A9_GTIMER_ERR_DEBUG > (level)) { \
> +    if ((level) < A9_GTIMER_ERR_DEBUG) { \
>          fprintf(stderr,  ": %s: ", __func__); \
>          fprintf(stderr, ## __VA_ARGS__); \
>      } \
> diff -u -p a/hw/ssi/xilinx_spips.c b/hw/ssi/xilinx_spips.c
> --- a/hw/ssi/xilinx_spips.c
> +++ b/hw/ssi/xilinx_spips.c
> @@ -35,7 +35,7 @@
>  #endif
>=20
>  #define DB_PRINT_L(level, ...) do { \
> -    if (XILINX_SPIPS_ERR_DEBUG > (level)) { \
> +    if ((level) < XILINX_SPIPS_ERR_DEBUG) { \
>          fprintf(stderr,  ": %s: ", __func__); \
>          fprintf(stderr, ## __VA_ARGS__); \
>      } \
> diff -u -p a/hw/net/vmxnet3.c b/hw/net/vmxnet3.c
> --- a/hw/net/vmxnet3.c
> +++ b/hw/net/vmxnet3.c
> @@ -1009,7 +1009,7 @@ vmxnet3_indicate_packet(VMXNET3State *s)
>=20
>          vmxnet3_dump_rx_descr(&rxd);
>=20
> -        if (0 !=3D ready_rxcd_pa) {
> +        if (ready_rxcd_pa !=3D 0) {
>              cpu_physical_memory_write(ready_rxcd_pa, &rxcd,
> sizeof(rxcd));
>          }
>=20
> @@ -1020,7 +1020,7 @@ vmxnet3_indicate_packet(VMXNET3State *s)
>          rxcd.gen =3D new_rxcd_gen;
>          rxcd.rqID =3D RXQ_IDX + rx_ridx * s->rxq_num;
>=20
> -        if (0 =3D=3D bytes_left) {
> +        if (bytes_left =3D=3D 0) {
>              vmxnet3_rx_update_descr(s->rx_pkt, &rxcd);
>          }
>=20
> @@ -1038,16 +1038,16 @@ vmxnet3_indicate_packet(VMXNET3State *s)
>          num_frags++;
>      }
>=20
> -    if (0 !=3D ready_rxcd_pa) {
> +    if (ready_rxcd_pa !=3D 0) {
>          rxcd.eop =3D 1;
> -        rxcd.err =3D (0 !=3D bytes_left);
> +        rxcd.err =3D (bytes_left !=3D 0);
>          cpu_physical_memory_write(ready_rxcd_pa, &rxcd, sizeof(rxcd));
>=20
>          /* Flush RX descriptor changes */
>          smp_wmb();
>      }
>=20
> -    if (0 !=3D new_rxcd_pa) {
> +    if (new_rxcd_pa !=3D 0) {
>          vmxnet3_revert_rxc_descr(s, RXQ_IDX);
>      }
>=20
> @@ -1190,8 +1190,8 @@ static void vmxnet3_update_mcast_filters
>      s->mcast_list_len =3D list_bytes / sizeof(s->mcast_list[0]);
>=20
>      s->mcast_list =3D g_realloc(s->mcast_list, list_bytes);
> -    if (NULL =3D=3D s->mcast_list) {
> -        if (0 =3D=3D s->mcast_list_len) {
> +    if (s->mcast_list =3D=3D NULL) {
> +        if (s->mcast_list_len =3D=3D 0) {
>              VMW_CFPRN("Current multicast list is empty");
>          } else {
>              VMW_ERPRN("Failed to allocate multicast list of %d
> elements",
> @@ -1667,7 +1667,7 @@ vmxnet3_io_bar1_write(void *opaque,
>           * memory address. We save it to temp variable and set the
>           * shared address only after we get the high part
>           */
> -        if (0 =3D=3D val) {
> +        if (val =3D=3D 0) {
>              s->device_active =3D false;
>          }
>          s->temp_shared_guest_driver_memory =3D val;
> @@ -2009,7 +2009,7 @@ vmxnet3_use_msix_vectors(VMXNET3State *s
>      int i;
>      for (i =3D 0; i < num_vectors; i++) {
>          int res =3D msix_vector_use(d, i);
> -        if (0 > res) {
> +        if (res < 0) {
>              VMW_WRPRN("Failed to use MSI-X vector %d, error %d", i,
> res);
>              vmxnet3_unuse_msix_vectors(s, i);
>              return false;
> @@ -2029,7 +2029,7 @@ vmxnet3_init_msix(VMXNET3State *s)
>                          VMXNET3_MSIX_BAR_IDX,
> VMXNET3_OFF_MSIX_PBA,
>                          0);
>=20
> -    if (0 > res) {
> +    if (res < 0) {
>          VMW_WRPRN("Failed to initialize MSI-X, error %d", res);
>          s->msix_used =3D false;
>      } else {
> @@ -2067,7 +2067,7 @@ vmxnet3_init_msi(VMXNET3State *s)
>=20
>      res =3D msi_init(d, VMXNET3_MSI_OFFSET,
> VMXNET3_MAX_NMSIX_INTRS,
>                     VMXNET3_USE_64BIT,
> VMXNET3_PER_VECTOR_MASK);
> -    if (0 > res) {
> +    if (res < 0) {
>          VMW_WRPRN("Failed to initialize MSI, error %d", res);
>          s->msi_used =3D false;
>      } else {
> diff -u -p a/hw/net/vmxnet_tx_pkt.c b/hw/net/vmxnet_tx_pkt.c
> --- a/hw/net/vmxnet_tx_pkt.c
> +++ b/hw/net/vmxnet_tx_pkt.c
> @@ -94,8 +94,8 @@ void vmxnet_tx_pkt_update_ip_checksums(s
>      uint8_t gso_type =3D pkt->virt_hdr.gso_type &
> ~VIRTIO_NET_HDR_GSO_ECN;
>      struct ip_header *ip_hdr;
>=20
> -    if (VIRTIO_NET_HDR_GSO_TCPV4 !=3D gso_type &&
> -        VIRTIO_NET_HDR_GSO_UDP !=3D gso_type) {
> +    if (gso_type !=3D VIRTIO_NET_HDR_GSO_TCPV4 &&
> +        gso_type !=3D VIRTIO_NET_HDR_GSO_UDP) {
>          return;
>      }
>=20
> @@ -548,7 +548,7 @@ bool vmxnet_tx_pkt_send(struct VmxnetTxP
>       * Since underlying infrastructure does not support IP datagrams lon=
ger
>       * than 64K we should drop such packets and don't even try to send
>       */
> -    if (VIRTIO_NET_HDR_GSO_NONE !=3D pkt->virt_hdr.gso_type) {
> +    if (pkt->virt_hdr.gso_type !=3D VIRTIO_NET_HDR_GSO_NONE) {
>          if (pkt->payload_len >
>              ETH_MAX_IP_DGRAM_LEN -
>              pkt->vec[VMXNET_TX_PKT_L3HDR_FRAG].iov_len) {
> diff -u -p a/hw/audio/gus.c b/hw/audio/gus.c
> --- a/hw/audio/gus.c
> +++ b/hw/audio/gus.c
> @@ -212,7 +212,7 @@ static int GUS_read_DMA (void *opaque, i
>          pos +=3D copied;
>      }
>=20
> -    if (0 =3D=3D ((mode >> 4) & 1)) {
> +    if (((mode >> 4) & 1) =3D=3D 0) {
>          DMA_release_DREQ (s->emu.gusdma);
>      }
>      return dma_len;
> diff -u -p a/hw/audio/sb16.c b/hw/audio/sb16.c
> --- a/hw/audio/sb16.c
> +++ b/hw/audio/sb16.c
> @@ -226,7 +226,7 @@ static void dma_cmd8 (SB16State *s, int
>      s->fmt_bits =3D 8;
>      s->fmt_signed =3D 0;
>      s->fmt_stereo =3D (s->mixer_regs[0x0e] & 2) !=3D 0;
> -    if (-1 =3D=3D s->time_const) {
> +    if (s->time_const =3D=3D -1) {
>          if (s->freq <=3D 0)
>              s->freq =3D 11025;
>      }
> @@ -288,7 +288,7 @@ static void dma_cmd (SB16State *s, uint8
>          break;
>      }
>=20
> -    if (-1 !=3D s->time_const) {
> +    if (s->time_const !=3D -1) {
>  #if 1
>          int tmp =3D 256 - s->time_const;
>          s->freq =3D (1000000 + (tmp / 2)) / tmp;
> @@ -314,7 +314,7 @@ static void dma_cmd (SB16State *s, uint8
>              s->freq, s->fmt_stereo, s->fmt_signed, s->fmt_bits,
>              s->block_size, s->dma_auto, s->fifo, s->highspeed);
>=20
> -    if (16 =3D=3D s->fmt_bits) {
> +    if (s->fmt_bits =3D=3D 16) {
>          if (s->fmt_signed) {
>              s->fmt =3D AUD_FMT_S16;
>          }
> @@ -1212,7 +1212,7 @@ static int SB_read_DMA (void *opaque, in
>  #endif
>=20
>      if (till <=3D copy) {
> -        if (0 =3D=3D s->dma_auto) {
> +        if (s->dma_auto =3D=3D 0) {
>              copy =3D till;
>          }
>      }
> @@ -1224,7 +1224,7 @@ static int SB_read_DMA (void *opaque, in
>      if (s->left_till_irq <=3D 0) {
>          s->mixer_regs[0x82] |=3D (nchan & 4) ? 2 : 1;
>          qemu_irq_raise (s->pic);
> -        if (0 =3D=3D s->dma_auto) {
> +        if (s->dma_auto =3D=3D 0) {
>              control (s, 0);
>              speaker (s, 0);
>          }
> diff -u -p a/hw/audio/hda-codec.c b/hw/audio/hda-codec.c
> --- a/hw/audio/hda-codec.c
> +++ b/hw/audio/hda-codec.c
> @@ -489,7 +489,7 @@ static int hda_audio_init(HDACodecDevice
>      for (i =3D 0; i < a->desc->nnodes; i++) {
>          node =3D a->desc->nodes + i;
>          param =3D hda_codec_find_param(node,
> AC_PAR_AUDIO_WIDGET_CAP);
> -        if (NULL =3D=3D param)
> +        if (param =3D=3D NULL)
>              continue;
>          type =3D (param->val & AC_WCAP_TYPE) >> AC_WCAP_TYPE_SHIFT;
>          switch (type) {
> diff -u -p a/hw/isa/isa-bus.c b/hw/isa/isa-bus.c
> --- a/hw/isa/isa-bus.c
> +++ b/hw/isa/isa-bus.c
> @@ -50,7 +50,7 @@ ISABus *isa_bus_new(DeviceState *dev, Me
>          fprintf(stderr, "Can't create a second ISA bus\n");
>          return NULL;
>      }
> -    if (NULL =3D=3D dev) {
> +    if (dev =3D=3D NULL) {
>          dev =3D qdev_create(NULL, "isabus-bridge");
>          qdev_init_nofail(dev);
>      }
> diff -u -p a/hw/usb/dev-mtp.c b/hw/usb/dev-mtp.c
> --- a/hw/usb/dev-mtp.c
> +++ b/hw/usb/dev-mtp.c
> @@ -832,7 +832,7 @@ static void usb_mtp_command(MTPState *s,
>              return;
>          }
>          data_in =3D usb_mtp_get_object(s, c, o);
> -        if (NULL =3D=3D data_in) {
> +        if (data_in =3D=3D NULL) {
>              usb_mtp_queue_result(s, RES_GENERAL_ERROR,
>                                   c->trans, 0, 0, 0);
>              return;
> @@ -851,7 +851,7 @@ static void usb_mtp_command(MTPState *s,
>              return;
>          }
>          data_in =3D usb_mtp_get_partial_object(s, c, o);
> -        if (NULL =3D=3D data_in) {
> +        if (data_in =3D=3D NULL) {
>              usb_mtp_queue_result(s, RES_GENERAL_ERROR,
>                                   c->trans, 0, 0, 0);
>              return;
> diff -u -p a/hw/usb/hcd-ehci.c b/hw/usb/hcd-ehci.c
> --- a/hw/usb/hcd-ehci.c
> +++ b/hw/usb/hcd-ehci.c
> @@ -1596,7 +1596,7 @@ static EHCIQueue *ehci_state_fetchqh(EHC
>=20
>      entry =3D ehci_get_fetch_addr(ehci, async);
>      q =3D ehci_find_queue_by_qh(ehci, entry, async);
> -    if (NULL =3D=3D q) {
> +    if (q =3D=3D NULL) {
>          q =3D ehci_alloc_queue(ehci, entry, async);
>      }
>=20
> diff -u -p a/hw/usb/ccid-card-passthru.c b/hw/usb/ccid-card-passthru.c
> --- a/hw/usb/ccid-card-passthru.c
> +++ b/hw/usb/ccid-card-passthru.c
> @@ -108,7 +108,7 @@ static int ccid_card_vscard_can_read(voi
>  {
>      PassthruState *card =3D opaque;
>=20
> -    return VSCARD_IN_SIZE >=3D card->vscard_in_pos ?
> +    return card->vscard_in_pos <=3D VSCARD_IN_SIZE ?
>             VSCARD_IN_SIZE - card->vscard_in_pos : 0;
>  }
>=20
> diff -u -p a/hw/usb/dev-audio.c b/hw/usb/dev-audio.c
> --- a/hw/usb/dev-audio.c
> +++ b/hw/usb/dev-audio.c
> @@ -371,7 +371,7 @@ static void output_callback(void *opaque
>              return;
>          }
>          data =3D streambuf_get(&s->out.buf);
> -        if (NULL =3D=3D data) {
> +        if (data =3D=3D NULL) {
>              return;
>          }
>          AUD_write(s->out.voice, data, USBAUDIO_PACKET_SIZE);
> diff -u -p a/hw/usb/bus.c b/hw/usb/bus.c
> --- a/hw/usb/bus.c
> +++ b/hw/usb/bus.c
> @@ -91,7 +91,7 @@ USBBus *usb_bus_find(int busnr)
>  {
>      USBBus *bus;
>=20
> -    if (-1 =3D=3D busnr)
> +    if (busnr =3D=3D -1)
>          return QTAILQ_FIRST(&busses);
>      QTAILQ_FOREACH(bus, &busses, next) {
>          if (bus->busnr =3D=3D busnr)
> diff -u -p a/qemu-char.c b/qemu-char.c
> --- a/qemu-char.c
> +++ b/qemu-char.c
> @@ -4117,7 +4117,7 @@ void qmp_chardev_remove(const char *id,
>      CharDriverState *chr;
>=20
>      chr =3D qemu_chr_find(id);
> -    if (NULL =3D=3D chr) {
> +    if (chr =3D=3D NULL) {
>          error_setg(errp, "Chardev '%s' not found", id);
>          return;
>      }
> diff -u -p a/slirp/slirp.c b/slirp/slirp.c
> --- a/slirp/slirp.c
> +++ b/slirp/slirp.c
> @@ -68,7 +68,7 @@ int get_dns_addr(struct in_addr *pdns_ad
>      FixedInfo =3D (FIXED_INFO *)GlobalAlloc(GPTR, sizeof(FIXED_INFO));
>      BufLen =3D sizeof(FIXED_INFO);
>=20
> -    if (ERROR_BUFFER_OVERFLOW =3D=3D GetNetworkParams(FixedInfo,
> &BufLen)) {
> +    if (GetNetworkParams(FixedInfo, &BufLen) =3D=3D
> ERROR_BUFFER_OVERFLOW) {
>          if (FixedInfo) {
>              GlobalFree(FixedInfo);
>              FixedInfo =3D NULL;
> diff -u -p a/block/raw-posix.c b/block/raw-posix.c
> --- a/block/raw-posix.c
> +++ b/block/raw-posix.c
> @@ -1628,7 +1628,7 @@ kern_return_t FindEjectableCDMedia( io_i
>      CFMutableDictionaryRef  classesToMatch;
>=20
>      kernResult =3D IOMasterPort( MACH_PORT_NULL, &masterPort );
> -    if ( KERN_SUCCESS !=3D kernResult ) {
> +    if (kernResult !=3D KERN_SUCCESS) {
>          printf( "IOMasterPort returned %d\n", kernResult );
>      }
>=20
> @@ -1639,7 +1639,7 @@ kern_return_t FindEjectableCDMedia( io_i
>      CFDictionarySetValue( classesToMatch, CFSTR( kIOMediaEjectableKey ),
> kCFBooleanTrue );
>      }
>      kernResult =3D IOServiceGetMatchingServices( masterPort,
> classesToMatch, mediaIterator );
> -    if ( KERN_SUCCESS !=3D kernResult )
> +    if (kernResult !=3D KERN_SUCCESS)
>      {
>          printf( "IOServiceGetMatchingServices returned %d\n",
> kernResult );
>      }
> diff -u -p a/qdev-monitor.c b/qdev-monitor.c
> --- a/qdev-monitor.c
> +++ b/qdev-monitor.c
> @@ -694,7 +694,7 @@ void qmp_device_del(const char *id, Erro
>      DeviceState *dev;
>=20
>      dev =3D qdev_find_recursive(sysbus_get_default(), id);
> -    if (NULL =3D=3D dev) {
> +    if (dev =3D=3D NULL) {
>          error_set(errp, QERR_DEVICE_NOT_FOUND, id);
>          return;
>      }
> diff -u -p a/linux-user/flatload.c b/linux-user/flatload.c
> --- a/linux-user/flatload.c
> +++ b/linux-user/flatload.c
> @@ -185,7 +185,7 @@ static int decompress_exec(
>  	ret =3D 10;
>  	if (buf[3] & EXTRA_FIELD) {
>  		ret +=3D 2 + buf[10] + (buf[11] << 8);
> -		if (unlikely(LBUFSIZE =3D=3D ret)) {
> +		if (unlikely(ret =3D=3D LBUFSIZE)) {
>  			DBG_FLT("binfmt_flat: buffer overflow (EXTRA)?\n");
>  			goto out_free_buf;
>  		}
> @@ -193,7 +193,7 @@ static int decompress_exec(
>  	if (buf[3] & ORIG_NAME) {
>  		for (; ret < LBUFSIZE && (buf[ret] !=3D 0); ret++)
>  			;
> -		if (unlikely(LBUFSIZE =3D=3D ret)) {
> +		if (unlikely(ret =3D=3D LBUFSIZE)) {
>  			DBG_FLT("binfmt_flat: buffer overflow (ORIG_NAME)?\n");
>  			goto out_free_buf;
>  		}
> @@ -201,7 +201,7 @@ static int decompress_exec(
>  	if (buf[3] & COMMENT) {
>  		for (;  ret < LBUFSIZE && (buf[ret] !=3D 0); ret++)
>  			;
> -		if (unlikely(LBUFSIZE =3D=3D ret)) {
> +		if (unlikely(ret =3D=3D LBUFSIZE)) {
>  			DBG_FLT("binfmt_flat: buffer overflow (COMMENT)?\n");
>  			goto out_free_buf;
>  		}
> diff -u -p a/linux-user/arm/nwfpe/fpa11_cpdo.c
> b/linux-user/arm/nwfpe/fpa11_cpdo.c
> --- a/linux-user/arm/nwfpe/fpa11_cpdo.c
> +++ b/linux-user/arm/nwfpe/fpa11_cpdo.c
> @@ -67,7 +67,7 @@ unsigned int EmulateCPDO(const unsigned
>        to be. */
>     Fd =3D getFd(opcode);
>     nType =3D fpa11->fType[Fd];
> -   if ((0 !=3D nRc) && (nDest !=3D nType))
> +   if ((nRc !=3D 0) && (nDest !=3D nType))
>     {
>       switch (nDest)
>       {
> diff -u -p a/linux-user/arm/nwfpe/double_cpdo.c
> b/linux-user/arm/nwfpe/double_cpdo.c
> --- a/linux-user/arm/nwfpe/double_cpdo.c
> +++ b/linux-user/arm/nwfpe/double_cpdo.c
> @@ -226,7 +226,7 @@ unsigned int DoubleCPDO(const unsigned i
>        }
>     }
>=20
> -   if (0 !=3D nRc) fpa11->fType[Fd] =3D typeDouble;
> +   if (nRc !=3D 0) fpa11->fType[Fd] =3D typeDouble;
>     return nRc;
>  }
>=20
> diff -u -p a/linux-user/arm/nwfpe/single_cpdo.c
> b/linux-user/arm/nwfpe/single_cpdo.c
> --- a/linux-user/arm/nwfpe/single_cpdo.c
> +++ b/linux-user/arm/nwfpe/single_cpdo.c
> @@ -190,7 +190,7 @@ unsigned int SingleCPDO(const unsigned i
>        }
>     }
>=20
> -   if (0 !=3D nRc) fpa11->fType[Fd] =3D typeSingle;
> +   if (nRc !=3D 0) fpa11->fType[Fd] =3D typeSingle;
>     return nRc;
>  }
>=20
> diff -u -p a/linux-user/arm/nwfpe/extended_cpdo.c
> b/linux-user/arm/nwfpe/extended_cpdo.c
> --- a/linux-user/arm/nwfpe/extended_cpdo.c
> +++ b/linux-user/arm/nwfpe/extended_cpdo.c
> @@ -210,7 +210,7 @@ unsigned int ExtendedCPDO(const unsigned
>        }
>     }
>=20
> -   if (0 !=3D nRc) fpa11->fType[Fd] =3D typeExtended;
> +   if (nRc !=3D 0) fpa11->fType[Fd] =3D typeExtended;
>     return nRc;
>  }
>=20
> diff -u -p a/audio/ossaudio.c b/audio/ossaudio.c
> --- a/audio/ossaudio.c
> +++ b/audio/ossaudio.c
> @@ -286,7 +286,7 @@ static int oss_open (int in, struct oss_
>      oflags |=3D conf.try_mmap ? O_RDWR : (in ? O_RDONLY : O_WRONLY);
>=20
>      fd =3D open (dspname, oflags | O_NONBLOCK);
> -    if (-1 =3D=3D fd) {
> +    if (fd =3D=3D -1) {
>          oss_logerr2 (errno, typ, "Failed to open `%s'\n", dspname);
>          return -1;
>      }
> diff -u -p a/ui/spice-core.c b/ui/spice-core.c
> --- a/ui/spice-core.c
> +++ b/ui/spice-core.c
> @@ -677,7 +677,7 @@ void qemu_spice_init(void)
>=20
>      if (tls_port) {
>          x509_dir =3D qemu_opt_get(opts, "x509-dir");
> -        if (NULL =3D=3D x509_dir) {
> +        if (x509_dir =3D=3D NULL) {
>              x509_dir =3D ".";
>          }
>=20
> @@ -803,7 +803,7 @@ void qemu_spice_init(void)
>=20
>      seamless_migration =3D qemu_opt_get_bool(opts, "seamless-migration",
> 0);
>      spice_server_set_seamless_migration(spice_server,
> seamless_migration);
> -    if (0 !=3D spice_server_init(spice_server, &core_interface)) {
> +    if (spice_server_init(spice_server, &core_interface) !=3D 0) {
>          error_report("failed to initialize spice server");
>          exit(1);
>      };
>=20


