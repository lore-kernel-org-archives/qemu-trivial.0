Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1qg7LE-0005N4-4y
	for mharc-qemu-trivial@gnu.org; Tue, 12 Sep 2023 13:38:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qg7L9-0005MK-NR; Tue, 12 Sep 2023 13:38:19 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1qg7L6-0002nK-45; Tue, 12 Sep 2023 13:38:19 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 4656121354;
 Tue, 12 Sep 2023 20:38:15 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id DC4192795C;
 Tue, 12 Sep 2023 20:38:10 +0300 (MSK)
Message-ID: <2c3675bf-1bae-8100-3453-c6a5e1265baa@tls.msk.ru>
Date: Tue, 12 Sep 2023 20:38:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 5/7] hw/pci: spelling fixes
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20230909131258.354675-1-mjt@tls.msk.ru>
 <20230909131258.354675-6-mjt@tls.msk.ru>
 <CAFEAcA8Q3x-k_swFaFvkEMhYSAoSnb7ga6ijBhXMBkGYpX-B3Q@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <CAFEAcA8Q3x-k_swFaFvkEMhYSAoSnb7ga6ijBhXMBkGYpX-B3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -83
X-Spam_score: -8.4
X-Spam_bar: --------
X-Spam_report: (-8.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.473,
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
X-List-Received-Date: Tue, 12 Sep 2023 17:38:20 -0000

11.09.2023 18:37, Peter Maydell wrote:
> On Sat, 9 Sept 2023 at 14:18, Michael Tokarev <mjt@tls.msk.ru> wrote:

>> -     * We initially place MSI interrupt I/O region a adress 0 and
>> +     * We initially place MSI interrupt I/O region a address 0 and
> 
> "at address 0"

>> -             * Resources defined for PXBs are composed by the folling parts:
>> +             * Resources defined for PXBs are composed by the following parts:
> 
> Should be "composed of", while we're editing the line.

Heh. That's something I was able to notice but didn't.

Thank you very much Peter for the review!

/mjt

