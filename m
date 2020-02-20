Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j4pjr-0005ps-98
	for mharc-qemu-trivial@gnu.org; Thu, 20 Feb 2020 12:35:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41984)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j4pjm-0005om-6b
 for qemu-trivial@nongnu.org; Thu, 20 Feb 2020 12:35:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j4pjk-0001LW-Vv
 for qemu-trivial@nongnu.org; Thu, 20 Feb 2020 12:35:46 -0500
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f]:33413)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j4pjk-0001LA-QC
 for qemu-trivial@nongnu.org; Thu, 20 Feb 2020 12:35:44 -0500
Received: by mail-oi1-x22f.google.com with SMTP id q81so28411391oig.0
 for <qemu-trivial@nongnu.org>; Thu, 20 Feb 2020 09:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g3Q2fkCcFtALG4YlComMunPy5B22O7Kd3mD1z1ByAOo=;
 b=p17McKuk4SBntEB9/h3/rGj0w290mFAxMu1QNUGgm7EngzxPTAGlcWhyq2D/JtluJ/
 SPHce6349p3NTsEA+9oEtlYeuzR6pXqgufeRQ4vcahrlbQcxAOvXQBS0hwbiLTYta4P2
 jvtagr4h4netvD8i16/H4eNUj3Pzi5QHWmfVxFVHIqOY1a+psIzSiNR5Mij1ArxfuVo+
 bDPh78BYwjEn2iWKh6it7dxNm13LDZ7MxwBcKkS4aj8M+HtI3Mf7DdTCWTzWy6KyCZkw
 cw0b1+PlEY8uTOgNnSzxWWvWeO4uW1h/XGSLIpcU4PelDpvLKrxHY/kzPzydDD/vmNp2
 WW/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g3Q2fkCcFtALG4YlComMunPy5B22O7Kd3mD1z1ByAOo=;
 b=JIElkwVQMzZ+hv8N+TmIIKThHYNUH5QU+JHo4WIXm94w8QsgHCgMkN6CkBa/5rkYTi
 4CrLeCkVZWu0pOyPba99yHzAbRIGvKdXDIlGicCaPjApCXBqeR7v7aBsbwT6zngBLQmJ
 Rd9zTTyLrVehn4HlhjJ898wvv7N2+D20ZzdKbz9D6Z3Gnk15FHQo8ReNEoLcs2P0vpQK
 R0oZtbF/AfqOmRT3TF4k/2DWYKC665MZ9v78sdqaoHVDJC0unLKC4KWwBxsGuKcWAMcy
 TCUb/V5EP03HoqZto1XMY6D9+J+4pS35ElUfd4xa0Os21rX5EF55td043GXdUqZBo7Ui
 SUSw==
X-Gm-Message-State: APjAAAUBmSDl4wXE6oyV3kCVDrpCpcVrYJh7QcSbec/OyIV758J32IaC
 oYZ1AOt5Jw77x0fs3zsNq3vJu1+/h85KarHMnNFwvw==
X-Google-Smtp-Source: APXvYqxFCqcIa05VefrONofkmb52EHhLstjavsOyQ8HlOfPI3cLU4hqm5lnxXtn6gx/bq/pJY/qnnclfJaQLI3SV8c4=
X-Received: by 2002:a54:4f16:: with SMTP id e22mr2994886oiy.170.1582220143945; 
 Thu, 20 Feb 2020 09:35:43 -0800 (PST)
MIME-Version: 1.0
References: <20200219101612.1033925-1-laurent@vivier.eu>
In-Reply-To: <20200219101612.1033925-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2020 17:35:33 +0000
Message-ID: <CAFEAcA-gVy=KkOnjo7b4EsaetNKo_CPYA1WFwZYJT1vZVNao9A@mail.gmail.com>
Subject: Re: [PULL 00/17] Trivial branch patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Marek Vasut <marex@denx.de>, 
 Thomas Huth <thuth@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Jiri Pirko <jiri@resnulli.us>, 
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair@alistair23.me>, 
 Gerd Hoffmann <kraxel@redhat.com>, Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Laurent Vivier <lvivier@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, 
 Thomas Huth <huth@tuxfamily.org>, Qemu-block <qemu-block@nongnu.org>, 
 Chris Wulff <crwulff@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::22f
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
X-List-Received-Date: Thu, 20 Feb 2020 17:35:48 -0000

On Wed, 19 Feb 2020 at 10:16, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 6c599282f8ab382fe59f03a6cae755b89561a7b3:
>
>   Merge remote-tracking branch 'remotes/armbru/tags/pull-monitor-2020-02-15-v2' into staging (2020-02-17 13:32:25 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to d1cb67841ca213802ee789957188ec87e8b7996d:
>
>   hw/xtensa/xtfpga:fix leak of fdevice tree blob (2020-02-19 10:33:38 +0100)
>
> ----------------------------------------------------------------
> Fix memory leak with fdt
> cosmetic change in code and logs
> update mailmap
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

