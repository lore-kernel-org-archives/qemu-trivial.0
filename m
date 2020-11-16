Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kecSY-0007Gc-H1
	for mharc-qemu-trivial@gnu.org; Mon, 16 Nov 2020 06:14:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kecSW-0007Ej-5d; Mon, 16 Nov 2020 06:14:08 -0500
Received: from szxga07-in.huawei.com ([45.249.212.35]:2150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kecST-0003Du-Fd; Mon, 16 Nov 2020 06:14:07 -0500
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CZRK80JzPz6xdt;
 Mon, 16 Nov 2020 19:13:48 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Mon, 16 Nov 2020 19:13:59 +0800
Message-ID: <5FB25EF7.7060601@huawei.com>
Date: Mon, 16 Nov 2020 19:13:59 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: <stefanha@redhat.com>, <marcandre.lureau@redhat.com>, Raphael Norwitz
 <raphael.norwitz@nutanix.com>, QEMU <qemu-devel@nongnu.org>, QEMU Trivial
 <qemu-trivial@nongnu.org>
Subject: Re: [PATCH] contrib/libvhost-user: Fix bad printf format specifiers
References: <5FA28106.6000901@huawei.com> <5FB1E074.50205@huawei.com>
 <20201116045218-mutt-send-email-mst@kernel.org>
In-Reply-To: <20201116045218-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=alex.chen@huawei.com;
 helo=szxga07-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 04:22:43
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
X-List-Received-Date: Mon, 16 Nov 2020 11:14:08 -0000

On 2020/11/16 17:52, Michael S. Tsirkin wrote:
> It's in the latest pull weren't you Cc'd?
> 

This is my fault, I see this patch in the latest pull. thank you!!!

Thanks,
Alex

> On Mon, Nov 16, 2020 at 10:14:12AM +0800, Alex Chen wrote:
>> Kindly ping...
>>
>> On 2020/11/4 18:23, AlexChen wrote:
>>> We should use printf format specifier "%u" instead of "%d" for
>>> argument of type "unsigned int".


