Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hAmMF-0003FB-4Q
	for mharc-qemu-trivial@gnu.org; Sun, 31 Mar 2019 22:07:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59036)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hAmMD-0003Eo-BC
	for qemu-trivial@nongnu.org; Sun, 31 Mar 2019 22:07:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hAmMC-0003X3-H6
	for qemu-trivial@nongnu.org; Sun, 31 Mar 2019 22:07:29 -0400
Received: from mga02.intel.com ([134.134.136.20]:16862)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1hAmMC-0003LO-7J; Sun, 31 Mar 2019 22:07:28 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	31 Mar 2019 19:07:20 -0700
X-IronPort-AV: E=Sophos;i="5.60,294,1549958400"; d="scan'208";a="131806755"
Received: from likexu-mobl1.ccr.corp.intel.com (HELO [10.239.196.174])
	([10.239.196.174])
	by orsmga006-auth.jf.intel.com with ESMTP/TLS/AES128-SHA;
	31 Mar 2019 19:07:18 -0700
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, like.xu@intel.com,
	Igor Mammedov <imammedo@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <1553849325-44201-1-git-send-email-like.xu@linux.intel.com>
	<1553849325-44201-2-git-send-email-like.xu@linux.intel.com>
	<87imw2uja5.fsf@zen.linaroharston>
From: Like Xu <like.xu@linux.intel.com>
Organization: Intel OTC
Message-ID: <d7634837-54d4-dcf1-4b55-1f8602e236de@linux.intel.com>
Date: Mon, 1 Apr 2019 10:07:17 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87imw2uja5.fsf@zen.linaroharston>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.20
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/9] cpu/topology: add
 struct CpuTopology to MachineState
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
X-List-Received-Date: Mon, 01 Apr 2019 02:07:30 -0000

On 2019/3/29 17:22, Alex Bennée wrote:
> 
> Like Xu <like.xu@linux.intel.com> writes:
> 
>> Signed-off-by: Like Xu <like.xu@linux.intel.com>
>> ---
>>   include/hw/arm/virt.h   | 2 +-
>>   include/hw/boards.h     | 8 ++++++++
>>   include/sysemu/sysemu.h | 2 +-
>>   vl.c                    | 7 ++++++-
>>   4 files changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
>> index 507517c..724da0c 100644
>> --- a/include/hw/arm/virt.h
>> +++ b/include/hw/arm/virt.h
>> @@ -123,7 +123,7 @@ typedef struct {
>>       struct arm_boot_info bootinfo;
>>       MemMapEntry *memmap;
>>       const int *irqmap;
>> -    int smp_cpus;
>> +    unsigned int smp_cpus;
> 
> This seem unrelated to the rest of the change.
Just by the way to keep structural consistency.
> 
>>       void *fdt;
>>       int fdt_size;
> <snip>
>> diff --git a/include/sysemu/sysemu.h b/include/sysemu/sysemu.h
>> index 6065d9e..c0d7d7c 100644
>> --- a/include/sysemu/sysemu.h
>> +++ b/include/sysemu/sysemu.h
>> @@ -100,7 +100,7 @@ extern const char *keyboard_layout;
>>   extern int win2k_install_hack;
>>   extern int alt_grab;
>>   extern int ctrl_grab;
>> -extern int smp_cpus;
>> +extern unsigned int smp_cpus;
> 
> Along with this. Is this meant to align with what is currently defined
> as smp_cpus in vl.c? Maybe these changes should be rolled together with
> that before the patch to introduce the new topology structure?
At that time (just patch 1/9 is applied), it's align with what is
defined as smp_cpus in vl.c and these exposed smp variables would be
removed in an appropriate way after machine properties is fully enabled.

> 
> --
> Alex Bennée
> 
> 


