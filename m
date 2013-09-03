Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGo57-0000eh-7I
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 06:43:33 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54009)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1VGo4z-0000V9-OE
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 06:43:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1VGo4t-000744-Ik
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 06:43:25 -0400
Received: from thoth.sbs.de ([192.35.17.2]:33873)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1VGo4g-00071C-RJ; Tue, 03 Sep 2013 06:43:07 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by thoth.sbs.de (8.13.6/8.13.6) with ESMTP id r83Ah274011466;
	Tue, 3 Sep 2013 12:43:02 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.40.156])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id r83Ah0ft027005;
	Tue, 3 Sep 2013 12:43:00 +0200
Message-ID: <5225BD32.8030001@siemens.com>
Date: Tue, 03 Sep 2013 12:42:58 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1378196857-27541-1-git-send-email-aik@ozlabs.ru>
	<CAFEAcA8Jp=SQsC3RpxahF1RFRtX2nHOS2690XiT9Jnpn0jGk_g@mail.gmail.com>
	<5225AC9A.2090601@ozlabs.ru>
In-Reply-To: <5225AC9A.2090601@ozlabs.ru>
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 192.35.17.2
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm-devel <kvm@vger.kernel.org>,
	Gleb Natapov <gleb@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-headers: update to
	3.11
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
X-List-Received-Date: Tue, 03 Sep 2013 10:43:32 -0000

On 2013-09-03 11:32, Alexey Kardashevskiy wrote:
> On 09/03/2013 07:29 PM, Peter Maydell wrote:
>> On 3 September 2013 09:27, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>> ---
>>>
>>> I need this update as VFIO on PPC64/pseries got in upstream kernel
>>> and this is required by VFIO-SPAPR bits in QEMU. Others may find this
>>> update useful too :)
>>> ---
>>>  linux-headers/asm-arm64/kvm.h       | 168 ++++++++++++++++++++++++++++++++++++
>>>  linux-headers/asm-arm64/kvm_para.h  |   1 +
>>>  linux-headers/asm-mips/kvm.h        |  81 +++++++++--------
>>>  linux-headers/linux/kvm.h           |   3 +
>>>  linux-headers/linux/vfio.h          |  42 ++++++++-
>>>  linux-headers/linux/virtio_config.h |   3 +
>>>  6 files changed, 254 insertions(+), 44 deletions(-)
>>>  create mode 100644 linux-headers/asm-arm64/kvm.h
>>>  create mode 100644 linux-headers/asm-arm64/kvm_para.h
>>
>> I think this should go in via the KVM tree, not trivial.
> 
> I do not mind, it just went through the trivial tree last time, that's it.

This shouldn't be routed through trivial in general as things broke too
often in this area.

Jan

-- 
Siemens AG, Corporate Technology, CT RTC ITP SES-DE
Corporate Competence Center Embedded Linux

