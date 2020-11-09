Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kc2QL-0008ER-2q
	for mharc-qemu-trivial@gnu.org; Mon, 09 Nov 2020 03:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kc2QI-0008Dy-S1; Mon, 09 Nov 2020 03:21:11 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kc2QF-0005yl-0g; Mon, 09 Nov 2020 03:21:10 -0500
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CV3pr01Hpz15Sn4;
 Mon,  9 Nov 2020 16:20:52 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Mon, 9 Nov 2020 16:20:52 +0800
Message-ID: <5FA8FBE4.7000504@huawei.com>
Date: Mon, 9 Nov 2020 16:20:52 +0800
From: AlexChen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>
CC: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, Michael Tokarev
 <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>, QEMU Trivial
 <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>,
 <zhang.zhanghailiang@huawei.com>
Subject: Re: [PATCH V2 1/2] plugins: Fix resource leak in connect_socket()
References: <5FA4AE11.6060701@huawei.com>
 <37c069f2-b137-b68d-9fb5-45a98b84aa0c@redhat.com>
In-Reply-To: <37c069f2-b137-b68d-9fb5-45a98b84aa0c@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 03:21:00
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
X-List-Received-Date: Mon, 09 Nov 2020 08:21:11 -0000

On 2020/11/6 21:17, Eric Blake wrote:
> On 11/5/20 7:59 PM, AlexChen wrote:
>> Close the fd when the connect() fails.
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Alex Chen <alex.chen@huawei.com>
> 
> Your From: line ("AlexChen") is spelled differently than your S-o-b:
> line ("Alex Chen").  While this is not fatal to the patch, it is
> confusing, so you may want to update your git settings to produce mail
> spelled in the same manner as the S-o-b.
> 

Hi Eric,

Thanks for you suggestion, I will modify the user.name of git to "Alex Chen".

> Also, although you did manage to send a 0/2 letter, you did not thread
> things:
> 0/2 Message-ID: <5FA4AE0B.1000007@huawei.com>
> 1/2 Message-ID: Message-ID: <5FA4AE11.6060701@huawei.com>, but no
> In-Reply-To: or References: headers, which means it is a new top-level
> thread.  You may want to figure out why your mail setup is not
> preserving threading.
> 

This may be my email settings is wrong, I try to modify the setting and send a patch v3.

Thanks,
Alex

