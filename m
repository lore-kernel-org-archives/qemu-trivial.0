Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WQg0H-0004Cd-Rr
	for mharc-qemu-trivial@gnu.org; Thu, 20 Mar 2014 12:39:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49100)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <m.smarduch@samsung.com>) id 1WQg07-0003iD-8G
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 12:39:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <m.smarduch@samsung.com>) id 1WQfzy-0004ZU-Ar
	for qemu-trivial@nongnu.org; Thu, 20 Mar 2014 12:39:27 -0400
Received: from mailout4.w2.samsung.com ([211.189.100.14]:53550
	helo=usmailout4.samsung.com) by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <m.smarduch@samsung.com>)
	id 1WQfzg-0004QT-7I; Thu, 20 Mar 2014 12:39:00 -0400
Received: from uscpsbgex2.samsung.com
	(u123.gpu85.samsung.co.kr [203.254.195.123]) by usmailout4.samsung.com
	(Oracle Communications Messaging Server 7u4-24.01(7.0.4.24.0) 64bit
	(built Nov
	17 2011)) with ESMTP id <0N2Q00A9BU8Y85A0@usmailout4.samsung.com>; Thu,
	20 Mar 2014 12:38:58 -0400 (EDT)
X-AuditID: cbfec37b-b7f8f6d000007030-b9-532b19a19aef
Received: from usmmp1.samsung.com ( [203.254.195.77])	by uscpsbgex2.samsung.com
	(USCPEXMTA) with SMTP id 7E.DE.28720.1A91B235; Thu,
	20 Mar 2014 12:38:58 -0400 (EDT)
Received: from sisasmtp.sisa.samsung.com ([105.144.21.116])
	by usmmp1.samsung.com
	(Oracle Communications Messaging Server 7u4-27.01(7.0.4.27.0) 64bit
	(built Aug
	30 2012)) with ESMTP id <0N2Q00MDUU8X8240@usmmp1.samsung.com>; Thu,
	20 Mar 2014 12:38:57 -0400 (EDT)
Received: from [105.144.129.76] (105.144.129.76) by SISAEX02SJ.sisa.samsung.com
	(105.144.21.116) with Microsoft SMTP Server (TLS) id 14.1.421.2; Thu,
	20 Mar 2014 09:38:57 -0700
Message-id: <532B198B.8010800@samsung.com>
Date: Thu, 20 Mar 2014 09:38:35 -0700
From: Mario Smarduch <m.smarduch@samsung.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:17.0) Gecko/20130804
	Thunderbird/17.0.8
MIME-version: 1.0
To: Michael Tokarev <mjt@tls.msk.ru>
References: <5329D2CA.6020909@samsung.com> <532B0CFC.6070309@msgid.tls.msk.ru>
In-reply-to: <532B0CFC.6070309@msgid.tls.msk.ru>
Content-type: text/plain; charset=ISO-8859-1
Content-transfer-encoding: 7bit
X-Originating-IP: [105.144.129.76]
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrILMWRmVeSWpSXmKPExsVy+t9hX91FktrBBpvuM1s8+fed0eJ47w4W
	i7Vn5rI6MHs8ubaZyWPC1KUsAUxRXDYpqTmZZalF+nYJXBkTX25jL2jgrNjddoG1gbGJvYuR
	k0NCwERi3cznrBC2mMSFe+vZuhi5OIQEljFKLFk5jwXC6WWSWLpyPTOEs4VR4tPrqcwgLbwC
	WhIz51wBs1kEVCUefDgJNpZNQFdi/72NYLaoQITEn9P7WCHqBSV+TL7HAmKLCKhIfN92HizO
	LGAv8WvuL0YQW1ggTuL3ou9gcSEBP4kdK2eC1XMKGEgced/HBFGvI7G/dRobhC0vsXnNW2aI
	elWJbTefA83hAHpHSWL1EfMJjMKzkGyehaR7FpLuBYzMqxjFSouTC4qT0lMrjPSKE3OLS/PS
	9ZLzczcxQoK9egfj3a82hxgFOBiVeHgrOLWDhVgTy4orcw8xSnAwK4nwfuIGCvGmJFZWpRbl
	xxeV5qQWH2Jk4uCUamC0zzWa4q19tlNijYRCoZjhkXaPMNHMkDvPeg/ct0lY8mVSvFesvZKe
	4bmfT28vS59yhE+p6Mz1x943AiS2aRovX8ohEqD2/+4dr9KVU0oTaj7miPjKr/iwXf38ZMs5
	SxSWyiy/1ap9UmW/h8k69ym/CsLvnc942ht/a158pBd3Zq9ixNnrnq5KLMUZiYZazEXFiQAn
	vYXbVAIAAA==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 211.189.100.14
Cc: qemu-trivial@nongnu.org, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel][PATCH] fix return check for
 KVM_GET_DIRTY_LOG ioctl
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
X-List-Received-Date: Thu, 20 Mar 2014 16:39:36 -0000


I agree. One thing I forgot to mention andother side effect
of this bug was virtio VRing used, avail index error 
the Guest was 1,2,..  less then host.

I looked up that bug it happend on some architectures. 
This may or may not be related. Obviously if the dirty
bitmap is not processed properly you may see issues like that.

- Mario 

On 03/20/2014 08:45 AM, Michael Tokarev wrote:
> 19.03.2014 21:24, Mario Smarduch wrote:
>>
>> Fix return condition check from kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) to
>> handle internal failures or no support for memory slot dirty bitmap.
>> Otherwise the ioctl succeeds and continues with migration.
>> Addresses BUG# 1294227
> 
> Thanks, applied to -trivial.
> 
> []
>> -        if (kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) == -1) {
>> +        if (kvm_vm_ioctl(s, KVM_GET_DIRTY_LOG, &d) < 0) {
> 
> Actually I'd make all error checks like this.  Many checks compares
> return value with -1 for some reason, while actually, any <0 value
> should be treated as error in many many places...  At the same time,
> comparison with 0 is cheaper than comparison with -1 ;)
> 
> /mjt
> 


