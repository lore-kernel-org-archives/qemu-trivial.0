Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eDH6Q-0005uZ-Vd
	for mharc-qemu-trivial@gnu.org; Fri, 10 Nov 2017 16:44:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42115)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1eDH6L-0005ti-NN
	for qemu-trivial@nongnu.org; Fri, 10 Nov 2017 16:44:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1eDH6E-0001zL-FO
	for qemu-trivial@nongnu.org; Fri, 10 Nov 2017 16:44:37 -0500
Received: from mail-qk0-x241.google.com ([2607:f8b0:400d:c09::241]:43133)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <zachriggle@gmail.com>)
	id 1eDH6E-0001ys-8Y; Fri, 10 Nov 2017 16:44:30 -0500
Received: by mail-qk0-x241.google.com with SMTP id 78so13601346qkz.0;
	Fri, 10 Nov 2017 13:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r8PCxq+Ha7oS75m5TTaVMCTsCaxiq5OCUTvzONuCr5I=;
	b=FbixhCrtrZB/Z2SopFBaTqsatFqgRf5MH7o+AyMOiHvJLUhD82xBRbU+ytu3L1o/+x
	1t43MxbN2vrlD8Kyxwzc8wj5n9AxWokM8kCes/APL8AZjnKwg7gEe44nyth48HypG+xj
	lmwfJYod8J7BydSDmI4JGwUYj/Li7ad/z7r9SqQQTomlqW//EpfcLaPEiifKxx9RIowh
	Mo88tm1p4YF/cKc3V+Ygsw+jm84JdUAfXTajMXRRKzMiw6sdQKXdinTpC9fyNv/Hj5A+
	pVU28avej3nA98T0MYkBaja5b8m5+xtWlMTG9Hl6k7rgadRGdF/HLhevCjsGz2SYjTST
	ekPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r8PCxq+Ha7oS75m5TTaVMCTsCaxiq5OCUTvzONuCr5I=;
	b=X3pZTb2z1tL3A6M+YVqz5+53mnYhiUXuucda6mGJSg3MfeJ94SRThz4v694YYftTjt
	tviFYkIfa4aWkIRyuXYxlWfzcaWVpz3wfKbMp8u0NRXVvADywlFs28lH/Mj4VGwVV1rD
	p95VhQyw+DiSPCmjUoaMfP7RaVYd3xne6uo8Ftc+5ko4J9wjzDuPF3DOnc77mdb06AM0
	Q60TzidxWU6fwJM2POr3S6LoXWf/2ta/sffm7ZfDTpuHOeZJxIw5+zDkqxwhUe59Zm2P
	cNViGU5XwP+P3JzaXmG/ki5g13E7c81myjB0yrhmqdn+0hhnlHGEkTKZeTWidT1DuWPt
	VHaw==
X-Gm-Message-State: AJaThX4oP+orAAGXdHzUxz7UjOtng05GkTkkM1dibN/D1UMYmjrjrfVt
	6d8n5qNBi29P9Db6wC7um+8TLFbf9/0Tt+tattg=
X-Google-Smtp-Source: AGs4zMYxT+sV6aJx8cPDorREgLCVl/2ejCz+jFqXWvVIq61YlwKeFY4/FKHhucKgbuj5w3tkhqBjVYh3/TlhKJ1309c=
X-Received: by 10.55.17.150 with SMTP id 22mr2873898qkr.208.1510350268928;
	Fri, 10 Nov 2017 13:44:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.108.139 with HTTP; Fri, 10 Nov 2017 13:44:08 -0800 (PST)
In-Reply-To: <20171107200634.GB27631@kos.to>
References: <20171024230758.31779-1-riggle@google.com>
	<20171025033442.44872-1-zachriggle@gmail.com>
	<CAMP9c5=whCgR4qkOPDRKZ+adpWEPiVM=BwZp_r7qCAR7UAsWAQ@mail.gmail.com>
	<20171027093600.GA29513@kos.to>
	<CAMP9c5mm7icy06goXr3iiOEgqPbzyaWDt775+9+L=oxnqwRhpA@mail.gmail.com>
	<CAMP9c5kTQmKd7GVE8DZzvY8tTtWV=tLsgV1ptWPKhEAh=J-maQ@mail.gmail.com>
	<2251f54e-4c55-7495-8f60-af40cdd80594@redhat.com>
	<CAFEAcA-r-KxNDkHFJEdQDVnNXf4N-8zptjQK9a-uPixnSMsg+w@mail.gmail.com>
	<CAMP9c5krrvH-TpH0mM1D3Fm8=E+C7nYHU8h3b5CwU1Nb2HxN-A@mail.gmail.com>
	<20171107200634.GB27631@kos.to>
From: Zach Riggle <zachriggle@gmail.com>
Date: Fri, 10 Nov 2017 15:44:08 -0600
Message-ID: <CAMP9c5==+vgyYzb2+VdijvaxBhYLx4zhhyqJoptdhLZAdEaEGQ@mail.gmail.com>
To: Riku Voipio <riku.voipio@iki.fi>
Cc: Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>, 
	QEMU Trivial <qemu-trivial@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="001a11473804441636055da7d36e"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::241
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] linux-user: fix
 is_proc_myself to check the paths via realpath
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
X-List-Received-Date: Fri, 10 Nov 2017 21:44:42 -0000

--001a11473804441636055da7d36e
Content-Type: text/plain; charset="UTF-8"

Day 17 Ping :)



*Zach Riggle*

On Tue, Nov 7, 2017 at 2:06 PM, Riku Voipio <riku.voipio@iki.fi> wrote:

> Hi,
>
> On Mon, Nov 06, 2017 at 08:17:44PM +0000, Zach Riggle wrote:
> > Ping! What needs to be done to move this forward? My current
> implementation
> > is compatible with musl.
>
> I'll have a look at it soon.
>
> Riku
>
> > On Thu, Nov 2, 2017 at 12:36 PM Peter Maydell <peter.maydell@linaro.org>
> > wrote:
> >
> > > On 28 October 2017 at 06:14, Eric Blake <eblake@redhat.com> wrote:
> > > > By definition, in linux-user, we ARE using glibc; therefore, you are
> > > > free to use all GNU extensions.
> > >
> > > Don't we also support musl libc? I forget...
> > >
> > > thanks
> > > -- PMM
> > >
>

--001a11473804441636055da7d36e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Day 17 Ping :)<div><br></div></div><div class=3D"gmail_ext=
ra"><br clear=3D"all"><div><div class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature"><div dir=3D"ltr"><b><font face=3D"arial, helvetica, sans-=
serif"><br>Zach Riggle</font></b><br></div></div></div>
<br><div class=3D"gmail_quote">On Tue, Nov 7, 2017 at 2:06 PM, Riku Voipio =
<span dir=3D"ltr">&lt;<a href=3D"mailto:riku.voipio@iki.fi" target=3D"_blan=
k">riku.voipio@iki.fi</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_q=
uote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1e=
x">Hi,<br>
<span class=3D"im HOEnZb"><br>
On Mon, Nov 06, 2017 at 08:17:44PM +0000, Zach Riggle wrote:<br>
&gt; Ping! What needs to be done to move this forward? My current implement=
ation<br>
&gt; is compatible with musl.<br>
<br>
</span><span class=3D"im HOEnZb">I&#39;ll have a look at it soon.<br>
<br>
</span><span class=3D"HOEnZb"><font color=3D"#888888">Riku<br>
</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
&gt; On Thu, Nov 2, 2017 at 12:36 PM Peter Maydell &lt;<a href=3D"mailto:pe=
ter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt;<br>
&gt; wrote:<br>
&gt;<br>
&gt; &gt; On 28 October 2017 at 06:14, Eric Blake &lt;<a href=3D"mailto:ebl=
ake@redhat.com">eblake@redhat.com</a>&gt; wrote:<br>
&gt; &gt; &gt; By definition, in linux-user, we ARE using glibc; therefore,=
 you are<br>
&gt; &gt; &gt; free to use all GNU extensions.<br>
&gt; &gt;<br>
&gt; &gt; Don&#39;t we also support musl libc? I forget...<br>
&gt; &gt;<br>
&gt; &gt; thanks<br>
&gt; &gt; -- PMM<br>
&gt; &gt;<br>
</div></div></blockquote></div><br></div>

--001a11473804441636055da7d36e--

