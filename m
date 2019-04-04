Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBx0W-000891-RO
	for mharc-qemu-trivial@gnu.org; Thu, 04 Apr 2019 03:41:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45506)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hBx0U-00087y-H0
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 03:41:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hBx0T-0004RX-J5
	for qemu-trivial@nongnu.org; Thu, 04 Apr 2019 03:41:54 -0400
Received: from mga07.intel.com ([134.134.136.100]:15073)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1hBx0Q-00047K-N0; Thu, 04 Apr 2019 03:41:51 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2019 00:41:44 -0700
X-IronPort-AV: E=Sophos;i="5.60,306,1549958400"; d="scan'208";a="131355870"
Received: from likexu-mobl1.ccr.corp.intel.com (HELO [10.239.196.104])
	([10.239.196.104])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES128-SHA;
	04 Apr 2019 00:41:42 -0700
To: Markus Armbruster <armbru@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <1554194900-22817-1-git-send-email-like.xu@linux.intel.com>
	<871s2kejg1.fsf@dusky.pond.sub.org>
	<e72befe5-c931-5c80-6769-12e1a8e7d4fa@linux.intel.com>
	<20190402174749.71da1efe@redhat.com>
	<871s2k8jxo.fsf@dusky.pond.sub.org>
From: Like Xu <like.xu@linux.intel.com>
Organization: Intel OTC
Message-ID: <7e76d718-54fe-72b9-27b5-68f239859868@linux.intel.com>
Date: Thu, 4 Apr 2019 15:41:40 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <871s2k8jxo.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.100
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] vl.c: make
 current_machine as non-global variable
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
X-List-Received-Date: Thu, 04 Apr 2019 07:41:55 -0000

On 2019/4/3 0:13, Markus Armbruster wrote:
> Igor Mammedov <imammedo@redhat.com> writes:
> 
>> On Tue, 2 Apr 2019 21:09:39 +0800
>> Like Xu <like.xu@linux.intel.com> wrote:
>>
>>> On 2019/4/2 19:27, Markus Armbruster wrote:
>>>> Like Xu <like.xu@linux.intel.com> writes:
>>>>    
>>>>> This patch makes the remaining dozen or so uses of the global
>>>>> current_machine outside vl.c use qdev_get_machine() instead,
>>>>> and then make current_machine local to vl.c instead of global.
>>>>>
>>>>> Signed-off-by: Like Xu <like.xu@linux.intel.com>
>>>>
>>>> You effectively replace
>>>>
>>>>       current_machine
>>>>
>>>> by
>>>>
>>>>       MACHINE(qdev_get_machine())
>>>>
>>>> qdev_get_machine() uses container_get(), which has a side effect: any
>>>> path component that doesn't exist already gets created as "container"
>>>> object.  In case of qdev_get_machine(), that's just "/machine".
>>>>
>>>> Creating "/machine" as "container" is of course wrong.  You therefore
>>>> must not use qdev_get_machine() before main() creates "/machine".  It
>>>> does like this:
>>>>
>>>>       object_property_add_child(object_get_root(), "machine",
>>>>                                 OBJECT(current_machine), &error_abort);
>>>>
>>>> I recently had several cases of code rearrangements explode because the
>>>> reordered code called qdev_get_machine() too early.  Makes me rather
>>>> skeptical about this patch.  To be frank, I consider qdev_get_machine()
>>>> a trap for the unwary.  container_get(), too.
>>>>
>>>> If we decide using it to make current_machine static a good idea anyway,
>>>> we need to check the new uses carefully to make sure they can't run
>>>> before main() creates "/machine".
>>
>> maybe we can assert in qdev_get_machine() if machine hasn't been created yet?
>> with this at least it will be hard to misuse function or catch invalid users.
>> (but it still might miss some use cases/CLI options which are not tested)
> 
> Good idea.  When my code created "/machine" as a container, debugging
> the resulting crash took me a bit of time.  The assertion you propose
> would've saved me some.
> 
> 

Good idea and please help review if this assertion in qdev_get_machine() 
could help for your code rearrangement:

       if (dev == NULL) {
           dev = container_get(object_get_root(), "/machine");
       }

+     assert(object_dynamic_cast(dev, TYPE_MACHINE) != NULL);
       return dev;

