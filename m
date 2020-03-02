Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1j8a2Q-0003IX-Ez
	for mharc-qemu-trivial@gnu.org; Sun, 01 Mar 2020 20:38:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52239)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <Colin.Xu@intel.com>) id 1j8a2K-0003IM-4t
 for qemu-trivial@nongnu.org; Sun, 01 Mar 2020 20:38:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Colin.Xu@intel.com>) id 1j8a2I-0002e6-1T
 for qemu-trivial@nongnu.org; Sun, 01 Mar 2020 20:38:23 -0500
Received: from mga05.intel.com ([192.55.52.43]:23348)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <Colin.Xu@intel.com>)
 id 1j8a2H-0002ae-Ou; Sun, 01 Mar 2020 20:38:21 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 01 Mar 2020 17:38:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,506,1574150400"; d="scan'208";a="386114239"
Received: from unknown (HELO [10.239.160.52]) ([10.239.160.52])
 by orsmga004.jf.intel.com with ESMTP; 01 Mar 2020 17:38:10 -0800
Reply-To: Colin.Xu@intel.com
Subject: Re: [PATCH V2] MAINTAINERS: Add entry for Guest X86 HAXM CPUs
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 philmd@redhat.com
Cc: wenchao.wang@intel.com, hang.yuan@intel.com, qemu-trivial@nongnu.org
References: <20200228012046.6629-1-colin.xu@intel.com>
 <9c32d7c2-d8af-45c6-4578-34c79bd7a2a0@redhat.com>
From: Colin Xu <Colin.Xu@intel.com>
Message-ID: <e6db0da6-6e18-cb9e-1fce-f4de4bb82e8a@intel.com>
Date: Mon, 2 Mar 2020 09:38:09 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <9c32d7c2-d8af-45c6-4578-34c79bd7a2a0@redhat.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.55.52.43
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 02 Mar 2020 01:38:25 -0000


On 2020-02-28 19:00, Paolo Bonzini wrote:
> On 28/02/20 02:20, Colin Xu wrote:
>> HAXM covers below files:
>> include/sysemu/hax.h
>> target/i386/hax-*
>>
>> V2: Add HAXM github page for wiki and issue tracking.
>>
>> Cc: Wenchao Wang <wenchao.wang@intel.com>
>> Cc: Hang Yuan <hang.yuan@intel.com>
>> Reviewed-by: Hang Yuan <hang.yuan@intel.com>
>> Signed-off-by: Colin Xu <colin.xu@intel.com>
>> ---
>>   MAINTAINERS | 11 +++++++++++
>>   1 file changed, 11 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index df1786db3207..c45f1421eab5 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -435,6 +435,17 @@ F: include/hw/block/dataplane/xen*
>>   F: include/hw/xen/
>>   F: include/sysemu/xen-mapcache.h
>>   
>> +Guest CPU Cores (HAXM)
>> +---------------------
>> +X86 HAXM CPUs
>> +M: Wenchao Wang <wenchao.wang@intel.com>
>> +M: Colin Xu <colin.xu@intel.com>
>> +L: haxm-team@intel.com
>> +W: https://github.com/intel/haxm/issues
>> +S: Maintained
>> +F: include/sysemu/hax.h
>> +F: target/i386/hax-*
>> +
>>   Hosts
>>   -----
>>   LINUX
>>
> Queued, thanks.
>
> Paolo
Thanks a lot!

-- 
Best Regards,
Colin Xu


