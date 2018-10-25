Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFhIs-0001Ov-VH
	for mharc-qemu-trivial@gnu.org; Thu, 25 Oct 2018 11:12:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gFhIo-0001MY-VY
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 11:12:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <liq3ea@gmail.com>) id 1gFhIo-0003Q8-4z
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 11:12:02 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:45215)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <liq3ea@gmail.com>)
	id 1gFhIn-0003Ln-Pa; Thu, 25 Oct 2018 11:12:01 -0400
Received: by mail-io1-xd2d.google.com with SMTP id p83-v6so5685954iod.12;
	Thu, 25 Oct 2018 08:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=voKP5Cfpp446XY5LL3sRZ867zSbAEoQxG6EaYbg5WfI=;
	b=o71Po71kHT/5bcgrFWwIt234PQ7V9R2z4vzUvKRNZh0PW65uEEpZ8BRaUeQUfIPaZg
	emBJXsBFH4jXT/NEancV5XxNhn9pF7ByxKYZRo8tRAxrN1VlGYING0ruv90tO+ZQe9NT
	fN8hM7mQY9yaeZtygv6SvtCZOzKNbUY2qL+MNOh8M7OObhBtWfddUvYXQSTy4sLH4u/U
	+e7I+d3oDTg1f8jl3g27ZeZDPHWpdeHfoILvXWhiDUChgFeimbyBMkpTzNfEQ84RJkrg
	PKns53hrYHyVk/Db/pw5zykBS/Bc1kBbeeaUJSojwEZlTMkPkJp458C2HrilYAnhxn0/
	NN1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=voKP5Cfpp446XY5LL3sRZ867zSbAEoQxG6EaYbg5WfI=;
	b=YmBFocX0yWPfkit3FlEl0kHFCYPguCis6Fuc+deryb8zjh6fr43ZezcRe6jO5adIlw
	NvizTxE3Mf4vopzixDJ60lFtd0QBNjr/9JyVLiNIAo8fdOJ1Jq8mOA4STcOkSn8WM11r
	2tiXbjMucKNgdp6nKkr4tKKvcUwcU02/lhPBlyL2/bRqnfpN3zwxq0c9nZxovTlIwguE
	X3dz7ST96ypMvc+vNMQJshfhPJmHwuUxZbQYlNQFVPKlEDjjBrj9lGaxSo5hLq51uT62
	Jb9hT8v+jc7sG1mWTMucp+BMHl49BmAkAc81OOXFOUUKc7mI+gxar7lvGJHD/vjlms+o
	Vcww==
X-Gm-Message-State: AGRZ1gKIvGWj2sCokKUf5GL0Ac3pke19MSFVdcn/QJoFTazLWUJxuksb
	UNQRK5xdaKklzDioA60tU6vS9K7vkWK1hHus6Xo=
X-Google-Smtp-Source: AJdET5esy7/ZXCyH3UBlMcXidBv5d2JY6ZoZPGMeHFSVtZhsgBDmCrOd1SZwpWE3Zs5fYMNUMp5t/GBI+OAiMKJ8ji8=
X-Received: by 2002:a6b:7302:: with SMTP id e2-v6mr1169499ioh.94.1540480320637;
	Thu, 25 Oct 2018 08:12:00 -0700 (PDT)
MIME-Version: 1.0
References: <1539261534-2795-1-git-send-email-liq3ea@gmail.com>
	<9d750f50-3692-8376-6b04-34b1c3991b15@vivier.eu>
In-Reply-To: <9d750f50-3692-8376-6b04-34b1c3991b15@vivier.eu>
From: Li Qiang <liq3ea@gmail.com>
Date: Thu, 25 Oct 2018 23:11:24 +0800
Message-ID: <CAKXe6SKbUkfHtx8EFuq=8c97nxntOpO3WTESQr4X6ngciQ+9jw@mail.gmail.com>
To: laurent@vivier.eu
Cc: mst@redhat.com, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	qemu-trivial@nongnu.org, Qemu Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000004b924405790f066c"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::d2d
Subject: Re: [Qemu-trivial] [PATCH] piix: use TYPE_FOO constants than string
 constats
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
X-List-Received-Date: Thu, 25 Oct 2018 15:12:03 -0000

--0000000000004b924405790f066c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Laurent,
Thanks,

This patch has been in Michael's pull request.
Maybe you can drop it.

Thanks,
Li Qiang



Laurent Vivier <laurent@vivier.eu> =E4=BA=8E2018=E5=B9=B410=E6=9C=8825=E6=
=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=889:52=E5=86=99=E9=81=93=EF=BC=9A

> On 11/10/2018 13:38, Li Qiang wrote:
> > Make them more QOMConventional.
> > Cc:qemu-trivial@nongnu.org
> >
> > Signed-off-by: Li Qiang <liq3ea@gmail.com>
> > ---
> >  hw/pci-host/piix.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
>
> Applied,
>
> Thanks,
> Laurent
>

--0000000000004b924405790f066c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hello=C2=A0Laurent,</div=
><div dir=3D"ltr">Thanks,</div><div dir=3D"ltr"><br></div><div dir=3D"ltr">=
This patch has been in=C2=A0Michael&#39;s pull request.</div><div>Maybe you=
 can drop it.</div><div><br></div><div>Thanks,</div><div>Li Qiang</div><div=
><br></div><div><br></div><div dir=3D"ltr"><div><div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr">Laurent Vivier &lt;<a href=3D"mailto:laurent@vivi=
er.eu">laurent@vivier.eu</a>&gt; =E4=BA=8E2018=E5=B9=B410=E6=9C=8825=E6=97=
=A5=E5=91=A8=E5=9B=9B =E4=B8=8B=E5=8D=889:52=E5=86=99=E9=81=93=EF=BC=9A<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">On 11/10/2018 13:38=
, Li Qiang wrote:<br>
&gt; Make them more QOMConventional.<br>
&gt; <a href=3D"mailto:Cc%3Aqemu-trivial@nongnu.org" target=3D"_blank">Cc:q=
emu-trivial@nongnu.org</a> <br>
&gt; <br>
&gt; Signed-off-by: Li Qiang &lt;<a href=3D"mailto:liq3ea@gmail.com" target=
=3D"_blank">liq3ea@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/pci-host/piix.c | 11 +++++++----<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 4 deletions(-)<br>
<br>
Applied,<br>
<br>
Thanks,<br>
Laurent<br>
</blockquote></div></div></div></div></div></div>

--0000000000004b924405790f066c--

