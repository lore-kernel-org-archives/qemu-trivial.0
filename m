Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XlCV5-0005nL-C0
	for mharc-qemu-trivial@gnu.org; Mon, 03 Nov 2014 02:56:31 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39324)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XlCUy-0005ev-GN
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 02:56:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1XlCUt-00023C-Hs
	for qemu-trivial@nongnu.org; Mon, 03 Nov 2014 02:56:24 -0500
Received: from mx1.redhat.com ([209.132.183.28]:39487)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1XlCUi-00021C-Td; Mon, 03 Nov 2014 02:56:09 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id sA37u3VN009558
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Mon, 3 Nov 2014 02:56:04 -0500
Received: from blackfin.pond.sub.org (ovpn-116-51.ams2.redhat.com
	[10.36.116.51])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id sA37u0GH019769
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 3 Nov 2014 02:56:02 -0500
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 5D41A30403B1; Mon,  3 Nov 2014 08:56:00 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1413535838-11000-1-git-send-email-zhang.zhanghailiang@huawei.com>
	<5440DB35.9020507@huawei.com> <54484C88.3070305@huawei.com>
	<544E12FB.6070904@huawei.com> <20141027084659.13cbdf8a@redhat.com>
	<5451F52A.7050305@huawei.com> <5455D735.2030202@msgid.tls.msk.ru>
Date: Mon, 03 Nov 2014 08:56:00 +0100
In-Reply-To: <5455D735.2030202@msgid.tls.msk.ru> (Michael Tokarev's message of
	"Sun, 02 Nov 2014 10:03:17 +0300")
Message-ID: <8761ew3egf.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: zhanghailiang <zhang.zhanghailiang@huawei.com>, qemu-trivial@nongnu.org,
	luonengjun@huawei.com, peter.huangpeng@huawei.com,
	qemu-devel@nongnu.org, Gonglei <arei.gonglei@huawei.com>,
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
X-List-Received-Date: Mon, 03 Nov 2014 07:56:29 -0000

Michael Tokarev <mjt@tls.msk.ru> writes:

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
> (But I don't know how various tools like coverity et al will react
> to this.  Gcc and any other C compiler should be fine).
>
> The same stands for other function prototype.
>
> I'm not sure this qualifies as -trivial really.  Yes the change
> does not affect anything but the `info' command, and is rather
> simple, but... I'm not sure.

Fortunately, monitor.c got a maintainer.  Luiz, would you be willing to
shepherd this patch?

