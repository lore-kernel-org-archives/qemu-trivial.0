Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kRzO5-0002oJ-Fb
	for mharc-qemu-trivial@gnu.org; Mon, 12 Oct 2020 11:05:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzO3-0002na-I7
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 11:05:19 -0400
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644]:36155)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kRzO0-0003Ts-Kr
 for qemu-trivial@nongnu.org; Mon, 12 Oct 2020 11:05:19 -0400
Received: by mail-ej1-x644.google.com with SMTP id qp15so23651363ejb.3
 for <qemu-trivial@nongnu.org>; Mon, 12 Oct 2020 08:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nu8+ykLxiOPFA8bKANAHXNRJcMmmq/90jkdNTtPVqoc=;
 b=EvjBhQy78HOlkrt4qEbPT4b5vsVTzBV7skUy8RwUlJw9uI8mhbxE9rryMaYlhzUscv
 pt3mQD1RJDgWm4r7fM0mKsmdyf+gnVwURRCUKZrjByp9mxvhz0aO36JVVx/127ZxrHAc
 1NHW5QduxD8A9lvyUBebgokXQDbbitryYy0m0COU7/7rO+5Hm1Kmvp9qxKJJutn6qvnb
 IouiFreAyFnURskExnYQNcnxau+XdnFaeu0uvyzW2/jOXEXC6+Uy6igzITd5IM+YZHnI
 6HYQ2Pu0CYXYis1U1xRd7ffqlZDKnHJRbxZC1VUX2mr/omEscR/D96a9FHNUVQxdk9xL
 oo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nu8+ykLxiOPFA8bKANAHXNRJcMmmq/90jkdNTtPVqoc=;
 b=qkfF+xn2CKg4xOcPv56Bcih/1yyz5o0XhVXst8nhK2JPD54/XeRAktZb6bB2JRtK7l
 IHKVyL2ElBL5wwzPokq4iJurslI98DRDyK2Ag613qyPmwo3NUVA9h5Kl+qvxT6k1c9MW
 Q2qrK6eXh28ld8nm18WHt/3eyYDR9aiT1pD3dWcfZ131lYNTn/y4bKAoBwsdVUcbfMBB
 w0hG4dWjIH+9vluthW2V0AwhOry+xGXE8Cv/KfOgqNgKuvPYpSQWZVnK9j9CVKiYemSm
 ltKgcDw6+Z2cwoVAqIaI/bR248I6uBE7nVA+/RJ4WBKaMkp0pIDHqQvVfYHJ3wB2tRv0
 4A4g==
X-Gm-Message-State: AOAM532vnQynPnp06aDTg1SIW2j4z/nHE0mjRfyZIWWLjpZ+vJOTv+YQ
 F3TgvE/WkjoBfjdVMQRgNpmzulKplVMGuM7cVtq/xV//EmDGi7yT
X-Google-Smtp-Source: ABdhPJxZAc43/mTfMMYY7MZhZMaWGt8oE0aljsh6IN6N3EnjSXLXsql2n+zVuuooCq0btdQqv1q4kOqJ8fEJjEWxGTM=
X-Received: by 2002:a17:906:1f42:: with SMTP id
 d2mr27983435ejk.407.1602515115252; 
 Mon, 12 Oct 2020 08:05:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201008174359.157627-1-dgilbert@redhat.com>
 <7f8ffa77-cc95-b121-0da8-269d37c52830@redhat.com>
 <fa6c8769-b1d7-cd75-2c2e-d8bc74ebe51e@vivier.eu>
In-Reply-To: <fa6c8769-b1d7-cd75-2c2e-d8bc74ebe51e@vivier.eu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Oct 2020 16:05:04 +0100
Message-ID: <CAFEAcA9T-81tXcM1A0b-y-_ZkC_0sqJ8cQuEvDkfbobXJQr70Q@mail.gmail.com>
Subject: Re: [PATCH] mingw: Fix builds on f33 mingw
To: Laurent Vivier <laurent@vivier.eu>
Cc: Thomas Huth <thuth@redhat.com>,
 "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>, 
 QEMU Developers <qemu-devel@nongnu.org>, Juan Quintela <quintela@redhat.com>, 
 QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::644;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x644.google.com
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
X-List-Received-Date: Mon, 12 Oct 2020 15:05:20 -0000

On Mon, 12 Oct 2020 at 15:39, Laurent Vivier <laurent@vivier.eu> wrote:
>
> Le 08/10/2020 =C3=A0 19:46, Thomas Huth a =C3=A9crit :
> > On 08/10/2020 19.43, Dr. David Alan Gilbert (git) wrote:
> >> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >>
> >> Fedora 33's mingw moans about:
> >>
> >> In file included from ../tests/test-bitmap.c:12:
> >> /home/dgilbert/git/migpull/include/qemu/osdep.h:76: error: "__USE_MING=
W_ANSI_STDIO" redefined [-Werror]
> >>    76 | #define __USE_MINGW_ANSI_STDIO 1
> >>       |
> >>
> >> the fix is to make sure osdep.h is the first include - which is our
> >> rule anyway; but one we broke in a couple of places.
> >>
> >> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >> ---
> >>  migration/dirtyrate.c | 2 +-
> >>  tests/test-bitmap.c   | 2 +-
> >>  2 files changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/migration/dirtyrate.c b/migration/dirtyrate.c
> >> index ab9e1301f6..42b71e771e 100644
> >> --- a/migration/dirtyrate.c
> >> +++ b/migration/dirtyrate.c
> >> @@ -10,8 +10,8 @@
> >>   * See the COPYING file in the top-level directory.
> >>   */
> >>
> >> -#include <zlib.h>
> >>  #include "qemu/osdep.h"
> >> +#include <zlib.h>
> >>  #include "qapi/error.h"
> >>  #include "cpu.h"
> >>  #include "qemu/config-file.h"
> >> diff --git a/tests/test-bitmap.c b/tests/test-bitmap.c
> >> index 2f5b71458a..c3c9d79667 100644
> >> --- a/tests/test-bitmap.c
> >> +++ b/tests/test-bitmap.c
> >> @@ -8,8 +8,8 @@
> >>   * Author: Peter Xu <peterx@redhat.com>
> >>   */
> >>
> >> -#include <stdlib.h>
> >>  #include "qemu/osdep.h"
> >> +#include <stdlib.h>
> >>  #include "qemu/bitmap.h"
> >>
> >>  #define BMAP_SIZE  1024
> >>
> >
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> >
> >
>
> Applied to my trivial-patches branch.

This is the wrong version of this patch -- can you take
Marc-Andr=C3=A9's instead, please?

thanks
-- PMM

