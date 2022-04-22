Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nhqME-0002N8-R7
	for mharc-qemu-trivial@gnu.org; Fri, 22 Apr 2022 06:17:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqM6-0002Ix-66
 for qemu-trivial@nongnu.org; Fri, 22 Apr 2022 06:17:41 -0400
Received: from mail-yb1-xb2b.google.com ([2607:f8b0:4864:20::b2b]:42782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhqM3-0004wV-Gg
 for qemu-trivial@nongnu.org; Fri, 22 Apr 2022 06:17:37 -0400
Received: by mail-yb1-xb2b.google.com with SMTP id p65so13607488ybp.9
 for <qemu-trivial@nongnu.org>; Fri, 22 Apr 2022 03:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P1HnQzAM+PSCFld2kMCvssWpFpCVK98/bY+30Mqe+hQ=;
 b=LxqO2ilDOr4t0hkDS8j524Y7uRdP8tBAZp5VMFmAP8wMZkFwV8Zdc5x08X6P3ZoPCw
 0DKcc3UnOGCAYikypWY3sEGFq4KY6D1yeblLXSg/JU/c1/37vkaDECpOATcBfPjy52XY
 3wvan9EeKZo9PR1HInltzSCGW7s844JjoH0k2Ytn5oiky/qRVrjIEkSUjQI2its7pufM
 6+zjzVYckzosit/H8A3F5lWlI7U+xYTuzBsml7Kf5iAR0ulQ15i2pVA4xehHHpso+Ep4
 BRKWVAL8N8NaKdHXa72fWWs6mJu50gKIuIkqnjyNH/ha4MOJNHdD9fHnm74q24JHn6mt
 M3nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P1HnQzAM+PSCFld2kMCvssWpFpCVK98/bY+30Mqe+hQ=;
 b=E07SvV+hJZ+FR8DGwEw+tISgX8jJ7szFTgHt65p6OEU+Q7J/MIufkKLO6DpjAIOoQF
 z6Se3RsIRyOcjGG6zbD4Lq7qM29AZbCPoDTUq6Q/aJXMFFWFTlLaZfLqcbCFtBj+rh4p
 TIXRYf3+XQbvlryVbCoe9CWNXDVcJLOrS0QHx2zOoCbi+IAAp4jRHRDAKGyTzjJT8VHF
 KqBFLlAEsU6X/+1ISa1BQMTtFbbrUJtsHh3vPZfctOTbdzcyFbmRHtashArvpB1nmHe7
 p6vZO4DdhSQLbXMZFb9vjPVAMF8oyj5U1jMY1i+I86IV15IoC7PLTgPLiGeaYEfUx+9y
 m+og==
X-Gm-Message-State: AOAM532Sa8bqMDRJmA3VTjGPRsbsPdzeAWnGA2i6GCzyxN7tMkSYWZnf
 uo/fesaM4dNH0pOguy4cn76m/OGQXAOo6aNjf4nVSw==
X-Google-Smtp-Source: ABdhPJz4jRpqHnEZQRNG+aJCENzBK+hl2bQh218vXCauCnd+aub/+MM8ZV0lv17qN8mizDZ6IxufVDsh1eYsZpuNqnk=
X-Received: by 2002:a05:6902:390:b0:645:7d46:f1db with SMTP id
 f16-20020a056902039000b006457d46f1dbmr3642880ybs.85.1650622654248; Fri, 22
 Apr 2022 03:17:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220422084611.1083806-1-sw@weilnetz.de>
In-Reply-To: <20220422084611.1083806-1-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Apr 2022 11:17:23 +0100
Message-ID: <CAFEAcA92E_FZwdjoR9gYRqHExmDXNdoU5yeKx1UkaDC_EeSkjw@mail.gmail.com>
Subject: Re: [PATCH] nsis: Add missing tools to installer for Windows
To: Stefan Weil <sw@weilnetz.de>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 22 Apr 2022 10:17:41 -0000

On Fri, 22 Apr 2022 at 10:09, Stefan Weil <sw@weilnetz.de> wrote:
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>
> ---
>  qemu.nsi | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
>
> diff --git a/qemu.nsi b/qemu.nsi
> index 564d617d11..f56a18901c 100644
> --- a/qemu.nsi
> +++ b/qemu.nsi
> @@ -142,8 +142,12 @@ SectionEnd
>
>  Section "Tools" SectionTools
>      SetOutPath "$INSTDIR"
> +    File "${BINDIR}\qemu-edid.exe"
> +    File "${BINDIR}\qemu-ga.exe"
>      File "${BINDIR}\qemu-img.exe"
>      File "${BINDIR}\qemu-io.exe"
> +    File "${BINDIR}\qemu-nbd.exe"
> +    File "${BINDIR}\qemu-storage-daemon.exe"
>  SectionEnd

Maybe it would be better to change this section to be
created by the nsis.py script? I haven't looked at what
exactly we end up with in the tempdir that that script's
'make install' creates, but it might be as simple as
"put all the .exe files that aren't qemu-system-*.exe
into a tools section that we write out to a nother .nsh
include file". Scripting it would also let us handle the
"build an installer on a --disable-tools config" case.

thanks
-- PMM

