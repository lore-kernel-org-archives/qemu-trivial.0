Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qnHai-0005DW-3x
	for mharc-qemu-trivial@gnu.org; Mon, 02 Oct 2023 08:00:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qnHag-00054F-6M; Mon, 02 Oct 2023 07:59:58 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qnHad-0002uW-OD; Mon, 02 Oct 2023 07:59:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id A1E9F26BD0;
 Mon,  2 Oct 2023 15:00:34 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id C718D2C27F;
 Mon,  2 Oct 2023 14:59:51 +0300 (MSK)
Message-ID: <18a3d10f-615f-71ba-b827-a0d4cf644b60@tls.msk.ru>
Date: Mon, 2 Oct 2023 14:59:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add g364fb and ds1225y to the Jazz section
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Cc: qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <20230929140938.396565-1-thuth@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230929140938.396565-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -91
X-Spam_score: -9.2
X-Spam_bar: ---------
X-Spam_report: (-9.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.321,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Oct 2023 11:59:58 -0000

29.09.2023 17:09, Thomas Huth:
> These devices are only used by the Jazz machine, so they
> should be listed in the corresponding section in MAINTAINERS.

The devices look like git commit IDs :) (at least the first one)

Applied to my trivial-patches tree, thanks!

/mjt

> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   MAINTAINERS | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b4ab7d142..874234cb7b 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1295,8 +1295,10 @@ M: Hervé Poussineau <hpoussin@reactos.org>
>   R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
>   S: Maintained
>   F: hw/mips/jazz.c
> +F: hw/display/g364fb.c
>   F: hw/display/jazz_led.c
>   F: hw/dma/rc4030.c
> +F: hw/nvram/ds1225y.c
>   
>   Malta
>   M: Philippe Mathieu-Daudé <philmd@linaro.org>


