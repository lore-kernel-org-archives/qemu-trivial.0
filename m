Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xy9wO-0006Si-4W
	for mharc-qemu-trivial@gnu.org; Mon, 08 Dec 2014 20:50:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47083)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xy9wH-0006Gt-EA
	for qemu-trivial@nongnu.org; Mon, 08 Dec 2014 20:50:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1Xy9wC-000352-DL
	for qemu-trivial@nongnu.org; Mon, 08 Dec 2014 20:50:09 -0500
Received: from szxga01-in.huawei.com ([119.145.14.64]:52319)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1Xy9w2-0002kc-7Z; Mon, 08 Dec 2014 20:49:54 -0500
Received: from 172.24.2.119 (EHLO szxeml422-hub.china.huawei.com)
	([172.24.2.119])
	by szxrg01-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CFU36590; Tue, 09 Dec 2014 09:49:41 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by szxeml422-hub.china.huawei.com
	(10.82.67.161) with Microsoft SMTP Server id 14.3.158.1; Tue, 9 Dec 2014
	09:49:39 +0800
Message-ID: <5486552C.9020503@huawei.com>
Date: Tue, 9 Dec 2014 09:49:32 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
References: <1418039322-7892-1-git-send-email-arei.gonglei@huawei.com>
	<87wq626tq8.fsf@blackfin.pond.sub.org>
In-Reply-To: <87wq626tq8.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.64
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"mst@redhat.com" <mst@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] virtio: remove useless
	virtio_net_init define
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
X-List-Received-Date: Tue, 09 Dec 2014 01:50:14 -0000

On 2014/12/8 23:34, Markus Armbruster wrote:

> <arei.gonglei@huawei.com> writes:
> 
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> commit 1773d9ee (virtio-net: cleanup: init and exit function)
>> had removed realization of virtio_net_init(), but didn't remove
>> the define of head file. Let's remove it.
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> 
> I get what you mean by "realization", but the technical term is
> definition, and the thing you remove is a declaration.
> 

Thanks for your point. :)

> Suggest
> 
>     virtio: remove useless declaration of virtio_net_init()
> 
>     Commit 1773d9ee (virtio-net: cleanup: init and exit function)
>     removed the definition of virtio_net_init(), but didn't remove its
>     declaration in the header.  Clean that up.

OK, will do.

Regards,
-Gonglei


