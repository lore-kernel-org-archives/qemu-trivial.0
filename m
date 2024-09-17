Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1sqU8b-0003yz-Aa
	for mharc-qemu-trivial@gnu.org; Tue, 17 Sep 2024 05:04:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1sqU8a-0003th-15; Tue, 17 Sep 2024 05:04:44 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1sqU6h-0001mR-5G; Tue, 17 Sep 2024 05:04:43 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id E1CB38F99C;
 Tue, 17 Sep 2024 12:02:16 +0300 (MSK)
Received: from [192.168.177.146] (mjtthink.wg.tls.msk.ru [192.168.177.146])
 by tsrv.corpit.ru (Postfix) with ESMTP id 0FFBB13DCDA;
 Tue, 17 Sep 2024 12:02:31 +0300 (MSK)
Message-ID: <eeb45c7c-7662-4731-9186-069cec320674@tls.msk.ru>
Date: Tue, 17 Sep 2024 12:02:31 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tests/unit: Really build pbkdf test on macOS
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-trivial@nongnu.org
Cc: qemu-devel@nongnu.org
References: <20240917065736.27883-1-philmd@linaro.org>
 <Zuk7tnWvKyxhJzOT@redhat.com>
Content-Language: en-US, ru-RU
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <Zuk7tnWvKyxhJzOT@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 17 Sep 2024 09:04:44 -0000

On 17.09.2024 11:20, Daniel P. Berrangé wrote:
> On Tue, Sep 17, 2024 at 08:57:36AM +0200, Philippe Mathieu-Daudé wrote:
>> Fix a typo to run the pbkdf crypto cipher tests on macOS.
>>
>>   $ make check-unit
>>     ...
>>     87/102 qemu:unit / test-crypto-pbkdf      OK      2.35s   17 subtests passed
>>
>> Fixes: ebe0302ac8 ("tests/unit: build pbkdf test on macOS")

Picked up for trivial-patches tree, thanks!

/mjt

