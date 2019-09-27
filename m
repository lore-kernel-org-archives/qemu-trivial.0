Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1iDpjM-0002N8-D5
	for mharc-qemu-trivial@gnu.org; Fri, 27 Sep 2019 08:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52005)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iDpjJ-0002Iq-7G
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 08:52:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iDpjI-0001Gs-0D
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 08:52:12 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:55355)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1iDpjH-0001GU-NF
 for qemu-trivial@nongnu.org; Fri, 27 Sep 2019 08:52:11 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue109 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MG9c2-1iNfUJ1qd2-00Gb8P; Fri, 27 Sep 2019 13:43:27 +0200
Subject: Re: [PATCH 1/3] util/async: avoid useless cast
To: Frediano Ziglio <fziglio@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-trivial@nongnu.org
References: <20190927103233.20901-1-fziglio@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <7e769b7a-c825-7b20-973b-76d4c812e409@vivier.eu>
Date: Fri, 27 Sep 2019 13:43:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190927103233.20901-1-fziglio@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:fA3qrcd9PjE8HGk7nwRcVL1fpW55SRxQwrCynyk7o8ZUMbvtmrw
 8S6KCjo7GYbU4mmbKiHOXkhr4zBLYqVEDtCrDm30SGbGmj40EYovRNoke5h/gHlGAKM2p0T
 Q5WYY8vQryVXLFdrtKGuS7IrLn//BYvcTBjcu43GRO7WAZ5l+qZwx1MOghn5AFMTOC2O4I2
 vLcvEa5Ca9b6c5ZPee3IQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:xS0oOSIHvmo=:frNjzKfAhGRjnXE7DIR/Tj
 J3Fp18LajQwrVrQ7ZP213OcZ+7Q/+E6DiB7ojSCngn41lh899ReHEc/VROD6fJ/AA3GKW7/vw
 oZrOiKDSCUBxTH1FHl8FJvrpO4EV2/y+C30cSJDpm3gGdlcOGoFrZOaNVgfaaIPLQQafpWKCK
 KLR7059CrtSU428plvovqk+IdF2RFVCOo/NsdvxrQNBjb1BBOKUdwGsN7KP8+4RXH+ElfUCrI
 pnUk4MVRjr/SKSaEzCfRLlN0WXWS39Ukh3QDmX8FEIQ85+MP1To7uw0rEcSkCBuyGb1PMdpHW
 qu81m6pKmfbo3Hm4UCYpCE/D4L6jI/E2ikUlYoeAiPc40MuCzJuOTvkoGKpi7F1e/EuzO/xeJ
 068OI3byqgGpw5XQBtsIfu2NecoB1GnqNekUy2urYSGUo6+XLlsj9gZJd9FqB6IsPuuh1YL2t
 EkLpAfwugXuircYT64u42USOM7ReahvZLCN8tQpcHdXSPbIFB1zN1JJLudn1aSFMeVIRvIBGI
 qX7Id49kHNCLjFvMWaWPna9/hhgLaylWMlvl75TzftprxxgwP7cpnS34Wasg5SpyagHjizXpe
 TC/Z86rmjrwplywC+g2ZD0u3eX/MeouvAzwKKPU7vjs7dIpZenTLEjDKhAW9nF/Whx8+NU5GE
 qq89NtFZKZTy5TfzBK+V6f3ZpiLMfiXsNyzH9TgnOvXqg9xwZmIj1Yo9k5NXtvcDTZlAUYPbI
 KyvQMW/5IYKEyRgyGH3g5wubNKCmS5Fz39lefZtw0gCTzyjN0FHWSesnPOGJhIYnHhj1oJIHg
 ebTtz6tPAk3Drs8c/IC6AhRxieHcKRf4lsdA4nKe8lV3Xy/mJ1bFVt8/z7ShkjnJq1ppqmyqj
 1olAn+Kn06ZG4GEH39EsxrWHVOgrQa9+m4V/5bGII=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.17.24
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
X-List-Received-Date: Fri, 27 Sep 2019 12:52:14 -0000

Le 27/09/2019 à 12:32, Frediano Ziglio a écrit :
> event_notifier_dummy_cb is already compatible with EventNotifierHandler.
> 
> Signed-off-by: Frediano Ziglio <fziglio@redhat.com>
> ---
>  util/async.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/util/async.c b/util/async.c
> index 4e4c7af51e..3cdbf44503 100644
> --- a/util/async.c
> +++ b/util/async.c
> @@ -425,7 +425,6 @@ AioContext *aio_context_new(Error **errp)
>  
>      aio_set_event_notifier(ctx, &ctx->notifier,
>                             false,
> -                           (EventNotifierHandler *)
>                             event_notifier_dummy_cb,
>                             event_notifier_poll);
>  #ifdef CONFIG_LINUX_AIO
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

