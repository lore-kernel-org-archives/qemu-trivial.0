Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1boXiq-0002gQ-Jd
	for mharc-qemu-trivial@gnu.org; Mon, 26 Sep 2016 11:21:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43290)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1boXil-0002ci-DJ
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2016 11:21:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1boXig-0002IE-QX
	for qemu-trivial@nongnu.org; Mon, 26 Sep 2016 11:21:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51654)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1boXiX-0002Fa-RC; Mon, 26 Sep 2016 11:21:17 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A5A89C056792;
	Mon, 26 Sep 2016 15:21:16 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-171.bos.redhat.com
	[10.18.17.171])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8QFLF0M019734; Mon, 26 Sep 2016 11:21:16 -0400
To: Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <1474646996-30421-1-git-send-email-thuth@redhat.com>
	<8d0e6f92-a114-2f08-c789-25265e6abea9@redhat.com>
	<20160926082214.GA6093@noname.str.redhat.com>
	<2e3398cc-def0-8ed6-e558-cdb58aec91eb@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
From: John Snow <jsnow@redhat.com>
Message-ID: <88b58209-07c9-25c5-8e8d-884f906f32db@redhat.com>
Date: Mon, 26 Sep 2016 11:21:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <2e3398cc-def0-8ed6-e558-cdb58aec91eb@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Mon, 26 Sep 2016 15:21:16 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [Qemu-block] [PATCH] MAINTAINERS:
 Add some more headers to the IDE section
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
X-List-Received-Date: Mon, 26 Sep 2016 15:21:34 -0000



On 09/26/2016 05:39 AM, Thomas Huth wrote:
> On 26.09.2016 10:22, Kevin Wolf wrote:
>> Am 23.09.2016 um 18:42 hat John Snow geschrieben:
>>> On 09/23/2016 12:09 PM, Thomas Huth wrote:
>>>> The folder include/hw/ide/ belongs to the IDE section.
>>>>
>>>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>>>> ---
>>>> MAINTAINERS | 1 +
>>>> 1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>>> index d8a0cfc..acf6d6c 100644
>>>> --- a/MAINTAINERS
>>>> +++ b/MAINTAINERS
>>>> @@ -791,6 +791,7 @@ M: John Snow <jsnow@redhat.com>
>>>> L: qemu-block@nongnu.org
>>>> S: Supported
>>>> F: include/hw/ide.h
>>>> +F: include/hw/ide/
>>>> F: hw/ide/
>>>> F: hw/block/block.c
>>>> F: hw/block/cdrom.c
>>>>
>>>
>>> Ah, yeah. These got missed when they were moved over. Thanks.
>>>
>>> Reviewed-by: John Snow <jsnow@redhat.com>
>>
>> Who is supposed to merge this if you only give an R-b?
>
> I've CC:ed this patch to qemu-trivial, so I hope it will get picked up
> there if John does not want to apply this directly.
>
>  Thomas
>
>

Sorry, I didn't realize I would be expected to merge this myself.

And I do want to move the files back, but I have to disentangle them and 
haven't done so yet. In the meantime, they should be recorded in 
MAINTAINERS.

I'll stage this page in my IDE branch, thanks

--js

