Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDpqT-0001uu-4z
	for mharc-qemu-trivial@gnu.org; Fri, 27 Sep 2019 08:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54787)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iDpqO-0001nx-Tm
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 08:59:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iDpqN-0002qL-FK
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 08:59:32 -0400
Received: from mout.kundenserver.de ([217.72.192.74]:33887)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iDpqN-0002pw-2Y
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 08:59:31 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue106 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1Mlejs-1hnnOt3tFy-00ikLJ; Fri, 27 Sep 2019 13:50:10 +0200
Subject: Re: [PATCH 3/3] qemu-timer: reuse MIN macro in qemu_timeout_ns_to_ms
To: Frediano Ziglio <fziglio@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-trivial@nongnu.org
References: <20190927103233.20901-1-fziglio@redhat.com>
 <20190927103233.20901-3-fziglio@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <9ec0d128-86ec-542b-a1b6-5cba36b752ec@vivier.eu>
Date: Fri, 27 Sep 2019 13:50:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190927103233.20901-3-fziglio@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Wb9NUUssY0QqpVrN/DC+LTaIfQiU0lWyi68bsWtUZc7xd1QmIog
 iMTk6HIQa8u7aWvDt0sTPsWCoiY+5E3HnE7e58r/49E2yOFPWV73W/HAEMcM6+J3twyxL8M
 wYMjSXp7Dgr6OruLk0sxO0jvykpmCGNJfzAcX3xY/tbqommgG1V8s2Hq6m/SsB2OszOQGTP
 zk8fHjnMACUR3r7QYqUoQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:9GgOmBaD5fs=:2Xn20wPFO6ykfGsn5s96zQ
 Xb/65Ao0bs35ODGdEO40hTR8wyVv3P0DF460u5b79xrkV5+5fJKjrdNJgA4dDmXrOMsdFnqnV
 0yq1omnwZAjeLUhj3NRWqnKqEc4gDO/pe6K82LDsDGPcosX/8uZcVoLf6pvMd76PIkSuLv7Jf
 tvc/mLLkLsnQg237oshE6OJVnCLmizo1tIyzZdmoQlM4nXmbVayzR7SD43byP3dKoYTdg2gyp
 v/l+wzdhB7bzQRTeAmWFJTdTUpjKev4EeZdpvrKQ2wJNJRgFAerhXQSMhCurrspqKI5ULD9K7
 8OgG0xWnc+MnRehu5TxliRAgmUZ40+TVo61dj7UUmOhvU3o+rO3Upqkq4PjSaBfRE6Clyml8R
 z42n2PHnaK+l8U4rd9XhAXJz9GCQvO+KfAV/Mfigaoq0qTrZIkjp0nwaZaFihOZeyEjv3NqHn
 Xc+Uxj5IZ2JUmf2HF0LOGZJ2rYw/0mFr2xYaXBP4LWHg14KAiymEp6x9yYYl4T42XPZmWa7eO
 rzdd8UsXTbI80vOpvWJhs4TAX1HPb2181HP/PjuDgyCecuy8HrsFMLkJo8jY/enT7Yyp6MwFH
 KDqvWc/H8xNHinz93DqcvNxk/aItc1NwcAhDGAg4XlZCZSV3MapzRrMATSPen5Fkx1dYcI10O
 FPfC3qYhssiL79KNmrwLmU0k+dCaiRSbS+8NSX6ReDbQihysAf5H13EROHMU62YW2PuKcYAsm
 /qBFxUNEqqYTbUPdr4hxWUvhZCoJ7x3gAXRlJZoG3I5B8pYwbXnrU9Ez/GuFrsWrZ7/d7LJbH
 TQ/tOtigVu1KTk4Lap7u4KLQzjXH3fdnkcdCnfIEQMIIK937qRBB839j06Xb+ZpfGbElVEoYT
 sy0J5sobEP+xXYGimbtu5ivljs5+OJc6gTxPiU3js=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 217.72.192.74
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
X-List-Received-Date: Fri, 27 Sep 2019 12:59:35 -0000

Le 27/09/2019 à 12:32, Frediano Ziglio a écrit :
> Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
> ---
>  util/qemu-timer.c | 6 +-----
>  1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/util/qemu-timer.c b/util/qemu-timer.c
> index d428fec567..9bd173ecda 100644
> --- a/util/qemu-timer.c
> +++ b/util/qemu-timer.c
> @@ -322,11 +322,7 @@ int qemu_timeout_ns_to_ms(int64_t ns)
>      ms = DIV_ROUND_UP(ns, SCALE_MS);
>  
>      /* To avoid overflow problems, limit this to 2^31, i.e. approx 25 days */
> -    if (ms > (int64_t) INT32_MAX) {
> -        ms = INT32_MAX;
> -    }
> -
> -    return (int) ms;
> +    return (int) MIN(ms, INT32_MAX);
>  }
>  

Perhaps it would be cleaner to have always the same return type for
MIN() with:

    MIN(ms, (int64_t) INT32_MAX)

Anyway:

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

Thanks,
Laurent

