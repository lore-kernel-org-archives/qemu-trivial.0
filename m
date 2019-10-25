Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iO08F-0006tk-UT
	for mharc-qemu-trivial@gnu.org; Fri, 25 Oct 2019 09:59:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40303)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iO08C-0006lk-9z
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 09:59:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iO08A-00061K-AJ
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 09:59:56 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:36983)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iO08A-00060E-4A
 for qemu-trivial@nongnu.org; Fri, 25 Oct 2019 09:59:54 -0400
Received: by mail-ot1-x330.google.com with SMTP id 53so2142998otv.4
 for <qemu-trivial@nongnu.org>; Fri, 25 Oct 2019 06:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r09A2sIU1Rg57fAoyBzrREbrJ7KGvvru3Z8K3pZMeHs=;
 b=l6TtjN2Z9lI/qRj25Wn+gZEW7Wy0qKnVIgJscQv3eLrk8wRRL1UNBg+WT/ucjMRJkE
 bBkPg0fuN0l5hYhj7tOAwnh4DL0EYJyHDNduzTmzHEBDdR8eqSboLw9oyCb3SUPAcjrr
 jeYYXWGq+3aTKxJzGtiaZFOZ/lSlTNBQaqWDa/FiHMLRu9vCGdB3gRb1P/U61BKB83KS
 GkzrZdw1igGNVPVmRQbyqmsXBdao0lPK+fiCoCFqK55BC2zpOqoU40tBxMk+rKVUjYwQ
 QeNUFV4oHGRu3nwbNtGa9qb2UqFVyCKki/JOcbyR4ppuo//wEMp3z+NHAYd9zFiFPD05
 SYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r09A2sIU1Rg57fAoyBzrREbrJ7KGvvru3Z8K3pZMeHs=;
 b=tyA6Gtf0F0Kmnk97pWfFvUN468JPjMg1yY9Vjbfzz4R+nr0t0OvwQdGA/NBEikS2Qv
 i2OcNCGhmVDtCBYDhfAT26tbd/tDoKlDyCLJA3at6ZPaOTxU9jK1RkR2/UHE4MuIYUL7
 zM5laMO7JA5ms6vEyszzMdj7j2KWy/g5b2MmJ9bo+znW/Rw68q0NEhXqrua2h6f6IA2y
 6Fctv/kie3ho6vZ8O6WeN8gPLYiFYClcIjontPw0o2C7BHnLNIikZKI9FYk4UJU2N6Pb
 wEx92Td7BmUktwS9q+AiLxWSo3W5ZJb79nbLxDjderhLRslgRhrFBgLcDzBpGDGXSQFM
 aQCA==
X-Gm-Message-State: APjAAAW1hXtMno5XWarCX13Kdxc7JmYFt3xWsflKOxMvZMdoiHIfYz7m
 C9Hdt6RMKd+a8f+dUVKXVsS9+5zKyorgz03ivP90xg==
X-Google-Smtp-Source: APXvYqzAqlCj5ZEcUORcpI+aZmM5vrPyQZf36OnVN7OCi4W9Cjsf2oPCCrBY2yVjfInalgJW8PF4z67MBkoo4tW6PzA=
X-Received: by 2002:a05:6830:4c1:: with SMTP id s1mr77890otd.232.1572011991639; 
 Fri, 25 Oct 2019 06:59:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191025083511.11463-1-laurent@vivier.eu>
In-Reply-To: <20191025083511.11463-1-laurent@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 25 Oct 2019 14:59:40 +0100
Message-ID: <CAFEAcA9XFKc01mOKMFEwHKfWupLq+yc9KeR1g76v6bbggKgkkw@mail.gmail.com>
Subject: Re: [PULL 00/19] Trivial branch patches
To: Laurent Vivier <laurent@vivier.eu>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Artyom Tarasenko <atar4qemu@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 Michael Tokarev <mjt@tls.msk.ru>, Richard Henderson <rth@twiddle.net>,
 Qemu-block <qemu-block@nongnu.org>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>, 
 qemu-arm <qemu-arm@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 Fam Zheng <fam@euphon.net>, Aleksandar Rikalo <arikalo@wavecomp.com>, 
 =?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>, 
 Eduardo Habkost <ehabkost@redhat.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Andrew Jeffery <andrew@aj.id.au>, 
 Helge Deller <deller@gmx.de>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 qemu-ppc <qemu-ppc@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::330
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
X-List-Received-Date: Fri, 25 Oct 2019 13:59:58 -0000

On Fri, 25 Oct 2019 at 09:35, Laurent Vivier <laurent@vivier.eu> wrote:
>
> The following changes since commit 58560ad254fbda71d4daa6622d71683190070ee2:
>
>   Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-4.2-20191024' into staging (2019-10-24 16:22:58 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/vivier/qemu.git tags/trivial-branch-pull-request
>
> for you to fetch changes up to fabb862f76f093cdd1610571de9ba714d3333c1c:
>
>   hw/rtc/aspeed_rtc: Remove unused includes (2019-10-24 20:35:28 +0200)
>
> ----------------------------------------------------------------
> Fix typos and docs, trivial changes and RTC devices split
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.2
for any user-visible changes.

-- PMM

