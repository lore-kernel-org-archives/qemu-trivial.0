Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gAIIr-0004P3-NO
	for mharc-qemu-trivial@gnu.org; Wed, 10 Oct 2018 13:29:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34406)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanogarzarella@gmail.com>) id 1gAHY6-0005oe-DI
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 12:41:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanogarzarella@gmail.com>) id 1gAHY4-0001KG-DE
	for qemu-trivial@nongnu.org; Wed, 10 Oct 2018 12:41:26 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44971)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanogarzarella@gmail.com>)
	id 1gAHY4-0001JB-74; Wed, 10 Oct 2018 12:41:24 -0400
Received: by mail-ot1-x344.google.com with SMTP id p23so5986705otf.11;
	Wed, 10 Oct 2018 09:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=yaqHNAqCerzpVBHkEfDOuNSarvHEB5+vm81aj+aC5XM=;
	b=qdNfxSzU2LdG2Kr6yKLZK5/LbTgb3LRn92NleoPpdhXTs6BJLeKvYYzhUojMCIEU3e
	Wy/l+Jrrqipao/IlS3Y8Y9S5GDD8QXMPycRuOVoGS3mWU4ufcNf9nV1aChN3qIkORLQS
	jTstYeWfrqBsjqbS/PNLKFP4RXv9o5l6vXY/8yl3uQpVY6wAjiaC0+x8L0YX/6SAnL4X
	hmJ571XTYExTjOKjV+MpyEm3XzZ2RI5twzYNO/24dmA05TRAHRciPNOYnufa9tGxK5qg
	StlkkDmAmKrEAMTRBVdwdRgTediTLBPZ2a80xZH7RCAkH3EgZ6HyfrcspMjulf8A4Hzq
	QgQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=yaqHNAqCerzpVBHkEfDOuNSarvHEB5+vm81aj+aC5XM=;
	b=hsm6N7ZWRUROUW27cu3UXWuM9djSXd9nbAqsC9vGCDC+T+9HiB+t5tns5rwSsXkmZv
	hBk1UIfhPXjAJfUMCthlKTOllZFkziRoC/Gl5zAugWZJ3QdsD/ZOi2+ibo6sgmpcThHW
	okJ+1YbUzoSd4rzI64V9uTYesxpBLwsMOcNQHb+glWLrlhItEfG9G+8WBUJEQ/VJidRM
	tN3wH84y2pZZNvyWMXEMA5iC9ZZmVKoaj4c1IxettgWBvdX5M3mkZv1BQo8eBjyN6s3T
	XV7E1x1DAcOp5qNY+zsEQXvAmyhGyp67axfzY21lmOOnBKg9iHx0ez/A8PLYUuQYaNU6
	CJqg==
X-Gm-Message-State: ABuFfojAZuT590pXnx6Aw7mkZoVV/s617IYuNSRTHnfZx2vUf/GkpL8k
	hxYoH1qVo6BG0cvRlRvuAvUUErj7/8IJZu10rg==
X-Google-Smtp-Source: ACcGV63cz91WY9+9O5JJD4Jx2ZFj8d1I1dP7WtOZeqUpeecltGtRJStWk3gjl3m+NyAU2pn++OIdSSAXsE+W7m5WW4Q=
X-Received: by 2002:a9d:4483:: with SMTP id v3mr13680667ote.233.1539189680860; 
	Wed, 10 Oct 2018 09:41:20 -0700 (PDT)
MIME-Version: 1.0
References: <20181010161025.34796-1-liq3ea@163.com>
In-Reply-To: <20181010161025.34796-1-liq3ea@163.com>
From: Stefano Garzarella <stefanogarzarella@gmail.com>
Date: Wed, 10 Oct 2018 18:41:09 +0200
Message-ID: <CAO0mX5Y+FbtFa1Q0MXRf3yA4uSnPKV_GgH8z49Knzy+jvPHf=A@mail.gmail.com>
To: liq3ea@163.com
Cc: ehabkost@redhat.com, marcel.apfelbaum@gmail.com, qemu-trivial@nongnu.org, 
	qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000002b728f0577e28666"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
X-Mailman-Approved-At: Wed, 10 Oct 2018 13:29:44 -0400
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] machine: fix a typo
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
X-List-Received-Date: Wed, 10 Oct 2018 16:41:27 -0000

--0000000000002b728f0577e28666
Content-Type: text/plain; charset="UTF-8"

Reviewed-by: Stefano Garzarella <stefanogarzarella@gmail.com>

Il giorno mer 10 ott 2018 alle ore 18:11 Li Qiang <liq3ea@163.com> ha
scritto:

> Cc: qemu-trivial@nongnu.org
> Signed-off-by: Li Qiang <liq3ea@163.com>
> ---
>  hw/core/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 1987557833..da50ad6de7 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -636,7 +636,7 @@ static void machine_class_init(ObjectClass *oc, void
> *data)
>          machine_get_memory_encryption, machine_set_memory_encryption,
>          &error_abort);
>      object_class_property_set_description(oc, "memory-encryption",
> -        "Set memory encyption object to use", &error_abort);
> +        "Set memory encryption object to use", &error_abort);
>  }
>
>  static void machine_class_base_init(ObjectClass *oc, void *data)
> --
> 2.17.1
>
>
>
>

-- 
*Stefano Garzarella*
Software Engineer

e-mail: stefano.garzarella@gmail.com
github: http://github.com/stefano-garzarella
linkedin: http://it.linkedin.com/pub/stefano-garzarella

--0000000000002b728f0577e28666
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br><div>Reviewed-by: Stefano Garzarella =
&lt;<a href=3D"mailto:stefanogarzarella@gmail.com" target=3D"_blank">stefan=
ogarzarella@gmail.com</a>&gt;<br></div></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr">Il giorno mer 10 ott 2018 alle ore 18:11 Li Qiang &=
lt;<a href=3D"mailto:liq3ea@163.com" target=3D"_blank">liq3ea@163.com</a>&g=
t; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">Cc: <a href=3D"mailt=
o:qemu-trivial@nongnu.org" target=3D"_blank">qemu-trivial@nongnu.org</a><br=
>
Signed-off-by: Li Qiang &lt;<a href=3D"mailto:liq3ea@163.com" target=3D"_bl=
ank">liq3ea@163.com</a>&gt;<br>
---<br>
=C2=A0hw/core/machine.c | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/hw/core/machine.c b/hw/core/machine.c<br>
index 1987557833..da50ad6de7 100644<br>
--- a/hw/core/machine.c<br>
+++ b/hw/core/machine.c<br>
@@ -636,7 +636,7 @@ static void machine_class_init(ObjectClass *oc, void *d=
ata)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0machine_get_memory_encryption, machine_se=
t_memory_encryption,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;error_abort);<br>
=C2=A0 =C2=A0 =C2=A0object_class_property_set_description(oc, &quot;memory-=
encryption&quot;,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Set memory encyption object to use&quot;=
, &amp;error_abort);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 &quot;Set memory encryption object to use&quot=
;, &amp;error_abort);<br>
=C2=A0}<br>
<br>
=C2=A0static void machine_class_base_init(ObjectClass *oc, void *data)<br>
-- <br>
2.17.1<br>
<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"m_767920400205815103gmail_signature" data-smartmail=3D"gmail_sign=
ature"><div dir=3D"ltr"><div><div dir=3D"ltr"><div><div dir=3D"ltr"><b><fon=
t face=3D"courier new, monospace">Stefano Garzarella</font></b></div><div d=
ir=3D"ltr"><font face=3D"courier new, monospace">Software Engineer</font></=
div><div dir=3D"ltr"><font face=3D"courier new, monospace"><br></font></div=
></div><div><div dir=3D"ltr"><div><div><div><font face=3D"courier new, mono=
space">e-mail:=C2=A0<a href=3D"mailto:stefano.garzarella@gmail.com" target=
=3D"_blank">stefano.garzarella@gmail.com</a></font></div></div></div></div>=
</div><div><div dir=3D"ltr"><div><font face=3D"courier new, monospace">gith=
ub: <a href=3D"http://github.com/stefano-garzarella" target=3D"_blank">http=
://github.com/stefano-garzarella</a><br></font></div><div><font face=3D"cou=
rier new, monospace">linkedin: <a href=3D"http://it.linkedin.com/pub/stefan=
o-garzarella" target=3D"_blank">http://it.linkedin.com/pub/stefano-garzarel=
la</a></font><br></div></div></div></div></div></div></div>

--0000000000002b728f0577e28666--

