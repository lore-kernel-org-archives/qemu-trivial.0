Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XhCa7-0005XI-5q
	for mharc-qemu-trivial@gnu.org; Thu, 23 Oct 2014 03:13:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38148)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1XhCa0-0005Tm-VH
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 03:13:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mreitz@redhat.com>) id 1XhCZw-00049s-4b
	for qemu-trivial@nongnu.org; Thu, 23 Oct 2014 03:13:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:6685)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mreitz@redhat.com>)
	id 1XhCZv-00049o-Sm; Thu, 23 Oct 2014 03:13:00 -0400
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s9N7CwKG026638
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Thu, 23 Oct 2014 03:12:59 -0400
Received: from dresden.str.redhat.com (dhcp-192-247.str.redhat.com
	[10.33.192.247])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s9N7CrVY007830
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NO);
	Thu, 23 Oct 2014 03:12:54 -0400
Message-ID: <5448AA75.4000902@redhat.com>
Date: Thu, 23 Oct 2014 09:12:53 +0200
From: Max Reitz <mreitz@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>
References: <201410211604116199416@sangfor.com> <5446265E.306@redhat.com>
	<54482D38.5080904@redhat.com>
	<20141023070325.GA3522@noname.redhat.com>
In-Reply-To: <20141023070325.GA3522@noname.redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, Zhang Haoyu <zhanghy@sangfor.com>,
	qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] snapshot: use local
 variable to bdrv_pwrite_sync L1 table
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
X-List-Received-Date: Thu, 23 Oct 2014 07:13:09 -0000

On 2014-10-23 at 09:03, Kevin Wolf wrote:
> Am 23.10.2014 um 00:18 hat Eric Blake geschrieben:
>> On 10/21/2014 03:24 AM, Max Reitz wrote:
>>> On 2014-10-21 at 10:04, Zhang Haoyu wrote:
>>>> Use local variable to bdrv_pwrite_sync L1 table,
>>>> needless to make conversion of cached L1 table between
>>>> big-endian and host style.
>>>>
>>>> Signed-off-by: Zhang Haoyu <zhanghy@sangfor.com>
>>>> ---
>>>>    block/qcow2-refcount.c | 22 +++++++---------------
>>>>    1 file changed, 7 insertions(+), 15 deletions(-)
>>>>
>> I know we're up to v5 and that Max already took it into his branch, but...
>>
>>
>>>>        l1_size2 = l1_size * sizeof(uint64_t);
>>>> +    l1_table = g_try_malloc0(align_offset(l1_size2, 512));
>>> I wanted to propose using qemu_try_blockalign(), but since it'd require
>>> a memset() afterwards, it gets rather ugly.
>> Not after this recent patch:
>>
>> https://lists.gnu.org/archive/html/qemu-devel/2014-10/msg02499.html
> We can switch to qemu_try_blockalign0() in a follow-up patch.
>
> But this is far from being a fast path, so there is very little to gain
> anyway.

We don't need the 0 variant anyway. In v5, the one I applied, it's just 
qemu_try_blockalign(). The size does not have to be aligned to 
BDRV_SECTOR_SIZE, since any access index is below l1_size and only 
bdrv_pread() and bdrv_pwrite() are used, so we can first omit the 
align_offset(). Second, all the rest (0 .. l1_size - 1) is overwritten 
either by memcpy() or bdrv_pread(). Therefore, no 0-ing required and 
qemu_try_blockalign() was fine.

There are things we can do in follow-up patches to optimize v5 (getting 
read of the memcpy()s), but as Kevin said (and myself before that in 
reply to v5), this function is not performance-critical, so there's no 
real point in doing so (other than "Clearly unoptimized code makes my 
fingers twitch").

Max

