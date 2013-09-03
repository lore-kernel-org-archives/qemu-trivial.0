Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VGsdl-0002js-0p
	for mharc-qemu-trivial@gnu.org; Tue, 03 Sep 2013 11:35:37 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VGsdd-0002fB-RV
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 11:35:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VGsdY-0005Jo-1Q
	for qemu-trivial@nongnu.org; Tue, 03 Sep 2013 11:35:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60315)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1VGsdN-0005IU-PV; Tue, 03 Sep 2013 11:35:13 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r83FZAFT028524
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Tue, 3 Sep 2013 11:35:10 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-53.ams2.redhat.com
	[10.36.112.53])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id r83FZ5bs023708; Tue, 3 Sep 2013 11:35:06 -0400
Message-ID: <522601AB.1050901@redhat.com>
Date: Tue, 03 Sep 2013 17:35:07 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Alexey Kardashevskiy <aik@ozlabs.ru>
References: <1378196857-27541-1-git-send-email-aik@ozlabs.ru>
	<CAFEAcA8Jp=SQsC3RpxahF1RFRtX2nHOS2690XiT9Jnpn0jGk_g@mail.gmail.com>
	<5225AC9A.2090601@ozlabs.ru> <5225BD32.8030001@siemens.com>
	<52260025.3050704@ozlabs.ru>
In-Reply-To: <52260025.3050704@ozlabs.ru>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=KOI8-R
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: Peter Maydell <peter.maydell@linaro.org>, kvm-devel <kvm@vger.kernel.org>,
	Gleb Natapov <gleb@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>,
	Jan Kiszka <jan.kiszka@siemens.com>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>
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
X-List-Received-Date: Tue, 03 Sep 2013 15:35:35 -0000

Il 03/09/2013 17:28, Alexey Kardashevskiy ha scritto:
> On 09/03/2013 08:42 PM, Jan Kiszka wrote:
>> On 2013-09-03 11:32, Alexey Kardashevskiy wrote:
>>> On 09/03/2013 07:29 PM, Peter Maydell wrote:
>>>> On 3 September 2013 09:27, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>>>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>>>> ---
>>>>>
>>>>> I need this update as VFIO on PPC64/pseries got in upstream kernel
>>>>> and this is required by VFIO-SPAPR bits in QEMU. Others may find this
>>>>> update useful too :)
>>>>> ---
>>>>>  linux-headers/asm-arm64/kvm.h       | 168 ++++++++++++++++++++++++++++++++++++
>>>>>  linux-headers/asm-arm64/kvm_para.h  |   1 +
>>>>>  linux-headers/asm-mips/kvm.h        |  81 +++++++++--------
>>>>>  linux-headers/linux/kvm.h           |   3 +
>>>>>  linux-headers/linux/vfio.h          |  42 ++++++++-
>>>>>  linux-headers/linux/virtio_config.h |   3 +
>>>>>  6 files changed, 254 insertions(+), 44 deletions(-)
>>>>>  create mode 100644 linux-headers/asm-arm64/kvm.h
>>>>>  create mode 100644 linux-headers/asm-arm64/kvm_para.h
>>>>
>>>> I think this should go in via the KVM tree, not trivial.
>>>
>>> I do not mind, it just went through the trivial tree last time, that's it.
>>
>> This shouldn't be routed through trivial in general as things broke too
>> often in this area.
> 
> Sorry for my ignorance, but this is The Kernel, it is already there, broken
> or not, even if it is broken, qemu cannot stay isolated, no?
> This is a mechanical change, no more.

It's a matter of keeping things bisectable.  If we can detect a
breakage, we can first work around it, and then apply the header update.
 And if we don't detect it, maintainers usually send pull requests when
they have time to work on breakage caused by their patches.

Paolo

