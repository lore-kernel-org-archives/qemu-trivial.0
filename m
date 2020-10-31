Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kYnUC-0000RH-UO
	for mharc-qemu-trivial@gnu.org; Sat, 31 Oct 2020 05:47:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYnUB-0000Oc-Eg
 for qemu-trivial@nongnu.org; Sat, 31 Oct 2020 05:47:47 -0400
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:38294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kYnU8-00085p-E0
 for qemu-trivial@nongnu.org; Sat, 31 Oct 2020 05:47:47 -0400
Received: by mail-ed1-x542.google.com with SMTP id k9so9185872edo.5
 for <qemu-trivial@nongnu.org>; Sat, 31 Oct 2020 02:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=urG2kFZ3ce8Op/j8tESCCY+aOGYMljSJmXSJJ2Vr/XI=;
 b=NAdvUhJsc9heM/Ik8kb4VHKedwI0Wz/vHNVaZMxVJGPulVHpcfEpPuXmCtm6f9C8Gt
 o5Bq/4yJoGVG75Jchs7tVPp4CEtmKGOiI49mzRknGcmlr8dkbE/z0dhELuxWunRg08YL
 8KGWKlMwt81QfpTqHIbsM2hmqpjlsqrFbqZWcrib1K135szWIrXlltsgME0GKKxD5gPY
 NH+akUUc7P8kML6rOykkzZzOR+QxNPdwbLGWf7HZqklY/fHQGt4JrAuPEay/9wXB3Wtl
 bMILmrVk7C9lAn6bPPUXo+//18cu9qbu09stemF5VqjO+RMiSj4Roithna9STITbWhEL
 +cNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=urG2kFZ3ce8Op/j8tESCCY+aOGYMljSJmXSJJ2Vr/XI=;
 b=TySkzAPW385zh79eWxaGL25jLu/zviFHrYldHmO204w3JCTPkwO6Pr8lDLLgy7hgA4
 0YODfGwSBxqwX8oSZiM+uPrfvh1OCteS231/toOD7S8NLvvVell4fWH1ESIBa5Be9YkP
 h/3vz4JMu+aXwltCt+ZG1f9oo/v40B/bDAXYteYZxLzYaaNNWqKfbIgIpCUxSQhdyLK9
 hbct4AysNejpvYyJ7xq+rabVwQB+wKWZqhcgUtVrFeSP4Wz/VwacMsh/XWnY9GPhEeep
 ZINhfxnx7iJkea/BbRRlYT8ixpLgH+Idg/bXlFl9nJ/QzcjhTEfwvt9FeNsQSsQvZ8fu
 DUww==
X-Gm-Message-State: AOAM532JyUGps1CQmdqmj48ZzhlYsGbXJH2ASkvqxXpj5Xrs7Urh/08x
 de8J6P+6JgF4S5EC7sTkU1U/noupqb7lB9iao/1ikA==
X-Google-Smtp-Source: ABdhPJzi8PlEBw6d+JQsJJBvmxzL4Wo+GoIOuCa8eKh9bCGxWRkZ/1L8LmQ5X4n5kWxdIJuRY8mXMnKduyhiSVDGE7A=
X-Received: by 2002:a05:6402:b35:: with SMTP id
 bo21mr7061428edb.52.1604137662703; 
 Sat, 31 Oct 2020 02:47:42 -0700 (PDT)
MIME-Version: 1.0
References: <5F9BE974.3040806@huawei.com>
 <CAFEAcA_7xMjOTAWkk+k34oneB_KGCGk_hoBVMX-oDRMLZzR8Wg@mail.gmail.com>
 <5F9CD2AB.1060601@huawei.com>
In-Reply-To: <5F9CD2AB.1060601@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 31 Oct 2020 09:47:31 +0000
Message-ID: <CAFEAcA-ig-+T21OmbiRXhEZF6zpjsXXN=pm7Y=bj-P_d2SHFNg@mail.gmail.com>
Subject: Re: [PATCH] hw/display/exynos4210_fimd: Fix potential NULL pointer
 dereference
To: AlexChen <alex.chen@huawei.com>
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>, 
 QEMU <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x542.google.com
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
X-List-Received-Date: Sat, 31 Oct 2020 09:47:47 -0000

On Sat, 31 Oct 2020 at 02:57, AlexChen <alex.chen@huawei.com> wrote:
>
> On 2020/10/30 22:28, Peter Maydell wrote:
> > On Fri, 30 Oct 2020 at 10:23, AlexChen <alex.chen@huawei.com> wrote:
> >>
> >> In exynos4210_fimd_update(), the pointer s is dereferenced before
> >> being check if it is valid, which may lead to NULL pointer dereference.
> >> So move the assignment to global_width after checking that the s is valid
> >>
> >> Reported-by: Euler Robot <euler.robot@huawei.com>
> >> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> >> ---
> >>  hw/display/exynos4210_fimd.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
> >> index 4c16e1f5a0..a1179d2f89 100644
> >> --- a/hw/display/exynos4210_fimd.c
> >> +++ b/hw/display/exynos4210_fimd.c
> >> @@ -1275,12 +1275,12 @@ static void exynos4210_fimd_update(void *opaque)
> >>      bool blend = false;
> >>      uint8_t *host_fb_addr;
> >>      bool is_dirty = false;
> >> -    const int global_width = (s->vidtcon[2] & FIMD_VIDTCON2_SIZE_MASK) + 1;
> >>
> >>      if (!s || !s->console || !s->enabled ||
> >>          surface_bits_per_pixel(qemu_console_surface(s->console)) == 0) {
> >>          return;
> >>      }
> >> +    const int global_width = (s->vidtcon[2] & FIMD_VIDTCON2_SIZE_MASK) + 1;
> >>      exynos4210_update_resolution(s);
> >>      surface = qemu_console_surface(s->console);
> >
> > Yep, this is a bug, but QEMU's coding style doesn't permit
> > variable declarations in the middle of functions. You need
> > to split the declaration (which stays where it is) and the
> > initialization (which can moved down below the !s test.
> >
> Thans for your review. I have also considered this modification to be incompatible with
> the QEMU's coding style. But the type of global_width is const int which cannot be
> assigned once they are defined.
> Could we define the global_width as int, such as this modification:
>
> diff --git a/hw/display/exynos4210_fimd.c b/hw/display/exynos4210_fimd.c
> index 4c16e1f5a0..34a960a976 100644
> --- a/hw/display/exynos4210_fimd.c
> +++ b/hw/display/exynos4210_fimd.c
> @@ -1275,12 +1275,14 @@ static void exynos4210_fimd_update(void *opaque)
>      bool blend = false;
>      uint8_t *host_fb_addr;
>      bool is_dirty = false;
> -    const int global_width = (s->vidtcon[2] & FIMD_VIDTCON2_SIZE_MASK) + 1;
> +    int global_width;
>
>      if (!s || !s->console || !s->enabled ||
>          surface_bits_per_pixel(qemu_console_surface(s->console)) == 0) {
>          return;
>      }
> +
> +    global_width = (s->vidtcon[2] & FIMD_VIDTCON2_SIZE_MASK) + 1;
>      exynos4210_update_resolution(s);
>      surface = qemu_console_surface(s->console);

Yes, I think that would be fine.

thanks
-- PMM

