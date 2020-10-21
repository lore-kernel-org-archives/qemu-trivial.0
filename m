Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kVBMx-0003OG-N1
	for mharc-qemu-trivial@gnu.org; Wed, 21 Oct 2020 06:29:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kVBMw-0003MU-5q
 for qemu-trivial@nongnu.org; Wed, 21 Oct 2020 06:29:22 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:54429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kVBMu-0006JM-JX
 for qemu-trivial@nongnu.org; Wed, 21 Oct 2020 06:29:21 -0400
Received: by mail-wm1-x344.google.com with SMTP id c77so1257313wmd.4
 for <qemu-trivial@nongnu.org>; Wed, 21 Oct 2020 03:29:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=TdwRZ7rBOCFE2n6etOekAvQgVo9aP4FW3zOA1tprhPU=;
 b=z6dG4RqSmhgjjR2RWdaq19fNbob688fijZ5wB3tWpfTfoWeBMuKtkCkoXas3FjwLbs
 AraKrcvLUP46D3ppaIdzFDlnLbLj0LwBaiJjubcEHZbPl4IMXki0gkpcpg6sc+mOQZSo
 iKD1hOonZR6s4xGPjYTeU/HuVM+U6uH88hRTLWO8+Ie1/q4WCvtdBcR/EwDUjdesB/ve
 +3LlQsCVWhGbQhzMTy8a2fYw4tayQz/gXNuMuCB1QHFsTohpcMxZ+Arc24lSQ8DRAI8O
 +KCnRzjOK/0Cp8unP85rkHDE2Y2sxoOT7OFzNwdoD7LGttM/pCM8ikJKcJRPLzYkfNrV
 ZVsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=TdwRZ7rBOCFE2n6etOekAvQgVo9aP4FW3zOA1tprhPU=;
 b=KIuPsbArrlGUYPcRo+9LK3Eak+T4MH/sPK+EHWpU3fd9SCeV3EB6mejOy2byQ06D/Y
 R9jdcdk2WOpVgRXOyQ4jdJOOVkkyB57AJouuXPJRZ/BgBJDfmhNB8DbUl+DcJSCxVHOj
 aCm6R8wl2lDJq84u8t+14UXXBRbk4a+QeeWfPI7rWnrroDGw8x9Xx8Xgr9qdc2acccdM
 GIkrb7Mb+tYwMWKar6x18xqGvH6JVngNkT4nv8miQTE2eaymG3hh745RMIKCNYKid5TP
 O788dVikoWblcMz4ZkuIB7TEC8tpM+mpV5NIJsM4hjvuNAwPQa8y4loq2u2Hq4VIg7b5
 ID/w==
X-Gm-Message-State: AOAM530AoCtou66JRyw5Lg8hWq6P/f+1Zza4BAyyKtqLQK5ZIPftaFgh
 FACNMHS2X9VAMJ8jVl+9mqYB+Q==
X-Google-Smtp-Source: ABdhPJz+pHG3pYnYl0+pfFO6cqgMzh+Tzh4fqyOJcFIYbEF6qigFDOLLsUQRoIDiANyt1YLp62ZKDA==
X-Received: by 2002:a1c:2905:: with SMTP id p5mr2834925wmp.187.1603276159140; 
 Wed, 21 Oct 2020 03:29:19 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n9sm3235529wrq.72.2020.10.21.03.29.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 03:29:17 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 23FE71FF7E;
 Wed, 21 Oct 2020 11:29:17 +0100 (BST)
References: <20201021072308.9224-1-thuth@redhat.com>
User-agent: mu4e 1.5.6; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>, Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>, qemu-trivial@nongnu.org
Subject: Re: [PATCH] tests/docker/dockerfiles/centos: Use SDL2 instead of SDL1
In-reply-to: <20201021072308.9224-1-thuth@redhat.com>
Date: Wed, 21 Oct 2020 11:29:17 +0100
Message-ID: <87imb3x476.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-List-Received-Date: Wed, 21 Oct 2020 10:29:22 -0000


Thomas Huth <thuth@redhat.com> writes:

> We do not support SDL1 in QEMU anymore. Use SDL2 instead.

Queued to testing/next, thanks.

>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/docker/dockerfiles/centos7.docker | 2 +-
>  tests/docker/dockerfiles/centos8.docker | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/docker/dockerfiles/centos7.docker b/tests/docker/docke=
rfiles/centos7.docker
> index 8b273725ee..6f11af1989 100644
> --- a/tests/docker/dockerfiles/centos7.docker
> +++ b/tests/docker/dockerfiles/centos7.docker
> @@ -31,7 +31,7 @@ ENV PACKAGES \
>      perl-Test-Harness \
>      pixman-devel \
>      python3 \
> -    SDL-devel \
> +    SDL2-devel \
>      spice-glib-devel \
>      spice-server-devel \
>      tar \
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/docke=
rfiles/centos8.docker
> index 585dfad9be..f86931f955 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -2,7 +2,7 @@ FROM centos:8.1.1911
>=20=20
>  RUN dnf -y update
>  ENV PACKAGES \
> -    SDL-devel \
> +    SDL2-devel \
>      bzip2 \
>      bzip2-devel \
>      dbus-daemon \


--=20
Alex Benn=C3=A9e

