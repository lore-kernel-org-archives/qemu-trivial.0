Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kmdQg-0001Rj-Mi
	for mharc-qemu-trivial@gnu.org; Tue, 08 Dec 2020 08:53:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kmdQd-0001Oj-Rz; Tue, 08 Dec 2020 08:53:19 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kmdQZ-0003id-PW; Tue, 08 Dec 2020 08:53:19 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Cr1p828lKz735D;
 Tue,  8 Dec 2020 21:52:32 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Tue, 8 Dec 2020 21:52:56 +0800
Message-ID: <5FCF8538.1050705@huawei.com>
Date: Tue, 8 Dec 2020 21:52:56 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: "zhouyang (T)" <zhouyang789@huawei.com>
CC: <alex.bennee@linaro.org>, <qemu-devel@nongnu.org>, <hunongda@huawei.com>, 
 <qemu-trivial@nongnu.org>
Subject: Re: [PATCH 1/5] contrib: Don't use '#' flag of printf format
References: <20201208122134.3308101-1-zhouyang789@huawei.com>
 <20201208122134.3308101-2-zhouyang789@huawei.com>
In-Reply-To: <20201208122134.3308101-2-zhouyang789@huawei.com>
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=alex.chen@huawei.com;
 helo=szxga07-in.huawei.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PYZOR_CHECK=1.392, RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
X-List-Received-Date: Tue, 08 Dec 2020 13:53:20 -0000


