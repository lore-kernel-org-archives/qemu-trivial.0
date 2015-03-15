Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YX5iN-0006bE-6E
	for mharc-qemu-trivial@gnu.org; Sun, 15 Mar 2015 06:24:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41311)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YX5iL-0006YG-0t
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 06:24:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1YX5iK-0003dM-3m
	for qemu-trivial@nongnu.org; Sun, 15 Mar 2015 06:24:08 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:46036)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1YX5iF-0003H3-PW; Sun, 15 Mar 2015 06:24:03 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id DD5F241A89;
	Sun, 15 Mar 2015 13:23:54 +0300 (MSK)
Message-ID: <55055DBA.9040804@msgid.tls.msk.ru>
Date: Sun, 15 Mar 2015 13:23:54 +0300
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.5.0
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Weil <sw@weilnetz.de>, 
	Shannon Zhao <zhaoshenglong@huawei.com>, qemu-devel@nongnu.org
References: <1426326454-7216-1-git-send-email-zhaoshenglong@huawei.com>
	<55040865.8050908@weilnetz.de> <55054F1D.2080408@redhat.com>
In-Reply-To: <55054F1D.2080408@redhat.com>
OpenPGP: id=804465C5
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org, hangaohuai@huawei.com,
	peter.huangpeng@huawei.com, shannon.zhao@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] hw/bt/sdp: Fix resource leak detect by
	coverity
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
X-List-Received-Date: Sun, 15 Mar 2015 10:24:10 -0000

15.03.2015 12:21, Paolo Bonzini wrote:
> On 14/03/2015 11:07, Stefan Weil wrote:
>>
>> This fixes the memory leak, but I still don't understand what is done here.
>> data is allocated, then filled with values, now it is also deallocated.
>> But I'm missing the part where all those data is used.
> 
> "data" escapes in record->attribute_list[record->attributes].pair.
> 
> The bug is in bt_l2cap_sdp_close_ch which does an invalid free every
> time it frees the first sdp->service_list[i].attribute_list->pair (but
> the qsort could have moved it elsewhere in the list).  The right fix is
> to do a separate malloc for each attribute, instead of a single one.

Or, alternatively, to keep this `data' pointer in sdp to use it in
bt_l2cap_sdp_close_ch().

> In any case, it seems simpler to just leave this code aside.

How many times this code is called?

We have many many places in qemu where resources are allocated once
at startup and never freed just because there's no need to.

Thanks,

/mjt

