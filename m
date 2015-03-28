Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YblDW-0003IF-Sc
	for mharc-qemu-trivial@gnu.org; Sat, 28 Mar 2015 03:31:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54375)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1YblDU-0003Fq-SE
	for qemu-trivial@nongnu.org; Sat, 28 Mar 2015 03:31:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1YblDT-0006NH-HV
	for qemu-trivial@nongnu.org; Sat, 28 Mar 2015 03:31:36 -0400
Received: from mail-ig0-x230.google.com ([2607:f8b0:4001:c05::230]:33668)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1YblDQ-0006MS-Pg; Sat, 28 Mar 2015 03:31:32 -0400
Received: by ignm3 with SMTP id m3so44137211ign.0;
	Sat, 28 Mar 2015 00:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=pW/EPzkwsfm32x26lW6+8ozDTBp9P/a1ysx0Y93RVa4=;
	b=clTmsWJDaGQtbVzr7tIwQsBG6BTSqIWH3NbeEjHfzUCqgbEp6cdUUhZBDXAVz7CJSb
	UyPAsoAfM7Z8liWZE1/tK/SY5MH8XVZIQ+5Xcw7g+iopKjAAX9+m5XEys8mUfEz6HWQd
	umQuZDn8/enUGMn8UCXb1/7pd3oFM841Sq7f4g8weCRXrBdOmPXIhOuN3Qw4rh6iBzIJ
	lQUg1+gylj4bfpJKT/pS2RuzxFG92e+iekX4RF/bZCkzflpRxKpcBcTnqAjhY3ZksDdm
	VwSZEGHXpA8MBIjn/xdo9ZpBKd5hZsf3AsBVP7PnmGPfoF5kk4a43Lah7aNgYW63jaW0
	lreQ==
MIME-Version: 1.0
X-Received: by 10.107.36.6 with SMTP id k6mr4808302iok.83.1427527892254; Sat,
	28 Mar 2015 00:31:32 -0700 (PDT)
Received: by 10.107.28.1 with HTTP; Sat, 28 Mar 2015 00:31:32 -0700 (PDT)
Received: by 10.107.28.1 with HTTP; Sat, 28 Mar 2015 00:31:32 -0700 (PDT)
In-Reply-To: <55161404.4000404@huawei.com>
References: <1425524720-11376-1-git-send-email-arei.gonglei@huawei.com>
	<5507D480.1000505@huawei.com> <55161404.4000404@huawei.com>
Date: Sat, 28 Mar 2015 17:31:32 +1000
Message-ID: <CAJy5ezrFVPCC1VCbvVVYYTEgx2v__AicWFUme_yh2ikuB0wOEg@mail.gmail.com>
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Gonglei <arei.gonglei@huawei.com>
Content-Type: multipart/alternative; boundary=001a1140f794ecc7840512543c8b
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4001:c05::230
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org,
	"pbonzini@redhat.com" <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH v2] microblaze: fix memory leak
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
X-List-Received-Date: Sat, 28 Mar 2015 07:31:38 -0000

--001a1140f794ecc7840512543c8b
Content-Type: text/plain; charset=UTF-8

On 28/03/2015 12:38 pm, "Gonglei" <arei.gonglei@huawei.com> wrote:
>
> Hi,
>
>    Ping again...  Can this patch be a raw stuff for rc2 ?

Looks good to me, thanks.

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Can this go through -trivial?

Cheers,
Edgar

>
> Regards,
> Gonglei
>
> On 2015/3/17 15:15, Gonglei wrote:
> > On 2015/3/5 11:05, arei.gonglei@huawei.com wrote:
> >> From: Gonglei <arei.gonglei@huawei.com>
> >>
> >> When not assign a -dtb argument, the variable dtb_filename
> >> storage returned from qemu_find_file(), which should be freed
> >> after use. Alternatively we define a local variable filename,
> >> with 'char *' type, free after use.
> >>
> >> Cc: Michael Tokarev <mjt@tls.msk.ru>
> >> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> >> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> >> ---
> >> v2: fix a complier error.
> >> ---
> >>  hw/microblaze/boot.c | 13 +++++++------
> >>  1 file changed, 7 insertions(+), 6 deletions(-)
> >>
> >
> > Ping...
> >
> >> diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c
> >> index a2843cd..352ccb1 100644
> >> --- a/hw/microblaze/boot.c
> >> +++ b/hw/microblaze/boot.c
> >> @@ -113,15 +113,15 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu,
hwaddr ddr_base,
> >>      const char *kernel_filename;
> >>      const char *kernel_cmdline;
> >>      const char *dtb_arg;
> >> +    char *filename = NULL;
> >>
> >>      machine_opts = qemu_get_machine_opts();
> >>      kernel_filename = qemu_opt_get(machine_opts, "kernel");
> >>      kernel_cmdline = qemu_opt_get(machine_opts, "append");
> >>      dtb_arg = qemu_opt_get(machine_opts, "dtb");
> >> -    if (dtb_arg) { /* Preference a -dtb argument */
> >> -        dtb_filename = dtb_arg;
> >> -    } else { /* default to pcbios dtb as passed by machine_init */
> >> -        dtb_filename = qemu_find_file(QEMU_FILE_TYPE_BIOS,
dtb_filename);
> >> +    /* default to pcbios dtb as passed by machine_init */
> >> +    if (!dtb_arg) {
> >> +        filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, dtb_filename);
> >>      }
> >>
> >>      boot_info.machine_cpu_reset = machine_cpu_reset;
> >> @@ -203,7 +203,8 @@ void microblaze_load_kernel(MicroBlazeCPU *cpu,
hwaddr ddr_base,
> >>                              boot_info.initrd_start,
> >>                              boot_info.initrd_end,
> >>                              kernel_cmdline,
> >> -                            dtb_filename);
> >> +                            /* Preference a -dtb argument */
> >> +                            dtb_arg ? dtb_arg : filename);
> >>      }
> >> -
> >> +    g_free(filename);
> >>  }
> >>
> >
>
>

--001a1140f794ecc7840512543c8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr">On 28/03/2015 12:38 pm, &quot;Gonglei&quot; &lt;<a href=3D"m=
ailto:arei.gonglei@huawei.com">arei.gonglei@huawei.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi,<br>
&gt;<br>
&gt; =C2=A0 =C2=A0Ping again...=C2=A0 Can this patch be a raw stuff for rc2=
 ?</p>
<p dir=3D"ltr">Looks good to me, thanks.</p>
<p dir=3D"ltr">Reviewed-by: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.i=
glesias@xilinx.com">edgar.iglesias@xilinx.com</a>&gt;</p>
<p dir=3D"ltr">Can this go through -trivial?</p>
<p dir=3D"ltr">Cheers,<br>
Edgar</p>
<p dir=3D"ltr">&gt;<br>
&gt; Regards,<br>
&gt; Gonglei<br>
&gt;<br>
&gt; On 2015/3/17 15:15, Gonglei wrote:<br>
&gt; &gt; On 2015/3/5 11:05,<a href=3D"mailto:arei.gonglei@huawei.com"> are=
i.gonglei@huawei.com</a> wrote:<br>
&gt; &gt;&gt; From: Gonglei &lt;<a href=3D"mailto:arei.gonglei@huawei.com">=
arei.gonglei@huawei.com</a>&gt;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; When not assign a -dtb argument, the variable dtb_filename<br=
>
&gt; &gt;&gt; storage returned from qemu_find_file(), which should be freed=
<br>
&gt; &gt;&gt; after use. Alternatively we define a local variable filename,=
<br>
&gt; &gt;&gt; with &#39;char *&#39; type, free after use.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Cc: Michael Tokarev &lt;<a href=3D"mailto:mjt@tls.msk.ru">mjt=
@tls.msk.ru</a>&gt;<br>
&gt; &gt;&gt; Cc: Edgar E. Iglesias &lt;<a href=3D"mailto:edgar.iglesias@gm=
ail.com">edgar.iglesias@gmail.com</a>&gt;<br>
&gt; &gt;&gt; Signed-off-by: Gonglei &lt;<a href=3D"mailto:arei.gonglei@hua=
wei.com">arei.gonglei@huawei.com</a>&gt;<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt; v2: fix a complier error.<br>
&gt; &gt;&gt; ---<br>
&gt; &gt;&gt;=C2=A0 hw/microblaze/boot.c | 13 +++++++------<br>
&gt; &gt;&gt;=C2=A0 1 file changed, 7 insertions(+), 6 deletions(-)<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt; &gt; Ping...<br>
&gt; &gt;<br>
&gt; &gt;&gt; diff --git a/hw/microblaze/boot.c b/hw/microblaze/boot.c<br>
&gt; &gt;&gt; index a2843cd..352ccb1 100644<br>
&gt; &gt;&gt; --- a/hw/microblaze/boot.c<br>
&gt; &gt;&gt; +++ b/hw/microblaze/boot.c<br>
&gt; &gt;&gt; @@ -113,15 +113,15 @@ void microblaze_load_kernel(MicroBlazeC=
PU *cpu, hwaddr ddr_base,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 const char *kernel_filename;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 const char *kernel_cmdline;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 const char *dtb_arg;<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 char *filename =3D NULL;<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 machine_opts =3D qemu_get_machine_opts();=
<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 kernel_filename =3D qemu_opt_get(machine_=
opts, &quot;kernel&quot;);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 kernel_cmdline =3D qemu_opt_get(machine_o=
pts, &quot;append&quot;);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 dtb_arg =3D qemu_opt_get(machine_opts, &q=
uot;dtb&quot;);<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 if (dtb_arg) { /* Preference a -dtb argument *=
/<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_filename =3D dtb_arg;<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 } else { /* default to pcbios dtb as passed by=
 machine_init */<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_filename =3D qemu_find_file(=
QEMU_FILE_TYPE_BIOS, dtb_filename);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 /* default to pcbios dtb as passed by machine_=
init */<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 if (!dtb_arg) {<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 filename =3D qemu_find_file(QEMU=
_FILE_TYPE_BIOS, dtb_filename);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 boot_info.machine_cpu_reset =3D machine_c=
pu_reset;<br>
&gt; &gt;&gt; @@ -203,7 +203,8 @@ void microblaze_load_kernel(MicroBlazeCPU=
 *cpu, hwaddr ddr_base,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 boot_info.initrd_start,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 boot_info.initrd_end,<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 kernel_cmdline,<br>
&gt; &gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_filename);<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Preference a -dtb argument */<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dtb_arg ? dtb_arg : filename);<br>
&gt; &gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; &gt;&gt; -<br>
&gt; &gt;&gt; +=C2=A0 =C2=A0 g_free(filename);<br>
&gt; &gt;&gt;=C2=A0 }<br>
&gt; &gt;&gt;<br>
&gt; &gt;<br>
&gt;<br>
&gt;<br>
</p>

--001a1140f794ecc7840512543c8b--

