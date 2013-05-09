Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UaLfi-0002m7-02
	for mharc-qemu-trivial@gnu.org; Thu, 09 May 2013 03:53:50 -0400
Received: from eggs.gnu.org ([208.118.235.92]:49919)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1UaLff-0002lx-Ht
	for qemu-trivial@nongnu.org; Thu, 09 May 2013 03:53:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1UaLfd-0006xP-I6
	for qemu-trivial@nongnu.org; Thu, 09 May 2013 03:53:47 -0400
Received: from e33.co.us.ibm.com ([32.97.110.151]:58873)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <wdongxu@linux.vnet.ibm.com>) id 1UaLfd-0006vS-Bd
	for qemu-trivial@nongnu.org; Thu, 09 May 2013 03:53:45 -0400
Received: from /spool/local
	by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
	Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <wdongxu@linux.vnet.ibm.com>;
	Thu, 9 May 2013 01:53:44 -0600
Received: from d03dlp01.boulder.ibm.com (9.17.202.177)
	by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Thu, 9 May 2013 01:53:38 -0600
Received: from d03relay03.boulder.ibm.com (d03relay03.boulder.ibm.com
	[9.17.195.228])
	by d03dlp01.boulder.ibm.com (Postfix) with ESMTP id 5D9DD1FF001F;
	Thu,  9 May 2013 01:48:32 -0600 (MDT)
Received: from d03av06.boulder.ibm.com (d03av06.boulder.ibm.com [9.17.195.245])
	by d03relay03.boulder.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	r497rbTg121854; Thu, 9 May 2013 01:53:38 -0600
Received: from d03av06.boulder.ibm.com (loopback [127.0.0.1])
	by d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP
	id r497uYmI003856; Thu, 9 May 2013 01:56:35 -0600
Received: from [9.115.124.188] (dong.cn.ibm.com [9.115.124.188])
	by d03av06.boulder.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	r497uV4Z003738; Thu, 9 May 2013 01:56:32 -0600
Message-ID: <518B55FD.2070503@linux.vnet.ibm.com>
Date: Thu, 09 May 2013 15:53:33 +0800
From: Dong Xu Wang <wdongxu@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130328 Thunderbird/17.0.5
MIME-Version: 1.0
To: Hu Tao <hutao@cn.fujitsu.com>
References: <1368006380-3125-1-git-send-email-trivial@linux.vnet.ibm.com>
	<1368006380-3125-2-git-send-email-trivial@linux.vnet.ibm.com>
	<518A4A2E.200@msgid.tls.msk.ru> <87vc6t61te.fsf@codemonkey.ws>
	<518B40CD.7030604@msgid.tls.msk.ru>
	<20130509070813.GA30653@arch.fnst.cn.fujitsu.com>
In-Reply-To: <20130509070813.GA30653@arch.fnst.cn.fujitsu.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: No
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 13050907-2398-0000-0000-00001426DA76
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 32.97.110.151
Cc: qemu-trivial@nongnu.org, Trival <trivial@linux.vnet.ibm.com>,
	qemu-devel@nongnu.org, Anthony Liguori <anthony@codemonkey.ws>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 2/2] remove
	needless	semicolon
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
X-List-Received-Date: Thu, 09 May 2013 07:53:49 -0000

On 2013/5/9 15:08, Hu Tao wrote:
> On Thu, May 09, 2013 at 10:23:09AM +0400, Michael Tokarev wrote:
>> 08.05.2013 17:25, Anthony Liguori wrote:
>>> Michael Tokarev <mjt@tls.msk.ru> writes:
>>>
>>>> 08.05.2013 13:46, Trival wrote:
>>>>> Signed-off-by: Trival <trivial@linux.vnet.ibm.com>
>
> I think wdongxu probably wants HIS name and email go here. wdongxu, can
> you resend your patches with:
>
Sorry for the inconvenience, will re-send the patches.
>    Signed-off-by: <your real name> <wdongxu@linux.vnet.ibm.com>
>
> ?
>
>>>
>>> Something went wrong in sending this.  This is not a valid SoB.
>>
>> So, do we not accept it?  Should I revert it in the
>> trivial-patches-next ?
>>
>> Thanks,
>>
>> /mjt
>
>


