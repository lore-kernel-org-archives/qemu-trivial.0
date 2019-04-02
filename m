Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hBJAl-00050K-HT
	for mharc-qemu-trivial@gnu.org; Tue, 02 Apr 2019 09:09:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36826)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hBJAj-0004y7-2o
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 09:09:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <like.xu@linux.intel.com>) id 1hBJAi-0001X9-3m
	for qemu-trivial@nongnu.org; Tue, 02 Apr 2019 09:09:49 -0400
Received: from mga11.intel.com ([192.55.52.93]:34078)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <like.xu@linux.intel.com>)
	id 1hBJAe-0001Rg-PK; Tue, 02 Apr 2019 09:09:45 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	02 Apr 2019 06:09:43 -0700
X-IronPort-AV: E=Sophos;i="5.60,300,1549958400"; d="scan'208";a="130785971"
Received: from likexu-mobl1.ccr.corp.intel.com (HELO [10.249.170.174])
	([10.249.170.174])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/AES128-SHA;
	02 Apr 2019 06:09:41 -0700
To: Markus Armbruster <armbru@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>
References: <1554194900-22817-1-git-send-email-like.xu@linux.intel.com>
	<871s2kejg1.fsf@dusky.pond.sub.org>
From: Like Xu <like.xu@linux.intel.com>
Organization: Intel OTC
Message-ID: <e72befe5-c931-5c80-6769-12e1a8e7d4fa@linux.intel.com>
Date: Tue, 2 Apr 2019 21:09:39 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <871s2kejg1.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.93
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
X-List-Received-Date: Tue, 02 Apr 2019 13:09:50 -0000

On 2019/4/2 19:27, Markus Armbruster wrote:
> Like Xu <like.xu@linux.intel.com> writes:
> 
>> This patch makes the remaining dozen or so uses of the global
>> current_machine outside vl.c use qdev_get_machine() instead,
>> and then make current_machine local to vl.c instead of global.
>>
>> Signed-off-by: Like Xu <like.xu@linux.intel.com>
> 
> You effectively replace
> 
>      current_machine
> 
> by
> 
>      MACHINE(qdev_get_machine())
> 
> qdev_get_machine() uses container_get(), which has a side effect: any
> path component that doesn't exist already gets created as "container"
> object.  In case of qdev_get_machine(), that's just "/machine".
> 
> Creating "/machine" as "container" is of course wrong.  You therefore
> must not use qdev_get_machine() before main() creates "/machine".  It
> does like this:
> 
>      object_property_add_child(object_get_root(), "machine",
>                                OBJECT(current_machine), &error_abort);
> 
> I recently had several cases of code rearrangements explode because the
> reordered code called qdev_get_machine() too early.  Makes me rather
> skeptical about this patch.  To be frank, I consider qdev_get_machine()
> a trap for the unwary.  container_get(), too.
> 
> If we decide using it to make current_machine static a good idea anyway,
> we need to check the new uses carefully to make sure they can't run
> before main() creates "/machine".
> 
> 

Thanks for your comments and this issue may not exist in this patch.

I am curious when and where we would call qdev_get_machine() before 
main() initializes current_machine and adds it to QOM store which is
called very early.

