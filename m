Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1c3eqL-0005n7-Vr
	for mharc-qemu-trivial@gnu.org; Mon, 07 Nov 2016 02:59:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53344)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1c3eqK-0005lT-47
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2016 02:59:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>) id 1c3eqJ-000584-Cl
	for qemu-trivial@nongnu.org; Mon, 07 Nov 2016 02:59:48 -0500
Received: from [59.151.112.132] (port=23634 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <xiecl.fnst@cn.fujitsu.com>)
	id 1c3eqB-0004wc-9G; Mon, 07 Nov 2016 02:59:40 -0500
X-IronPort-AV: E=Sophos;i="5.22,518,1449504000"; d="scan'208";a="12730383"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 07 Nov 2016 15:59:30 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id BA39143972A7;
	Mon,  7 Nov 2016 15:59:24 +0800 (CST)
Received: from [10.167.225.55] (10.167.225.55) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server id 14.3.279.2; Mon, 7 Nov 2016 15:59:27 +0800
Message-ID: <5820364D.8080000@cn.fujitsu.com>
Date: Mon, 7 Nov 2016 16:07:41 +0800
From: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Markus Armbruster <armbru@redhat.com>
CC: qemu devel <qemu-devel@nongnu.org>, qemu block <qemu-block@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>, qemu
	trival <qemu-trivial@nongnu.org>, zhanghailiang
	<zhang.zhanghailiang@huawei.com>
References: <1478490505-9315-1-git-send-email-xiecl.fnst@cn.fujitsu.com>
	<87fun320fa.fsf@dusky.pond.sub.org>
In-Reply-To: <87fun320fa.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.225.55]
X-yoursite-MailScanner-ID: BA39143972A7.A8609
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: xiecl.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] docs/block-replication.txt:
 Introduce nbd qmp commands
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
X-List-Received-Date: Mon, 07 Nov 2016 07:59:49 -0000

On 11/07/2016 03:50 PM, Markus Armbruster wrote:
> Changlong Xie <xiecl.fnst@cn.fujitsu.com> writes:
>
>> Signed-off-by: Changlong Xie <xiecl.fnst@cn.fujitsu.com>
>> ---
>>   docs/block-replication.txt | 22 +++++++++++++++++-----
>>   1 file changed, 17 insertions(+), 5 deletions(-)
>>
>> diff --git a/docs/block-replication.txt b/docs/block-replication.txt
>> index 6bde673..6b9c77b 100644
>> --- a/docs/block-replication.txt
>> +++ b/docs/block-replication.txt
>> @@ -152,9 +152,22 @@ Primary:
>>            children.0.driver=raw
>>
>>     Run qmp command in primary qemu:
>> -    { 'execute': 'human-monitor-command',
>> +    { 'execute': 'blockdev-add',
>>         'arguments': {
>> -          'command-line': 'drive_add -n buddy driver=replication,mode=primary,file.driver=nbd,file.host=xxxx,file.port=xxxx,file.export=colo1,node-name=nbd_client1'
>> +          'driver': 'replication',
>> +          'node-name': 'nbd_client1',
>> +          'mode': 'primary',
>> +          'file': {
>> +              'driver': 'nbd',
>> +              'export': 'colo1',
>> +              'server': {
>> +                  'type': 'inet',
>> +                  'data': {
>> +                      'host': 'xxxx',
>> +                      'port': 'xxxx'
>> +                  }
>> +              }
>> +          }
>>         }
>>       }
>>       { 'execute': 'x-blockdev-change',
>> @@ -223,12 +236,11 @@ Primary:
>>           'child': 'children.1'
>>       }
>>     }
>> -  { 'execute': 'human-monitor-command',
>> +  { 'execute': 'x-blockdev-del',
>>       'arguments': {
>> -        'command-line': 'drive_del xxxx'
>> +        'node-name': 'nbd_client1'
>>       }
>>     }
>> -  Note: there is no qmp command to remove the blockdev now
>>
>>   Secondary:
>>     The primary host is down, so we should do the following thing:
>
> This is premature: both blockdev-add and x-blockdev-del still aren't
> ready for production.  Getting close, though.

Sound nice : ), so let this patch pending here.

Thanks
	-Xie
>
>
> .
>



