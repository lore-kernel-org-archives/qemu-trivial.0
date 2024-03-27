Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1rpTKB-000186-0i
	for mharc-qemu-trivial@gnu.org; Wed, 27 Mar 2024 09:28:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpTK9-00017i-RG
 for qemu-trivial@nongnu.org; Wed, 27 Mar 2024 09:28:13 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpTK8-0005i6-7I
 for qemu-trivial@nongnu.org; Wed, 27 Mar 2024 09:28:13 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-56c3689ad2cso1769155a12.1
 for <qemu-trivial@nongnu.org>; Wed, 27 Mar 2024 06:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711546090; x=1712150890; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TitztqS/oML4BOLgIpb5h6Tok73IYxEQW3Ngsz1nAYM=;
 b=s6M5hVzFWp7xP39KdNW0LOkGJejRgPpD9YMuzi3rp0zULJtiKlu7rv6yGDo7TKsYk7
 f505dDf+zUjTrf1/Od7Nxthz4Ky6+A2zYqMA7H5SCDr6/dNztNeCjlraVG7kQad4/w8P
 hYF8eQ6CXXpoPnzn4ghqiVoVfHrdC7cnCZzEW6xOzRbNh2OCmi/L+5Gca0KCE+On9TvG
 B0AigMqKPGqwhBEap/kzk1OnaYbV3uWwzHA8LpmaaaELjcjPMvODWvo1HFVWTI04A3Tb
 SfsCtRND3kemGmqCEuDy2j+qG8J4JqMx0f+iJv3CfUcGXC2ZCnMWPzc3gnesql7GjB08
 7CzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711546090; x=1712150890;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TitztqS/oML4BOLgIpb5h6Tok73IYxEQW3Ngsz1nAYM=;
 b=VDpPi3TczLe8657uq8C/hAVKcgSpXTXMsp2DquTjCv2o4lp5g5USz3R+Igoiq+QA4t
 8Lyx68x6rQbsY2aVfif3OUdwc39B3gwIsexNtwCwdcGuxMB/fmtagwxV1pHnyg1uME2Z
 Lk0uMZwdLdx0vYDNbZWXJa6/y1VTTYjZa5Xq6UFIZmx3o/cL7KnKVbK2r9vLLhcjleSt
 wRhNEoeimXTHg5vA+rd8qF7pbF7Qylnk1d3EGgmCSyLVy87sd/ZeL8z6acGHgFILtSlB
 ENqyL1CJrzT9Ex0FZLKChoY71u9Du/s1Tgio60D6XFX5tOFrpkZ/ezfWkyxWd77oZu0q
 CWuw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlJi3wVXF8xom3dEKGr7IpDZ57H+tFDR1dqXrkXZ6sYTq6fiBy7LhcwTjsgBfNge3vGKEP8rg28fN3vIfViAjJTUoJ8RWf/g==
X-Gm-Message-State: AOJu0YzkbG/gomKZ1OMUbGWdRKTuk3b2LqM/E4OHrznvJ+ngb4UJA372
 JCCKtTIpV4BQIZQT1GAJJHuuCSJLTX0jSJFeYJWWnN1ty0VEeIR70wwgDZ46dl/lSBAYhA/etVG
 ltfX2xSnLSz11KlvIfAtl0x3ZVtT/C3wy3rwxhA==
X-Google-Smtp-Source: AGHT+IGNq1+ftX5LbkdkZcSnLQCAhD6g3naPeP7IPh0hp5Ewlu2m4BDCVPlWnTc2iPcXB3gF4R9+Q3H6HgWoNGrA81U=
X-Received: by 2002:a50:bae2:0:b0:568:b702:e0d3 with SMTP id
 x89-20020a50bae2000000b00568b702e0d3mr4021319ede.21.1711546090361; Wed, 27
 Mar 2024 06:28:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240326125104.90103-1-imammedo@redhat.com>
 <a4a0bb13-d6a0-4665-810d-ecd9a9fb89b1@redhat.com>
 <8dbba6ae-5910-4a62-9a08-a56e20dfb480@linaro.org>
 <20240326171632.3cc7533d@imammedo.users.ipa.redhat.com>
 <ZgP5x3ECYGevla1-@redhat.com>
 <20240327140917.69d86539@imammedo.users.ipa.redhat.com>
 <ZgQdjX_G9FzpOx6n@redhat.com>
In-Reply-To: <ZgQdjX_G9FzpOx6n@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 27 Mar 2024 13:27:58 +0000
Message-ID: <CAFEAcA-K30KZndNK-sfUKjsE7ATMNpNUgpPZY-5YEpxL3BoeLA@mail.gmail.com>
Subject: Re: [PATCH for-9.0] docs/about: Mark the iaspc machine type as
 deprecated
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, 
 Bernhard Beschow <shentey@gmail.com>, pbonzini@redhat.com,
 devel@lists.libvirt.org, 
 richard.henderson@linaro.org, mst@redhat.com, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-List-Received-Date: Wed, 27 Mar 2024 13:28:14 -0000

On Wed, 27 Mar 2024 at 13:23, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Wed, Mar 27, 2024 at 02:09:17PM +0100, Igor Mammedov wrote:
> > On Wed, 27 Mar 2024 10:49:43 +0000
> > Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:
> > It's question of whether we are willing to do unthinkable,
> > i.e. to break QEMU <-> guest ABI for isapc case by removing
> > corresponding fwcfg entries.
>
> There has never been any ABI stability requirement for 'isapc'
> as it is not a versioned machine type.
>
> > With migration ignored it shouldn't be a problem.
> > Question is: does anyone care about migration with isapc?
> > If not, I'd gladly axe smbios legacy parts in 9.1
>
> Migration is irrelevant unless someone steps forward to
> commit to long term versioning of the machine type.

But migration is also how we implement savevm/loadvm,
which are useful even when the machine type is not versioned.
So please don't put in migration blockers or similar that would
break that.

thanks
-- PMM

