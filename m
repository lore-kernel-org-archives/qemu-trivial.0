Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eAKCb-000326-3C
	for mharc-qemu-trivial@gnu.org; Thu, 02 Nov 2017 14:26:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1eAKCW-00030O-CO
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 14:26:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zachriggle@gmail.com>) id 1eAKCV-0006ce-BA
	for qemu-trivial@nongnu.org; Thu, 02 Nov 2017 14:26:48 -0400
Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242]:56181)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <zachriggle@gmail.com>)
	id 1eAKCV-0006c6-6g; Thu, 02 Nov 2017 14:26:47 -0400
Received: by mail-qt0-x242.google.com with SMTP id v41so502336qtv.12;
	Thu, 02 Nov 2017 11:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=HsRGBHF09lMAoDhb/2Wap58M/l3eaViTGhuRA06vldQ=;
	b=uj/iJiNcUEMgL0lruHxS0PvpD16Gn6Q0X/agkEenb/ggx5DCcFfaKH9priuCn97AMS
	rGQfzowmAE+UgGAoCOKgmBjeepUsPZRd8eurEZpGAIJU/IZUlgwA9abn2o+3rHr49Q8T
	UivHAwh8Ch3awiUwRkHJb+yYr37KPavTsW1AS/mLGiXQQk/OBPfw3vhqOKfTL44Az6IV
	CsSSFNL6yrnE21WOo7G1DvuJcAvXdYklHsgG/NTCxxASgZtVP39e9YdZh6odZe2OH53z
	hhqAEQmC8ClPdInMXMcWCkWPhwfpXvormSmzSruGYmWaoMkZcyyKi7LyA82TM/U3kDQF
	DjTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=HsRGBHF09lMAoDhb/2Wap58M/l3eaViTGhuRA06vldQ=;
	b=cut9GBJ33OBJlCkvqLDsgiXy35/lf7rSZyVy+Vztk69SDUk4UEZ3EsUpA4QyyLBe5Z
	PnWNc3WbBynamkLxPaWyej9a6M+2a4e0hxJ3ZDPtXsMoPlUyVUheIqlk3suE4xTpN1fj
	HVRHjA39p3K9Do9j2eDLN4jLnR5TlDxWoGWq0zsN1+xSkmRK8JW68uNYMrzAa8yMW0VN
	KdFZ8OpjD1WqA0x+rVmgSh6q5wLYcw6hFOzyWrg8DLxkEy5UAbr/ieH10UaWM0Feahba
	xty5TcZowOikdErY29MGNStXZX0l2MUg4DXwMgDleXorZBJi10+Gi1j8ROilPb6+bw1K
	3GIA==
X-Gm-Message-State: AMCzsaX9FZnKQD6VIjHIKyG/rp2vqG+1gTAA/ewEr3wSI9I0p+pvvON7
	3Yh5WdpuH0vYKw6yLlbpANoWuz8ifTL1GjA5+hA=
X-Google-Smtp-Source: ABhQp+QFsiiIgDbNj43XK/cd6cV3UzX3X7s3qhe70dD59+HlZjbpz/ivXLyZCY+zJbUFD7ozgc8v3v/Vkr8oeo6FSGY=
X-Received: by 10.200.17.1 with SMTP id c1mr6054528qtj.252.1509647206294; Thu,
	02 Nov 2017 11:26:46 -0700 (PDT)
MIME-Version: 1.0
References: <20171024230758.31779-1-riggle@google.com>
	<20171025033442.44872-1-zachriggle@gmail.com>
	<CAMP9c5=whCgR4qkOPDRKZ+adpWEPiVM=BwZp_r7qCAR7UAsWAQ@mail.gmail.com>
	<20171027093600.GA29513@kos.to>
	<CAMP9c5mm7icy06goXr3iiOEgqPbzyaWDt775+9+L=oxnqwRhpA@mail.gmail.com>
	<CAMP9c5kTQmKd7GVE8DZzvY8tTtWV=tLsgV1ptWPKhEAh=J-maQ@mail.gmail.com>
	<2251f54e-4c55-7495-8f60-af40cdd80594@redhat.com>
In-Reply-To: <2251f54e-4c55-7495-8f60-af40cdd80594@redhat.com>
From: Zach Riggle <zachriggle@gmail.com>
Date: Thu, 02 Nov 2017 18:26:35 +0000
Message-ID: <CAMP9c5=3rpH_84w8sRNhdRufnu7sisiyu_U0Bz+cyqdpP=C2_A@mail.gmail.com>
To: Eric Blake <eblake@redhat.com>
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-trivial@nongnu.org, 
	Laurent Vivier <laurent@vivier.eu>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="089e0826516877ab6f055d0421fe"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::242
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
X-List-Received-Date: Thu, 02 Nov 2017 18:26:49 -0000

--089e0826516877ab6f055d0421fe
Content-Type: text/plain; charset="UTF-8"

Ping. What changes do I need to make to land this?
On Sat, Oct 28, 2017 at 12:49 AM Eric Blake <eblake@redhat.com> wrote:

> On 10/27/2017 09:07 PM, Zach Riggle wrote:
> > Another case that may be more relevant for general QEMU use, is that the
> > current code fails if the software under test has poor path-handling
> code.
> > For example, any of
> >
> > - //proc/self/maps
> > - /proc//self/maps
> > - /proc/self//maps
> >
> > Will all return the non-emulated results.  Those examples are just path
> > canonicalization issues and could be resolved with e.g.
> > canonicalize_file_name, but I'm not sure if QEMU allows GNU extensions --
> > and realpath() is portable.
>
> By definition, in linux-user, we ARE using glibc; therefore, you are
> free to use all GNU extensions.
>
> And you'd be surprised at how many non-glibc implementations of
> realpath() are not POSIX-compliant, even though that is not relevant here.
>
> --
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3266
> Virtualization:  qemu.org | libvirt.org
>
>

--089e0826516877ab6f055d0421fe
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping.  What changes do I need to make to land this?<br><div class=3D"gmail_=
quote"><div dir=3D"ltr">On Sat, Oct 28, 2017 at 12:49 AM Eric Blake &lt;<a =
href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On 10/27/2017 09:07 PM, Zach Riggle wrote:<=
br>
&gt; Another case that may be more relevant for general QEMU use, is that t=
he<br>
&gt; current code fails if the software under test has poor path-handling c=
ode.<br>
&gt; For example, any of<br>
&gt;<br>
&gt; - //proc/self/maps<br>
&gt; - /proc//self/maps<br>
&gt; - /proc/self//maps<br>
&gt;<br>
&gt; Will all return the non-emulated results.=C2=A0 Those examples are jus=
t path<br>
&gt; canonicalization issues and could be resolved with e.g.<br>
&gt; canonicalize_file_name, but I&#39;m not sure if QEMU allows GNU extens=
ions --<br>
&gt; and realpath() is portable.<br>
<br>
By definition, in linux-user, we ARE using glibc; therefore, you are<br>
free to use all GNU extensions.<br>
<br>
And you&#39;d be surprised at how many non-glibc implementations of<br>
realpath() are not POSIX-compliant, even though that is not relevant here.<=
br>
<br>
--<br>
Eric Blake, Principal Software Engineer<br>
Red Hat, Inc.=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0+1-919-301-3266<br>
Virtualization:=C2=A0 <a href=3D"http://qemu.org" rel=3D"noreferrer" target=
=3D"_blank">qemu.org</a> | <a href=3D"http://libvirt.org" rel=3D"noreferrer=
" target=3D"_blank">libvirt.org</a><br>
<br>
</blockquote></div>

--089e0826516877ab6f055d0421fe--

