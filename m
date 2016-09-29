Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1bpW1j-0001ab-8j
	for mharc-qemu-trivial@gnu.org; Thu, 29 Sep 2016 03:45:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bpW1g-0001XY-Dc
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 03:45:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1bpW1e-0000jO-ER
	for qemu-trivial@nongnu.org; Thu, 29 Sep 2016 03:45:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51235)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1bpW1Z-0000hr-EY; Thu, 29 Sep 2016 03:44:57 -0400
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E326E7CDE2;
	Thu, 29 Sep 2016 07:44:56 +0000 (UTC)
Received: from [10.36.116.32] (ovpn-116-32.ams2.redhat.com [10.36.116.32])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u8T7isLi028726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 29 Sep 2016 03:44:56 -0400
To: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
References: <1474986431-2701-1-git-send-email-thuth@redhat.com>
	<01cb50c8-bc3b-b248-2ac9-5045d3898346@weilnetz.de>
Cc: qemu-trivial@nongnu.org
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7bbd6dc7-0bf0-041b-be44-2d1af750bd81@redhat.com>
Date: Thu, 29 Sep 2016 09:44:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <01cb50c8-bc3b-b248-2ac9-5045d3898346@weilnetz.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 29 Sep 2016 07:44:56 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] MAINTAINERS: Add some more pattern to
 recognize all win32 related files
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
X-List-Received-Date: Thu, 29 Sep 2016 07:45:05 -0000

On 28.09.2016 21:28, Stefan Weil wrote:
> Am 27.09.2016 um 16:27 schrieb Thomas Huth:
>> The get_maintainer.pl script currently thinks that the win32
>> related files in the util and include folders are currently
>> unmaintained. Thus let's add some additional wildcards to
>> match these files.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>  MAINTAINERS | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 6902885..a5dec30 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -324,6 +324,8 @@ L: qemu-devel@nongnu.org
>>  M: Stefan Weil <sw@weilnetz.de>
>>  S: Maintained
>>  F: *win32*
>> +F: */*win32*
>> +F: include/*/*win32*
>>  F: qemu.nsi
>>
>>  ARM Machines
> 
> Thank you, Thomas, for this patch. I suggest a small modification
> because there is already a maintainer for qga/ (Michael Roth) and I
> cannot contribute much to the QEMU guest agent. Therefore I'd prefer
> excluding that directory. That requires replacing */*win32* by an
> explicit list of directories.

Sure. There is even a nicer way to exclude certain files: Adding a line
starting with "X:". I just sent a v2 of this patch with that line included.

 Thomas


