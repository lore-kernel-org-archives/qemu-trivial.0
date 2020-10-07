Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kQ842-00017G-R7
	for mharc-qemu-trivial@gnu.org; Wed, 07 Oct 2020 07:56:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kQ840-00016A-JI
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 07:56:56 -0400
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444]:41113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1kQ83y-0001ea-R4
 for qemu-trivial@nongnu.org; Wed, 07 Oct 2020 07:56:56 -0400
Received: by mail-wr1-x444.google.com with SMTP id w5so1812691wrp.8
 for <qemu-trivial@nongnu.org>; Wed, 07 Oct 2020 04:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=N+QdIBb6xdvqxez6TK0xKZHg68jzfjvp0EPuwfaQdNE=;
 b=H52p5AR3Huhnf5UAaxD/i69GCuV5hrEvdA7nNIN1JiKuuVJFnF3O2MTYNl65z4enUQ
 xWh/NHq+R5zsOcGk3sGv0vUJyXV2g0mrbFkgHi+SqSkha5AyxT64bzzw/OeDBe5nuWVG
 83/gVRahbpQ1NZZ5dlycIOpfExdXeeNv4JuqQQFx0Wd/35qvVma+URUgN+In61dDekOS
 iDsFYV92CYptuxDrrkR6IbMBA0xsBIi9QQOQJ1WHDTLioeBvdDdlq3Ddri6huPtFVUu3
 VetmlLj0sUzkMdgxILu1ZAvxTpTApqTFC78et1g2hDsukd8ODkEeig7NT+uzRNCNyo4c
 agFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=N+QdIBb6xdvqxez6TK0xKZHg68jzfjvp0EPuwfaQdNE=;
 b=XNPNWzXSuVfsvTPoSS/dLjALF0o5BtzihnVM21x+T/2KjwKt15IbHfXcLsXwUyfImZ
 I+ZmpYu7w3rZ9kqSeetq1+MAYJDBnWO2SSjsgT5rzBQ0XgPcxRAY3Z6Lq2kRgZB8pirv
 ySp+DAu4mOK40YSWK9V6eXR9aAtLjznlXUSTQJjb+Dbs8GVMay/N7kaQrOtU14f0PYUn
 KLYqPawkBgNMAOyWmc8eLHdjaF3ZD4/nXtl3J7+b9ykZfYa2EahcnV+QEKXRCjAfnqaS
 4nkytY4qBbE4LN6GvMUPOcEj9/kfOgYkquvr1NCdReJiAdvm3BHInBMxpxCs43CfpW6I
 MkRA==
X-Gm-Message-State: AOAM530QSoQVd/wEF5pxxtWNS7QcgfOpW+mYu05QC/LXOjHOSaYqxBXZ
 Bl4UfaKhzBXbRNtLBYA9LKt0SA==
X-Google-Smtp-Source: ABdhPJwRy5Fko8RWXTZuXs8dfSpZSff0uVEh0+vBMvI5VNTEB5pQ5ETZJAPoy3TnhBPUoY5Qqp6GZg==
X-Received: by 2002:a5d:494c:: with SMTP id r12mr3095339wrs.406.1602071812803; 
 Wed, 07 Oct 2020 04:56:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id j17sm2624606wrw.68.2020.10.07.04.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Oct 2020 04:56:51 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id DF2281FF7E;
 Wed,  7 Oct 2020 12:56:50 +0100 (BST)
References: <20201006174347.152040-1-thuth@redhat.com>
User-agent: mu4e 1.5.5; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: John Snow <jsnow@redhat.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <philmd@redhat.com>, qemu-trivial@nongnu.org
Subject: Re: [PATCH] tests/docker: Add genisoimage to the docker file
In-reply-to: <20201006174347.152040-1-thuth@redhat.com>
Date: Wed, 07 Oct 2020 12:56:50 +0100
Message-ID: <875z7m1c71.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::444;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x444.google.com
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
X-List-Received-Date: Wed, 07 Oct 2020 11:56:56 -0000


Thomas Huth <thuth@redhat.com> writes:

> genisoimage is needed for running the tests/qtest/cdrom-test qtest.

Queued to testing/next, thanks.

>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  tests/docker/dockerfiles/centos8.docker      | 1 +
>  tests/docker/dockerfiles/debian-amd64.docker | 1 +
>  tests/docker/dockerfiles/fedora.docker       | 1 +
>  tests/docker/dockerfiles/ubuntu2004.docker   | 1 +
>  4 files changed, 4 insertions(+)
>
> diff --git a/tests/docker/dockerfiles/centos8.docker b/tests/docker/docke=
rfiles/centos8.docker
> index f435616d6a..0fc2697491 100644
> --- a/tests/docker/dockerfiles/centos8.docker
> +++ b/tests/docker/dockerfiles/centos8.docker
> @@ -8,6 +8,7 @@ ENV PACKAGES \
>      dbus-daemon \
>      gcc \
>      gcc-c++ \
> +    genisoimage \
>      gettext \
>      git \
>      glib2-devel \
> diff --git a/tests/docker/dockerfiles/debian-amd64.docker b/tests/docker/=
dockerfiles/debian-amd64.docker
> index d2500dcff1..314c6bae83 100644
> --- a/tests/docker/dockerfiles/debian-amd64.docker
> +++ b/tests/docker/dockerfiles/debian-amd64.docker
> @@ -14,6 +14,7 @@ RUN apt update && \
>  RUN apt update && \
>      DEBIAN_FRONTEND=3Dnoninteractive eatmydata \
>      apt install -y --no-install-recommends \
> +        genisoimage \
>          libbz2-dev \
>          liblzo2-dev \
>          libgcrypt20-dev \
> diff --git a/tests/docker/dockerfiles/fedora.docker b/tests/docker/docker=
files/fedora.docker
> index ec783418c8..85c975543d 100644
> --- a/tests/docker/dockerfiles/fedora.docker
> +++ b/tests/docker/dockerfiles/fedora.docker
> @@ -15,6 +15,7 @@ ENV PACKAGES \
>      findutils \
>      gcc \
>      gcc-c++ \
> +    genisoimage \
>      gettext \
>      git \
>      glib2-devel \
> diff --git a/tests/docker/dockerfiles/ubuntu2004.docker b/tests/docker/do=
ckerfiles/ubuntu2004.docker
> index cafe8443fb..f4b9556b9e 100644
> --- a/tests/docker/dockerfiles/ubuntu2004.docker
> +++ b/tests/docker/dockerfiles/ubuntu2004.docker
> @@ -3,6 +3,7 @@ ENV PACKAGES flex bison \
>      ccache \
>      clang-10\
>      gcc \
> +    genisoimage \
>      gettext \
>      git \
>      glusterfs-common \


--=20
Alex Benn=C3=A9e

