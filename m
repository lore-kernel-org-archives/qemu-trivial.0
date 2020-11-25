Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1khjR5-00043S-Fu
	for mharc-qemu-trivial@gnu.org; Tue, 24 Nov 2020 20:17:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1khjR3-00040S-0k; Tue, 24 Nov 2020 20:17:29 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:2463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1khjR0-0001vd-7k; Tue, 24 Nov 2020 20:17:28 -0500
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CgjfD4b7jzLtl0;
 Wed, 25 Nov 2020 09:16:52 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Wed, 25 Nov 2020 09:17:11 +0800
Message-ID: <5FBDB096.3040600@huawei.com>
Date: Wed, 25 Nov 2020 09:17:10 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
CC: zhanghailiang <zhang.zhanghailiang@huawei.com>, QEMU Trivial
 <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>, Yuval Shaia
 <yuval.shaia.ml@gmail.com>, QEMU <qemu-devel@nongnu.org>,
 <zhengchuan@huawei.com>, Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PATCH] contrib/rdmacm-mux: Fix error condition in
 hash_tbl_search_fd_by_ifid()
References: <5F9AC6FF.4000301@huawei.com>
 <CAC_L=vVg=YitEAKE+wGEmphuL8Eu87mYDiYD=UNKGhqOyd8PpQ@mail.gmail.com>
 <5FBCF8F0.9060103@huawei.com>
 <CAFEAcA985RuM96HP4mvHmU-ffAsQWv4hFFABXQ2ZW_t5Uts7vg@mail.gmail.com>
In-Reply-To: <CAFEAcA985RuM96HP4mvHmU-ffAsQWv4hFFABXQ2ZW_t5Uts7vg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.191; envelope-from=alex.chen@huawei.com;
 helo=szxga05-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 25 Nov 2020 01:17:29 -0000

On 2020/11/24 23:29, Peter Maydell wrote:
> On Tue, 24 Nov 2020 at 12:15, Alex Chen <alex.chen@huawei.com> wrote:
>>
>> Hi everyone，
>>
>> Who can help me merge this patch into the master branch? This patch may be need for qemu-5.2
> 
> This code has been like this since 2018, so this is not
> a regression in 5.2. At this point in the release cycle
> (rc3 imminent) I think it's best to just leave it until 6.0.
> 

OK, I see.

Thanks
Alex





