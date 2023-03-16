Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcnsf-0001Y1-K1
	for mharc-qemu-trivial@gnu.org; Thu, 16 Mar 2023 09:42:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcnsd-0001XI-UZ
 for qemu-trivial@nongnu.org; Thu, 16 Mar 2023 09:42:55 -0400
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcnsc-0002Ys-3N
 for qemu-trivial@nongnu.org; Thu, 16 Mar 2023 09:42:55 -0400
Received: by mail-pf1-x42f.google.com with SMTP id ce7so1145441pfb.9
 for <qemu-trivial@nongnu.org>; Thu, 16 Mar 2023 06:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678974172;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uNa1IvKBI6YwaZck5BxEV6vCD8ZEYxZqLISguOw2G64=;
 b=u8HBxecxMBJltHsLlBvqxGFqvcZDuuXXXMjYALI9tFgcFI8UA0aMPYULLLR8Yapowb
 KCvUuhC04rux1BgYtCJ+LWjKKSVMGmguwFhhNoimg7H04Vvx2ufknD9IsvLf52rZfMRN
 5RmJukR2+iRk2u0Ps5HHHqPWBiKpKYxAOWLLp2BsPxAHq6EJSEiwhPP6cOuZSBHnpUr/
 ym0R9EmNHlGfFBgRf2w7Vj6kegn7lcXfEJ5IWZz6VLDNUSLxDupLLJ1jwrXnzSx1YyIY
 9OInFXLPQS2KYavYiCYpzrj4vIqcbhpRS3bI+1fJ6ou4osTifzMjl7QtWhVPj7sl7/8u
 nFLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678974172;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uNa1IvKBI6YwaZck5BxEV6vCD8ZEYxZqLISguOw2G64=;
 b=ygbQxkFPvXj8z2qFW+Ixb+ajbzB2IPiSCn9hoxAnmNskOK1qVei/xUDbAM4kYGWePf
 lDeBZJst3bJT6k3vgybCGUCUFR8tqEv7IjOAQg8bnZK8UPsZ+ecqK9w3mo0HpIatZKsq
 h78vdreZoV5/Ca/gKj73G7UTI8g3LaTzHZDwEE2KkPsYZ5fD23QLQHo8ED53txTd4LZw
 YdTSVXJoJXKDeE11uQ9lDCJkt/Yf8s6mdgfIo1/SDPeC7pQ9hFyxfmCOkGlLOV+oLdFj
 fRVOiFaQVN3zsGEO/98ccskMIFYGsMDgm1DzIvv98BJLYg0KK51XBSrloEI2NN9foKxr
 PvFg==
X-Gm-Message-State: AO0yUKUVL7TNc/Gq3a/WYfSkL3qRepBvScRrsgcqRNyKEMjrDZ2wWn8p
 gTs3OLFVmSJ6YryRJ9MVgobt34qHp72WqrvCbGOX2A==
X-Google-Smtp-Source: AK7set9Zpu1FBpojaYPRnXj84Dgo7zLpcuBll/NiM35nUns78pTf2gttmN1i4HURYB9kuBjFBcEZH117LqcPHi/nn0A=
X-Received: by 2002:a65:5087:0:b0:503:a26a:2e7a with SMTP id
 r7-20020a655087000000b00503a26a2e7amr904333pgp.6.1678974172412; Thu, 16 Mar
 2023 06:42:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230314114431.1096972-1-peter.maydell@linaro.org>
 <8f048b8a-55f0-d124-3cb7-9a34e863149f@vivier.eu>
In-Reply-To: <8f048b8a-55f0-d124-3cb7-9a34e863149f@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Mar 2023 13:42:41 +0000
Message-ID: <CAFEAcA_wAUgEiL1T_E9mKKW7PCpdRASKaBnTEydJuC9cPGme2w@mail.gmail.com>
Subject: Re: [PATCH] docs/sphinx/kerneldoc.py: Honour --enable-werror
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000002255bb05f704a3b3"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Mar 2023 13:42:56 -0000

--0000000000002255bb05f704a3b3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 16 Mar 2023 at 13:40, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 14/03/2023 =C3=A0 12:44, Peter Maydell a =C3=A9crit :
> > Currently, the kerneldoc Sphinx plugin doesn't honour the
> > --enable-werror configure option, so its warnings are never fatal.
> > This is because although we do pass sphinx-build the -W switch, the
> > warnings from kerneldoc are produced by the scripts/kernel-doc script
> > directly and don't go through Sphinx's "emit a warning" function.
> >
> > When --enable-werror is in effect, pass sphinx-build an extra
> > argument -Dkerneldoc_werror=3D1.  The kerneldoc plugin can then use
> > this to determine whether it should be passing the kernel-doc script
> > -Werror.
> >
> > We do this because there is no documented mechanism for
> > a Sphinx plugin to determine whether sphinx-build was
> > passed -W or not; if one is provided then we can switch to
> > that at a later date:
> > https://github.com/sphinx-doc/sphinx/issues/11239
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > NB: we need to land the fix for the current outstanding
> > warning before this one can go in...
> >
https://lore.kernel.org/qemu-devel/20230310103123.2118519-11-alex.bennee@li=
naro.org/
> > ---
> >   docs/meson.build         | 2 +-
> >   docs/sphinx/kerneldoc.py | 5 +++++
> >   2 files changed, 6 insertions(+), 1 deletion(-)

> I've applied it to my trivial-patches branch,
> but if you want to apply it via some doc or misc branches, let me know.

Trivial is fine, but make sure you've put in the fix for
the outstanding warning first :-)

-- PMM

--0000000000002255bb05f704a3b3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br>On Thu, 16 Mar 2023 at 13:40, Laurent Vivier &lt;<=
a href=3D"mailto:laurent@vivier.eu">laurent@vivier.eu</a>&gt; wrote:<br>&gt=
;<br>&gt; Le 14/03/2023 =C3=A0 12:44, Peter Maydell a =C3=A9crit :<br>&gt; =
&gt; Currently, the kerneldoc Sphinx plugin doesn&#39;t honour the<br>&gt; =
&gt; --enable-werror configure option, so its warnings are never fatal.<br>=
&gt; &gt; This is because although we do pass sphinx-build the -W switch, t=
he<br>&gt; &gt; warnings from kerneldoc are produced by the scripts/kernel-=
doc script<br>&gt; &gt; directly and don&#39;t go through Sphinx&#39;s &quo=
t;emit a warning&quot; function.<br>&gt; &gt;<br>&gt; &gt; When --enable-we=
rror is in effect, pass sphinx-build an extra<br>&gt; &gt; argument -Dkerne=
ldoc_werror=3D1.=C2=A0 The kerneldoc plugin can then use<br>&gt; &gt; this =
to determine whether it should be passing the kernel-doc script<br>&gt; &gt=
; -Werror.<br>&gt; &gt;<br>&gt; &gt; We do this because there is no documen=
ted mechanism for<br>&gt; &gt; a Sphinx plugin to determine whether sphinx-=
build was<br>&gt; &gt; passed -W or not; if one is provided then we can swi=
tch to<br>&gt; &gt; that at a later date:<br>&gt; &gt; <a href=3D"https://g=
ithub.com/sphinx-doc/sphinx/issues/11239">https://github.com/sphinx-doc/sph=
inx/issues/11239</a><br>&gt; &gt;<br>&gt; &gt; Signed-off-by: Peter Maydell=
 &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</=
a>&gt;<br>&gt; &gt; ---<br>&gt; &gt; NB: we need to land the fix for the cu=
rrent outstanding<br>&gt; &gt; warning before this one can go in...<br>&gt;=
 &gt; <a href=3D"https://lore.kernel.org/qemu-devel/20230310103123.2118519-=
11-alex.bennee@linaro.org/">https://lore.kernel.org/qemu-devel/202303101031=
23.2118519-11-alex.bennee@linaro.org/</a><br>&gt; &gt; ---<br>&gt; &gt; =C2=
=A0 docs/meson.build =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 2 +-<br>&gt; &gt; =C2=A0=
 docs/sphinx/kerneldoc.py | 5 +++++<br>&gt; &gt; =C2=A0 2 files changed, 6 =
insertions(+), 1 deletion(-)<br><br>&gt; I&#39;ve applied it to my trivial-=
patches branch,<br><div>&gt; but if you want to apply it via some doc or mi=
sc branches, let me know.</div><div><br></div><div>Trivial is fine, but mak=
e sure you&#39;ve put in the fix for</div><div>the outstanding warning firs=
t :-)</div><div><br></div><div>-- PMM<br><br></div><br></div>

--0000000000002255bb05f704a3b3--

