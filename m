Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGsXQ-0007Pz-4Y
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 11:29:04 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42403)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1VGsXI-0007LK-Cr
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 11:29:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1VGsX9-000381-UM
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 11:28:56 -0400
Received: from mail-pa0-f44.google.com ([209.85.220.44]:58021)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1VGsX9-00037e-NJ
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 11:28:47 -0400
Received: by mail-pa0-f44.google.com with SMTP id fz6so6584728pac.3
	for <qemu-trivial@nongnu.org>; Tue, 03 Sep 2013 08:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=w+jJHHNR0iD60nuYOxvGXvm2EypZVkP6YpcQKI9mz1Y=;
	b=MmzASUkXfowintl4WxP1CcSppC/fNfhdNT7CB8M6+qEnneZxCsDGG6nWCTgFU0Sk+s
	c9xK+JUn8pg9jc4avkSJfmajn2/aPXAh/UUAMfGcLuFQtwrDOYCqusLkdyQZGz8repRG
	gwn++oRPK5d7EEPgEzuTx6TXZ1BTO5WUSFh7A5goIHYJ7P3DP+UK1lWuYz2WEgMIyHO6
	SNx3ulO96+CL1AI8wbd1CXx4PvXrL8AQEYusie8Hv0v/gOcXdm0BpTSRg/tJ5wGeITKH
	eKilQrFSPfxdGoLjlSaCu44YlHNxGS1GfD3WsR2713rFcpDM/Ijw9X5EetRhw06JoFZc
	LCTg==
X-Gm-Message-State: ALoCoQk0A6ogaXZ0dZMF9RDtpbl51zaRTHlinsLWPUu3C5RW7l79zKCknPQ8oN2uPFNbsI/0t1HG
X-Received: by 10.66.141.144 with SMTP id ro16mr3680725pab.173.1378222125158; 
	Tue, 03 Sep 2013 08:28:45 -0700 (PDT)
Received: from aik.ozlabs.ibm.com (60-242-102-4.tpgi.com.au. [60.242.102.4])
	by mx.google.com with ESMTPSA id y5sm2568561pbs.18.1969.12.31.16.00.00
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 03 Sep 2013 08:28:42 -0700 (PDT)
Message-ID: <52260025.3050704@ozlabs.ru>
Date: Wed, 04 Sep 2013 01:28:37 +1000
From: Alexey Kardashevskiy <aik@ozlabs.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130625 Thunderbird/17.0.7
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <1378196857-27541-1-git-send-email-aik@ozlabs.ru>
	<CAFEAcA8Jp=SQsC3RpxahF1RFRtX2nHOS2690XiT9Jnpn0jGk_g@mail.gmail.com>
	<5225AC9A.2090601@ozlabs.ru> <5225BD32.8030001@siemens.com>
In-Reply-To: <5225BD32.8030001@siemens.com>
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.220.44
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
X-List-Received-Date: Tue, 03 Sep 2013 15:29:02 -0000

On 09/03/2013 08:42 PM, Jan Kiszka wrote:
> On 2013-09-03 11:32, Alexey Kardashevskiy wrote:
>> On 09/03/2013 07:29 PM, Peter Maydell wrote:
>>> On 3 September 2013 09:27, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>> ---
>>>>
>>>> I need this update as VFIO on PPC64/pseries got in upstream kernel
>>>> and this is required by VFIO-SPAPR bits in QEMU. Others may find this
>>>> update useful too :)
>>>> ---
>>>>  linux-headers/asm-arm64/kvm.h       | 168 ++++++++++++++++++++++++++++++++++++
>>>>  linux-headers/asm-arm64/kvm_para.h  |   1 +
>>>>  linux-headers/asm-mips/kvm.h        |  81 +++++++++--------
>>>>  linux-headers/linux/kvm.h           |   3 +
>>>>  linux-headers/linux/vfio.h          |  42 ++++++++-
>>>>  linux-headers/linux/virtio_config.h |   3 +
>>>>  6 files changed, 254 insertions(+), 44 deletions(-)
>>>>  create mode 100644 linux-headers/asm-arm64/kvm.h
>>>>  create mode 100644 linux-headers/asm-arm64/kvm_para.h
>>>
>>> I think this should go in via the KVM tree, not trivial.
>>
>> I do not mind, it just went through the trivial tree last time, that's it.
> 
> This shouldn't be routed through trivial in general as things broke too
> often in this area.


Sorry for my ignorance, but this is The Kernel, it is already there, broken
or not, even if it is broken, qemu cannot stay isolated, no?
This is a mechanical change, no more.


-- 
Alexey

