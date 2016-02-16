Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aVbDz-0000Qm-HY
	for mharc-qemu-trivial@gnu.org; Tue, 16 Feb 2016 03:43:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58841)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1aVbDx-0000QX-JR
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 03:43:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1aVbDv-0004hA-81
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 03:43:09 -0500
Received: from e06smtp16.uk.ibm.com ([195.75.94.112]:38773)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1aVbDu-0004gi-V9
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 03:43:07 -0500
Received: from localhost
	by e06smtp16.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <borntraeger@de.ibm.com>;
	Tue, 16 Feb 2016 08:43:03 -0000
Received: from d06dlp01.portsmouth.uk.ibm.com (9.149.20.13)
	by e06smtp16.uk.ibm.com (192.168.101.146) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Tue, 16 Feb 2016 08:43:02 -0000
X-IBM-Helo: d06dlp01.portsmouth.uk.ibm.com
X-IBM-MailFrom: borntraeger@de.ibm.com
X-IBM-RcptTo: qemu-devel@nongnu.org;qemu-trivial@nongnu.org
Received: from b06cxnps3074.portsmouth.uk.ibm.com
	(d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by d06dlp01.portsmouth.uk.ibm.com (Postfix) with ESMTP id 50D9117D805D; 
	Tue, 16 Feb 2016 08:43:19 +0000 (GMT)
Received: from d06av10.portsmouth.uk.ibm.com (d06av10.portsmouth.uk.ibm.com
	[9.149.37.251])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u1G8h1RU63504450; Tue, 16 Feb 2016 08:43:01 GMT
Received: from d06av10.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av10.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u1G7h2U0024818; Tue, 16 Feb 2016 00:43:03 -0700
Received: from oc1450873852.ibm.com (dyn-9-152-224-136.boeblingen.de.ibm.com
	[9.152.224.136])
	by d06av10.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u1G7h20k024781; Tue, 16 Feb 2016 00:43:02 -0700
To: Thomas Huth <thuth@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	qemu-devel@nongnu.org
References: <1455102397-14425-1-git-send-email-mjt@msgid.tls.msk.ru>
	<56BB2086.2040001@de.ibm.com> <56C2BC98.8000009@redhat.com>
	<56C2CA7C.5040905@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Message-ID: <56C2E114.7080602@de.ibm.com>
Date: Tue, 16 Feb 2016 09:43:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <56C2CA7C.5040905@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16021608-0025-0000-0000-000008FC63C3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 195.75.94.112
Cc: qemu-trivial@nongnu.org, Pierre Morel <pmorel@linux.vnet.ibm.com>,
	Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] s390x: remove s390-zipl.rom
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
X-List-Received-Date: Tue, 16 Feb 2016 08:43:10 -0000

On 02/16/2016 08:06 AM, Thomas Huth wrote:
> On 16.02.2016 07:07, Thomas Huth wrote:
>> On 10.02.2016 12:35, Christian Borntraeger wrote:
>>> On 02/10/2016 12:06 PM, Michael Tokarev wrote:
>>>> This is an s390 boot rom which was used in s390-virtio machine.
>>>> but since commit 3538fb6f89dd9bb2e7e59de2bfad52a45321c744
>>>> "s390x: remove s390-virtio machine", this file isn't used.
>>>> The only place it is referenced in the code is an unused
>>>> which I'm modifying too, to refer to s390-ccw.rom instead.
>>>>
>>>> Cc: Pierre Morel <pmorel@linux.vnet.ibm.com>
>>>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
>>>
>>> a minor nit below, otherwise 
>>> Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
>>>
>>>
>>>> ---
>>>>  Makefile               |   1 -
>>>>  hw/s390x/ipl.c         |   2 +-
>>>>  hw/s390x/s390-virtio.c |   1 -
>>>>  pc-bios/README         |   4 ----
>>>>  pc-bios/s390-zipl.rom  | Bin 3304 -> 0 bytes
>>>>  5 files changed, 1 insertion(+), 7 deletions(-)
>>>>  delete mode 100644 pc-bios/s390-zipl.rom
>>>>
>>>> diff --git a/Makefile b/Makefile
>>>> index 30b1b2d..f9fae3a 100644
>>>> --- a/Makefile
>>>> +++ b/Makefile
>>>> @@ -400,7 +400,6 @@ efi-pcnet.rom efi-rtl8139.rom efi-virtio.rom \
>>>>  qemu-icon.bmp qemu_logo_no_text.svg \
>>>>  bamboo.dtb petalogix-s3adsp1800.dtb petalogix-ml605.dtb \
>>>>  multiboot.bin linuxboot.bin kvmvapic.bin \
>>>> -s390-zipl.rom \
>>>>  s390-ccw.img \
>>>>  spapr-rtas.bin slof.bin \
>>>>  palcode-clipper \
>>>> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
>>>> index 6992add..4e6a0ac 100644
>>>> --- a/hw/s390x/ipl.c
>>>> +++ b/hw/s390x/ipl.c
>>>> @@ -106,7 +106,7 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
>>>>              /* Adjust ELF start address to final location */
>>>>              ipl->bios_start_addr += fwbase;
>>>>          } else {
>>>> -            /* Try to load non-ELF file (e.g. s390-zipl.rom) */
>>>> +            /* Try to load non-ELF file (e.g. s390-ccw.rom) */
>>>
>>> 						s390-ccw.img
>>
>> Actually, s390-ccw.img is an ELF file, so this is a bad example for the
>> above comment. 
>> Maybe it would be better to simply remove the parenthesis
>> with the example instead?

Right, so better completely remove the file name.

> ... or even remove that else-branch completely since it is now not
> necessary anymore? The ccw machine should always use an ELF image as
> firmware, shouldn't it?

Please keep it. The use can specify a bios on the command line and maybe
this helps to test some odd-ball scenario.


