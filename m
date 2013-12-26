Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Vvz22-0006hv-Tg
	for mharc-qemu-trivial@gnu.org; Wed, 25 Dec 2013 19:42:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37019)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Vvz1w-0006aE-Hk
	for qemu-trivial@nongnu.org; Wed, 25 Dec 2013 19:42:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>) id 1Vvz1r-0000Np-WC
	for qemu-trivial@nongnu.org; Wed, 25 Dec 2013 19:42:28 -0500
Received: from [222.73.24.84] (port=2912 helo=song.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lig.fnst@cn.fujitsu.com>)
	id 1Vvz1i-0000DK-AI; Wed, 25 Dec 2013 19:42:14 -0500
X-IronPort-AV: E=Sophos;i="4.95,551,1384272000"; 
   d="scan'208";a="9327528"
Received: from unknown (HELO tang.cn.fujitsu.com) ([10.167.250.3])
	by song.cn.fujitsu.com with ESMTP; 26 Dec 2013 08:38:38 +0800
Received: from fnstmail02.fnst.cn.fujitsu.com (tang.cn.fujitsu.com [127.0.0.1])
	by tang.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id rBQ0gBdv021042;
	Thu, 26 Dec 2013 08:42:11 +0800
Received: from [10.167.226.22] ([10.167.226.22])
	by fnstmail02.fnst.cn.fujitsu.com (Lotus Domino Release 8.5.3)
	with ESMTP id 2013122608413114-716250 ;
	Thu, 26 Dec 2013 08:41:31 +0800 
Message-ID: <52BB7AFB.5080507@cn.fujitsu.com>
Date: Thu, 26 Dec 2013 08:40:27 +0800
From: Li Guang <lig.fnst@cn.fujitsu.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); en-US;
	rv:1.9.1.16) Gecko/20120421 Iceape/2.0.11
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1387956078-10651-1-git-send-email-lig.fnst@cn.fujitsu.com>
	<CAFEAcA-a_0w=NNF+cD53Cf5DOQ0KeeE5GD+ug3qKMH=M99mBfg@mail.gmail.com>
	<52BB76AB.3060502@cn.fujitsu.com>
	<CAFEAcA-fWhfh5JwkCyV5zgx0EmgYCpwFsh43wXVF5PnU1wQrJA@mail.gmail.com>
In-Reply-To: <CAFEAcA-fWhfh5JwkCyV5zgx0EmgYCpwFsh43wXVF5PnU1wQrJA@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on mailserver/fnst(Release 8.5.3|September
	15, 2011) at 2013/12/26 08:41:31,
	Serialize by Router on mailserver/fnst(Release 8.5.3|September 15,
	2011) at 2013/12/26 08:41:31,
	Serialize complete at 2013/12/26 08:41:31
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=UTF-8; format=flowed
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 222.73.24.84
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/sd: move sdhci.h to
	include/hw
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
X-List-Received-Date: Thu, 26 Dec 2013 00:42:33 -0000

Peter Maydell wrote:
> On 26 December 2013 00:22, Li Guang<lig.fnst@cn.fujitsu.com>  wrote:
>    
>> Peter Maydell wrote:
>>      
>>> On 25 December 2013 07:21, liguang<lig.fnst@cn.fujitsu.com>   wrote:
>>> This is where your patch should have had an explanation
>>> for why you're making this change. What is the user outside
>>> of hw/sd/ that needs this header that means we should
>>> move it into include/ ?
>>>        
>    
>> I don't mean someone will include it outside of hw/sd, just in the
>> sense of "header files be better in a directory called include",
>>      
> QEMU's policy is that header files used only by other C files within
> that directory can live in that directory; include is for headers which
> define functions to be used between modules.
>
>    
>> A10's SDHC(really an odd controller, without public datasheet) emulation
>> will use some of definitions in this file, and I think many other standard
>> SDHC will also be happy to include this file.
>>      
> I think all of these will live inside hw/sd so there's no need to move
> the header.
>
>    

OK, thanks!


