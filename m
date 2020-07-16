Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jw537-0001iB-Vt
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jul 2020 10:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jw537-0001h5-4i
 for qemu-trivial@nongnu.org; Thu, 16 Jul 2020 10:39:49 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:46856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jw534-0007gc-JG
 for qemu-trivial@nongnu.org; Thu, 16 Jul 2020 10:39:48 -0400
Received: by mail-oi1-x241.google.com with SMTP id l63so5227680oih.13
 for <qemu-trivial@nongnu.org>; Thu, 16 Jul 2020 07:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=y65RhF2V5cNpl6EuruJMdTRMhPky0ICrRpc567TcmTo=;
 b=ua55TD2IDP/z4SjXLwS6mF4938Fh1TpulKKXNeUpa6WLNsJ/hAYlte62ugA/bzK8An
 0LljFV89kDOph4QtW7Qef5P+nrui9brwua5N8oI1rmLMvgeGwZM3lbBqixSI2UgJMrlk
 RhNSjkYQv/fBJyrsYBD+E2pboPIrruMDnNp9fJ1FwtnIfV4xNnPzfbzsAHZ6kQ6OPYki
 Rphk4CzxgfzUZ/VQJvl/LpqP/EoeJepc3OQtJf+/7ZVBpjBDauxvjVPOk0JAYjDHBOLd
 vVG+1g96NBL691ESkWQhTNjIRV+Oi0dLcEfAGNpj518++DwcttIqMFPR4vZ3zT2VqRT3
 o2vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y65RhF2V5cNpl6EuruJMdTRMhPky0ICrRpc567TcmTo=;
 b=Vj1v9+/6dQQTnmF8/GAbvTJj2tAUEmZfbiJbpXcNA+ugmg2Pq0Cuw+N7zX9DfRt6Ft
 zGGjpAui1+QqlQp7oJqOMNrqFeL3Dg9mjFjH3JoauOuiVrWKutzTJ/CPVs5mj8LPWuhp
 tg2lKpsMRm9RK1sWQR+JOZwTBG31/ClL3tbdXR+pd12/0lXbl13hM4DIZEO5rNHHB5Y5
 Ex7TGBXP/ZgiBG/m0rpZwX+rHCC/1aLOawqFBS4C80vd3B8oUjrzthkjycOtpN8wnv+/
 LNpL+ZCnIwQbCQwGidHYJNE/sDRTRiiN4x7BLO3fLqKZG9H3Ynhs+3PeLZ+2gwgSk6rD
 FgkQ==
X-Gm-Message-State: AOAM5316dEgMv7egCNRsTa+27JOSsH7uw2uT/GJ1sPQGEMEO6PUC5WDz
 +IWrGo+j6tmbwywtDWT8ICT/7pk+HKnhq87em+9dIw==
X-Google-Smtp-Source: ABdhPJw1bD4riNUx/a4caVwlp0e8whh6EAJGZ2hemSd60SgKRWBH89PQBqTGAIZNs/Scigo/GCB0xtVz/WXgvguJv+I=
X-Received: by 2002:aca:54c9:: with SMTP id i192mr4027494oib.163.1594910385218; 
 Thu, 16 Jul 2020 07:39:45 -0700 (PDT)
MIME-Version: 1.0
References: <CA+XhMqxD6gQDBaj8tX0CMEj3si7qYKsM8u1km47e_-U7MC37Pg@mail.gmail.com>
 <631dad16-66cd-3f7b-90bc-969c52d29aa1@redhat.com>
 <51a660f2-2241-d27f-afd5-a02ce5bd0e73@comstyle.com>
In-Reply-To: <51a660f2-2241-d27f-afd5-a02ce5bd0e73@comstyle.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Jul 2020 15:39:34 +0100
Message-ID: <CAFEAcA-MEEAaAUp9Osn-A0yuEa1KToKQ2OYJRSCgwUyZ-_iAkA@mail.gmail.com>
Subject: Re: [PATCH] util: qemu_get_thread_id for OpenBSD
To: Brad Smith <brad@comstyle.com>
Cc: Thomas Huth <thuth@redhat.com>, David CARLIER <devnexen@gmail.com>, 
 qemu-devel <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::241;
 envelope-from=peter.maydell@linaro.org; helo=mail-oi1-x241.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 16 Jul 2020 14:39:49 -0000

On Wed, 15 Jul 2020 at 08:41, Brad Smith <brad@comstyle.com> wrote:
>
> On 7/15/2020 12:54 AM, Thomas Huth wrote:
> > On 14/07/2020 23.26, David CARLIER wrote:
> >>  From 9c7f54c67d40fae0174ba795fbaad829cd59c264 Mon Sep 17 00:00:00 2001
> >> From: David Carlier <devnexen@gmail.com>
> >> Date: Tue, 14 Jul 2020 23:23:55 +0100
> >> Subject: [PATCH] util: qemu_get_thread_id implementation for OpenBSD.
> >>
> >> ussage of getthrid syscall.
> >>
> >> Signed-off-by: David Carlier <devnexen@gmail.com>
> >> ---
> >>   util/oslib-posix.c | 2 ++
> >>   1 file changed, 2 insertions(+)
> >>
> >> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> >> index 72907d4d7f..b4f7de83c8 100644
> >> --- a/util/oslib-posix.c
> >> +++ b/util/oslib-posix.c
> >> @@ -100,6 +100,8 @@ int qemu_get_thread_id(void)
> >>       return (int)tid;
> >>   #elif defined(__NetBSD__)
> >>       return _lwp_self();
> >> +#elif defined(__OpenBSD__)
> >> +    return getthrid();
> >>   #else
> >>       return getpid();
> >>   #endif
> >>
> >   Brad,
> >
> > since you're listed as OpenBSD maintainer, could you please review above
> > patch?
>
> Thank you David and Thomas.
>
> Reviewed-by: Brad Smith <brad@comstyle.com>

Thanks for the review. Since this is a one-liner I'll take it into
the tree via target-arm.next just for convenience.

Side note: the only things we use this value for are:
 (1) it appears in the output of the QMP monitor's query-cpus and
query-iothreads commands, so that a management layer app can
use whatever the host OS provides for setting host CPU
affinity to tie a particular guest vCPU thread to a host CPU.
 (2) the log tracing backend uses it in the output just as a
way to allow tracing from different threads to be distinguished

We should really write a doc comment explaining that. Maybe
I'll put a patch together.

thanks
-- PMM

