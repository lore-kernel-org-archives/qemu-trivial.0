Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XkncP-0006j4-Vm
	for mharc-qemu-trivial@gnu.org; Sun, 02 Nov 2014 01:22:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XkncJ-0006ic-9V
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:22:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>) id 1XkncE-0003b4-D2
	for qemu-trivial@nongnu.org; Sun, 02 Nov 2014 01:22:19 -0400
Received: from szxga02-in.huawei.com ([119.145.14.65]:37021)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <arei.gonglei@huawei.com>)
	id 1XkncD-0003TS-NP; Sun, 02 Nov 2014 01:22:14 -0400
Received: from 172.24.2.119 (EHLO SZXEML414-HUB.china.huawei.com)
	([172.24.2.119])
	by szxrg02-dlp.huawei.com (MOS 4.3.7-GA FastPath queued)
	with ESMTP id CBS74769; Sun, 02 Nov 2014 13:22:05 +0800 (CST)
Received: from [127.0.0.1] (10.177.19.102) by SZXEML414-HUB.china.huawei.com
	(10.82.67.153) with Microsoft SMTP Server id 14.3.158.1; Sun, 2 Nov 2014
	13:21:55 +0800
Message-ID: <5455BF5F.3010400@huawei.com>
Date: Sun, 2 Nov 2014 13:21:35 +0800
From: Gonglei <arei.gonglei@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:11.0) Gecko/20120327 Thunderbird/11.0.1
MIME-Version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <1414735861-1232-1-git-send-email-arei.gonglei@huawei.com>
	<1414735861-1232-3-git-send-email-arei.gonglei@huawei.com>
	<5455BCE6.5080804@msgid.tls.msk.ru>
In-Reply-To: <5455BCE6.5080804@msgid.tls.msk.ru>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.102]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 119.145.14.65
Cc: "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
Subject: Re: [Qemu-trivial] [PATCH 2/2] tap: fix possible fd leak
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
X-List-Received-Date: Sun, 02 Nov 2014 05:22:24 -0000

On 2014/11/2 13:11, Michael Tokarev wrote:

> 31.10.2014 09:11, arei.gonglei@huawei.com wrote:
>> From: Gonglei <arei.gonglei@huawei.com>
>>
>> In hotplugging scenario, taking those true branch, the file
>> handler do not be closed. Adding cleanup logic for them.
>>
>> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
>> ---
>>  net/tap.c | 12 +++++++++---
>>  1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/net/tap.c b/net/tap.c
>> index 7bcd4c7..3cfbee8 100644
>> --- a/net/tap.c
>> +++ b/net/tap.c
>> @@ -796,7 +796,7 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
>>          if (net_init_tap_one(tap, peer, "bridge", name, ifname,
>>                               script, downscript, vhostfdname,
>>                               vnet_hdr, fd)) {
>> -            return -1;
>> +            goto fail;
>>          }
>>      } else {
>>          if (tap->has_vhostfds) {
>> @@ -823,7 +823,7 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
>>              if (queues > 1 && i == 0 && !tap->has_ifname) {
>>                  if (tap_fd_get_ifname(fd, ifname)) {
>>                      error_report("Fail to get ifname");
>> -                    return -1;
>> +                    goto fail;
>>                  }
>>              }
>>  
>> @@ -831,12 +831,18 @@ int net_init_tap(const NetClientOptions *opts, const char *name,
>>                                   i >= 1 ? "no" : script,
>>                                   i >= 1 ? "no" : downscript,
>>                                   vhostfdname, vnet_hdr, fd)) {
>> -                return -1;
>> +                goto fail;
>>              }
>>          }
>>      }
>>  
>>      return 0;
>> +
>> +fail:
>> +    if (fd != -1) {
>> +        close(fd);
>> +    }
>> +    return -1;
>>  }
> 
> I think, given the somewhat "hairy" nature of net_init_tap() function, which
> has many error returns which should not close fd and just 3 which should, it
> is better to add explicit close(fd) in these 3 places.
> 

Agree. v2 will do. Thanks!

> Besides, why do you check for fd != -1 in the fail path?  You added the goto
> into the 3 places, all of them has fd != -1, and there's no other ways to
> reach this place.  

Yes.

> Are you not certain that fd will be valid here?  If yes,
> I think this is yet another argument for adding close()s into the 3 places.
> 


Best regards,
-Gonglei


