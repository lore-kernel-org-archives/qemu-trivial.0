Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YmlwB-00035n-Fd
	for mharc-qemu-trivial@gnu.org; Mon, 27 Apr 2015 12:31:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1Ymlw7-0002yl-JK
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:31:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1Ymlw6-0003SG-Nk
	for qemu-trivial@nongnu.org; Mon, 27 Apr 2015 12:31:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55661)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1Ymlw0-0003PU-KA; Mon, 27 Apr 2015 12:31:04 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (Postfix) with ESMTPS id 3E3FD8EB54;
	Mon, 27 Apr 2015 16:31:03 +0000 (UTC)
Received: from scv.usersys.redhat.com (dhcp-17-29.bos.redhat.com [10.18.17.29])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t3RGV1XC019357; Mon, 27 Apr 2015 12:31:02 -0400
Message-ID: <553E6445.20309@redhat.com>
Date: Mon, 27 Apr 2015 12:31:01 -0400
From: John Snow <jsnow@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Eric Blake <eblake@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
References: <1430122397-2807-1-git-send-email-mjt@msgid.tls.msk.ru>
	<553E4C5C.7010705@redhat.com>
In-Reply-To: <553E4C5C.7010705@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qemu-options: trivial
	spelling fix (messsage)
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
X-List-Received-Date: Mon, 27 Apr 2015 16:31:13 -0000



On 04/27/2015 10:49 AM, Eric Blake wrote:
> On 04/27/2015 02:13 AM, Michael Tokarev wrote:
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>> ---
>>   qemu-options.hx | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> Reviewed-by: Eric Blake <eblake@redhat.com>
>
> But while at it...
>
>>
>> diff --git a/qemu-options.hx b/qemu-options.hx
>> index 319d971..ec356f6 100644
>> --- a/qemu-options.hx
>> +++ b/qemu-options.hx
>> @@ -3106,7 +3106,7 @@ executed often has little or no correlation with actual performance.
>>   to synchronise the host clock and the virtual clock. The goal is to
>
> Is there any consensus on whether we should prefer US spelling
> (synchronize) over UK spelling in our user-facing text?
>

I would just go with whatever the prevailing standard currently is.

Can we run a spellchecker over our code in a UK mode and then again in a 
US mode, and we'll just go with whatever has the least errors currently?

--js

