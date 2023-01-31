Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pMvPv-0000Gd-Fh
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2023 13:31:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMvPt-0000E2-Gm
 for qemu-trivial@nongnu.org; Tue, 31 Jan 2023 13:31:37 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pMvPr-0006Bx-SM
 for qemu-trivial@nongnu.org; Tue, 31 Jan 2023 13:31:37 -0500
Received: by mail-wm1-x334.google.com with SMTP id bg26so5174667wmb.0
 for <qemu-trivial@nongnu.org>; Tue, 31 Jan 2023 10:31:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o2rL/QIqr5obTKcWzZ0gxTGdVbp+Klb+WD9OfTH6tig=;
 b=tUJncaOLibDpbYrUx7E0CVUoGVeKsVySEVNh6jwImiICFXOpYjPggNZAKn6dm3yUdd
 DKsy+faKk2nCEfXni7aE4URhEWSYyKx68qcbc1DZGBSqja+Nmseoi1u2WuGmzj7e2LXw
 wfFhQD7DsIinnRl7H9diDIEr/dVk026RbUjkWsFo1r5RiiJf9c4BaWfRmddmnFXILKVA
 SEx8VyuSx5zEN2l5oFH6DGY7oeRZFVvZcO+QRxN4dcmz1+U1S9oC8wYCDhkR3+EaftO4
 7BfiXECa5Ka1SKHeMaLvOW0Dy4oyixe4pS3I+JrIdkGfkFfkdYaTABb4RWCvg6bPuazh
 AKwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
 :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=o2rL/QIqr5obTKcWzZ0gxTGdVbp+Klb+WD9OfTH6tig=;
 b=C85Vw/F81c4Xg/oAb2Cc/YCl9+dzEj7O7If+jUMeGI7cPNl48QPbIxVgeu/4OtserX
 +dUyPhX9yCHv+hQuTmsd5168la+xyUTZ2FagesUtBzq71UL14kyobqCYukQlGhNv6fNQ
 jyvznn+FbIktsly5mwlqsUCcerLmq7hpmJPer+/oDkeuLvFMvY1vN1ywwg78zUWV6KEI
 0yU8RCqnCLV6tsZty0f5KxuBrJufuA9+oRkX1/b6mrzyNs8pK5e7vc5vXlBDU0I/7Rbh
 xAD+dpTARxSr5pOvgXBXIPr1eJSlL+6BiSN2v1i091Pc9+EYDFKED0ZSJiFPoqyqc45R
 uxsw==
X-Gm-Message-State: AO0yUKXT62FrYfu5M7NDupcJ0ftI6EuufZzqR45TwjMUafp/AuW8RGTz
 hj+9FlVf1DZV1vHCyIrICVPkwQ==
X-Google-Smtp-Source: AK7set+ZQBqigkolZCYRLnKUYeuWoK/V0whzCMiTm0o9d0S0RGOln3HzAhRIsqKI9Zcslh16LWP9mw==
X-Received: by 2002:a05:600c:22c1:b0:3dd:e86e:8805 with SMTP id
 1-20020a05600c22c100b003dde86e8805mr1621264wmg.5.1675189894107; 
 Tue, 31 Jan 2023 10:31:34 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 o18-20020a05600c339200b003dc42d48defsm12550104wmp.6.2023.01.31.10.31.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 10:31:33 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3DD131FFB7;
 Tue, 31 Jan 2023 18:31:33 +0000 (GMT)
References: <20230131180239.1582302-1-thuth@redhat.com>
User-agent: mu4e 1.9.18; emacs 29.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-trivial@nongnu.org, anthony.perard@citrix.com, berrange@redhat.com
Subject: Re: [PATCH] configure: Bump minimum Clang version to 10.0
Date: Tue, 31 Jan 2023 18:31:22 +0000
In-reply-to: <20230131180239.1582302-1-thuth@redhat.com>
Message-ID: <87pmautv23.fsf@linaro.org>
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
X-List-Received-Date: Tue, 31 Jan 2023 18:31:37 -0000


Thomas Huth <thuth@redhat.com> writes:

> Anthony Perard recently reported some problems with Clang v6.0 from
> Ubuntu Bionic (with regards to the -Wmissing-braces configure test).
> Since we're not officially supporting that version of Ubuntu anymore,
> we should better bump our minimum version check in the configure script
> instead of using our time to fix problems of unsupported compilers.
> According to repology.org, our supported distros ship these versions
> of Clang (looking at the highest version only):
>
>               Fedora 36: 14.0.5
>       CentOS 8 (RHEL-8): 12.0.1
>               Debian 11: 13.0.1
>      OpenSUSE Leap 15.4: 13.0.1
>        Ubuntu LTS 20.04: 12.0.0
>           FreeBSD Ports: 15.0.7
>           NetBSD pkgsrc: 15.0.7
>                Homebrew: 15.0.7
>             MSYS2 mingw: 15.0.7
>             Haiku ports: 12.0.1
>
> While it seems like we could update to v12.0.0 from that point of view,
> the default version on Ubuntu 20.04 is still v10.0, and we use that for
> our CI tests based via the tests/docker/dockerfiles/ubuntu2004.docker
> file.
>
> Thus let's make v10.0 our minimum version now (which corresponds to
> Apple Clang version v12.0). The -Wmissing-braces check can then be
> removed, too, since both our minimum GCC and our minimum Clang version
> now handle this correctly.
>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

--=20
Alex Benn=C3=A9e
Virtualisation Tech Lead @ Linaro

