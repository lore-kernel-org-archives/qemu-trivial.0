Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UZiqd-0000Qa-9K
	for mharc-qemu-trivial@gnu.org; Tue, 07 May 2013 10:26:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:59938)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1UZiqW-0000Gw-3a
	for qemu-trivial@nongnu.org; Tue, 07 May 2013 10:26:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1UZiqR-0000WS-1z
	for qemu-trivial@nongnu.org; Tue, 07 May 2013 10:26:24 -0400
Received: from david.siemens.de ([192.35.17.14]:17718)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1UZii6-0005lF-Of; Tue, 07 May 2013 10:17:43 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.13.6/8.13.6) with ESMTP id r47EHepP016986;
	Tue, 7 May 2013 16:17:40 +0200
Received: from mchn199C.mchp.siemens.de ([139.25.109.49])
	by mail1.siemens.de (8.13.6/8.13.6) with ESMTP id r47EHeiH030312;
	Tue, 7 May 2013 16:17:40 +0200
Message-ID: <51890D04.7030102@siemens.com>
Date: Tue, 07 May 2013 16:17:40 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Paolo Bonzini <pbonzini@redhat.com>
References: <5187D529.7010502@siemens.com> <5187D9A6.6050807@redhat.com>
In-Reply-To: <5187D9A6.6050807@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 192.35.17.14
Cc: qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] memory: Replace open-coded
	memory_region_is_romd
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
X-List-Received-Date: Tue, 07 May 2013 14:26:29 -0000

On 2013-05-06 18:26, Paolo Bonzini wrote:
> Il 06/05/2013 18:07, Jan Kiszka ha scritto:
>> Improves readability.
>>
>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>> ---
>>  translate-all.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/translate-all.c b/translate-all.c
>> index da93608..0d84b0d 100644
>> --- a/translate-all.c
>> +++ b/translate-all.c
>> @@ -1359,7 +1359,7 @@ void tb_invalidate_phys_addr(hwaddr addr)
>>      section = phys_page_find(address_space_memory.dispatch,
>>                               addr >> TARGET_PAGE_BITS);
>>      if (!(memory_region_is_ram(section->mr)
>> -          || (section->mr->rom_device && section->mr->readable))) {
>> +          || memory_region_is_romd(section->mr))) {
>>          return;
>>      }
>>      ram_addr = (memory_region_get_ram_addr(section->mr) & TARGET_PAGE_MASK)
>>
> 
> Not trivial enough for qemu-trivial, let's open a memory branch for 1.6.

Great, thanks.

> 
> Any volunteers for co-maintaining it? :)

Raising my hand, but not without remarking that I have some bandwidth
issue ATM. But I will try my best.

Jan

-- 
Siemens AG, Corporate Technology, CT RTC ITP SDP-DE
Corporate Competence Center Embedded Linux

