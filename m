Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1i161s-0002EJ-5W
	for mharc-qemu-trivial@gnu.org; Fri, 23 Aug 2019 05:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53785)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i161n-0002Cj-MW
 for qemu-trivial@nongnu.org; Fri, 23 Aug 2019 05:38:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <aleksandar.m.mail@gmail.com>) id 1i161m-00083H-NX
 for qemu-trivial@nongnu.org; Fri, 23 Aug 2019 05:38:39 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36831)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <aleksandar.m.mail@gmail.com>)
 id 1i161m-00082k-IT; Fri, 23 Aug 2019 05:38:38 -0400
Received: by mail-ot1-x343.google.com with SMTP id k18so8223433otr.3;
 Fri, 23 Aug 2019 02:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=CNoosYKunD/uXniu/uAfvouJoCQrHWMfwEVoJp+inf0=;
 b=BN6/W99yzYeRgp/UmEIK0yRpD6AQ6IAayDoMbFeujXje8wr70VKgnpaWTh+1LrUFqR
 G6vIWrI9kBQcg7UPNFnT7dF3U7k/KVgRMCNXlI8kOCqZOa7nTkjj5Fd0Kwu19yeZiu18
 +j8G6P9jg19UDPrPaYN7/CqLWvyiULAb2ez2ctAbCUmJ/P78c81LyLutqTe8yoI0ywxU
 yXC+1ls9dP+iP1kb0tTlwNB9n0FRH52J/rRapEZPPXtDI/Yel1tcWxnD9evF+aqPQCeo
 g2xOrlLcEGZJ5YyIVFmsMaRev/niuV/C6KJ5sAbmWZ1CJLBYyXy919WSE6PuEcihcNJ6
 johQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=CNoosYKunD/uXniu/uAfvouJoCQrHWMfwEVoJp+inf0=;
 b=JG8lPgSeyACoao9BH0GF+ABXJZUsAguB8bMb9IipqW9/jS3i2V2iK/RerLVIUYfn19
 wkWY82foxURwwE9B/c8fESbwfJD3amyTLlGqNr5SR30dFFPrYaA+5hopJyZrS5KRT1Cb
 46QH6WL/FeIQLVNygh8gLDw1f5InXx8veeGdZzxvlwjkeGbNCpGNou23vT9R3HqhpNUZ
 jGNAJjBP37KXZ61XgFPP+0uT2INvXid40xpJeGZUA9Sg26IUeXIkTs6mlS/KenkjSSDs
 YBb8zDiUjfwF06m97qnJcoDDq/LFNgaUW1QpMNptamgifcNrN9wCcbzKjyPlqENHN3i8
 dV8Q==
X-Gm-Message-State: APjAAAWKjjM0xYjvj8cDfaZ8vv4aoa7g0EgqhnZ5XBAdTtWw8anDt6ET
 0zjW/QWqFXi68hHwqm7f11t3z+OoUiZEQD57dkSaVg==
X-Google-Smtp-Source: APXvYqzzou9Tq6Iw4BR3PzEB2sz08Brm04pmGz0DshLjU1ano+U03+xMp/r7afI0EU5BLvjwS3i83tJL8V6YqJMnxME=
X-Received: by 2002:a05:6830:15cc:: with SMTP id
 j12mr3308993otr.64.1566553116406; 
 Fri, 23 Aug 2019 02:38:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Fri, 23 Aug 2019 02:38:35
 -0700 (PDT)
Received: by 2002:a05:6830:10d7:0:0:0:0 with HTTP; Fri, 23 Aug 2019 02:38:35
 -0700 (PDT)
In-Reply-To: <20190822230916.576-3-philmd@redhat.com>
References: <20190822230916.576-1-philmd@redhat.com>
 <20190822230916.576-3-philmd@redhat.com>
From: Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Date: Fri, 23 Aug 2019 11:38:35 +0200
Message-ID: <CAL1e-=hTG7eG1eKW1qm03MUxMPvufLKYtubeZ8V2tyCMNKtmsA@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: qemu-trivial@nongnu.org, berrange@redhat.com, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000000676900590c59280"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/3] mailmap: Update philmd
 email address
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
X-List-Received-Date: Fri, 23 Aug 2019 09:38:42 -0000

--0000000000000676900590c59280
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

23.08.2019. 01.10, "Philippe Mathieu-Daud=C3=A9" <philmd@redhat.com> =D1=98=
=D0=B5
=D0=BD=D0=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:
>
> Use the email address where I spend most of my time.
>
> Suggested-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---

Reviewed-by: Aleksandar Markovic <amarkovic@wavecomp.com>

>  .mailmap | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/.mailmap b/.mailmap
> index e1fdc88d25..e68ddd26e6 100644
> --- a/.mailmap
> +++ b/.mailmap
> @@ -32,6 +32,7 @@ Aleksandar Markovic <amarkovic@wavecomp.com> <
aleksandar.markovic@imgtec.com>
>  Paul Burton <pburton@wavecomp.com> <paul.burton@mips.com>
>  Paul Burton <pburton@wavecomp.com> <paul.burton@imgtec.com>
>  Paul Burton <pburton@wavecomp.com> <paul@archlinuxmips.org>
> +Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> <f4bug@amsat.org>
>  Yongbok Kim <yongbok.kim@mips.com> <yongbok.kim@imgtec.com>
>
>  # Also list preferred name forms where people have changed their
> --
> 2.20.1
>
>

--0000000000000676900590c59280
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
23.08.2019. 01.10, &quot;Philippe Mathieu-Daud=C3=A9&quot; &lt;<a href=3D"m=
ailto:philmd@redhat.com">philmd@redhat.com</a>&gt; =D1=98=D0=B5 =D0=BD=D0=
=B0=D0=BF=D0=B8=D1=81=D0=B0=D0=BE/=D0=BB=D0=B0:<br>
&gt;<br>
&gt; Use the email address where I spend most of my time.<br>
&gt;<br>
&gt; Suggested-by: Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@r=
edhat.com">berrange@redhat.com</a>&gt;<br>
&gt; Signed-off-by: Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philm=
d@redhat.com">philmd@redhat.com</a>&gt;<br>
&gt; ---</p>
<p dir=3D"ltr">Reviewed-by: Aleksandar Markovic &lt;<a href=3D"mailto:amark=
ovic@wavecomp.com">amarkovic@wavecomp.com</a>&gt;</p>
<p dir=3D"ltr">&gt; =C2=A0.mailmap | 1 +<br>
&gt; =C2=A01 file changed, 1 insertion(+)<br>
&gt;<br>
&gt; diff --git a/.mailmap b/.mailmap<br>
&gt; index e1fdc88d25..e68ddd26e6 100644<br>
&gt; --- a/.mailmap<br>
&gt; +++ b/.mailmap<br>
&gt; @@ -32,6 +32,7 @@ Aleksandar Markovic &lt;<a href=3D"mailto:amarkovic@=
wavecomp.com">amarkovic@wavecomp.com</a>&gt; &lt;<a href=3D"mailto:aleksand=
ar.markovic@imgtec.com">aleksandar.markovic@imgtec.com</a>&gt;<br>
&gt; =C2=A0Paul Burton &lt;<a href=3D"mailto:pburton@wavecomp.com">pburton@=
wavecomp.com</a>&gt; &lt;<a href=3D"mailto:paul.burton@mips.com">paul.burto=
n@mips.com</a>&gt;<br>
&gt; =C2=A0Paul Burton &lt;<a href=3D"mailto:pburton@wavecomp.com">pburton@=
wavecomp.com</a>&gt; &lt;<a href=3D"mailto:paul.burton@imgtec.com">paul.bur=
ton@imgtec.com</a>&gt;<br>
&gt; =C2=A0Paul Burton &lt;<a href=3D"mailto:pburton@wavecomp.com">pburton@=
wavecomp.com</a>&gt; &lt;<a href=3D"mailto:paul@archlinuxmips.org">paul@arc=
hlinuxmips.org</a>&gt;<br>
&gt; +Philippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">=
philmd@redhat.com</a>&gt; &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsa=
t.org</a>&gt;<br>
&gt; =C2=A0Yongbok Kim &lt;<a href=3D"mailto:yongbok.kim@mips.com">yongbok.=
kim@mips.com</a>&gt; &lt;<a href=3D"mailto:yongbok.kim@imgtec.com">yongbok.=
kim@imgtec.com</a>&gt;<br>
&gt;<br>
&gt; =C2=A0# Also list preferred name forms where people have changed their=
<br>
&gt; -- <br>
&gt; 2.20.1<br>
&gt;<br>
&gt;<br>
</p>

--0000000000000676900590c59280--

