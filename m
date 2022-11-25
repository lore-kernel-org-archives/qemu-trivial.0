Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1oygC3-0001BV-54
	for mharc-qemu-trivial@gnu.org; Fri, 25 Nov 2022 16:25:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oygC1-0001BB-4h
 for qemu-trivial@nongnu.org; Fri, 25 Nov 2022 16:25:05 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oygBy-0007MV-CB
 for qemu-trivial@nongnu.org; Fri, 25 Nov 2022 16:25:04 -0500
Received: from sas1-c73b4b4f4b95.qloud-c.yandex.net
 (sas1-c73b4b4f4b95.qloud-c.yandex.net
 [IPv6:2a02:6b8:c08:12a9:0:640:c73b:4b4f])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id D4C2D5E923;
 Sat, 26 Nov 2022 00:13:56 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:16::1:7] (unknown [2a02:6b8:b081:16::1:7])
 by sas1-c73b4b4f4b95.qloud-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id tDU5B30OdSw1-ySaAKTd0; Sat, 26 Nov 2022 00:13:56 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1669410836; bh=koqoox0cuwA1chtDOGVfx0x/4xgr7dkKRnmnkhlyed0=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=11RDIj68d+tAhgNnASeRWcUGYAr3/g66ar6EwN0rrbySgKyBLkOIz9EtKF3Wm5W+9
 mRM98iZPjyOTMkstPWDfm9DY6/jdkCBLgEJYueYeH2+KJL8gN82xKHD5Nlq/vznunW
 wVxWuSzEwgm7PoUUYyXi8Ggy34eSx4RLrB+jeYXI=
Authentication-Results: sas1-c73b4b4f4b95.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <3e098edf-f513-bca2-41ae-182b950afc61@yandex-team.ru>
Date: Sat, 26 Nov 2022 00:13:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH-for-8.0] block/nbd: Add missing <qemu/bswap.h> include
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, qemu-trivial@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>
References: <20221125175328.48539-1-philmd@linaro.org>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20221125175328.48539-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Fri, 25 Nov 2022 21:25:05 -0000

On 11/25/22 20:53, Philippe Mathieu-Daudé wrote:
> The inlined nbd_readXX() functions call beXX_to_cpu(), themselves
> declared in <qemu/bswap.h>. This fixes when refactoring:
> 
>    In file included from ../../block/nbd.c:44:
>    include/block/nbd.h: In function 'nbd_read16':
>    include/block/nbd.h:383:12: error: implicit declaration of function 'be16_to_cpu' [-Werror=implicit-function-declaration]
>      383 |     *val = be##bits##_to_cpu(*val);                                     \
>          |            ^~
>    include/block/nbd.h:387:1: note: in expansion of macro 'DEF_NBD_READ_N'
>      387 | DEF_NBD_READ_N(16) /* Defines nbd_read16(). */
>          | ^~~~~~~~~~~~~~
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>

-- 
Best regards,
Vladimir


