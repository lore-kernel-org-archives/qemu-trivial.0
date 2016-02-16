Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aVYnM-0005R6-DB
	for mharc-qemu-trivial@gnu.org; Tue, 16 Feb 2016 01:07:32 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43964)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1aVYnK-0005PV-Hr
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 01:07:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1aVYnJ-0002HN-KV
	for qemu-trivial@nongnu.org; Tue, 16 Feb 2016 01:07:30 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43786)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>)
	id 1aVYnF-0002H6-7x; Tue, 16 Feb 2016 01:07:25 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id B65F8C0BBE4A;
	Tue, 16 Feb 2016 06:07:24 +0000 (UTC)
Received: from [10.36.5.104] (vpn1-5-104.ams2.redhat.com [10.36.5.104])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u1G67Kcr031436
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 16 Feb 2016 01:07:22 -0500
To: Christian Borntraeger <borntraeger@de.ibm.com>,
	Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <1455102397-14425-1-git-send-email-mjt@msgid.tls.msk.ru>
	<56BB2086.2040001@de.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <56C2BC98.8000009@redhat.com>
Date: Tue, 16 Feb 2016 07:07:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.0
MIME-Version: 1.0
In-Reply-To: <56BB2086.2040001@de.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
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
X-List-Received-Date: Tue, 16 Feb 2016 06:07:31 -0000

On 10.02.2016 12:35, Christian Borntraeger wrote:
> On 02/10/2016 12:06 PM, Michael Tokarev wrote:
>> This is an s390 boot rom which was used in s390-virtio machine.
>> but since commit 3538fb6f89dd9bb2e7e59de2bfad52a45321c744
>> "s390x: remove s390-virtio machine", this file isn't used.
>> The only place it is referenced in the code is an unused
>> which I'm modifying too, to refer to s390-ccw.rom instead.
>>
>> Cc: Pierre Morel <pmorel@linux.vnet.ibm.com>
>> Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
> 
> a minor nit below, otherwise 
> Acked-by: Christian Borntraeger <borntraeger@de.ibm.com>
> 
> 
>> ---
>>  Makefile               |   1 -
>>  hw/s390x/ipl.c         |   2 +-
>>  hw/s390x/s390-virtio.c |   1 -
>>  pc-bios/README         |   4 ----
>>  pc-bios/s390-zipl.rom  | Bin 3304 -> 0 bytes
>>  5 files changed, 1 insertion(+), 7 deletions(-)
>>  delete mode 100644 pc-bios/s390-zipl.rom
>>
>> diff --git a/Makefile b/Makefile
>> index 30b1b2d..f9fae3a 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -400,7 +400,6 @@ efi-pcnet.rom efi-rtl8139.rom efi-virtio.rom \
>>  qemu-icon.bmp qemu_logo_no_text.svg \
>>  bamboo.dtb petalogix-s3adsp1800.dtb petalogix-ml605.dtb \
>>  multiboot.bin linuxboot.bin kvmvapic.bin \
>> -s390-zipl.rom \
>>  s390-ccw.img \
>>  spapr-rtas.bin slof.bin \
>>  palcode-clipper \
>> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
>> index 6992add..4e6a0ac 100644
>> --- a/hw/s390x/ipl.c
>> +++ b/hw/s390x/ipl.c
>> @@ -106,7 +106,7 @@ static void s390_ipl_realize(DeviceState *dev, Error **errp)
>>              /* Adjust ELF start address to final location */
>>              ipl->bios_start_addr += fwbase;
>>          } else {
>> -            /* Try to load non-ELF file (e.g. s390-zipl.rom) */
>> +            /* Try to load non-ELF file (e.g. s390-ccw.rom) */
> 
> 						s390-ccw.img

Actually, s390-ccw.img is an ELF file, so this is a bad example for the
above comment. Maybe it would be better to simply remove the parenthesis
with the example instead?

 Thomas


