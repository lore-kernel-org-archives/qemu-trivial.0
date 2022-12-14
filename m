Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p5U65-0007j9-Cp
	for mharc-qemu-trivial@gnu.org; Wed, 14 Dec 2022 10:55:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1p5U63-0007ib-9Y
 for qemu-trivial@nongnu.org; Wed, 14 Dec 2022 10:55:03 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1p5U60-0005CA-PA
 for qemu-trivial@nongnu.org; Wed, 14 Dec 2022 10:55:03 -0500
Received: by mail-wr1-x435.google.com with SMTP id h12so140537wrv.10
 for <qemu-trivial@nongnu.org>; Wed, 14 Dec 2022 07:55:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vQ12kQ8GJlUpybjgHiW4SL+jDsM6U/tVV4jQZXS1Pts=;
 b=3tMc5nR8fW0OUso/NAHkN8xIBH1DpyYlfwuoRZZJyRlT7mVNJholywYkeccZPA6rnr
 rmzIV8HkU9otz38sWpsKDm3hcDkdBEaAZQRdii/EtjaAF4oDsJTBjMNbNRuI4roczjqv
 07uHSzWXlP71nzyRsmlXGkQwRvnw6YYNe16Zdt3X1pF7NntSkVbQXKiRMP3ZCcqwWFK9
 ee7UfgAAskIvHR3p3kt9KdZfc19PJ+Z8NCdXPig3Tj222nDY66zcJwF4HST8xXpEOEua
 GMmGfbrtH4sUm24HLeka3tsbXbEM1xWa0XKeXXrSJftHFTJs5N2Odgx5XzlzrtX9eYKo
 Rgfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vQ12kQ8GJlUpybjgHiW4SL+jDsM6U/tVV4jQZXS1Pts=;
 b=KcMvKgGr+sL+Q76iZdLvsBOU85o72C9yRK8wIOD9SajcO7UFnHFdHnyYrv+XN7eLpY
 G3Bfly3xQkxmtFJ2t1aYbzLS6v7kivpneKPz5ypf/hsSKbc7P8fmMId8/uykKFbMrmdW
 ss1hvcdHCg5jAUBYu9OowcCI8BY6VAu5T2LLBT3bRsqMchnWXwC75XaoZpf/6K0fXkgh
 HYyrttKPnUyU13YU3jcocz4XP7cm+ZMxaWXf5UK4U6F7XKZN656/Plzg9pjd0awaYb2P
 A3JPXwtKAf4qMfQmrLRJUPaPda4TRCXuC3U0eHebtSEfPj5gtEI9rpi3ac6tjuHCbwMC
 Mt8A==
X-Gm-Message-State: ANoB5plXRkgtSf6/Hy0UftQiZxSNPlJZ1N3p5Jk9N1MHLajkCbXckI9Y
 EQTdiIuTBa7p5iYblBARqh8TZ/gRV+Zbstwa3++rEA==
X-Google-Smtp-Source: AA0mqf7VtE8Ri0zRJ0vykO9JSi3b7hf+ODJF1/JYWw0kfIwYtmQbpUPQcZN6Frhv364udyt1NZNC271dtB70mdDsvJA=
X-Received: by 2002:adf:eecd:0:b0:242:3d24:5474 with SMTP id
 a13-20020adfeecd000000b002423d245474mr17258669wrp.681.1671033299225; Wed, 14
 Dec 2022 07:54:59 -0800 (PST)
MIME-Version: 1.0
References: <20221125044138.962137-1-ani@anisinha.ca>
 <CAARzgwy=m4tN69cSn1msrZg1thkzL2ZfQ8_yOLw6Y77AzfFP-g@mail.gmail.com>
 <20221129000647-mutt-send-email-mst@kernel.org>
 <CAARzgwzS0tvV-Vz7PByrWfxrs9Gc6vyuvDVKriDMQMoJ1HWtPg@mail.gmail.com>
 <874juirvrr.fsf@pond.sub.org>
 <CAARzgwzgtP93NKdiC-p_k5LLzgY_eEruFgeGC8wOcH9AvSrwtA@mail.gmail.com>
In-Reply-To: <CAARzgwzgtP93NKdiC-p_k5LLzgY_eEruFgeGC8wOcH9AvSrwtA@mail.gmail.com>
From: Ani Sinha <ani@anisinha.ca>
Date: Wed, 14 Dec 2022 21:24:48 +0530
Message-ID: <CAARzgwyX9yLrok2rePbEqE2O187k68LWwJ6OuO1Uw6ywPzFfew@mail.gmail.com>
Subject: Re: [PATCH v2] acpi/tests/avocado/bits: add SPDX license identifiers
 for bios bits tests
To: Markus Armbruster <armbru@redhat.com>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>, 
 Maydell Peter <peter.maydell@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2a00:1450:4864:20::435;
 envelope-from=ani@anisinha.ca; helo=mail-wr1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 14 Dec 2022 15:55:03 -0000

On Tue, Nov 29, 2022 at 3:41 PM Ani Sinha <ani@anisinha.ca> wrote:
>
> On Tue, Nov 29, 2022 at 2:18 PM Markus Armbruster <armbru@redhat.com> wro=
te:
> >
> > Ani Sinha <ani@anisinha.ca> writes:
> >
> > > On Tue, Nov 29, 2022 at 10:37 AM Michael S. Tsirkin <mst@redhat.com> =
wrote:
> > >>
> > >> On Tue, Nov 29, 2022 at 08:02:15AM +0530, Ani Sinha wrote:
> > >> >
> > >> >
> > >> > On Fri, Nov 25, 2022 at 10:11 AM Ani Sinha <ani@anisinha.ca> wrote=
:
> > >> >
> > >> >     Added the SPDX license identifiers for biosbits tests.
> > >> >     Also added a comment on each of the test scripts to indicate t=
hat they run
> > >> >     from within the biosbits environment and hence are not subject=
ed to the
> > >> >     regular
> > >> >     maintenance activities for QEMU and is excluded from the depen=
dency
> > >> >     management
> > >> >     challenges in the host testing environment.
> > >> >
> > >> >     Cc: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> > >> >     Cc: Paolo Bonzini <pbonzini@redhat.com>
> > >> >     Cc: Maydell Peter <peter.maydell@linaro.org>
> > >> >     Cc: John Snow <jsnow@redhat.com>
> > >> >     Cc: Thomas Huth <thuth@redhat.com>
> > >> >     Cc: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > >> >     Cc: Igor Mammedov <imammedo@redhat.com>
> > >> >     Cc: Michael Tsirkin <mst@redhat.com>
> > >> >     Cc: Thomas Huth <thuth@redhat.com>
> > >> >     Cc: qemu-trivial@nongnu.org
> > >> >     Signed-off-by: Ani Sinha <ani@anisinha.ca>

Reminder: michael, please queue this for your next PR.

> > >> >
> > >> >
> > >> > Is anyone going to queue this for 7.2 given it's quite trivial?
> > >>
> > >> Don't see why we should bother.
> > >
> > > Completeness?
> >
> > We're about to tag -rc3.  It's too late for trivial stuff.  Anything bu=
t
> > release-critical fixes would be madness at this stage.
> >
> > I recommend to route this via qemu-trivial into the next release.
>
> Sounds good. I'll make sure I remind people again after the release
> and before I go underground for xmas.

