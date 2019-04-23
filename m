Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hIqL7-0006Y0-3S
	for mharc-qemu-trivial@gnu.org; Tue, 23 Apr 2019 03:59:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36458)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hIqL4-0006V0-Lb
	for qemu-trivial@nongnu.org; Tue, 23 Apr 2019 03:59:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hIqL3-0000jX-Hl
	for qemu-trivial@nongnu.org; Tue, 23 Apr 2019 03:59:38 -0400
Received: from mga09.intel.com ([134.134.136.24]:15458)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1hIqL3-0000ia-8F; Tue, 23 Apr 2019 03:59:37 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Apr 2019 00:59:34 -0700
X-IronPort-AV: E=Sophos;i="5.60,385,1549958400"; d="scan'208";a="136564696"
Received: from likexu-mobl1.ccr.corp.intel.com (HELO [10.239.196.121])
	([10.239.196.121])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES128-SHA;
	23 Apr 2019 00:59:33 -0700
To: Eduardo Habkost <ehabkost@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
	qemu-trivial@nongnu.org, qemu-devel@nongnu.org, like.xu@intel.com,
	Igor Mammedov <imammedo@redhat.com>
References: <1555315185-16414-1-git-send-email-like.xu@linux.intel.com>
	<1555315185-16414-3-git-send-email-like.xu@linux.intel.com>
	<20190416212003.GB2272@habkost.net> <87ftqh1ae5.fsf@dusky.pond.sub.org>
	<20190417171059.GC25134@habkost.net>
From: Like Xu <like.xu@linux.intel.com>
Organization: Intel OTC
Message-ID: <3fc39df9-9c4e-219c-e7dc-c93754fd1315@linux.intel.com>
Date: Tue, 23 Apr 2019 15:59:31 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190417171059.GC25134@habkost.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.24
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v3 2/2] core/qdev: refactor
 qdev_get_machine() with type assertion
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
X-List-Received-Date: Tue, 23 Apr 2019 07:59:39 -0000

On 2019/4/18 1:10, Eduardo Habkost wrote:
> On Wed, Apr 17, 2019 at 07:14:10AM +0200, Markus Armbruster wrote:
>> Eduardo Habkost <ehabkost@redhat.com> writes:
>>
>>> On Mon, Apr 15, 2019 at 03:59:45PM +0800, Like Xu wrote:
>>>> To avoid the misuse of qdev_get_machine() if machine hasn't been created yet,
>>>> this patch uses qdev_get_machine_uncheck() for obj-common (share with user-only
>>>> mode) and adds type assertion to qdev_get_machine() in system-emulation mode.
>>>>
>>>> Suggested-by: Igor Mammedov <imammedo@redhat.com>
>>>> Signed-off-by: Like Xu <like.xu@linux.intel.com>
>>>
>>> Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>
>>>
>>> I'm queueing the series on machine-next, thanks!
>>
>> Hold your horses, please.
>>
>> I dislike the name qdev_get_machine_uncheck().  I could live with
>> qdev_get_machine_unchecked().
>>
>> However, I doubt this is the right approach.
>>
>> The issue at hand is undisciplined creation of QOM object /machine.
>>
>> This patch adds an asseertion "undisciplined creation of /machine didn't
>> create crap", but only in some places.
>>
>> I think we should never create /machine as (surprising!) side effect of
>> qdev_get_machine().  Create it explicitly instead, and have
>> qdev_get_machine() use object_resolve_path("/machine", NULL) to get it.
>> Look ma, no side effects.
> 
> OK, I'm dropping this one while we discuss it.
> 
> I really miss a good explanation why qdev_get_machine_unchecked()
> needs to exist.  When exactly do we want /machine to exist but
> not be TYPE_MACHINE?  Why?

AFAICT, there is no such "/machine" that is not of type TYPE_MACHINE.

The original qdev_get_machine() would always return a "/container" 
object in user-only mode and there is none TYPE_MACHINE object.

In system emulation mode, it returns the same "/container" object at the 
beginning, until we initialize and add a TYPE_MACHINE object to the 
"/container" as a child and it would return OBJECT(current_machine)
for later usages.

The starting point is to avoid using the legacy qdev_get_machine()
in system emulation mode when we haven't added the "/machine" object.
As a result, we introduced type checking assertions to avoid premature 
invocations.

In this proposal, the qdev_get_machine_unchecked() is only used
in user-only mode, part of which shares with system emulation mode
(such as device_set_realized, cpu_common_realizefn). The new 
qdev_get_machine() is only used in system emulation mode and type 
checking assertion does reduce the irrational use of this function (if 
any in the future).

We all agree to use this qdev_get_machine() as little as possible
and this patch could make future clean up work easier.

> 
> Once the expectations and use cases are explained, we can choose
> a better name for qdev_get_machine_unchecked() and document it
> properly.
> 


