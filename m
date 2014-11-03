Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlGDd-0001dV-IS
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 06:54:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlGDW-0001PE-4f
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 06:54:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>) id 1XlGDQ-0001FI-09
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 06:54:38 -0500
Received: from szxga03-in.huawei.com ([119.145.14.66]:29307)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <zhang.zhanghailiang@huawei.com>)
	id 1XlGDC-0001BE-29; Mon, 03 Nov 2014 06:54:19 -0500
Received: from 172.24.2.119 (EHLO szxeml401-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg03-dlp.huawei.com (MOS 4.4.3-GA FastPath queued)
	with ESMTP id AWO26484; Mon, 03 Nov 2014 19:54:09 +0800 (CST)
Received: from [10.177.22.69] (10.177.22.69) by szxeml401-hub.china.huawei.com
	(10.82.67.31) with Microsoft SMTP Server id 14.3.158.1;
	Mon, 3 Nov 2014 19:54:01 +0800
Message-ID: <54576CD8.8070104@huawei.com>
Date: Mon, 3 Nov 2014 19:54:00 +0800
From: zhanghailiang <zhang.zhanghailiang@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1413535838-11000-1-git-send-email-zhang.zhanghailiang@huawei.com>	<5440DB35.9020507@huawei.com>	<54484C88.3070305@huawei.com>	<544E12FB.6070904@huawei.com>	<20141027084659.13cbdf8a@redhat.com>
	<5451F52A.7050305@huawei.com> <5455D735.2030202@msgid.tls.msk.ru>
In-Reply-To: <5455D735.2030202@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.22.69]
X-CFilter-Loop: Reflected
X-Mirapoint-Virus-RAPID-Raw: score=unknown(0),
	refid=str=0001.0A020206.54576CE2.0020, ss=1, re=0.001, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0, ip=0.0.0.0,
	so=2013-05-26 15:14:31, dmn=2013-03-21 17:37:32
X-Mirapoint-Loop-Id: b144affc80d15cc10eeb735a59cec538
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.66
Cc: qemu-trivial@nongnu.org, luonengjun@huawei.com, qemu-devel@nongnu.org,
	peter.huangpeng@huawei.com, Gonglei <arei.gonglei@huawei.com>,
	pbonzini@redhat.com, imammedo@redhat.com,
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
X-List-Received-Date: Mon, 03 Nov 2014 11:54:44 -0000

On 2014/11/2 15:03, Michael Tokarev wrote:
> 30.10.2014 11:22, zhanghailiang wrote:
>> Hi Michael,
>>
>> Can you help applying this patch to -trivial branch?
>> It has been reviewed, and it mainly fix bug for hmp command of 'info numa'.
>> Which i don't know if it should go qemu-stable, for this is not a blocker.
>>
>> Maybe go trivial branch is a better choice.
>
> And the original patch description is:
>
>>>>>>> When do memory hotplug, if there is numa node, we should add
>>>>>>> the memory size to the corresponding node memory size.
>>>>>>>
>>>>>>> For now, it mainly affects the result of hmp command "info numa".
>
> What does the "for now" means in this context?  Is the patch
> incpmplete somehow and we should expect more code in this
> area/theme?
>

Hmm, yes, it not exact, i should remove the confused context.

> In the patch we have:
>
> +void query_numa_node_mem(uint64_t *node_mem)
> +{
> +    int i;
> +
> +    if (nb_numa_nodes <= 0) {
> +        return;
> +    }
> +
> +    numa_stat_memory_devices(node_mem);
> +    for (i = 0; i < nb_numa_nodes; i++) {
> +        node_mem[i] += numa_info[i].node_mem;
> +    }
> +}
>
> Please note that while the node_mem is a pointer, it is used as
> an array.  In C, pointers and arrays in this context is the same
> thing, but I think it is better to make the fact that it is an
> array explicit in the function prototype, to be like this:
>
> +void query_numa_node_mem(uint64_t node_mem[])
>

Good idea;), it is more clear.

> (But I don't know how various tools like coverity et al will react
> to this.  Gcc and any other C compiler should be fine).
>

I will look into this.

> The same stands for other function prototype.
>
> I'm not sure this qualifies as -trivial really.  Yes the change
> does not affect anything but the `info' command, and is rather
> simple, but... I'm not sure.
>

Hmm, this a tangled thing.:(



