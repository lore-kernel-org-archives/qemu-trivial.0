Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1p5rMx-0007Gs-90
	for mharc-qemu-trivial@gnu.org; Thu, 15 Dec 2022 11:46:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5rMj-0007D2-PV
 for qemu-trivial@nongnu.org; Thu, 15 Dec 2022 11:45:53 -0500
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5rMg-0005uY-OI
 for qemu-trivial@nongnu.org; Thu, 15 Dec 2022 11:45:49 -0500
Received: by mail-pl1-x631.google.com with SMTP id t2so7473673ply.2
 for <qemu-trivial@nongnu.org>; Thu, 15 Dec 2022 08:45:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/rqcgn4WX9nPlUTev8T7Xnxc9HhLauECVRkKx4aqr/I=;
 b=ULqCtbIsHV/NL7xPMz7Ilu0PeMDj1+DiutV8Av/xLSVz6nLPINGBhTjdSuKsLaGWrT
 al2/9dXGcS2F8/Hbj63GAcSGf74xcrV5AYEBnsjme0+MPfkwnx9DT8vgb+YULX6ZBWrc
 Dsx9V33jIBhQJsi1GvZcuQwurE0eA/rm3DBxkU81RmwwzpADGmgINFu6H4h6EpAVtLOr
 amCIOrifEHVGmyA6aiXnT+XHrcmdGuXPZUBpV18PwFHKHS5N/mrim0isf3LGlz3n122l
 qSbqEMNSsEOlxv2hWFyb41jKMS71qZysBaVMHVI0wuUmI13T3WrxscJIUtUIi28QVLkZ
 322Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/rqcgn4WX9nPlUTev8T7Xnxc9HhLauECVRkKx4aqr/I=;
 b=tUr/Ddb09I/W5v2VebDtmnYeS0puPaUbgBCZdW1QaeusM6Rm7jcpsCH0jTCk1pPQNl
 7eSBSsdT9qDBdeZwey2VCizAQGXXYPhOQj9RSREMZXzjXBuGx9/tWNk1V3tvYxZMIdGU
 kjSy26GiQYLJf2h4ReHmB0u6hubrqLEvoTLUw3cOuOEYAGqza66IBwus65dmc8B2URJV
 GHTEWNvVuRlhQ15OyHMiEulc1j5nVRdUJa77eWlI09Z0EgznzXa5UjgMrJVPihnv1Wbk
 gwa2oYX13yO73FXruyAvOLK/6/ZnnJ1ggLkO8eyZvikBxx8eMLjRpjmBWjGNCldTAU7S
 5nXw==
X-Gm-Message-State: ANoB5pkQB1TuI2gEHP3s73flRceEl0oHqnhmnFfU/hXWrOdPAAk6E4jW
 BTE/0rZ6WvYfyyfg3EwzkfgpCuC4leeDfamh4fa88g==
X-Google-Smtp-Source: AA0mqf7xzhpL3oVvU0leYZBljwKjI1taK91ZV+o3UwofbsEzrteT9/wEFJByaXgJ36+EDs0ZUWRJmo8pSma+CENfn/Q=
X-Received: by 2002:a17:903:2053:b0:189:cdc8:7261 with SMTP id
 q19-20020a170903205300b00189cdc87261mr23454409pla.168.1671122745045; Thu, 15
 Dec 2022 08:45:45 -0800 (PST)
MIME-Version: 1.0
References: <20221215093849.4771-1-quintela@redhat.com>
In-Reply-To: <20221215093849.4771-1-quintela@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Dec 2022 16:45:33 +0000
Message-ID: <CAFEAcA_iSJ7UgGLemK_Pv1XTDW1cKu7x0P=3odgWWz4UfU994Q@mail.gmail.com>
Subject: Re: [PULL 00/19] Next 8.0 patches
To: Juan Quintela <quintela@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Peter Xu <peterx@redhat.com>, Laurent Vivier <laurent@vivier.eu>, 
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-trivial@nongnu.org, qemu-block@nongnu.org, 
 Stefan Hajnoczi <stefanha@redhat.com>, David Hildenbrand <david@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Fam Zheng <fam@euphon.net>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x631.google.com
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
X-List-Received-Date: Thu, 15 Dec 2022 16:45:54 -0000

On Thu, 15 Dec 2022 at 09:39, Juan Quintela <quintela@redhat.com> wrote:
>
> The following changes since commit 5204b499a6cae4dfd9fe762d5e6e82224892383b:
>
>   mailmap: Fix Stefan Weil author email (2022-12-13 15:56:57 -0500)
>
> are available in the Git repository at:
>
>   https://gitlab.com/juan.quintela/qemu.git tags/next-8.0-pull-request
>
> for you to fetch changes up to 7f401b80445e8746202a6d643410ba1b9eeb3cb1:
>
>   migration: Drop rs->f (2022-12-15 10:30:37 +0100)
>
> ----------------------------------------------------------------
> Migration patches for 8.0
>
> Hi
>
> This are the patches that I had to drop form the last PULL request because they werent fixes:
> - AVX2 is dropped, intel posted a fix, I have to redo it
> - Fix for out of order channels is out
>   Daniel nacked it and I need to redo it
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/8.0
for any user-visible changes.

-- PMM

