Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQTaD-0002sQ-Tm
	for mharc-qemu-trivial@gnu.org; Thu, 08 Oct 2020 06:55:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chetan4windows@gmail.com>)
 id 1kQTaC-0002ri-4R; Thu, 08 Oct 2020 06:55:36 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:40752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chetan4windows@gmail.com>)
 id 1kQTaA-0000fz-B9; Thu, 08 Oct 2020 06:55:35 -0400
Received: by mail-io1-xd30.google.com with SMTP id k25so5704467ioh.7;
 Thu, 08 Oct 2020 03:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc; bh=fCkHbxBuObiItJKrH2qtvQNo2ygQiWCAHqlzJ5Nd+Uo=;
 b=cr1yG5Fu9tKsmOwDQeehIDRCFWEry52M83wrjg8qcwRnCQ0LM4P/ky8GhaBTZES+t4
 +GeZY0KktbEcjUwRoabJAQ8ZRvsZ3G/C5tEjJs8Bdw2iTDWuS23FfWhLz+tih4M1Cl1E
 vw49dshAk/p/0busg0bHh5KBzc3oO0N4u38X7CjHxGfkpQBILLIvG4Q9NMPA+nOZsHSs
 SiyJXu3pVuWzZL9XrFyWL64BnStPLpmYLsRl2RPsPSpNwxGFZ3OEsh3j31IGfxsnaZ0X
 CjiimfVy1d1kc0X7AuIhbdTPI/XZA3s+ZmQ6ieNN2w9n7LDEgm8RkCPNRyWadQ3cM2Sq
 ORHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from:date
 :message-id:subject:to:cc;
 bh=fCkHbxBuObiItJKrH2qtvQNo2ygQiWCAHqlzJ5Nd+Uo=;
 b=l9vgYOXwi6psHpRpidP1Iodrw8amdGgMIDal3edu8s8+ZUqQryoRD+BiAFkK1SfFN9
 BGxB8tjfTJWb1Ber4h5abnP9sswCDHfSrKSE6upXEd2EMxG7y4KGjzgHzFebDT6INq++
 1N+AwDBG9iphIO33xOkii6SOpe4wSSfaruVKgoN4DAY5DuV5Zx17IIYUfFAPgPZUoFI1
 0m5VDeZ4aunZagqM7sqsYDzID6oSKS9zKjMU93PsTV3v2/vJ7fHxWuAsxgGVQWXFNkQ1
 EhO84Mt/lX4oLYjFL0DEaR6gk4Rd5WXd/x7uA6y6nX7ivPU7r/TK2w7Yw9EA+6Vaio9k
 eaWA==
X-Gm-Message-State: AOAM5328u3KLvnz0qtMLSmFAnIgxQa4ULNbkX7BqUPh/9pxZQlgKICwo
 8iN2RttTpZ38pBeY6p4lLBACeCSCfN9tzA+3qZk=
X-Google-Smtp-Source: ABdhPJy+h/L7yMFDI9Ff/3/LRfmfHff7Nanb31QEIHAoJ+HyGZ8SMDEIgjxC7kGr66VVZjF5y6p0dSsLknsflGbVZ28=
X-Received: by 2002:a6b:d80d:: with SMTP id y13mr5702330iob.15.1602154532923; 
 Thu, 08 Oct 2020 03:55:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:146:0:0:0:0:0 with HTTP;
 Thu, 8 Oct 2020 03:55:32 -0700 (PDT)
In-Reply-To: <20201008102239.GA2526468@redhat.com>
References: <20201008060528.68579-1-chetan4windows@gmail.com>
 <df199cc8-c383-ed03-6244-7a204e92397b@redhat.com>
 <ba4f81dd-8e5c-1d50-311c-fdc41f9cc504@redhat.com>
 <CAPPKfOHQV44b+kkcc3QYsLXya-5Ttcbve51uqRUS0e5GyouX6w@mail.gmail.com>
 <20201008102239.GA2526468@redhat.com>
From: Chetan <chetan4windows@gmail.com>
Date: Thu, 8 Oct 2020 16:25:32 +0530
Message-ID: <CAPPKfOEbUGmjb8QfLXAUH7iqhBL-3ns6CaRMTqbVF-oAoG0dRA@mail.gmail.com>
Subject: Re: [PATCH] Fixing LGPL version number
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Peter Maydell <peter.maydell@linaro.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000cf6d6f05b126abc6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d30;
 envelope-from=chetan4windows@gmail.com; helo=mail-io1-xd30.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, HTML_OBFUSCATE_05_10=0.26, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
X-List-Received-Date: Thu, 08 Oct 2020 10:55:36 -0000

--000000000000cf6d6f05b126abc6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thursday, October 8, 2020, Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

>Removing existing license text is legally dubious if you are >not the
>exclusive copyright on the file being changed. Yes, the >kernel did it,
>but there was legal work behind the scenes before that >was done.

Thanks Daniel, I won't be proceedings with the license text changes.

On Thursday, October 8, 2020, Daniel P. Berrang=C3=A9 <berrange@redhat.com>
wrote:

> On Thu, Oct 08, 2020 at 02:10:01PM +0530, Chetan wrote:
> > Hello,
> >
> > I'll be working on replacing the license text in LGPL licensed files wi=
th
> > the SPDX identifier tag and will submit it as a separate patch.
>
> Removing existing license text is legally dubious if you are not the
> exclusive copyright on the file being changed. Yes, the kernel did it,
> but there was legal work behind the scenes before that was done.
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/
> dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/
> dberrange :|
>
>

--000000000000cf6d6f05b126abc6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thursday, October 8, 2020, Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto=
:berrange@redhat.com">berrange@redhat.com</a>&gt; wrote:<div><br></div><div=
>&gt;Removing existing license text is legally dubious if you are &gt;not t=
he<br>&gt;exclusive copyright on the file being changed. Yes, the &gt;kerne=
l did it,<br>&gt;but there was legal work behind the scenes before that &gt=
;was done.</div><div><br></div><div>Thanks Daniel, I won&#39;t be proceedin=
gs with the license text changes.<br><br>On Thursday, October 8, 2020, Dani=
el P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">berrange@red=
hat.com</a>&gt; wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Thu, Oct 08, 20=
20 at 02:10:01PM +0530, Chetan wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; I&#39;ll be working on replacing the license text in LGPL licensed fil=
es with<br>
&gt; the SPDX identifier tag and will submit it as a separate patch.<br>
<br>
Removing existing license text is legally dubious if you are not the<br>
exclusive copyright on the file being changed. Yes, the kernel did it,<br>
but there was legal work behind the scenes before that was done.<br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" target=3D"_blank">https://berrange.com<=
/a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"https://www.flickr.com/=
photos/dberrange" target=3D"_blank">https://www.flickr.com/photos/<wbr>dber=
range</a> :|<br>
|: <a href=3D"https://libvirt.org" target=3D"_blank">https://libvirt.org</a=
>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 <a href=3D"https://fstop138.berrange.com" target=3D"_blank">https://=
fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" target=3D"_blank">https://entangl=
e-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"https://www.instag=
ram.com/dberrange" target=3D"_blank">https://www.instagram.com/<wbr>dberran=
ge</a> :|<br>
<br>
</blockquote></div>

--000000000000cf6d6f05b126abc6--

