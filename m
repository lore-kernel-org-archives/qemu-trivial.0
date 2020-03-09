Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBLVx-0004Ac-UF
	for mharc-qemu-trivial@gnu.org; Mon, 09 Mar 2020 12:44:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52298)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jBLVv-00049T-9d
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 12:44:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jBLVu-0007ML-4j
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 12:44:23 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33561)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jBLVt-0007Lm-U5
 for qemu-trivial@nongnu.org; Mon, 09 Mar 2020 12:44:22 -0400
Received: by mail-oi1-x243.google.com with SMTP id q81so10839244oig.0
 for <qemu-trivial@nongnu.org>; Mon, 09 Mar 2020 09:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vsbxzOYE0aVq29heeEadFUFvp2hO7sl6c9V+gJlGK1U=;
 b=A2tRITAHhIIEJ4IpYm3rHTDk46dcAlRMUAh1jEsr3/QcrxEZbZj1e5sn/6ZIoe4G/C
 XY3DrCvI2YIj+6LJmnT9bSnA408qHbihPrTxanf19ACGXs7I8iwdm8rUBC7ZB4kze54m
 Ifm8n73lUQRXaVv4gpUpBdm5qARMi8XmPle0XGthAIYBGsZQpkIxHxO4RGeMtmZsLcc1
 I0zppwHe+RNe/ZimUcOObMQLkpxUL+kDSM6Zlef7JedrRpkWA9A3B5cKEB0N/OGOFbu0
 zvjwzVntIRaWXIx+iLgQ0h7NooK7RzB5LA7tEIog7tyKluuHDMcvTrilgQ2uojXA7AR8
 1mZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vsbxzOYE0aVq29heeEadFUFvp2hO7sl6c9V+gJlGK1U=;
 b=rIV8TTaSmAJjBnq3aOxOKMf7e1QJMZR05sditDCmXZogtJtxCYkBx4/1HCp94FhZgk
 28kSwrn5yOMzCn12XBiEv08pHY1NI5Yj9Wlm0OLxbBEDumO8SjaRV13mvi9NKRT7qDUy
 ODHjXGtgFeHqvCBIBX6Z6YQIVoD1x+WkL0bYUGw4RuNKXWcCuX7mWvhPUnu2tQLheKRo
 0/Iuw7T4M4u5UtpYpFUPbAAETxXIQwnyrdWUOTksEH1YRldognWGd3SP1gmr4tnog25Z
 BlWN3hQ9Ga6Wilc/PYHHBp1BCTrGDKkTppTNBhQRzZupHaKGdnRafCX7qO9LGPY88u/A
 4FrA==
X-Gm-Message-State: ANhLgQ0KTnUBGtfSOEhCX7snHXDR3nuGD36Goc9AvtXPt9hnBW3/9h6B
 3qUhLsNT2s3m76raHcHnMTOx6kgpxJ5JmPk37LRn7A==
X-Google-Smtp-Source: ADFU+vvBQPDKSS6q7Z59q1no5LH02dLE+Qs5gB3uirpjuOFNbpElnEaPnhpWHWYCYvHBdGBLHxeGHkO6PulyNTSlsfg=
X-Received: by 2002:a54:4f16:: with SMTP id e22mr149238oiy.170.1583772260918; 
 Mon, 09 Mar 2020 09:44:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200309150837.3193387-1-laurent@vivier.eu>
In-Reply-To: <20200309150837.3193387-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Mar 2020 16:44:08 +0000
Message-ID: <CAFEAcA_ZjyuCb3gZUXe1MN9PkN5D8hD7SLPoX0-sp231hVQV2g@mail.gmail.com>
Subject: Re: [PULL 00/33] Trivial branch patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 Greg Kurz <groug@kaod.org>, Qemu-block <qemu-block@nongnu.org>, 
 Gerd Hoffmann <kraxel@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Jason Wang <jasowang@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, 
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Fam Zheng <fam@euphon.net>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, 
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Andrzej Zaborowski <balrogg@gmail.com>, Helge Deller <deller@gmx.de>, 
 QEMU Trivial <qemu-trivial@nongnu.org>, Aurelien Jarno <aurelien@aurel32.net>, 
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, John Snow <jsnow@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-List-Received-Date: Mon, 09 Mar 2020 16:44:24 -0000

On Mon, 9 Mar 2020 at 15:09, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 7a5853cec479a448edae0fb2aaf4e2f78c9c774d:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into staging (2020-03-09 10:32:53 +0000)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to 916c92503bd5348a33e561db600d8894bde636bb:
>
>   monitor/hmp-cmds: Remove redundant statement in hmp_rocker_of_dpa_groups() (2020-03-09 15:59:31 +0100)
>
> ----------------------------------------------------------------
> - includes cleanup
> - reduce .data footprint
> - fix warnings reported by Clang static code analyzer
> - fix dp8393x part lost in merge
> - update git.orderfile and rules.mak
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

