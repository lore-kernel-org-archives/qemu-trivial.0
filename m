Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mNcgh-00041R-Gx
	for mharc-qemu-trivial@gnu.org; Tue, 07 Sep 2021 11:07:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNcgf-0003uV-Cm
 for qemu-trivial@nongnu.org; Tue, 07 Sep 2021 11:07:01 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:50877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mNcgd-0005hD-KO
 for qemu-trivial@nongnu.org; Tue, 07 Sep 2021 11:07:00 -0400
Received: by mail-wm1-x32b.google.com with SMTP id m2so7135705wmm.0
 for <qemu-trivial@nongnu.org>; Tue, 07 Sep 2021 08:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=G/pCJL7qiT2UsMwGYhBVGmFYsPWmxtAI+srQ20ormhw=;
 b=ieRe9PaLZJitUpPYPBEOnNuij6hy6p96iWRBmBM5NQRbIPdZJsgeyiYVUEX0hyw7OB
 WKtw92f8vdMsUqVpnJvOKFZ+PKInvDQbVzJGgp08jzQm7rYDx/ibJZOr7L0win1mlYI9
 gTs202Hvt3pmZODa8HkFQgPKH7urLAjXGo+X8m8FgbSt1jtpVGtJQmIjzDrfLlaAYTGA
 qMFXIVxQ08iofw8pNyq6nWcnIqi1oW1bBdT97thfPI7M02ufX0kq4o8Q+PRVISPnQsKt
 fAhExzwnQM5sEmStUjDmV4sbujTSsm1npouYqEbMxGoyRbsUomjiSX2aHqwpUHTGN0DQ
 zQ+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=G/pCJL7qiT2UsMwGYhBVGmFYsPWmxtAI+srQ20ormhw=;
 b=fkm4VHTIXRs9frtPQV+/PS1ENAaD9zVFjH4TtHWsQOIZhXjIDhcC6Yc8Q/mclQk0ub
 AMQJfHhFGD+uqxgI8MzQ+QhQWtF9kpaReXBrcmMWcYDPCtIWHsckcmv2SpmEeQUcHTYI
 LJ0POotmRa08pmfZGtGMdzYorKm6JhfjKlteEG362i7uSU7aA5GOuk+JkKiLJkUp/zXn
 4ZzYIv9CvzXvfLokeJQK83PzCsHArl2bLyrZKopn6tdtt0TbNCtFZP0eYgi6VDRxI59k
 DEPlITbzZjJF+YOn8MeK1SyBA+DOSv4/QFA3nCp6W6/UDt10+VEhANOyLyRGXxyvmf8T
 7PfA==
X-Gm-Message-State: AOAM530rcbtx0XtC4qwfTXaiatzO6W3jjKUkcZgTHN53NMUs2reEscvf
 E+cVm/0bPN+q67ElWZH2oWEbHose0XHGhRyQktmQbQ==
X-Google-Smtp-Source: ABdhPJybqw1zB5BZPa1peyit0cRU1aoBje06zTjC0Z0ghhmTAWvWBxcAGd5/N87ItfMfaXaowtY/4mNWijARsuxerdM=
X-Received: by 2002:a7b:ce87:: with SMTP id q7mr4612072wmj.126.1631027217626; 
 Tue, 07 Sep 2021 08:06:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210307222625.347268-1-f4bug@amsat.org>
 <6f13948a-1a33-1eb3-90d0-106afbb2caf8@redhat.com>
 <CAFEAcA_nMogdN-Q7Z7S=5BY6RWKDq0jnHya5BaoUe+6n8oKWYQ@mail.gmail.com>
 <db4abdf8-bbc7-ae63-a7a7-8496a4ed8dbd@amsat.org>
In-Reply-To: <db4abdf8-bbc7-ae63-a7a7-8496a4ed8dbd@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Sep 2021 16:06:08 +0100
Message-ID: <CAFEAcA-6+S1Ugh56wac02AnUdnbHftq0aYozHs5Yyq0vkX-usA@mail.gmail.com>
Subject: Re: [PATCH 0/4] hw/block/pflash_cfi01: Remove
 pflash_cfi01_get_memory()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Kevin Wolf <kwolf@redhat.com>, Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>, 
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>, 
 Richard Henderson <richard.henderson@linaro.org>, Max Reitz <mreitz@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
 Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Tue, 07 Sep 2021 15:07:02 -0000

On Tue, 7 Sept 2021 at 15:45, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> The problems I see:
>
> - pflash_cfi01_get_memory() doesn't really document what it returns,
>   simply an internal MemoryRegion* in pflash device. Neither we
>   document this is a ROMD device providing a RAM buffer initialized
>   by qemu_ram_alloc().
>
> - to update the flash content, we get the internal buffer via
>   memory_region_get_ram_ptr(). If the pflash implementation is
>   changed (.i.e. reworked to expose a MR container) we break
>   everything.
>
> - memory_region_get_ram_ptr() doesn't do any check on the MR type,
>   it simply calls qemu_map_ram_ptr(mr->ram_block, offset).

Using memory_region_get_ram_ptr() is tricky to get right, too --
if you're writing directly to the underlying ram while the system is
running you need to use memory_region_flush_rom_device() to make
sure it's marked dirty. I think the current users of this on the
pflash devices get away with it because they do it during initial
machine init.

-- PMM

