Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sqUgx-0004pV-OM
	for mharc-qemu-trivial@gnu.org; Tue, 17 Sep 2024 05:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sqUgw-0004nO-AD
 for qemu-trivial@nongnu.org; Tue, 17 Sep 2024 05:40:14 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sqUgu-0006ua-DY
 for qemu-trivial@nongnu.org; Tue, 17 Sep 2024 05:40:14 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5c413cf5de5so7611682a12.0
 for <qemu-trivial@nongnu.org>; Tue, 17 Sep 2024 02:40:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726566010; x=1727170810; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zcwpRtt1+Ds3KwlSF38JVJVBrJu4VTvKRsmKU20Kw0M=;
 b=EW3zIAdwnlHvUNokmE6D6jpnnAbBJn9Ujaw+dU2xDVF1QPulw7XKdLR86iV5IIGG2O
 AiA+0McXDj8UFTLphdMCC5QHwGbvgiJWAuM+S+Dv9uQIURgEpErWJR4wzFZVx0UxzCtk
 kGsQRbT/egAiYoAJVfn/xD5FIPxiwlL8EYIMzVjuj/1OGo2aDN6glFRzDJ4E8gAErMJ2
 kHJqCPNMmi7YDY6hwZUwe3sw1fB33v0xE2HvQJDlnb+IPZeR6Q2jIRlgdz+8xt5JBOdn
 MOPVErUaSmQ8d0giCTi9IFvHE99V2NaG1sPSAfjpI/3DXVEa+sfNixBuKLOr4ZGJ8DAs
 QM6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726566010; x=1727170810;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zcwpRtt1+Ds3KwlSF38JVJVBrJu4VTvKRsmKU20Kw0M=;
 b=MhCB/DdBpA+0e2fUkNxZ8CvbLobXN2ogoRyeqtutwWs8whQWQZDPA40opdp9ZDGWF4
 8XWBzG4+o3poPfrNonzIp5tZ0TTyMlGcxJIQG6a0eyM3ET8sYyCrwbz0muwLNPOnAq/5
 nsqjceCO+CtMTuUkWh0ecfwtd2BCBoTJLmgQfCpFxMV3s4xmHBy6sBHcx0JMA0cOAuuV
 bV6R8DI2lAgDFme6OR1Bum5SjNHfxZTxOxGDBoSI4RtcTqKmDS/OfGBGd5V2JIflJzyq
 fepy+79vIyMNUNNZwV6w7aFx+zhjeVTf5lTq46/6+daEqjNgeErOqnkxpmspbRNoXJt1
 OgiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtLzsYOUWoRiH+fzcELiYc8BS8/T1d01I0RgwH1SLIoogUIjNsMlIxbTxojKZtbYEp/ZhpHCO9DP6LOYw=@nongnu.org
X-Gm-Message-State: AOJu0YwQVuMixOkAanFMUouUfRoKIu279Cscx7+YbQfQVI3SLIPxBcd0
 UcoDbKslz3GP9HA72aQZ4fkIeWpD3cKLamPf87EyI5GpRvknBm7wuqMBQNMbWYAHfjj40X7oI6Q
 zfKSr8l39hhFyKTXyBMytzkr8flJJe079q48QQw==
X-Google-Smtp-Source: AGHT+IEVGii+uHQRlzUgRZOQf97m1MqlJKDH3wrqcGoANl5JYntRoxj2mFSYoWWUtMwoW+/CBk9/LSd0C5VET95xdsI=
X-Received: by 2002:a05:6402:34c7:b0:5c2:6c2d:3fb3 with SMTP id
 4fb4d7f45d1cf-5c413e5ed94mr13515652a12.36.1726566009804; Tue, 17 Sep 2024
 02:40:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240915125725.33099-1-ines.varhol@telecom-paris.fr>
 <10b98c97-ff2a-430f-ab76-66cc5948b0f8@tls.msk.ru>
In-Reply-To: <10b98c97-ff2a-430f-ab76-66cc5948b0f8@tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Sep 2024 10:39:56 +0100
Message-ID: <CAFEAcA_xsqUbCcgstwJWmF2uUWJGskZ04r6dNkiNpQPYbrMg2w@mail.gmail.com>
Subject: Re: [PATCH] hw/display: Fix mirrored output in dm163
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Laurent Vivier <laurent@vivier.eu>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 17 Sep 2024 09:40:14 -0000

On Tue, 17 Sept 2024 at 10:11, Michael Tokarev <mjt@tls.msk.ru> wrote:
>
> On 15.09.2024 15:57, In=C3=A8s Varhol wrote:
> > DM163 is an emulated 8x8 LED matrix. This commit flips the image
> > horizontally so it's rendered the same way as on the hardware.
>
> Picked this one up for trivial-patches, as it is, -
> I've no idea if it is correct or not :)
>
> This is an interesting device, I wonder if it is used by anyone?

The device is used by the Arm b-l475e-iot01a board.

thanks
-- PMM

