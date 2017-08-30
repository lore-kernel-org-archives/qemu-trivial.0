Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dn4A0-00035F-5J
	for mharc-qemu-trivial@gnu.org; Wed, 30 Aug 2017 10:40:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47608)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dn49u-00030L-Ko
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 10:40:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcandre.lureau@gmail.com>) id 1dn49t-0004rq-Iz
	for qemu-trivial@nongnu.org; Wed, 30 Aug 2017 10:39:58 -0400
Received: from mail-vk0-x234.google.com ([2607:f8b0:400c:c05::234]:35186)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
	id 1dn49r-0004rF-70; Wed, 30 Aug 2017 10:39:55 -0400
Received: by mail-vk0-x234.google.com with SMTP id z187so18061492vkd.2;
	Wed, 30 Aug 2017 07:39:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=goh1E7jAclT+nR789HTdVtHtYOtPrcQypqmy2Gb6JGQ=;
	b=SEiNfKuGai1TjomznPUqiKHDgYuWS8hRSFo3w+x4fXGxpArV6i1EPzlhbdUWLPmHgO
	d1EGOBHN+g/J6i6sB64cIZDlqM0l2a2teJ7OzTFkEqfMRJlwt9DsXDJfK+ZYAPnX5xmE
	i4wSrXlTBPMTtk2WYRuGYL0wz4ZaONG/3LyJLRX4J+aa0thSnTo/JXIy+xfWitMF2Kh2
	dGbjA4G9WBFRAOxkMD+mKd1O/fywr4wba/oxc7EXgay/vqjBU9YTmYQVZWJODXPXR1bJ
	MOFexOmDMbX2iM9OEnViU+yiRxMwgDgr6fNLbWMiBzBRHRsVfaH55uoUZwT1IXAe85Hg
	p6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=goh1E7jAclT+nR789HTdVtHtYOtPrcQypqmy2Gb6JGQ=;
	b=eo6HiuGtARiCLEClaanrsrRB0sbZIbvrg+sR4Uv5p8n4CcvCkO6C+jjiVfvCPmVF2B
	utSZPjcswMpNtrF328/y5EBIofLHF4RiXlq53/NAblxxQ6d1WY3DlybYlwLFuCFL0Ll3
	366vt2rw3sKcSv/5Il0yLHDyfeMQnlXo0RAqAeLfO+1nrbVkX9nUMlZpWl/tBkHuhIWn
	gms59j/52tEm6Ujt/dkPqtIDHo84+gp/Od/x13ptzVuBWInVLgkyDqD3/u0e9dxBvJXG
	ByvpVnRuQAwaSsThnIFLEIoNyO4o7wNdGABRdEYd3WzGLjgWoYdnOocPTy6Ph7jaA5Rv
	4W1g==
X-Gm-Message-State: AHYfb5iy2Sedtu0DA+I84rD5gUPKfh8V6lo0+t6n/SpVeEPeq2z5KynC
	zwthnAFTwNGiEPbAxJbQcG+M7jJ3Mw==
X-Received: by 10.31.11.11 with SMTP id 11mr842709vkl.61.1504103994594; Wed,
	30 Aug 2017 07:39:54 -0700 (PDT)
MIME-Version: 1.0
References: <1504100343-26607-1-git-send-email-thuth@redhat.com>
In-Reply-To: <1504100343-26607-1-git-send-email-thuth@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Wed, 30 Aug 2017 14:39:44 +0000
Message-ID: <CAJ+F1CJ7r=z8mMu0kyCEtjCgAnKGLhh5WTUKVdeyzi57eYLDSA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Laurent Vivier <lvivier@redhat.com>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
	David Gibson <david@gibson.dropbear.id.au>
Content-Type: multipart/alternative; boundary="001a114580a24d9a140557f98017"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::234
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for-2.11] hw/misc/ivshmem:
 Fix ivshmem_recv_msg() to also work on big endian systems
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
X-List-Received-Date: Wed, 30 Aug 2017 14:40:02 -0000

--001a114580a24d9a140557f98017
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Wed, Aug 30, 2017 at 3:43 PM Thomas Huth <thuth@redhat.com> wrote:

> The "slow" ivshmem-tests currently fail when they are running on a
> big endian host:
>
> $ uname -m
> ppc64
> $ V=3D1 QTEST_QEMU_BINARY=3Dx86_64-softmmu/qemu-system-x86_64
> tests/ivshmem-test -m slow
> /x86_64/ivshmem/single: OK
> /x86_64/ivshmem/hotplug: OK
> /x86_64/ivshmem/memdev: OK
> /x86_64/ivshmem/pair: OK
> /x86_64/ivshmem/server-msi: qemu-system-x86_64:
>  -device ivshmem-doorbell,chardev=3Dchr0,vectors=3D2: server sent invalid=
 ID
> message
> Broken pipe
>
> The problem is that the server side code in ivshmem_server_send_one_msg()
> correctly translates all messages IDs into little endian 64-bit values,
> but the client side code in the ivshmem_recv_msg() function does not swap
> the byte order back. Fix it by passing the value through le64_to_cpu().
>
>
ivshmem_read() is correct though

Signed-off-by: Thomas Huth <thuth@redhat.com>
>

 Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  hw/misc/ivshmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
> index 47a015f..b3ef3ec 100644
> --- a/hw/misc/ivshmem.c
> +++ b/hw/misc/ivshmem.c
> @@ -653,7 +653,7 @@ static int64_t ivshmem_recv_msg(IVShmemState *s, int
> *pfd, Error **errp)
>      } while (n < sizeof(msg));
>
>      *pfd =3D qemu_chr_fe_get_msgfd(&s->server_chr);
> -    return msg;
> +    return le64_to_cpu(msg);
>  }
>
>  static void ivshmem_recv_setup(IVShmemState *s, Error **errp)
> --
> 1.8.3.1
>
>
> --
Marc-Andr=C3=A9 Lureau

--001a114580a24d9a140557f98017
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi<br><div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
>On Wed, Aug 30, 2017 at 3:43 PM Thomas Huth &lt;<a href=3D"mailto:thuth@re=
dhat.com">thuth@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">The &quot;slow&quot; ivshmem-tests currently fail when they are runn=
ing on a<br>
big endian host:<br>
<br>
$ uname -m<br>
ppc64<br>
$ V=3D1 QTEST_QEMU_BINARY=3Dx86_64-softmmu/qemu-system-x86_64 tests/ivshmem=
-test -m slow<br>
/x86_64/ivshmem/single: OK<br>
/x86_64/ivshmem/hotplug: OK<br>
/x86_64/ivshmem/memdev: OK<br>
/x86_64/ivshmem/pair: OK<br>
/x86_64/ivshmem/server-msi: qemu-system-x86_64:<br>
=C2=A0-device ivshmem-doorbell,chardev=3Dchr0,vectors=3D2: server sent inva=
lid ID message<br>
Broken pipe<br>
<br>
The problem is that the server side code in ivshmem_server_send_one_msg()<b=
r>
correctly translates all messages IDs into little endian 64-bit values,<br>
but the client side code in the ivshmem_recv_msg() function does not swap<b=
r>
the byte order back. Fix it by passing the value through le64_to_cpu().<br>
<br></blockquote><div><br></div><div>ivshmem_read() is correct though</div>=
<div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">
Signed-off-by: Thomas Huth &lt;<a href=3D"mailto:thuth@redhat.com" target=
=3D"_blank">thuth@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
=C2=A0Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.l=
ureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<div style=3D"color:rg=
b(0,0,0);font-family:-webkit-standard;font-style:normal;font-variant-caps:n=
ormal;font-weight:normal;letter-spacing:normal;text-align:start;text-indent=
:0px;text-transform:none;white-space:normal;word-spacing:0px"><br class=3D"=
inbox-inbox-Apple-interchange-newline"></div></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
---<br>
=C2=A0hw/misc/ivshmem.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c<br>
index 47a015f..b3ef3ec 100644<br>
--- a/hw/misc/ivshmem.c<br>
+++ b/hw/misc/ivshmem.c<br>
@@ -653,7 +653,7 @@ static int64_t ivshmem_recv_msg(IVShmemState *s, int *p=
fd, Error **errp)<br>
=C2=A0 =C2=A0 =C2=A0} while (n &lt; sizeof(msg));<br>
<br>
=C2=A0 =C2=A0 =C2=A0*pfd =3D qemu_chr_fe_get_msgfd(&amp;s-&gt;server_chr);<=
br>
-=C2=A0 =C2=A0 return msg;<br>
+=C2=A0 =C2=A0 return le64_to_cpu(msg);<br>
=C2=A0}<br>
<br>
=C2=A0static void ivshmem_recv_setup(IVShmemState *s, Error **errp)<br>
--<br>
1.8.3.1<br>
<br>
<br>
</blockquote></div></div></div><div dir=3D"ltr">-- <br></div><div class=3D"=
gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr">Marc-A=
ndr=C3=A9 Lureau<br></div></div>

--001a114580a24d9a140557f98017--

