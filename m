Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ktx3o-0004jp-It
	for mharc-qemu-trivial@gnu.org; Mon, 28 Dec 2020 13:16:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ktvH8-0006iQ-8O
 for qemu-trivial@nongnu.org; Mon, 28 Dec 2020 11:21:40 -0500
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:34851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1ktvH5-00072t-6M
 for qemu-trivial@nongnu.org; Mon, 28 Dec 2020 11:21:38 -0500
Received: by mail-qk1-x731.google.com with SMTP id n142so9206105qkn.2
 for <qemu-trivial@nongnu.org>; Mon, 28 Dec 2020 08:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Kx2liJFWVJ70dQN59D3kj7Iv+SGPfkUhAFVKuO6MaEY=;
 b=11X4nHHJ2C+YOdMKMwn9wYPlcS/a+DRceahoKBD2O1MVEIRpG4PaeGsTdkGLzQpYff
 xgJMiFS0J0fwqx1Tr34FiCXW22Fy2Zo/tjgwbH2JTD0yTzjeC0/TBzvlqeNPG8Z62xYF
 HjnJuV2+X3P23aDWxcghgNycSipVsWSaStIJJ+4C5EfaUqZUZR5qO0MTen+6KGHsuPFh
 CrL3XvF45Ngy8NNNCbHtlS0m0P7uJvTq9j7B8VRjvorYPSctALzoo9F25PZm0NVRFLhN
 vjaXXrfC8lFQBhGq2plGiIuxJMwy+FHn/OTMjgGtUbpqc/FKE3wloYg6iw/r8xpeJiBX
 +AuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Kx2liJFWVJ70dQN59D3kj7Iv+SGPfkUhAFVKuO6MaEY=;
 b=CUPzh50ngiPYwGKDL1bC0PcYeoIefFzIH14wgdNcOR5bNdC4raS4ZRMgwncmGAseRq
 UuufX9jH0HBydUoLOfUQTOfe6lORFlrLu0sp9cVZfmigIvhPz81QjerVWv2A+i1eyBIA
 evM+AFA+gVOVXDLGEAlJbIaocs3ggeiVadpg5cP/dCL+UKSgapHk8iLXC1xCfntguR+8
 628aai0RQ5XuLQmXReazT87zkAGkBxuS7g+sKmxMabxWaohqEccNDP7JE04Sm4GnsBN7
 vo6snBwFJRMWUe/iUmQJMDangq0Y/Xz75D20nr9tmLBh3rEKGr91bSsGrhABfJc7PWhi
 YQ6g==
X-Gm-Message-State: AOAM532Qrd6/5VWvjBL6RtiI7QMM+x1ZGofP9XaOvju6us7UV9RaSpVL
 9d6jsRf+y4jFxBzBeed0s/bN18Zo3CoW3K+8Y7gF1A==
X-Google-Smtp-Source: ABdhPJznmtlka9JAoQv78DroYRfnWAUAmg2KGBRN4/uobCbPVBzGfiUfL+QW3sGxbgZ9/sSOCkdAp2nb8Iu+kNzjEGI=
X-Received: by 2002:a37:a614:: with SMTP id p20mr44149088qke.359.1609172493622; 
 Mon, 28 Dec 2020 08:21:33 -0800 (PST)
MIME-Version: 1.0
References: <CA+XhMqwjq99QdTKntxbQ_rZ-L3bQX7D3WHLkwMdK6zmiP=_56w@mail.gmail.com>
In-Reply-To: <CA+XhMqwjq99QdTKntxbQ_rZ-L3bQX7D3WHLkwMdK6zmiP=_56w@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Mon, 28 Dec 2020 09:21:22 -0700
Message-ID: <CANCZdfpt0vEvJR7BYpPSxKdHs6r0BoUtXsHL1gi+x6ZopzZ1OA@mail.gmail.com>
Subject: Re: [PATCH 0/2] bsd-user, FreeBSD update
To: David CARLIER <devnexen@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000dd732105b788aa44"
Received-SPF: none client-ip=2607:f8b0:4864:20::731;
 envelope-from=wlosh@bsdimp.com; helo=mail-qk1-x731.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 28 Dec 2020 13:15:58 -0500
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
X-List-Received-Date: Mon, 28 Dec 2020 16:21:48 -0000

--000000000000dd732105b788aa44
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 28, 2020 at 1:15 AM David CARLIER <devnexen@gmail.com> wrote:

> From 10b13162949debdbbd8394bc1047511d1a900176 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Mon, 28 Dec 2020 08:10:43 +0000
> Subject: [PATCH 0/2] *** SUBJECT HERE ***
>
> bsd-user, FreeBSD update.
>
> David Carlier (2):
>   bsd-user, updating the FreeBSD's syscall list, based on the 11.x
>   bsd-user, Adding more strace support for a handful of syscalls.
>
>  bsd-user/freebsd/strace.list  | 12 ++++++++++++
>  bsd-user/freebsd/syscall_nr.h | 25 ++++++++++++++++++++++---
>  2 files changed, 34 insertions(+), 3 deletions(-)
>

Have you seen my patches in this area? Are you familiar with the bsd-user
efforts we've been doing at https://github.com/qemu-bsd-user/qemu-bsd-user
We have about 300 patches in the queue and the more that others change
things, the harder it is to get them in. They are a twisty maze of
conflicts early in the series and some not-updated API calls dealing with
the evolution of the qemu cpu model as well.

I posted this series two weeks ago:
https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg05528.html

This part
https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg05530.html updates
the system call numbers to the latest FreeBSD 13 numbers.

Perhaps you could help in these efforts? They have been going on since
around Qemu 1.0 and we were bad about getting them upstreamed early, and so
are paying the price now. We use the code in the above repo to build about
40k packages for a couple of different architectures.

Warner


> --
> 2.30.0.rc2
>
>

--000000000000dd732105b788aa44
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 28, 2020 at 1:15 AM David=
 CARLIER &lt;<a href=3D"mailto:devnexen@gmail.com">devnexen@gmail.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">From 1=
0b13162949debdbbd8394bc1047511d1a900176 Mon Sep 17 00:00:00 2001<br>
From: David Carlier &lt;<a href=3D"mailto:devnexen@gmail.com" target=3D"_bl=
ank">devnexen@gmail.com</a>&gt;<br>
Date: Mon, 28 Dec 2020 08:10:43 +0000<br>
Subject: [PATCH 0/2] *** SUBJECT HERE ***<br>
<br>
bsd-user, FreeBSD update.<br>
<br>
David Carlier (2):<br>
=C2=A0 bsd-user, updating the FreeBSD&#39;s syscall list, based on the 11.x=
<br>
=C2=A0 bsd-user, Adding more strace support for a handful of syscalls.<br>
<br>
=C2=A0bsd-user/freebsd/strace.list=C2=A0 | 12 ++++++++++++<br>
=C2=A0bsd-user/freebsd/syscall_nr.h | 25 ++++++++++++++++++++++---<br>
=C2=A02 files changed, 34 insertions(+), 3 deletions(-)<br></blockquote><di=
v><br></div><div>Have you seen my patches in this area? Are you familiar wi=
th the bsd-user efforts we&#39;ve been doing at=C2=A0<a href=3D"https://git=
hub.com/qemu-bsd-user/qemu-bsd-user">https://github.com/qemu-bsd-user/qemu-=
bsd-user</a> We have about 300 patches in the queue and the more that other=
s change things, the harder it is to get them in. They are a twisty maze of=
 conflicts early in the series and some not-updated API calls dealing with =
the evolution of the qemu cpu model as well.</div><div><br></div><div>I pos=
ted this series two=C2=A0weeks ago: <a href=3D"https://lists.gnu.org/archiv=
e/html/qemu-devel/2020-12/msg05528.html">https://lists.gnu.org/archive/html=
/qemu-devel/2020-12/msg05528.html</a></div><div><br></div><div>This part <a=
 href=3D"https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg05530.htm=
l">https://lists.gnu.org/archive/html/qemu-devel/2020-12/msg05530.html</a> =
updates the system call numbers to the latest FreeBSD 13 numbers.</div><div=
><br></div><div>Perhaps you could help in these efforts? They have been goi=
ng on since around Qemu 1.0 and we were bad about getting them upstreamed e=
arly, and so are paying the price now. We use the code in the above repo to=
 build about 40k packages for a couple of different architectures.</div><di=
v><br></div><div>Warner<br></div><div>=C2=A0</div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">
-- <br>
2.30.0.rc2<br>
<br>
</blockquote></div></div>

--000000000000dd732105b788aa44--

