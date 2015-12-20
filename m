Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aAav7-0005df-Sj
	for mharc-qemu-trivial@gnu.org; Sun, 20 Dec 2015 05:08:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51183)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aAav5-0005bL-OR
	for qemu-trivial@nongnu.org; Sun, 20 Dec 2015 05:08:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>) id 1aAav4-0006fR-QC
	for qemu-trivial@nongnu.org; Sun, 20 Dec 2015 05:08:51 -0500
Received: from [59.151.112.132] (port=6446 helo=heian.cn.fujitsu.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <caoj.fnst@cn.fujitsu.com>)
	id 1aAauy-0006dO-Qz; Sun, 20 Dec 2015 05:08:45 -0500
X-IronPort-AV: E=Sophos;i="5.20,346,1444665600"; 
   d="scan'208";a="1774670"
Received: from bogon (HELO cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 20 Dec 2015 18:06:52 +0800
Received: from G08CNEXCHPEKD03.g08.fujitsu.local (unknown [10.167.33.85])
	by cn.fujitsu.com (Postfix) with ESMTP id BEAD740427FE;
	Sun, 20 Dec 2015 18:06:43 +0800 (CST)
Received: from [10.167.226.86] (10.167.226.86) by
	G08CNEXCHPEKD03.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Sun, 20 Dec 2015 18:10:00 +0800
To: Markus Armbruster <armbru@redhat.com>
References: <1450428770-18215-1-git-send-email-caoj.fnst@cn.fujitsu.com>
	<87wpsbex5u.fsf@blackfin.pond.sub.org>
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Message-ID: <56767E40.9090607@cn.fujitsu.com>
Date: Sun, 20 Dec 2015 18:09:04 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <87wpsbex5u.fsf@blackfin.pond.sub.org>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.167.226.86]
X-yoursite-MailScanner-ID: BEAD740427FE.A8CFE
X-yoursite-MailScanner: Found to be clean
X-yoursite-MailScanner-From: caoj.fnst@cn.fujitsu.com
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 59.151.112.132
Cc: ehabkost@redhat.com, mst@redhat.com, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, pbonzini@redhat.com, rth@twiddle.net
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] Use macro instead of
	plain text
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
X-List-Received-Date: Sun, 20 Dec 2015 10:08:52 -0000



On 12/18/2015 08:52 PM, Markus Armbruster wrote:
> Cao jin <caoj.fnst@cn.fujitsu.com> writes:
>
>> There is TYPE_ICH9_AHCI definition in ahci.h when QOMify it, seems it
>> is missed.
>>
>> Signed-off-by: Cao jin <caoj.fnst@cn.fujitsu.com>
>> ---
>>   hw/i386/pc_q35.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
>> index 9a12068..aa34a07 100644
>> --- a/hw/i386/pc_q35.c
>> +++ b/hw/i386/pc_q35.c
>> @@ -249,7 +249,7 @@ static void pc_q35_init(MachineState *machine)
>>       ahci = pci_create_simple_multifunction(host_bus,
>>                                              PCI_DEVFN(ICH9_SATA1_DEV,
>>                                                        ICH9_SATA1_FUNC),
>> -                                           true, "ich9-ahci");
>> +                                           true, TYPE_ICH9_AHCI);
>>       idebus[0] = qdev_get_child_bus(&ahci->qdev, "ide.0");
>>       idebus[1] = qdev_get_child_bus(&ahci->qdev, "ide.1");
>>       g_assert(MAX_SATA_PORTS == ICH_AHCI(ahci)->ahci.ports);
>
> I suspect there are more instances of the same problem.
>
> To find all similar macro definitions:
>
>      $ git-grep -Eh '^ *# *define +TYPE_[A-Za-z0-9_]+ +"'
>
> Extract the strings:
>
>      $ git-grep -Eh '^ *# *define +TYPE_[A-Za-z0-9_]+ +"' | sed 's/^[^"]*\("[^"]*"\).*/\1/'
>
> Search the source for them:
>
>      $ for i in `git-grep -Eh '^ *# *define +TYPE_[A-Za-z0-9_]+ +"' | sed 's/^[^"]*\("[^"]*"\).*/\1/'`; do echo "= $i ="; git-grep -F "$i"; done
>
> Results in more than 1000 hits for me.  Names like "device" are of
> course very prone to false positives.
>

Yes, often seeing "plain text" style when browsing code, and after 
seeing PMM`s explanation, I finally see why there are lots of these...

> Not sure how interested we are in consistent use of these macros...
>

I didn`t pay any attention to this before. It comes to me when I make 
the V2 "msi/msix" patch. as I said in that cover-letter: special case:)

we can forget this patch now.

>
> .
>

-- 
Yours Sincerely,

Cao Jin



