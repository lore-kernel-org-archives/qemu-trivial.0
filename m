Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBBsf-0002jj-5U
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2019 01:22:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54360)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hBBsc-0002j4-Rn
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 01:22:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hBBr0-0006yn-Uk
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 01:20:59 -0400
Received: from mga18.intel.com ([134.134.136.126]:34671)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1hBBr0-0006xF-Jp; Tue, 02 Apr 2019 01:20:58 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Apr 2019 22:20:56 -0700
X-IronPort-AV: E=Sophos;i="5.60,298,1549958400"; d="scan'208";a="130679905"
Received: from likexu-mobl1.ccr.corp.intel.com (HELO [10.239.196.69])
	([10.239.196.69])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES128-SHA;
	01 Apr 2019 22:20:54 -0700
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Eduardo Habkost <ehabkost@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, like.xu@intel.com,
	Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
	<1553849325-44201-5-git-send-email-like.xu@linux.intel.com>
	<87h8bmuj2d.fsf@zen.linaroharston>
	<2546bf3e-2009-5a76-bc63-0ad73d333a78@linux.intel.com>
	<20190401233818.GA22884@habkost.net>
	<965d5d2f-1717-dcd0-8707-f6629f54e504@linux.intel.com>
	<CAFEAcA_i9Te5Gs9GWnqH+JvTPFbp80+n2D=VAoC0e2DS7OfSeg@mail.gmail.com>
From: Like Xu <like.xu@linux.intel.com>
Organization: Intel OTC
Message-ID: <ca73da94-df07-ac0e-67a4-8c9b18b7dc20@linux.intel.com>
Date: Tue, 2 Apr 2019 13:20:51 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_i9Te5Gs9GWnqH+JvTPFbp80+n2D=VAoC0e2DS7OfSeg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.126
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 4/9] cpu/topology: add ARM
 support for smp machine properties
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Apr 2019 05:22:39 -0000

On 2019/4/2 12:45, Peter Maydell wrote:
> On Tue, 2 Apr 2019 at 09:46, Like Xu <like.xu@linux.intel.com> wrote:
>>
>> On 2019/4/2 7:38, Eduardo Habkost wrote:
>>> On Mon, Apr 01, 2019 at 10:56:30AM +0800, Like Xu wrote:
>>>> On 2019/3/29 17:27, Alex Bennée wrote:
>>> [...]
>>>>>> @@ -1713,6 +1717,9 @@ static void cortex_a9_initfn(Object *obj)
>>>>>>     #ifndef CONFIG_USER_ONLY
>>>>>>     static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>>>>>>     {
>>>>>> +    MachineState *ms = MACHINE(qdev_get_machine());
>>>>>
>>>>> How expensive is qdev_get_machine? This could potentially be a
>>>>> performance issue if this register is read a lot.
>>>>
>>>> It may not bother us cause the MachineState object would be feteched from
>>>> qemu QOM at its first requested time and save it as static variable for
>>>> incoming requests.
>>>
>>> We already have a current_machine variable declared in
>>> include/hw/boards.h.  We normally avoid using it and use
>>> MACHINE(qdev_get_machine()) instead, but I never understood why.
>>>
>> Which one do you prefer to access smp machine properties?
> 
> My suggestion would be that we use qdev_get_machine(). I think
> it would be nice to make the remaining dozen or so uses of
> the global current_machine outside vl.c use qdev_get_machine()
> instead, and then make current_machine local to vl.c instead
> of global.
> 
> thanks
> -- PMM
> 
> 
It looks good to me and I am not sure if this refactoring should be 
added in next patch series or as a separate patch.

