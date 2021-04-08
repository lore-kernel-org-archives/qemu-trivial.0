Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lUUzf-00019N-Ge
	for mharc-qemu-trivial@gnu.org; Thu, 08 Apr 2021 09:46:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lUUzV-000131-PI; Thu, 08 Apr 2021 09:46:40 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhukeqian1@huawei.com>)
 id 1lUUzN-0007Sx-7r; Thu, 08 Apr 2021 09:46:37 -0400
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGMtT4rmZz1BFhj;
 Thu,  8 Apr 2021 21:44:01 +0800 (CST)
Received: from [10.174.184.42] (10.174.184.42) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.498.0; Thu, 8 Apr 2021 21:46:09 +0800
Subject: Re: [PATCH 0/3] hw: Constify VMStateDescription
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 <qemu-devel@nongnu.org>
References: <20210313171150.2122409-1-f4bug@amsat.org>
 <bd47e690-dab6-e8db-2d8c-aa729c41abad@huawei.com>
 <4b8eca8f-fad2-1adf-6997-686803dfa723@amsat.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Rob Herring <robh@kernel.org>,
 <qemu-trivial@nongnu.org>, <qemu-arm@nongnu.org>, Gerd Hoffmann
 <kraxel@redhat.com>
From: Keqian Zhu <zhukeqian1@huawei.com>
Message-ID: <07edbe0e-37ad-d262-6f9f-d058a2f3e3a8@huawei.com>
Date: Thu, 8 Apr 2021 21:46:09 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <4b8eca8f-fad2-1adf-6997-686803dfa723@amsat.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.184.42]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190;
 envelope-from=zhukeqian1@huawei.com; helo=szxga04-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 08 Apr 2021 13:46:42 -0000



On 2021/4/8 21:22, Philippe Mathieu-Daudé wrote:
> On 3/15/21 10:05 AM, Keqian Zhu wrote:
>> Hi Philippe,
>>
>> It seems that vmstate_ecc_state and vmstate_x86_cpu can also be constified.
>> Found by <git grep "VMStateDescription" | grep -v "const">.
> 
> Correct (I only searched for the static ones).
> 
> Do you mind sending a patch?
OK, I'll do. :)

BRs,
Keqian

> 
>>
>> Thanks,
>> Keqian
>>
>> On 2021/3/14 1:11, Philippe Mathieu-Daudé wrote:
>>> VMStateDescription isn't supposed to be modified.
> .
> 

