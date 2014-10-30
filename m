Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xjl0E-0007bU-24
	for mharc-qemu-trivial@gnu.org; Thu, 30 Oct 2014 04:22:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47285)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xjl07-0007SG-Nw
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 04:22:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1Xjl02-00013n-U1
	for qemu-trivial@nongnu.org; Thu, 30 Oct 2014 04:22:35 -0400
Received: from szxga01-in.huawei.com ([119.145.14.64]:30898)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1Xjkzs-00012K-Hl; Thu, 30 Oct 2014 04:22:21 -0400
Received: from 172.24.2.119 (EHLO szxeml459-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CDQ81481; Thu, 30 Oct 2014 16:22:14 +0800 (CST)
Received: from [127.0.0.1] (10.177.22.69) by szxeml459-hub.china.huawei.com
	(10.82.67.202) with Microsoft SMTP Server id 14.3.158.1;
	Thu, 30 Oct 2014 16:22:04 +0800
Message-ID: <5451F52A.7050305@huawei.com>
Date: Thu, 30 Oct 2014 16:22:02 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: "mjt@tls.msk.ru" <mjt@tls.msk.ru>
References: <1413535838-11000-1-git-send-email-zhang.zhanghailiang@huawei.com>	<5440DB35.9020507@huawei.com>	<54484C88.3070305@huawei.com>	<544E12FB.6070904@huawei.com>
	<20141027084659.13cbdf8a@redhat.com>
In-Reply-To: <20141027084659.13cbdf8a@redhat.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, Gonglei <arei.gonglei@huawei.com>,
	imammedo@redhat.com, pbonzini@redhat.com,
	Luiz Capitulino <lcapitulino@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v6] numa: make 'info numa'
 take into account hotplugged memory
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Thu, 30 Oct 2014 08:22:40 -0000

Hi Michael,

Can you help applying this patch to -trivial branch?
It has been reviewed, and it mainly fix bug for hmp command of 'info numa'.
Which i don't know if it should go qemu-stable, for this is not a blocker.

Maybe go trivial branch is a better choice.

Thanks,
zhanghailiang

On 2014/10/27 20:46, Luiz Capitulino wrote:
> On Mon, 27 Oct 2014 17:40:11 +0800
> zhanghailiang <zhang.zhanghailiang@huawei.com> wrote:
>
>> Hi Luiz,
>>
>> Can you apply this to your qmp branch?
>> It has been reviewd;)
>
> I can, but I don't have bandwidth for another pull request for v2.2 unless
> it's a fix for a blocker. This means you have two options, wait for v2.3
> or find another tree to merge this.
>
>>
>> Thanks,
>> zhanghailiang
>>
>> On 2014/10/23 8:32, zhanghailiang wrote:
>>> Hi,
>>>
>>> Ping...
>>> This patch has been reviewed, please pick up, Thanks.
>>>
>>> Best Regargs,
>>> zhanghailiang
>>>
>>> On 2014/10/17 17:02, Gonglei wrote:
>>>> On 2014/10/17 16:50, zhanghailiang wrote:
>>>>
>>>>> When do memory hotplug, if there is numa node, we should add
>>>>> the memory size to the corresponding node memory size.
>>>>>
>>>>> For now, it mainly affects the result of hmp command "info numa".
>>>>>
>>>>> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
>>>>> Signed-off-by: zhanghailiang <zhang.zhanghailiang@huawei.com>
>>>>> ---
>>>>>    v6:
>>>>> - remove unnecessary 'di' variable (GongLei)
>>>>>    v5:
>>>>> - reword the subject (Igor Mammedov)
>>>>> - turn query_numa_node_mem to void (Igor Mammedov)
>>>>>    v4:
>>>>> - s/pc_dimm_stat_node_mem/numa_stat_memory_devices/ (Igor Mammedov)
>>>>> - rewrite numa_stat_memory_devices and this will also fix compile error for
>>>>>     targets that don't support memory hotplug
>>>>>    v3:
>>>>> - cold-plugged memory should not be excluded (Igor Mammedov)
>>>>>    v2:
>>>>> - Don't modify the numa_info.node_mem directly when treating hotplug memory,
>>>>>     fix the "info numa" instead (Igor Mammedov)
>>>>>
>>>>> Thanks for review!;)
>>>>> ---
>>>>>
>>>>>    include/sysemu/sysemu.h |  1 +
>>>>>    monitor.c               |  6 +++++-
>>>>>    numa.c                  | 38 ++++++++++++++++++++++++++++++++++++++
>>>>>    3 files changed, 44 insertions(+), 1 deletion(-)
>>>>>
>>>>
>>>> Reviewed-by: Gonglei <arei.gonglei@huawei.com>
>>>>
>>>> Best regards,
>>>> -Gonglei
>>>>
>>>>
>>>> .
>>>>
>>>
>>>
>>>
>>>
>>>
>>
>>
>
>
> .
>



