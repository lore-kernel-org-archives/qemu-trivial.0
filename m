Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kUhgM-0001hG-LT
	for mharc-qemu-trivial@gnu.org; Mon, 19 Oct 2020 22:47:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kUhgL-0001h5-0M; Mon, 19 Oct 2020 22:47:25 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:43740 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yubihong@huawei.com>)
 id 1kUhgJ-0004zt-Ao; Mon, 19 Oct 2020 22:47:24 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id D89C83BD802CD6179BF5;
 Tue, 20 Oct 2020 10:47:17 +0800 (CST)
Received: from [10.174.186.14] (10.174.186.14) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Tue, 20 Oct 2020 10:47:08 +0800
Subject: Re: [PATCH v2 3/8] migration: Add spaces around operator
To: Markus Armbruster <armbru@redhat.com>
CC: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, <alex.chen@huawei.com>,
 <quintela@redhat.com>, <qemu-trivial@nongnu.org>, <qemu-devel@nongnu.org>,
 <zhengchuan@huawei.com>, <wanghao232@huawei.com>
References: <1602508140-11372-1-git-send-email-yubihong@huawei.com>
 <1602508140-11372-4-git-send-email-yubihong@huawei.com>
 <20201013101003.GC2920@work-vm> <87a6wi1v4b.fsf@dusky.pond.sub.org>
 <90d55347-0f39-1ac7-f1a1-3982684b2213@huawei.com>
 <87h7qq4ea4.fsf@dusky.pond.sub.org>
From: Bihong Yu <yubihong@huawei.com>
Message-ID: <ae334678-2b9d-0fa7-4b9a-f06a29be9477@huawei.com>
Date: Tue, 20 Oct 2020 10:47:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <87h7qq4ea4.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.186.14]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.35; envelope-from=yubihong@huawei.com;
 helo=huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 22:24:46
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Tue, 20 Oct 2020 02:47:25 -0000

OK, I will change it to "VMStateDescription *[]". Thank you for your review.

On 2020/10/19 19:59, Markus Armbruster wrote:
> Bihong Yu <yubihong@huawei.com> writes:
> 
>> Yes, I used to think "const VMStateDescription *[]" was right, but when I search
>> similar expressions, most of all are "xxx * []". Such as:
>> fsdev/qemu-fsdev.c:54:        .opts = (const char * [])
>> hw/intc/s390_flic_kvm.c:567:    .subsections = (const VMStateDescription * [])
>> ...
> 
> All three variations occur in the code: no space, space on both sides,
> space only on the left.
> 
>> So, I keep the same style. Should I change it to "const VMStateDescription *[]"?
> 
> Dropping the change to savevm.c should be fine.
> 
> Changing it to "VMStateDescription *[]" should be also fine.
> 
> I figure you can keep David's R-by in both cases.
> 
> [...]
> 
> .
> 

