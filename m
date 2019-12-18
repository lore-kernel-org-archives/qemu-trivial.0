Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ihQkI-0003jw-UN
	for mharc-qemu-trivial@gnu.org; Tue, 17 Dec 2019 23:15:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41280)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ihQkE-0003iX-Cw
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2019 23:15:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ihQkA-0008Gp-KU
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2019 23:15:29 -0500
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:34428)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ihQkA-0008FS-Bf
 for qemu-trivial@nongnu.org; Tue, 17 Dec 2019 23:15:26 -0500
Received: by mail-pg1-x544.google.com with SMTP id r11so534534pgf.1
 for <qemu-trivial@nongnu.org>; Tue, 17 Dec 2019 20:15:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9C/NllXt+IiMcTKuUu1KalZGcyy4YxFtVK0hNJJKSu8=;
 b=Mbo78YQV18F6yKgC0YqWhsSg64m6s3WkylVPQTiaXvbMV68K/GAxghjgo7pUZC1Io1
 SJPzkZ6eyKFZU64CMJkk0+p112O6+S//qA9H8Hwg0zsRfIller0eB4FkUFwHUvR8533Y
 mOULpqmWvTerrU6pAerBKovqrrblyZuo3D5xJ/3dlY40u/bbLKmUO5bUHyGEXP/SBMfv
 SX3OGN6CsNBgZVm+rfJfTwO2wbwxXwy9Qy5FRWyRDQvI+XantGdABp2HlqGQIqVOCemR
 nvEPyEACr7cPQYmWxBeZ/NYUEG5rmZ5pt1+kdMlUDXrh/2jltIUKoWPX3vGhNAMFaimr
 l9VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9C/NllXt+IiMcTKuUu1KalZGcyy4YxFtVK0hNJJKSu8=;
 b=mupSXn2UABlWojSYOfLIA/+sW9T09pNdtiAEeVuuvLRwYXXoLSTHKxp7hYPHyxiWAO
 qn830i+KsudswlSQblscrfz5ISayF2BQYpqCaZaa4QbJ+GrCf5RjwOzV7pQrei2jz+78
 3MXr2APITkeTViBL79FH7fQMqYL4vUUZaZvacPiEauHJYq+Xa4vh5gLBDAgQmmCFzftF
 9cKehaKa6rARZhnRm5lrd7HM8Dit7dZXmmSZnCBWOMD77V76DMrUYY159CQe+CWCCvqD
 zslEVcTJJFs4vcXNnjWHBNKBzb40lDcX2QwPEYGlCm0+G6JgMLzUHkXm2EpM9O8abM7E
 sjbw==
X-Gm-Message-State: APjAAAWb12wrobEbczGtigaqNlX8WLHL0dfLyy8IkGVXaYMd821afFvi
 moVYrpNIeFel3X2cqp1tJbQUjg==
X-Google-Smtp-Source: APXvYqwYAD4pd6h6l6Qs56nhZ9VCMA43ro3PTrHjKnumX0gkC05+9kc1EaR1YJZbquNLgs+0tAxGxw==
X-Received: by 2002:a63:134e:: with SMTP id 14mr566737pgt.115.1576642525108;
 Tue, 17 Dec 2019 20:15:25 -0800 (PST)
Received: from ?IPv6:2605:e000:c74f:dc00:6838:d2b2:17e2:8445?
 ([2605:e000:c74f:dc00:6838:d2b2:17e2:8445])
 by smtp.gmail.com with ESMTPSA id a6sm657309pgg.25.2019.12.17.20.15.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 20:15:24 -0800 (PST)
Subject: Re: [PATCH 6/6] qemu-io-cmds: Silent GCC9 format-overflow warning
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
References: <20191217173425.5082-1-philmd@redhat.com>
 <20191217173425.5082-7-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0bd64884-03fd-68e1-a790-c9ceb7710fd9@linaro.org>
Date: Tue, 17 Dec 2019 18:15:21 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191217173425.5082-7-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::544
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
X-List-Received-Date: Wed, 18 Dec 2019 04:15:32 -0000

On 12/17/19 7:34 AM, Philippe Mathieu-Daudé wrote:
> GCC9 is confused when building with CFLAG -O3:
> 
>   In function ‘help_oneline’,
>       inlined from ‘help_all’ at qemu-io-cmds.c:2414:9,
>       inlined from ‘help_f’ at qemu-io-cmds.c:2424:9:
>   qemu-io-cmds.c:2389:9: error: ‘%s’ directive argument is null [-Werror=format-overflow=]
>    2389 |         printf("%s ", ct->name);
>         |         ^~~~~~~~~~~~~~~~~~~~~~~
> 
> Audit shows this can't happen. Give a hint to GCC adding an
> assert() call.

This deserves more investigation.  From my glance it appears you are right --
and moreover impossible for gcc to have come to this conclusion.  Which begs
the question of how that is.

Did you file a gcc bug report?


r~

> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> Cc: Kevin Wolf <kwolf@redhat.com>
> Cc: Max Reitz <mreitz@redhat.com>
> Cc: qemu-block@nongnu.org
> ---
>  qemu-io-cmds.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
> index 1b7e700020..9e956a5dd4 100644
> --- a/qemu-io-cmds.c
> +++ b/qemu-io-cmds.c
> @@ -2411,6 +2411,7 @@ static void help_all(void)
>      const cmdinfo_t *ct;
>  
>      for (ct = cmdtab; ct < &cmdtab[ncmds]; ct++) {
> +        assert(ct->name);
>          help_oneline(ct->name, ct);
>      }
>      printf("\nUse 'help commandname' for extended help.\n");
> 


