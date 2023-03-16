Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pcpSg-0001y1-Tw
	for mharc-qemu-trivial@gnu.org; Thu, 16 Mar 2023 11:24:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcpSf-0001xe-JS
 for qemu-trivial@nongnu.org; Thu, 16 Mar 2023 11:24:13 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pcpSd-0006Bg-LO
 for qemu-trivial@nongnu.org; Thu, 16 Mar 2023 11:24:13 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 l9-20020a17090a3f0900b0023d32684e7fso5961648pjc.1
 for <qemu-trivial@nongnu.org>; Thu, 16 Mar 2023 08:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678980250;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aAJFppXBi3TBcLP0ImZXXsCfoShRC86wnPfDVJR0w6E=;
 b=iHqLlu11Vu2ptxjvJa/u2ACgTD/4yhfUTKZWg2wc1Rd3U85BsCMlWU77JRGo55Ztw1
 90HAkMh1g5BsxtR9eaobWVN/4DbDxFF0aFTpXcvph2kzBLnL0N+8Ba/EoiYd5wkmkrAv
 WEops0tJk5N3DhasCmKj+ZkU/tOkHfHjgpfjShZei5CvGmMnXp2wmraaTi8My11hPmrq
 itOe6qlKl0ATKOPpZijPlt0kWa3EiSQcnQBsLVJ/ORrnGMCs5U2btul2BusHsguNwFVX
 5/OCrCaYu1AzB/khT4piLsMgYCr75htxe902i1TGpShpCPxDh7L5G8I3PcJFBV4MnySF
 +ZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678980250;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aAJFppXBi3TBcLP0ImZXXsCfoShRC86wnPfDVJR0w6E=;
 b=IZIUm7CcVF0C/fqqy2LooHB0ylB1FvGNY3Af3ddLk7aXe2GBtsOuyK6jmDc3n1kOfo
 66fn+k3Sq28K0TpVxHDFAAjgFbIyTTI6NN70QQrAjie4EHkNv4jOiqz1EjZhZKoL2Nmr
 Nsa+x/UTKIkO6xPgkePDNAZHVmncDIbxICSjlburrX1kAb9oOW99dPvT21BMj54fYQf0
 0aPBty4PQFrrfVBGHc0FXxXfs5TXc0MfeTAmVjzr/a+o6OHd2cu5Seor6LM2ar3z2r35
 n1HSCXzdTptcR5Z9y8fGF/EexLIeXVJVoUorTvV5Y0NLxCcqs+nbtrm7GqPH+P/QcRU+
 hwQA==
X-Gm-Message-State: AO0yUKUp872sGfYIjjNPUjli0yO7QD/qYub5nQQgrMArr6w5RTrtRGE/
 KDMhcQjW0w3NtgulpP2f3Gh052/QEncgCWTkq43/Wg==
X-Google-Smtp-Source: AK7set9+uj8TEzIiWVY6g9EoSfSof0NbpfTymdEw83U/3PwwqLWlN22ZAJ57RGHyiHVWx+UwTcaIwbud7jgpyDNZff8=
X-Received: by 2002:a17:902:e54c:b0:19a:5953:e85c with SMTP id
 n12-20020a170902e54c00b0019a5953e85cmr1615714plf.1.1678980250034; Thu, 16 Mar
 2023 08:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230314114431.1096972-1-peter.maydell@linaro.org>
 <8f048b8a-55f0-d124-3cb7-9a34e863149f@vivier.eu>
 <CAFEAcA_wAUgEiL1T_E9mKKW7PCpdRASKaBnTEydJuC9cPGme2w@mail.gmail.com>
 <67509d48-cf9d-bd01-e284-72f39c4d74f0@vivier.eu>
In-Reply-To: <67509d48-cf9d-bd01-e284-72f39c4d74f0@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Mar 2023 15:23:58 +0000
Message-ID: <CAFEAcA91vwRw409zFSQuRYiOVyeQ-GGcwE4QD0_Y2f7pebRHWA@mail.gmail.com>
Subject: Re: [PATCH] docs/sphinx/kerneldoc.py: Honour --enable-werror
To: Laurent Vivier <laurent@vivier.eu>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
X-List-Received-Date: Thu, 16 Mar 2023 15:24:13 -0000

On Thu, 16 Mar 2023 at 15:16, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 16/03/2023 =C3=A0 14:42, Peter Maydell a =C3=A9crit :
> >
> >
> > On Thu, 16 Mar 2023 at 13:40, Laurent Vivier <laurent@vivier.eu <mailto=
:laurent@vivier.eu>> wrote:
> >  >
> >  > Le 14/03/2023 =C3=A0 12:44, Peter Maydell a =C3=A9crit :
> >  > > Currently, the kerneldoc Sphinx plugin doesn't honour the
> >  > > --enable-werror configure option, so its warnings are never fatal.
> >  > > This is because although we do pass sphinx-build the -W switch, th=
e
> >  > > warnings from kerneldoc are produced by the scripts/kernel-doc scr=
ipt
> >  > > directly and don't go through Sphinx's "emit a warning" function.
> >  > >
> >  > > When --enable-werror is in effect, pass sphinx-build an extra
> >  > > argument -Dkerneldoc_werror=3D1.  The kerneldoc plugin can then us=
e
> >  > > this to determine whether it should be passing the kernel-doc scri=
pt
> >  > > -Werror.
> >  > >
> >  > > We do this because there is no documented mechanism for
> >  > > a Sphinx plugin to determine whether sphinx-build was
> >  > > passed -W or not; if one is provided then we can switch to
> >  > > that at a later date:
> >  > > https://github.com/sphinx-doc/sphinx/issues/11239
> > <https://github.com/sphinx-doc/sphinx/issues/11239>
> >  > >
> >  > > Signed-off-by: Peter Maydell <peter.maydell@linaro.org <mailto:pet=
er.maydell@linaro.org>>
> >  > > ---
> >  > > NB: we need to land the fix for the current outstanding
> >  > > warning before this one can go in...
> >  > > https://lore.kernel.org/qemu-devel/20230310103123.2118519-11-alex.=
bennee@linaro.org/
> > <https://lore.kernel.org/qemu-devel/20230310103123.2118519-11-alex.benn=
ee@linaro.org/>
> >  > > ---
> >  > >   docs/meson.build         | 2 +-
> >  > >   docs/sphinx/kerneldoc.py | 5 +++++
> >  > >   2 files changed, 6 insertions(+), 1 deletion(-)
> >
> >  > I've applied it to my trivial-patches branch,
> >  > but if you want to apply it via some doc or misc branches, let me kn=
ow.
> >
> > Trivial is fine, but make sure you've put in the fix for
> > the outstanding warning first :-)
>
> I didn't take this one but:
>
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg949558.html

Yeah, that one has the same effect.

-- PMM

