Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1buElG-0002yQ-CM
	for mharc-qemu-trivial@gnu.org; Wed, 12 Oct 2016 04:19:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54610)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1buElC-0002wj-29
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 04:19:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1buEl9-00020q-Uk
	for qemu-trivial@nongnu.org; Wed, 12 Oct 2016 04:19:32 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55116)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1buEl3-0001zS-HO; Wed, 12 Oct 2016 04:19:25 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 13CF3A794;
	Wed, 12 Oct 2016 08:19:25 +0000 (UTC)
Received: from [10.36.112.55] (ovpn-112-55.ams2.redhat.com [10.36.112.55])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u9C8JKID019562
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 12 Oct 2016 04:19:22 -0400
To: "Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Michael Tokarev <mjt@tls.msk.ru>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <1476237901-85376-1-git-send-email-arei.gonglei@huawei.com>
	<14f4caf5-3884-bd5a-0f91-b206d578aa76@msgid.tls.msk.ru>
	<33183CC9F5247A488A2544077AF19020B03F1A53@SZXEMA503-MBS.china.huawei.com>
	<76eac1cd-4005-417c-8700-430b4cf295c2@redhat.com>
	<33183CC9F5247A488A2544077AF19020B03F1A7B@SZXEMA503-MBS.china.huawei.com>
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"Herongguang (Stephen)" <herongguang.he@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ec290e8d-0f97-9a58-b453-caff08d86845@redhat.com>
Date: Wed, 12 Oct 2016 10:19:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <33183CC9F5247A488A2544077AF19020B03F1A7B@SZXEMA503-MBS.china.huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.29]);
	Wed, 12 Oct 2016 08:19:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] mmap-alloc: check before use for ptr
 pointer
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
X-List-Received-Date: Wed, 12 Oct 2016 08:19:35 -0000



On 12/10/2016 09:54, Gonglei (Arei) wrote:
> 
>> -----Original Message-----
>> From: Paolo Bonzini [mailto:paolo.bonzini@gmail.com] On Behalf Of Paolo
>> Bonzini
>> Sent: Wednesday, October 12, 2016 3:41 PM
>> To: Gonglei (Arei); Michael Tokarev; qemu-devel@nongnu.org
>> Cc: qemu-trivial@nongnu.org; Herongguang (Stephen)
>> Subject: Re: [PATCH] mmap-alloc: check before use for ptr pointer
>>
>>
>>
>> On 12/10/2016 09:37, Gonglei (Arei) wrote:
>>>> -----Original Message-----
>>>> From: Michael Tokarev [mailto:mjt@tls.msk.ru]
>>>> Sent: Wednesday, October 12, 2016 2:46 PM
>>>> Subject: Re: [PATCH] mmap-alloc: check before use for ptr pointer
>>>>
>>>> 12.10.2016 05:05, Gonglei wrote:
>>>>> If ptr mmap failed, we don't need to do a superfluous
>>>>> calculation for offset variable by ptr (MAP_FAILED).
>>>>
>>>> What's the point?  There's no problem in extra calculation
>>>> if mmap failed, yes, but do we really care?  As of it is now,
>>>> it is more compact and readable, and works.  I think.
>>>>
>>>
>>> I just think it's more reasonable because the ptr is checked after
>>> used. Why do we need a extra calculation?
>>
>> Another reasonable objection (that however your patch doesn't fix) is
>> that align is being used before the assertion:
>>
>>      assert(!(align & (align - 1)));
>>
> 
> Eh, align is used at the beginning of the qemu_ram_mmap()  ;)

Yes, but the assertion is there because align is passed to QEMU_ALIGN_UP.

Paolo

