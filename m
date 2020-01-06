Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1ioO3B-0006JI-KG
	for mharc-qemu-trivial@gnu.org; Mon, 06 Jan 2020 03:47:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49246)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pannengyuan@huawei.com>) id 1ioIOx-0001Vm-RY
 for qemu-trivial@nongnu.org; Sun, 05 Jan 2020 21:45:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pannengyuan@huawei.com>) id 1ioIOw-0005Om-RR
 for qemu-trivial@nongnu.org; Sun, 05 Jan 2020 21:45:55 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2228 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pannengyuan@huawei.com>)
 id 1ioIOs-0005KF-2d; Sun, 05 Jan 2020 21:45:50 -0500
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 72904C0902ADA7E3453A;
 Mon,  6 Jan 2020 10:45:44 +0800 (CST)
Received: from [10.184.39.213] (10.184.39.213) by smtp.huawei.com
 (10.3.19.205) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 6 Jan 2020
 10:45:34 +0800
Subject: Re: [PATCH] arm/translate-a64: fix uninitialized variable warning
To: Richard Henderson <richard.henderson@linaro.org>,
 <peter.maydell@linaro.org>
CC: <zhang.zhanghailiang@huawei.com>, <qemu-trivial@nongnu.org>,
 <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, Euler Robot
 <euler.robot@huawei.com>
References: <20200106015700.52992-1-pannengyuan@huawei.com>
 <69ee9eb1-84bf-5bcc-738c-c75dd520cbf2@linaro.org>
From: Pan Nengyuan <pannengyuan@huawei.com>
Message-ID: <4dfe7a32-80f7-bd57-edc0-3105e8f08dce@huawei.com>
Date: Mon, 6 Jan 2020 10:45:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <69ee9eb1-84bf-5bcc-738c-c75dd520cbf2@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.184.39.213]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
X-Mailman-Approved-At: Mon, 06 Jan 2020 03:47:48 -0500
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
X-List-Received-Date: Mon, 06 Jan 2020 02:45:57 -0000



On 1/6/2020 10:15 AM, Richard Henderson wrote:
> On 1/6/20 11:57 AM, pannengyuan@huawei.com wrote:
>> From: Pan Nengyuan <pannengyuan@huawei.com>
>>
>> Fixes:
>> target/arm/translate-a64.c: In function 'disas_crypto_three_reg_sha512':
>> target/arm/translate-a64.c:13625:9: error: 'genfn' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>     genfn(tcg_rd_ptr, tcg_rn_ptr, tcg_rm_ptr);
>>     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> qemu/target/arm/translate-a64.c:13609:8: error: 'feature' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>>     if (!feature) {
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Pan Nengyuan <pannengyuan@huawei.com>
>> Cc: Peter Maydell <peter.maydell@linaro.org> 
> 
> Are you compiling with reduced optimization?  The compiler should be able to
> prove that these variables are initialized.  It certainly does with -O2, on all
> known gcc versions.

Yes, I compile it with optimization flags (-O2) and get this warnings. The gcc version is 8.2.1.

> 
> Perhaps a better fix is to add a
> 
>     default:
>         g_assert_not_reached();
> 
> entry to the o == 0 switch.  Though of course opcode must be in [0-3], based on
> the extraction mask, so a default label isn't actually reachable.  But that's
> the only path I can see for which incomplete optimization would fail to prove
> initializatio
Yes, a default label is a better way.

> 
> r~
> 

