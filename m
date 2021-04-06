Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lTi0T-0008PD-KT
	for mharc-qemu-trivial@gnu.org; Tue, 06 Apr 2021 05:28:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1lTi0R-0008Nk-8v; Tue, 06 Apr 2021 05:28:19 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:33068
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>)
 id 1lTi0O-0005P8-MC; Tue, 06 Apr 2021 05:28:18 -0400
Received: from macbook02.fritz.box (p5b1511bf.dip0.t-ipconnect.de
 [91.21.17.191])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 53201DA0491;
 Tue,  6 Apr 2021 11:28:12 +0200 (CEST)
To: Bin Meng <bmeng.cn@gmail.com>, Peter Maydell <peter.maydell@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 QEMU Trivial <qemu-trivial@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Alistair Francis <alistair23@gmail.com>
References: <20210326062140.367861-1-bmeng.cn@gmail.com>
 <CAEUhbmW-RaG-yy_YmL_cFQ-vUS=9_Mw3CmvBCTrkTAiKi8Y2TA@mail.gmail.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH] nsis: Install *.elf images
Message-ID: <ce9214bb-d68b-defe-8af1-84373727b396@weilnetz.de>
Date: Tue, 6 Apr 2021 11:28:09 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <CAEUhbmW-RaG-yy_YmL_cFQ-vUS=9_Mw3CmvBCTrkTAiKi8Y2TA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
X-List-Received-Date: Tue, 06 Apr 2021 09:28:19 -0000

Am 06.04.21 um 11:04 schrieb Bin Meng:

> On Fri, Mar 26, 2021 at 2:22 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>> As of today, the QEMU Windows installer does not include the
>> following two RISC-V BIOS images:
>>
>> - opensbi-riscv64-generic-fw_dynamic.elf
>> - opensbi-riscv32-generic-fw_dynamic.elf
>>
>> Update the installer script to include them.
>>
>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>>
>> ---
>> Based on:
>> https://repo.or.cz/qemu/ar7.git/commit/657a6a90b69da971afdc71501c30275=
ba307ff6c
>>
>> The above commit does not land on QEMU master. I am not sure what
>> the process is, sending it here for comments.
>>
>>   qemu.nsi | 2 ++
>>   1 file changed, 2 insertions(+)
> Ping?


Reviewed-by: Stefan Weil <sw@weilnetz.de>

This is a small uncritical fix which can be merged via QEMU trivial.

As Philippe already mentioned, a more advanced solution would only=20
install the required binaries, but typically the NSIS installer is built =

with all system emulations, so it requires all available blobs.=20
Thererfore the current solution is fine for now.

Regards,

Stefan




