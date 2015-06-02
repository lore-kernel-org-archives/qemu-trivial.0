Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Yzrg0-0002jo-0B
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jun 2015 15:16:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47968)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1Yzrfx-0002hm-Ph
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 15:16:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1Yzrfw-0008H1-TT
	for qemu-trivial@nongnu.org; Tue, 02 Jun 2015 15:16:37 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58523)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>)
	id 1Yzrfq-00082w-0T; Tue, 02 Jun 2015 15:16:30 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id 61A21BBF57;
	Tue,  2 Jun 2015 19:16:29 +0000 (UTC)
Received: from scv.usersys.redhat.com (vpn-58-11.rdu2.redhat.com [10.10.58.11])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t52JGPt5008641; Tue, 2 Jun 2015 15:16:26 -0400
Message-ID: <556E0108.1050003@redhat.com>
Date: Tue, 02 Jun 2015 15:16:24 -0400
From: John Snow <jsnow@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Fam Zheng <famz@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>
References: <1433237561-10846-1-git-send-email-famz@redhat.com>	<556D8266.8060004@msgid.tls.msk.ru>
	<20150602102637.GD22059@dhcp-14-238.nay.redhat.com>
In-Reply-To: <20150602102637.GD22059@dhcp-14-238.nay.redhat.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, qemu-block@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-block] [PATCH] sheepdog: Fix error message
 if failed to load vmstate
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
X-List-Received-Date: Tue, 02 Jun 2015 19:16:38 -0000



On 06/02/2015 06:26 AM, Fam Zheng wrote:
> On Tue, 06/02 13:16, Michael Tokarev wrote:
>> 02.06.2015 12:32, Fam Zheng wrote:
>>>          if (ret < 0) {
>>> -            error_report("failed to save vmstate %s", strerror(errno));
>>> +            if (load) {
>>> +                error_report("failed to load vmstate %s", strerror(errno));
>>> +            } else {
>>> +                error_report("failed to save vmstate %s", strerror(errno));
>>> +            }
>>
>>  +            error_report("failed to %s vmstate: %s", load ? "load" : "save", strerror(errno));
> 
> The reason I didn't use a one-liner was, "git grep 'failed to load vmstate'"
> in the code base would just work, besides my eyes also like the readability.
> 

+1, Error messages should be kept on one line and intact where possible
and convenient. Greppable code is happy code.

>>
>> (note also the addition of ":")
> 
> Yes that applies to all error_report() in this file.
> 
>> (besides what Kevin said).
>>
>> Thanks,
> 
> Thanks,
> 
> Fam
> 

