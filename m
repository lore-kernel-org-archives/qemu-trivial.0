Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WOyJU-0006gX-95
	for mharc-qemu-trivial@gnu.org; Sat, 15 Mar 2014 19:48:24 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35127)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WOyJM-0006c0-LV
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 19:48:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WOyJA-0005gj-LT
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 19:48:16 -0400
Received: from mail-la0-f52.google.com ([209.85.215.52]:34376)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WOyJA-0005ej-Db
	for qemu-trivial@nongnu.org; Sat, 15 Mar 2014 19:48:04 -0400
Received: by mail-la0-f52.google.com with SMTP id ec20so2784159lab.11
	for <qemu-trivial@nongnu.org>; Sat, 15 Mar 2014 16:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=aejfzWqSkHCU86jEvUsH22ZlZunEvEimE6z275QLyek=;
	b=MvhytbsHf75temRikP7YD6qcnVUMMyLVMBm+FlrEJ2zHEfDmvGCouvtNdVcYpKOhXd
	UzEt9937flDr1yUHPH++AlTaEPvKaeR5CAnN0ULY3xClLe/jzFOCSB3LBaRft5nUF9bD
	CkrBRCMtZmjQ6fagpRSLypEx88gKNMDf1oO9s6ZoQE11oU/PJnSd82Pj43asB0jyYTqO
	XIL8F2+aLeL61xoBTiZ9yWj0UDm+gauxEXD4bdtwfE9hjUe6XcuHUOOPKEpZYMYm8pMA
	2of5tpqEV+mkL58+1NCz57AwgLpk063tjf87R4kcp28LXtNFqZv1yl4OU8tApf2th5+A
	WT2Q==
X-Gm-Message-State: ALoCoQlC4jriWIz1vvX1rL9gBbv40IVpAJncsZNgHGQ4hjIgIMUV2+dPU3dpbFeJJIPE3L/lFqRH
X-Received: by 10.153.8.135 with SMTP id dk7mr11222112lad.18.1394927282936;
	Sat, 15 Mar 2014 16:48:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.180.233 with HTTP; Sat, 15 Mar 2014 16:47:42 -0700 (PDT)
In-Reply-To: <1394908420-6981-1-git-send-email-pbonzini@redhat.com>
References: <1394908420-6981-1-git-send-email-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 15 Mar 2014 23:47:42 +0000
Message-ID: <CAFEAcA-iLNU5g236yhp7ie6-dqpxNpG=EMz8tXhOXs9aPnaS+Q@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.52
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-alpha: fix subl and
	s8subl indentation
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Mar 2014 23:48:22 -0000

On 15 March 2014 18:33, Paolo Bonzini <pbonzini@redhat.com> wrote:
> Two missing braces, one close and one open, fabulously let the code
> compile.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  target-alpha/translate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/target-alpha/translate.c b/target-alpha/translate.c
> index a9ef1a7..e7e319b 100644
> --- a/target-alpha/translate.c
> +++ b/target-alpha/translate.c
> @@ -1927,6 +1927,7 @@ static ExitStatus translate_one(DisasContext *ctx, uint32_t insn)
>                      else {
>                          tcg_gen_neg_i64(cpu_ir[rc], cpu_ir[rb]);
>                          tcg_gen_ext32s_i64(cpu_ir[rc], cpu_ir[rc]);
> +                    }
>                  }
>              }
>              break;
> @@ -1991,7 +1992,7 @@ static ExitStatus translate_one(DisasContext *ctx, uint32_t insn)
>                  } else {
>                      if (islit)
>                          tcg_gen_movi_i64(cpu_ir[rc], -lit);
> -                    else
> +                    else {
>                          tcg_gen_neg_i64(cpu_ir[rc], cpu_ir[rb]);
>                          tcg_gen_ext32s_i64(cpu_ir[rc], cpu_ir[rc]);
>                      }

I'm surprised checkpatch didn't insist you added braces to the "if"
half of this if-else as well.

thanks
-- PMM

