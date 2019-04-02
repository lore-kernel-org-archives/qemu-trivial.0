Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hB9P3-0003K3-Fu
	for mharc-qemu-trivial@gnu.org; Mon, 01 Apr 2019 22:43:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50048)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hB9P0-0003A9-KQ
	for qemu-trivial@nongnu.org; Mon, 01 Apr 2019 22:43:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hB9H9-0007Gm-Vw
	for qemu-trivial@nongnu.org; Mon, 01 Apr 2019 22:35:49 -0400
Received: from mga05.intel.com ([192.55.52.43]:6170)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1hB9H9-000770-2p; Mon, 01 Apr 2019 22:35:47 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	01 Apr 2019 19:35:34 -0700
X-IronPort-AV: E=Sophos;i="5.60,298,1549958400"; d="scan'208";a="130649729"
Received: from likexu-mobl1.ccr.corp.intel.com (HELO [10.239.196.69])
	([10.239.196.69])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES128-SHA;
	01 Apr 2019 19:35:32 -0700
To: Eduardo Habkost <ehabkost@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, like.xu@intel.com,
	Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
	<1553849325-44201-5-git-send-email-like.xu@linux.intel.com>
	<87h8bmuj2d.fsf@zen.linaroharston>
	<2546bf3e-2009-5a76-bc63-0ad73d333a78@linux.intel.com>
	<20190401233818.GA22884@habkost.net>
From: Like Xu <like.xu@linux.intel.com>
Organization: Intel OTC
Message-ID: <965d5d2f-1717-dcd0-8707-f6629f54e504@linux.intel.com>
Date: Tue, 2 Apr 2019 10:35:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190401233818.GA22884@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.43
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
X-List-Received-Date: Tue, 02 Apr 2019 02:43:55 -0000

On 2019/4/2 7:38, Eduardo Habkost wrote:
> On Mon, Apr 01, 2019 at 10:56:30AM +0800, Like Xu wrote:
>> On 2019/3/29 17:27, Alex Bennée wrote:
> [...]
>>>> @@ -1713,6 +1717,9 @@ static void cortex_a9_initfn(Object *obj)
>>>>    #ifndef CONFIG_USER_ONLY
>>>>    static uint64_t a15_l2ctlr_read(CPUARMState *env, const ARMCPRegInfo *ri)
>>>>    {
>>>> +    MachineState *ms = MACHINE(qdev_get_machine());
>>>
>>> How expensive is qdev_get_machine? This could potentially be a
>>> performance issue if this register is read a lot.
>>
>> It may not bother us cause the MachineState object would be feteched from
>> qemu QOM at its first requested time and save it as static variable for
>> incoming requests.
> 
> We already have a current_machine variable declared in
> include/hw/boards.h.  We normally avoid using it and use
> MACHINE(qdev_get_machine()) instead, but I never understood why.
>
Which one do you prefer to access smp machine properties?

