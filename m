Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cJeKe-0007IO-3N
	for mharc-qemu-trivial@gnu.org; Wed, 21 Dec 2016 05:41:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45389)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1cJeKc-0007HX-Hr
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2016 05:41:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <marcel@redhat.com>) id 1cJeKb-0003UD-T4
	for qemu-trivial@nongnu.org; Wed, 21 Dec 2016 05:41:10 -0500
Received: from mx1.redhat.com ([209.132.183.28]:38442)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <marcel@redhat.com>)
	id 1cJeKW-0003Qz-75; Wed, 21 Dec 2016 05:41:04 -0500
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 152F243A5D;
	Wed, 21 Dec 2016 10:41:02 +0000 (UTC)
Received: from [10.35.203.98] (vpn-203-98.tlv.redhat.com [10.35.203.98])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id uBLAex6K018093; Wed, 21 Dec 2016 05:41:00 -0500
To: Cao jin <caoj.fnst@cn.fujitsu.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
References: <1478833368-25917-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<585A2156.6000700@cn.fujitsu.com>
Cc: mst@redhat.com
From: Marcel Apfelbaum <marcel@redhat.com>
Message-ID: <de55d157-d5a3-e6a9-e079-b89cea3ed754@redhat.com>
Date: Wed, 21 Dec 2016 12:40:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.1.1
MIME-Version: 1.0
In-Reply-To: <585A2156.6000700@cn.fujitsu.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.30]);
	Wed, 21 Dec 2016 10:41:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] pcie: fix typo in
 comments
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Dec 2016 10:41:11 -0000

On 12/21/2016 08:29 AM, Cao jin wrote:
> ping
>

No need for an r-b for this patch ,Michael or the qemu-trivial maintainer will take that.

Thanks,
Marce;

> On 11/11/2016 11:02 AM, Cao jin wrote:
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>>  hw/pci/pcie.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
>> index 99cfb45..39b10b8 100644
>> --- a/hw/pci/pcie.c
>> +++ b/hw/pci/pcie.c
>> @@ -656,7 +656,7 @@ static void pcie_ext_cap_set_next(PCIDevice *dev, uint16_t pos, uint16_t next)
>>  }
>>
>>  /*
>> - * caller must supply valid (offset, size) * such that the range shouldn't
>> + * Caller must supply valid (offset, size) such that the range wouldn't
>>   * overlap with other capability or other registers.
>>   * This function doesn't check it.
>>   */
>>
>


