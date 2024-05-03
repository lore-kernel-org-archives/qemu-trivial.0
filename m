Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1s2ppb-00070o-Ah
	for mharc-qemu-trivial@gnu.org; Fri, 03 May 2024 06:07:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1s2ppa-00070R-0u
 for qemu-trivial@nongnu.org; Fri, 03 May 2024 06:07:54 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1s2ppX-0003QN-U4
 for qemu-trivial@nongnu.org; Fri, 03 May 2024 06:07:53 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2db13ca0363so143282061fa.3
 for <qemu-trivial@nongnu.org>; Fri, 03 May 2024 03:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714730868; x=1715335668; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=T3fOM+pl4bI+zQ6OHLH+FF4yznZmpCoizoYjHYd7lo4=;
 b=d/RQyxQ0PsVow2QKB7L3bzyPKf5sB23chXrkKKscwr7i62q7aPt6GLOOd0gI5iSboh
 0hpevmwx+e+6kGDa1DciqEEDZFOMVkZ3db8Ig/FoZ6R4ZMf+EUksRYlxm43HnUJFzmTC
 Vwgms6RnpCKaar0rga7qEFFkmnh2Vg94IbV9E34iyPe6SmZW/o9KP1pq3ZcBd5NK3FrM
 G5F9ry2/DOG1cqvZdNIUX3gZYzyHKGl8ifq9XWilNkduhFxH0KSU2086Vy22EjeZ6ZUh
 c1ZXqls9Q8Gf/7lJSgy6mJQcMLjnQPIaZMDT1qobnAeEVrxccYzdag6/A6bwOJPNZdWf
 T3Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714730868; x=1715335668;
 h=content-transfer-encoding:mime-version:message-id:date:references
 :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T3fOM+pl4bI+zQ6OHLH+FF4yznZmpCoizoYjHYd7lo4=;
 b=YxhIfU1dRxQYJNFKiSa9fafgh8YiW9cHrsjybTpabV8VSZz0sWZWJltk1B7vCeNdpX
 d4B56hYKx5wAOOc+m/nldyFpXw1d5/fhWu70NM+/QyeK579XP5SfVvmhI774viE+4RFE
 28iGaBd2fxiWlaL4KCSEPE+doGBSr2fl6ChJrzrlGXpHfEDNqhEA1ZftLLSBxd2OEITo
 852hw7CaZBnhVWV1wLunONTYh9NCIPpGmYhTjlNQfUMuIRsWBUHc4p/uFDx7X0vyqHVz
 5DdeNEqyjeOLqKmmmqFAF0MZIxJ1p5IX14GzowuZVG1qz0fFFiseGEPbjbKq8R3sd1R9
 1AGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUIolAuc2JjABH7ofVtXwwx2vXJk1sZMwvipONfPDUmAJhvgrxZ6jZE985Zpgq279yZO4ycAEWpVUxdi4hJ7LP7Dd9clNbp2Q==
X-Gm-Message-State: AOJu0Ywr/KkzqlnyS/kbosIwcP+dVfhCoKB3fER7XWMyD0lv9mySjvP6
 fvD0iK/XvIX2ugQWw+Hv9vxX+aitC3qHLHh6zwru8Hs9HMWcJKz13iDUU/sC3lU=
X-Google-Smtp-Source: AGHT+IHCch3O4y7cQzgXCRgL1Ii9ClFPsyuI6yJrG76IFWX35JR7zctJZS82EzuulatRlkNpUdM4jQ==
X-Received: by 2002:a2e:a23a:0:b0:2dc:fc58:9d74 with SMTP id
 i26-20020a2ea23a000000b002dcfc589d74mr1774282ljm.37.1714730868504; 
 Fri, 03 May 2024 03:07:48 -0700 (PDT)
Received: from draig.lan ([85.9.250.243]) by smtp.gmail.com with ESMTPSA id
 v17-20020a1709062f1100b00a55aee4bf74sm1533281eji.79.2024.05.03.03.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 03:07:48 -0700 (PDT)
Received: from draig (localhost [IPv6:::1])
 by draig.lan (Postfix) with ESMTP id 74FA65F753;
 Fri,  3 May 2024 11:07:47 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Michael Tokarev <mjt@tls.msk.ru>,  qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org,  Thomas Huth <thuth@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PATCH v2] Re-enable riscv64-debian-cross-container (debian
 riscv64 is finally usable again!)
In-Reply-To: <ZjSbRsOpJsTdTh6l@redhat.com> ("Daniel P. =?utf-8?Q?Berrang?=
 =?utf-8?Q?=C3=A9=22's?= message of
 "Fri, 3 May 2024 09:07:34 +0100")
References: <20240503071634.841103-1-mjt@tls.msk.ru>
 <ZjSbRsOpJsTdTh6l@redhat.com>
Date: Fri, 03 May 2024 11:07:47 +0100
Message-ID: <87cyq32op8.fsf@draig.linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=alex.bennee@linaro.org; helo=mail-lj1-x229.google.com
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
X-List-Received-Date: Fri, 03 May 2024 10:07:54 -0000

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Fri, May 03, 2024 at 10:16:34AM +0300, Michael Tokarev wrote:
>> Revert "gitlab-ci: Disable the riscv64-debian-cross-container by default"
>> This reverts commit f51f90c65ed7706c3c4f7a889ce3d6b7ab75ef6a.
>>=20
>> riscv64 in debian has been non-functioning for almost a year, after the
>> architecture has been promoted to release architecture

is this for trixie or the next release?

>> and all binary
>> packages started to be re-built, making the port not multi-arch-co-insta=
llable
>> for a long time (in debian, multi-arch packages must be of the same vers=
ion,
>> but when a package is rebuilt on one architecture it gets a version bump=
 too).
>> Later on, debiah had a long time64_t transition which made sid unusable =
for
>> quite some time too.  Both such events happens in debian very rarely (li=
ke,
>> once in 10 years or so - for example, previous big transition like that =
was
>> libc5 =3D> libc6 transition).  Now both of these are finished (where qem=
u is
>> concerned anyway).
>>=20
>> Hopefully debian unstable wont be very unstable.  At the very least it is
>> better to have sporadic CI failures here than no riscv64 coverage at all.
>
> IME of running Debian sid in CI pipelines for libvirt, it is
> way too unstable to be used as a gating job. There are periods
> weeks-long when packages fail to install, even for relatively
> mainstream arch targets like x86, let alone a new target like
> riscv.

I think testing can be more stable IME but I agree we still don't want
it gating until we have a stable release.

>
> Running the job by default is sane, but it should not be made
> gating until in a formal Debian release IMHO.
>
>>=20
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> ---
>> v2: drop a TODO comment which turned out to be confused, replacing it
>>  with the description why debian riscv64 were unusable.
>>=20
>>  .gitlab-ci.d/container-cross.yml | 1 -
>>  1 file changed, 1 deletion(-)
>>=20
>> diff --git a/.gitlab-ci.d/container-cross.yml b/.gitlab-ci.d/container-c=
ross.yml
>> index e3103940a0..dbffed3f21 100644
>> --- a/.gitlab-ci.d/container-cross.yml
>> +++ b/.gitlab-ci.d/container-cross.yml
>> @@ -77,7 +77,6 @@ riscv64-debian-cross-container:
>>    allow_failure: true
>>    variables:
>>      NAME: debian-riscv64-cross
>> -    QEMU_JOB_OPTIONAL: 1
>>=20=20
>>  s390x-debian-cross-container:
>>    extends: .container_job_template
>> --=20
>> 2.39.2
>>=20
>>=20
>
> With regards,
> Daniel

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

