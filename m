Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kTMCU-0003hE-37
	for mharc-qemu-trivial@gnu.org; Fri, 16 Oct 2020 05:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTMCS-0003gz-L8; Fri, 16 Oct 2020 05:39:00 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:56884
 helo=mail.default.ilande.uk0.bigv.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTMCP-0006TV-Vv; Fri, 16 Oct 2020 05:39:00 -0400
Received: from host86-148-246-80.range86-148.btcentralplus.com
 ([86.148.246.80] helo=[192.168.1.65])
 by mail.default.ilande.uk0.bigv.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1kTMCL-0008Kl-2D; Fri, 16 Oct 2020 10:38:53 +0100
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, =?UTF-8?Q?Herv=c3=a9_Poussineau?=
 <hpoussin@reactos.org>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20201015194647.477252-1-f4bug@amsat.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <991e3614-e416-1ef3-c097-dccfaa8fb77d@ilande.co.uk>
Date: Fri, 16 Oct 2020 10:38:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201015194647.477252-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 86.148.246.80
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 0/2] hw/rtc/m48t59: Simplify m48t59_init()
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.uk0.bigv.io)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.uk0.bigv.io
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.019,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Fri, 16 Oct 2020 09:39:01 -0000

On 15/10/2020 20:46, Philippe Mathieu-Daudé wrote:

> Since v1:
> - Do not remove mem_base in patch 1 (Laurent)
> - Pass MemoryRegion* (new patch)
> - Run check-qtest
> 
> Philippe Mathieu-Daudé (2):
>    hw/rtc/m48t59: Simplify m48t59_init() removing 'io_base' argument
>    hw/rtc/m48t59: Simplify m48t59_init() passing MemoryRegion argument
> 
>   include/hw/rtc/m48t59.h |  5 ++---
>   hw/ppc/ppc405_boards.c  |  2 +-
>   hw/rtc/m48t59.c         | 14 +++-----------
>   hw/sparc/sun4m.c        |  3 ++-
>   hw/sparc64/sun4u.c      |  7 ++-----
>   5 files changed, 10 insertions(+), 21 deletions(-)

This looks good, and from what you've done here it's only a little more work to 
remove m48t59_init() completely. Would you mind if I try this using these patches as 
a starting point? :)


ATB,

Mark.

