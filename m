Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qnPgw-0002Cw-Kh
	for mharc-qemu-trivial@gnu.org; Mon, 02 Oct 2023 16:38:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qnPgv-0002Cd-K7; Mon, 02 Oct 2023 16:38:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qnPgt-0002WK-VT; Mon, 02 Oct 2023 16:38:57 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 9465726DB8;
 Mon,  2 Oct 2023 23:39:36 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 46C802C42C;
 Mon,  2 Oct 2023 23:38:52 +0300 (MSK)
Message-ID: <57485341-5875-dca2-801c-59edacbbefab@tls.msk.ru>
Date: Mon, 2 Oct 2023 23:38:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] MAINTAINERS: Add section for overall sensors
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, qemu-devel@nongnu.org
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230220110235.24472-1-philmd@linaro.org>
 <3d754a9a-a854-f71f-e5e8-c133d23a3cd9@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <3d754a9a-a854-f71f-e5e8-c133d23a3cd9@redhat.com>
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
X-List-Received-Date: Mon, 02 Oct 2023 20:38:58 -0000

02.10.2023 21:26, Thomas Huth :
> On 20/02/2023 12.02, Philippe Mathieu-Daudé wrote:
>> Sensor devices depend on some bus, not a particular board.
>> While merged for a particular board, sensor devices don't
>> depend on it. They depend on a bus technology, and can be
>> used by any board exposing such bus.

Heck. That's a blast from the past.  Applied to trivial-patches :)

/mjt

