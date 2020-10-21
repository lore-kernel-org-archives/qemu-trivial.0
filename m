Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kVGmO-00047T-KZ
	for mharc-qemu-trivial@gnu.org; Wed, 21 Oct 2020 12:16:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56018)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kVGmN-00046A-1e
 for qemu-trivial@nongnu.org; Wed, 21 Oct 2020 12:15:59 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kVGmK-0003AZ-0Z
 for qemu-trivial@nongnu.org; Wed, 21 Oct 2020 12:15:58 -0400
Received: by mail-wr1-x441.google.com with SMTP id n18so3761414wrs.5
 for <qemu-trivial@nongnu.org>; Wed, 21 Oct 2020 09:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=0p6R/xh9sq6v4kHBx5QB6Is0bNfQ/u+ywP0ESl/GvdM=;
 b=M4J9X+34/TzfwBI0KD/9uZyoRK1bvxkifGSTPlXZbX+ruZZVry66AA1mmtyz5hX1Z2
 JP4chLr03/uVZSerkHzeKBwSrBtq2WBZGafLoyonHeAZBnt2f2OYaoJz5yja2CyYRVy2
 8LIq8yciMMQSBB++SkEX5+Rc236rhnbF8vmWUtXGBm/b/s0oRFTbdEmYwqsiZOcwseMP
 vQoh4tAwOmD6HrfiD7ObMoz6DxbUZjmpgzn97ysUUv/UQ0mv0UN6ZgsFa6/KaDuEKKyo
 oT7Znm6c6d5hXz3ycUtE/qirMF/E4/KF76VM0kb4KeblQ5h9UZbR77d/L/obawiBCaVz
 Tryg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=0p6R/xh9sq6v4kHBx5QB6Is0bNfQ/u+ywP0ESl/GvdM=;
 b=dLH4WiaWI5ZwaMd3OOvZvwIyXg22d2ZzF91tfPzcL3wwJNnhniAy9lzkYMwTgojfVd
 z+WHNXFZovnZ+nmwvmmmTGJRPsXoIldBNh7j76izTA419g5ZcyMgYXYDJ37p/xZW6foc
 g4HFiGNoWcFs4/KtUZugj7gv19Br9guibLl4vufKq8N9WBCkEsOubVjdkqOyGBZjKZoK
 S9XVyepi8u4WGnAyhwpqiAUn4IsYG7xKas7qeMdE9aWfUBfgVLLD4BFNH3TmodpzNr4A
 KtCIWLl/2pdptIk4UcMEvE+2Sg+t32KTyTlM+WBRMOJWroA5a8CPB67g8DblQlAAQZaT
 zqhQ==
X-Gm-Message-State: AOAM532AkhAHQ6FCM1CTbgBi5zwZY4VbvPtdyoauiuTlTUBzpOzmfmOY
 HZ78XRiG1aHp6X0TZMfADOhrrQ==
X-Google-Smtp-Source: ABdhPJxZKPxNgsGOgkYSoIYGbX+3GG9lgdZ1osaqdgZZho/XOBeq/gtZD6dKhX614u5ARcPT7ghejg==
X-Received: by 2002:adf:f101:: with SMTP id r1mr6046478wro.392.1603296953149; 
 Wed, 21 Oct 2020 09:15:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n5sm4599967wrm.2.2020.10.21.09.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 09:15:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id D178D1FF7E;
 Wed, 21 Oct 2020 17:15:50 +0100 (BST)
References: <20201021072308.9224-1-thuth@redhat.com>
 <e7ac0344-24d1-d53f-7e7f-798be452adcb@redhat.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, Fam Zheng
 <fam@euphon.net>, qemu-trivial@nongnu.org, "Daniel P . Berrange"
 <berrange@redhat.com>
Subject: Re: [PATCH] tests/docker/dockerfiles/centos: Use SDL2 instead of SDL1
In-reply-to: <e7ac0344-24d1-d53f-7e7f-798be452adcb@redhat.com>
Date: Wed, 21 Oct 2020 17:15:50 +0100
Message-ID: <873627wo5l.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::441;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x441.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Wed, 21 Oct 2020 16:15:59 -0000


Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> On 10/21/20 9:23 AM, Thomas Huth wrote:
>> We do not support SDL1 in QEMU anymore. Use SDL2 instead.
>>=20
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   tests/docker/dockerfiles/centos7.docker | 2 +-
>>   tests/docker/dockerfiles/centos8.docker | 2 +-
>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/dock=
erfiles/centos7.docker
>> index 8b273725ee..6f11af1989 100644
>> --- a/tests/docker/dockerfiles/centos7.docker
>> +++ b/tests/docker/dockerfiles/centos7.docker
>> @@ -31,7 +31,7 @@ ENV PACKAGES \
>>       perl-Test-Harness \
>>       pixman-devel \
>>       python3 \
>> -    SDL-devel \
>> +    SDL2-devel \
>>       spice-glib-devel \
>>       spice-server-devel \
>>       tar \
>> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/dock=
erfiles/centos8.docker
>> index 585dfad9be..f86931f955 100644
>> --- a/tests/docker/dockerfiles/centos8.docker
>> +++ b/tests/docker/dockerfiles/centos8.docker
>> @@ -2,7 +2,7 @@ FROM centos:8.1.1911
>>=20=20=20
>>   RUN dnf -y update
>>   ENV PACKAGES \
>> -    SDL-devel \
>> +    SDL2-devel \
>>       bzip2 \
>>       bzip2-devel \
>>       dbus-daemon \
>
> I wonder if we are having docker image caching issues...
>
> build-system-centos job passed but then in check-system-centos:
>
> FAILED: libcommon.fa.p/ui_sdl2-input.c.o
> ui/sdl2.h:7:10: fatal error: SDL.h: No such file or directory
>   #include
>            ^~~~~~~
>
> And then in acceptance-system-centos:
>
> ./qemu-system-x86_64: error while loading shared libraries:=20
> libSDL2-2.0.so.0: cannot open shared object file: No such file or
> directory

Hmm weird it passes for me.

--=20
Alex Benn=C3=A9e

