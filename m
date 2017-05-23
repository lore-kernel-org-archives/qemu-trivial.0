Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dDC2A-0002LV-2l
	for mharc-qemu-trivial@gnu.org; Tue, 23 May 2017 11:47:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45653)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1dDC27-0002Jj-Ua
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 11:47:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1dDC27-0003UG-5S
	for qemu-trivial@nongnu.org; Tue, 23 May 2017 11:47:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:57956)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1dDC22-0003O5-3L; Tue, 23 May 2017 11:47:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 424C4C059720;
	Tue, 23 May 2017 15:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 424C4C059720
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx08.extmail.prod.ext.phx2.redhat.com;
	spf=pass smtp.mailfrom=jsnow@redhat.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.redhat.com 424C4C059720
Received: from [10.18.17.130] (dhcp-17-130.bos.redhat.com [10.18.17.130])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A0CA87EBF9;
	Tue, 23 May 2017 15:47:31 +0000 (UTC)
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	Thomas Huth <thuth@redhat.com>
References: <1494322876-28843-1-git-send-email-armbru@redhat.com>
	<ea74cfd3-9009-e99d-8f18-8edc9c0441c2@redhat.com>
	<87zie3byk6.fsf@dusky.pond.sub.org> <87h90b39m5.fsf@dusky.pond.sub.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <eb143f09-b903-606e-7961-c22653e2bf92@redhat.com>
Date: Tue, 23 May 2017 11:47:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.0
MIME-Version: 1.0
In-Reply-To: <87h90b39m5.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Tue, 23 May 2017 15:47:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 0/2] docs: Minor updates
 around ide-drive
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
X-List-Received-Date: Tue, 23 May 2017 15:47:40 -0000



On 05/23/2017 10:56 AM, Markus Armbruster wrote:
> Markus Armbruster <armbru@redhat.com> writes:
> 
>> John Snow <jsnow@redhat.com> writes:
>>
>>> On 05/09/2017 05:41 AM, Markus Armbruster wrote:
>>>> Markus Armbruster (2):
>>>>   docs qemu-doc: Avoid ide-drive, it's deprecated
>>>>   docs/qdev-device-use.txt: update section Default Devices
>>>>
>>>>  docs/bootindex.txt       |  2 +-
>>>>  docs/qdev-device-use.txt | 13 +++++++------
>>>>  qemu-options.hx          |  2 +-
>>>>  3 files changed, 9 insertions(+), 8 deletions(-)
>>>>
>>>
>>> Shame on me for not noticing, but thank you.
>>>
>>> Acked-by: John Snow <jsnow@redhat.com>
>>
>> Thanks!
>>
>> The canonical path is through your tree, but I could stick it into a
>> miscellaneous pull request if you like.
> 
> Nevermind, qemu-trivial picked it up.
> 

That was my assumption since it went to -trivial :)
Glad my inaction helped sort it out.

