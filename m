Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jdXhD-00067g-9o
	for mharc-qemu-trivial@gnu.org; Tue, 26 May 2020 07:24:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jdXhB-00064h-MQ
 for qemu-trivial@nongnu.org; Tue, 26 May 2020 07:24:33 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:34378)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1jdXh9-0008BT-OY
 for qemu-trivial@nongnu.org; Tue, 26 May 2020 07:24:33 -0400
Received: by mail-wm1-x342.google.com with SMTP id u26so938049wmn.1
 for <qemu-trivial@nongnu.org>; Tue, 26 May 2020 04:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=laM7y7+lT6/5na9RQFiDucmGI7iVmSETqGLjzOL9ruI=;
 b=SFlzWi/49McvSGtLnAWt3dUkvXsfByyqGvXhF6lSAbFd0C5+xaBxlfi+YXQPe8ux24
 6l1gFkFrk8G2btkKKAL4O8P8bGEHTlKEtEMNFLCZib6kaQlk+W4KyhqvIsFHYclotcs8
 PQrqUFBe4Og2GgS/MnMPOtGN6X+eF3H6Xzqm9c60T0+IpItBa/2tuvfK58dVNpEkeKBE
 OpgZ8tQXhZBDCHtCMlMSPtH1RhDN2s3RKevvfZQ2verw7+dMGBBkUWlc4GpcVNJwYTf+
 ahNO6kvkIRB5M/YtEnUJl90sV8Szz6xis/Dgr7/ALRoPR3+YzT4X3eCgwKZCIGnQDzvh
 5U2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=laM7y7+lT6/5na9RQFiDucmGI7iVmSETqGLjzOL9ruI=;
 b=QXc6GikqEpWwhJE4VC5HPxl7bnHjqjUKCI2bJhxDpL1HW5kp2D0U3IJtm4j2VPayCJ
 he0MHY6YZuMv8F7nittO3qFLNqMQWFTaXuYOBhUcu8HNQPh1TUmHto3IyepYeidBGuV6
 uG8lkm3WZ34eyo48dQ4uD4LNQxc0hv1YMuUKFrWXweSbIpz6BUBK1tibYuuejyWqvuGS
 BzmWFqFMi2DWFqV7W6SlNI0dAgAC3UN6MTOzNi7bqQTgWxowSbImD6zkvZW5Dd+rW3RG
 xkGkTUiR9W6zBGF0kUhUHdTFHIrNsopSvLiWtBPuBLwepemYyOID8nL3A8SZ5/xh6Qg5
 Feqw==
X-Gm-Message-State: AOAM533jTPCqYpVd4MxQL3HL2vEaZZMNJhbMpbdpZoyOoQxujQUKmQzx
 mj6TuOeyCsi7cGDZAxJ44Ckq5G4J8aw=
X-Google-Smtp-Source: ABdhPJxZl4Xnak3TsptoybcPp2zwPQDqJ41s4wxNyQyxi/sPf/9bcwBAbp/w7X+XlKAtGJplAJWbgg==
X-Received: by 2002:a1c:7c0b:: with SMTP id x11mr963108wmc.149.1590492270182; 
 Tue, 26 May 2020 04:24:30 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a12sm15891505wrs.70.2020.05.26.04.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 May 2020 04:24:28 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6346E1FF7E;
 Tue, 26 May 2020 12:24:28 +0100 (BST)
References: <20200524215654.13256-1-f4bug@amsat.org>
User-agent: mu4e 1.5.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, "Emilio G . Cota" <cota@braap.org>, Richard
 Henderson <richard.henderson@linaro.org>, qemu-trivial@nongnu.org
Subject: Re: [PATCH] scripts/clean-includes: Mark 'qemu/qemu-plugin.h' as
 special header
In-reply-to: <20200524215654.13256-1-f4bug@amsat.org>
Date: Tue, 26 May 2020 12:24:28 +0100
Message-ID: <87ftbn6is3.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 26 May 2020 11:24:34 -0000


Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> writes:

> "qemu/qemu-plugin.h" isn't meant to be include by QEMU codebase,
> but by 3rd party plugins that QEMU can use. These plugins can be
> built out of QEMU and don't include "qemu/osdep.h".
> Mark "qemu/qemu-plugin.h" as a special header that doesn't need
> to be cleaned for "qemu/osdep.h".
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  scripts/clean-includes | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/clean-includes b/scripts/clean-includes
> index dd938daa3e..795b3bea31 100755
> --- a/scripts/clean-includes
> +++ b/scripts/clean-includes
> @@ -123,6 +123,7 @@ for f in "$@"; do
>        ;;
>      *include/qemu/osdep.h | \
>      *include/qemu/compiler.h | \
> +    *include/qemu/qemu-plugin.h | \
>      *include/glib-compat.h | \
>      *include/sysemu/os-posix.h | \
>      *include/sysemu/os-win32.h | \


Queued to plugins/next, thanks.

--=20
Alex Benn=C3=A9e

