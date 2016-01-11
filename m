Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aIR5d-0005Fr-Lu
	for mharc-qemu-trivial@gnu.org; Sun, 10 Jan 2016 20:16:09 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43936)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aIR5b-0005CW-61
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 20:16:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aIR5a-0003pg-Dh
	for qemu-trivial@nongnu.org; Sun, 10 Jan 2016 20:16:07 -0500
Received: from [59.151.112.132] (port=59180 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aIR5U-0003lK-9L; Sun, 10 Jan 2016 20:16:00 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="2429273"
Received: from unknown (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 11 Jan 2016 09:15:53 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (unknown [10.167.33.80])
	by cn.fujitsu.com (Postfix) with ESMTP id 23CB24189116;
	Mon, 11 Jan 2016 09:15:35 +0800 (CST)
Received: from [10.167.226.69] (10.167.226.69) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Mon, 11 Jan 2016 09:15:35 +0800
To: Michael Tokarev <mjt@tls.msk.ru>, <qemu-devel@nongnu.org>
References: <1450428935-18329-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<56929D32.3050702@msgid.tls.msk.ru>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <569302FA.7080301@cn.fujitsu.com>
Date: Mon, 11 Jan 2016 09:18:50 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <56929D32.3050702@msgid.tls.msk.ru>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.167.226.69]
X-yoursite-MailScanner-ID: 23CB24189116.A58D2
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: qemu-trivial <qemu-trivial@nongnu.org>, jslaby@suse.cz, armbru@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] Convert to realize()
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
X-List-Received-Date: Mon, 11 Jan 2016 01:16:08 -0000

Thanks for your work:)

On 01/11/2016 02:04 AM, Michael Tokarev wrote:
> 18.12.2015 11:55, Cao jin wrote:
>> for educational PCI device
>
> Applied to -trivial, adding "hw/misc/edu:" prefix to the subject line, thanks!
>
> 10.01.2016 13:14, Cao jin wrote:
>> Hi mjt,
>>      seems the patch is still pending in qemu-trivial, and besides, I have several others also pending in there，may I know how are they going?
>
> I didn't process almost anything before 2.5.0 release, and next
> there were Cristmas and New Year holidays.  As you can see, some
> patches are now going.
>
> Thanks,
>
> /mjt
>
>
>

-- 
Yours Sincerely,

Cao jin



