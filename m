Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e0677-00019S-Kj
	for mharc-qemu-trivial@gnu.org; Thu, 05 Oct 2017 09:22:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45256)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1e0670-00011g-D6
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 09:22:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <malbarbo@gmail.com>) id 1e066z-0001oT-Ab
	for qemu-trivial@nongnu.org; Thu, 05 Oct 2017 09:22:50 -0400
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:36241)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <malbarbo@gmail.com>)
	id 1e066t-0001jz-SG; Thu, 05 Oct 2017 09:22:44 -0400
Received: by mail-lf0-x243.google.com with SMTP id l196so5730164lfl.3;
	Thu, 05 Oct 2017 06:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UA43CkJc8Gq52JSI8HiXl8/iok92eVv0C1615efTbQE=;
	b=FBowlsTmktM5xUUBB1jh9WbjUDB3HBU+5CSR8SsQKMS/n46ihDzW5AVIxFjzZzsP4t
	5GSSoIVGeyELHU7L6Pw50d7/cL6HME85KqZ0AeeQv7eF0h9hhgtPvzQEab6XK2q2OqdR
	9sz9ZGrHLwR+PWXRy/Dm/PVpb2mI3qm//Qc4gdelrbBcr5Bj02b+/ckrnaefBSRfe4Z2
	Y9D5xKllDiIJ5JyLaNsSWhPcSCzuykP3saa9NyzOu6+hLVFa5104CFFt5oo9d21QubKZ
	euK+WKESmtWhkxHx19Zg/jdLlUdcVSrUqaBDChRvW/aCPkEI2iAiaKNQ1mJgL6n73pu1
	+cpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UA43CkJc8Gq52JSI8HiXl8/iok92eVv0C1615efTbQE=;
	b=V4yOyJmm2IlfhTKlcV6e8Ar7guBuK9FTXgiKMhwKWklyc5IqRq4rnbeuUcuoj4AGRf
	/fqbEjiyEQbf7m9eEeQdNHKiqtso5Bs8vORwIIIIXVr6X7y7T2G1CaS3cVMaKtpBNMF5
	7PXDpVKXSwL0BYyZ+rKovw0/v0xlcSHYsGsmk0IQGb8YjBQ8qqtzimfSFKqOXmXz8TTV
	MGAJ6PNIPSDFngJ1IyOEfJ8PiUvp5VWd7d1vq/XlteSjIMzeEGOqFHQuhD1L7u+nS/33
	o8W7M+kzr3f5ijqs6oPFDrYOe4yzQfbg6WS7wymqHhqNCdVrNFdCK/PpIUTbXtHvirFw
	Fudg==
X-Gm-Message-State: AMCzsaVV+qmqT1MKv8G/az+fsUX9/aQMkJ2jb7gpADOFLcNV9vOAmh+P
	iUjn4dLQsSbcIFzg1FPpct3nGNKrJSpz7pkQfmE=
X-Google-Smtp-Source: AOwi7QD0EtjFwy6Zq9pnm9Shz5RaLTkafzItLHPaz9Lc2p1fMNK8r7RXdksn/RpE8eQsjnY6mcqh9/rN47fED57wNDg=
X-Received: by 10.46.95.198 with SMTP id x67mr266315lje.184.1507209762226;
	Thu, 05 Oct 2017 06:22:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.40.193 with HTTP; Thu, 5 Oct 2017 06:22:41 -0700 (PDT)
In-Reply-To: <82b1a00d-ea31-c76f-96bd-402828cceebf@redhat.com>
References: <CAHpsRN-XzxjJZb=rb0iHMv4Afv=2H3N5U7p4+NNJFPkxgSLMXg@mail.gmail.com>
	<43071208-759c-6476-0cb0-c4e7e0daaf77@redhat.com>
	<CAHpsRN9s_qa_knpn0QRVu0UasFrx1c+nvy2rY6hHB7GvnRkCZg@mail.gmail.com>
	<82b1a00d-ea31-c76f-96bd-402828cceebf@redhat.com>
From: Marco A L Barbosa <malbarbo@gmail.com>
Date: Thu, 5 Oct 2017 10:22:41 -0300
Message-ID: <CAHpsRN-MpkJyBsO2y0DEOyuo_wAGT+F-y6yzQT=ObL220rZ9eg@mail.gmail.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: multipart/alternative; boundary="001a114a4f607ac47b055acc9e42"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-trivial] [PATCH] linux-user: Add random ioctls
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Oct 2017 13:22:56 -0000

--001a114a4f607ac47b055acc9e42
Content-Type: text/plain; charset="UTF-8"

I submitted a new patch. Thanks.

On Thu, Oct 5, 2017 at 7:35 AM, Laurent Vivier <lvivier@redhat.com> wrote:

> On 05/10/2017 12:24, Marco A L Barbosa wrote:
> >     I doesn't look really trivial...
> >
> >     To manage the buf field you must read buf_size and it cannot be done
> in
> >     a generic way: you must define a function to translate the buffer,
> use
> >     IOCTL_SPECIAL() with RNDADDENTROPY and RNDGETPOOL.
> >
> >     You should send your patch using "git send-email" or "git publish"
> >     instead of adding it in you email client.
> >
> >
> > Thanks for your advices.
> >
> > My use case only requires support for RNDGETENTCNT... Considering that
> > RNDADDENTROPY and RNDGETPOOL are non trivial, would a patch with only
> > RNDGETENTCNT, RNDADDTOENTCNT, RNDZAPENTCNT and RNDCLEARPOOL be accepted?
>
> I think you can only post what you use. If it is tested, it's better...
>
> Thanks,
> Laurent
>



-- 
Marco A L Barbosa
http://malbarbo.pro.br
--

--001a114a4f607ac47b055acc9e42
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I submitted a new patch. Thanks.<br></div><div class=3D"gm=
ail_extra"><br><div class=3D"gmail_quote">On Thu, Oct 5, 2017 at 7:35 AM, L=
aurent Vivier <span dir=3D"ltr">&lt;<a href=3D"mailto:lvivier@redhat.com" t=
arget=3D"_blank">lvivier@redhat.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><span class=3D"">On 05/10/2017 12:24, Marco A L Barbosa wr=
ote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0I doesn&#39;t look really trivial...<br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0To manage the buf field you must read buf_size and =
it cannot be done in<br>
&gt;=C2=A0 =C2=A0 =C2=A0a generic way: you must define a function to transl=
ate the buffer, use<br>
&gt;=C2=A0 =C2=A0 =C2=A0IOCTL_SPECIAL() with RNDADDENTROPY and RNDGETPOOL.<=
br>
&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0You should send your patch using &quot;git send-ema=
il&quot; or &quot;git publish&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0instead of adding it in you email client.<br>
&gt;<br>
&gt;<br>
&gt; Thanks for your advices.<br>
&gt;<br>
&gt; My use case only requires support for RNDGETENTCNT... Considering that=
<br>
&gt; RNDADDENTROPY and RNDGETPOOL are non trivial, would a patch with only<=
br>
&gt; RNDGETENTCNT, RNDADDTOENTCNT, RNDZAPENTCNT and RNDCLEARPOOL be accepte=
d?<br>
<br>
</span>I think you can only post what you use. If it is tested, it&#39;s be=
tter...<br>
<br>
Thanks,<br>
Laurent<br>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">Marco A L Barbosa<br><a href=3D"=
http://malbarbo.pro.br" target=3D"_blank">http://malbarbo.pro.br</a><br>--<=
/div>
</div>

--001a114a4f607ac47b055acc9e42--

