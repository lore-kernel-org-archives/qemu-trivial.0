Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mXpB1-0007Db-Eb
	for mharc-qemu-trivial@gnu.org; Tue, 05 Oct 2021 14:28:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXpAw-0007AH-P0
 for qemu-trivial@nongnu.org; Tue, 05 Oct 2021 14:28:27 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:37788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mXpAr-0004eH-OS
 for qemu-trivial@nongnu.org; Tue, 05 Oct 2021 14:28:24 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 j10-20020a1c230a000000b0030d523b6693so4106612wmj.2
 for <qemu-trivial@nongnu.org>; Tue, 05 Oct 2021 11:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=balllrdYxCknSFzBJRCz5b43G8sYD6gnObCb987LYKk=;
 b=Y9HUydSfwPN1DaeeypW2uHSD9STf2l98adUNp8658YLUp0mx6o9tyfHdd/cr1rx3wC
 +FCM/6iKHTkAcrZGbFlrIsR+UY3cv+jqbpVsrC26WgdnTblRwWBQgNarQJ999fhL2rfv
 kV7nVM2vNXOo828srFhqgpt0EsuBeabh2Q+UfrM/NM7ZdEj1W8Ri6LyqgauEsG75PsW1
 foHh8qcKaA8jfuILJz+eplRASzNgPxA2evCM0VXa75SdaO8dyPNyPDqDO8TW5LBJRj3O
 zULGHXslJVrvgsRLQLb+4s32O0aDuzqxecy1Do2T1iAzUGZZaWI2d4uJ+eF+DVUFGd+E
 0XrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=balllrdYxCknSFzBJRCz5b43G8sYD6gnObCb987LYKk=;
 b=NaAvTF72lDPk0xhdd/TMzqEPJ/kbmqQ3ZqgLCy6v+M5kTiQtbgQdWXgtLZAWXsANwh
 eqH8OW74+e8vjIt0azxm1gRJQxxW8j3XkPGyWulgmGAxDgGF/QjJ2nUjO/H3QibbeE9j
 IpT52Eazz07c5Koiscmv2O7ZBX2IhMZJAifBH96nfTcSey/WHDUwQoNR6KLRhT6dRa8F
 cDyaPaxklvALrc9flozH5GAR/jebFFdvE2j2StYTXgIx0iaEmrxdC0n8egMHVa+Dm14Y
 qIpl3jcvzoLOKmf58+JenNHtom9cDVLB1GS3OiXAuGlgsvHU0fR47ZsNN5vE9Sku3tOs
 EU0w==
X-Gm-Message-State: AOAM532d8Lx8cGhOqb/PkJLB/1ma3t8q4ueRQCZS8hFTO72Ds8Gb3psS
 9pIzWCnpaLhvYJ7T9FGoUxAIAA==
X-Google-Smtp-Source: ABdhPJyvFrYqpfxc7eOYVNhh73PAQokO2KHzRVkdY/0DxVQey1444GqukclexDdqPWur2iH4ZpgX1Q==
X-Received: by 2002:a05:600c:3b26:: with SMTP id
 m38mr5019999wms.176.1633458500175; 
 Tue, 05 Oct 2021 11:28:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id r19sm2482597wmp.43.2021.10.05.11.28.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 11:28:19 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id A56CD1FF96;
 Tue,  5 Oct 2021 19:28:18 +0100 (BST)
References: <20210926220103.1721355-1-f4bug@amsat.org>
 <20210926220103.1721355-2-f4bug@amsat.org>
 <CAFEAcA_pRwZz=cK7=EjTsffhfhkXA-WvfecYWQ16sHYW+yQJBA@mail.gmail.com>
 <CAAdtpL7DesxBWZkjZdrWtSVNuqzqthPR-MMdCCd4LMg+Rnudww@mail.gmail.com>
User-agent: mu4e 1.7.0; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, QEMU Trivial
 <qemu-trivial@nongnu.org>, Kyle Evans <kevans@freebsd.org>, Richard
 Henderson <richard.henderson@linaro.org>, Laurent Vivier
 <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>, Warner Losh
 <imp@bsdimp.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH 1/2] bsd-user: Only process meson rules on BSD host
Date: Tue, 05 Oct 2021 19:28:08 +0100
In-reply-to: <CAAdtpL7DesxBWZkjZdrWtSVNuqzqthPR-MMdCCd4LMg+Rnudww@mail.gmail.com>
Message-ID: <87a6jnfhrx.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 05 Oct 2021 18:28:27 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> On Mon, Sep 27, 2021 at 11:15 AM Peter Maydell <peter.maydell@linaro.org>=
 wrote:
>> On Sun, 26 Sept 2021 at 23:04, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.=
org> wrote:
>> > Reported-by: Warner Losh <imp@bsdimp.com>
>> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> > ---
>> >  bsd-user/meson.build | 4 ++++
>> >  1 file changed, 4 insertions(+)
>> >
>> > diff --git a/bsd-user/meson.build b/bsd-user/meson.build
>> > index 03695493408..a7607e1c884 100644
>> > --- a/bsd-user/meson.build
>> > +++ b/bsd-user/meson.build
>> > @@ -1,3 +1,7 @@
>> > +if not config_host.has_key('CONFIG_BSD')
>> > +  subdir_done()
>> > +endif
>> > +
>> >  bsd_user_ss.add(files(
>> >    'bsdload.c',
>> >    'elfload.c',
>>
>>
>> So, what's the reason for this change?
>
> https://lore.kernel.org/qemu-devel/CANCZdfprC16ezJQCWJmYEApX6eym9nxSOqAtB=
AGr+cziS4r2qw@mail.gmail.com/
>
> linux-user/meson.build is evaluated on bsd, and bsd-user/meson.build on L=
inux.
>
>> The commit messages and
>> the cover letter don't really explain it. Is this fixing a bug
>> (if so what?), a precaution to avoid possible future bugs,
>> fixing a performance issue with how long meson takes to run (if
>> so, how much effect does this have), or something else?
>
> I'll wait for feedback from Paolo, then work on the explanation.

Ping Paolo?

--=20
Alex Benn=C3=A9e

