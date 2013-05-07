Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UZizK-0008V9-9H
	for mharc-qemu-trivial@gnu.org; Tue, 07 May 2013 10:35:30 -0400
Received: from eggs.gnu.org ([208.118.235.92]:35709)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UZizD-0008TV-Er
	for qemu-trivial@nongnu.org; Tue, 07 May 2013 10:35:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1UZiz8-0004OX-MW
	for qemu-trivial@nongnu.org; Tue, 07 May 2013 10:35:23 -0400
Received: from mail-ye0-f169.google.com ([209.85.213.169]:48050)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1UZiz8-0004OP-Ib; Tue, 07 May 2013 10:35:18 -0400
Received: by mail-ye0-f169.google.com with SMTP id m3so132209yen.0
	for <multiple recipients>; Tue, 07 May 2013 07:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:message-id:date:from:user-agent:mime-version:to
	:cc:subject:references:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=EgPKBXjnBBp+bW3W4RtWOXBiNz6Xf6Wm/zOG4qR06Jk=;
	b=DUz2mGXhx7l3eGMnCAgcTK0Vf56kXEwscgnjvREB0gcqkE2frr1gj/BbWcMWrWQIF+
	NG6bbvrw9zHI3d4di5WB0q6YPIypj+T4rytfO7KdEmGY58uUKXUquIT9oZ2SrUZhQ7S+
	QbTHcqjx2YEBnu2GakHtr42ie2hSmk56rt822hUXdYa1DeuaJoz8J29lpXL3rNkQ2igA
	amA9ZRpiXo8mo00OWWoNH9SwYY/sqgTKnyGttB+Shq++aojJIPlJCL4pWyH1BGvW4Lt7
	wW3VuujDXfKLsz8NrGL9i6cHOVw+qqcXx/scP3+taZTM4yP6Ns8SSfxNSkUHd+/FQC7X
	1r8g==
X-Received: by 10.236.164.74 with SMTP id b50mr2144247yhl.1.1367937318006;
	Tue, 07 May 2013 07:35:18 -0700 (PDT)
Received: from yakj.usersys.redhat.com (93-34-176-20.ip50.fastwebnet.it.
	[93.34.176.20])
	by mx.google.com with ESMTPSA id i75sm56092880yhi.9.2013.05.07.07.35.15
	for <multiple recipients>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Tue, 07 May 2013 07:35:16 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5189111B.1090308@redhat.com>
Date: Tue, 07 May 2013 16:35:07 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130311 Thunderbird/17.0.4
MIME-Version: 1.0
To: Jan Kiszka <jan.kiszka@siemens.com>
References: <5187D529.7010502@siemens.com> <5187D9A6.6050807@redhat.com>
	<51890D04.7030102@siemens.com>
In-Reply-To: <51890D04.7030102@siemens.com>
X-Enigmail-Version: 1.5.1
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.213.169
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
X-List-Received-Date: Tue, 07 May 2013 14:35:28 -0000

Il 07/05/2013 16:17, Jan Kiszka ha scritto:
> On 2013-05-06 18:26, Paolo Bonzini wrote:
>> Il 06/05/2013 18:07, Jan Kiszka ha scritto:
>>> Improves readability.
>>>
>>> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>>> ---
>>>  translate-all.c |    2 +-
>>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>>
>>> diff --git a/translate-all.c b/translate-all.c
>>> index da93608..0d84b0d 100644
>>> --- a/translate-all.c
>>> +++ b/translate-all.c
>>> @@ -1359,7 +1359,7 @@ void tb_invalidate_phys_addr(hwaddr addr)
>>>      section = phys_page_find(address_space_memory.dispatch,
>>>                               addr >> TARGET_PAGE_BITS);
>>>      if (!(memory_region_is_ram(section->mr)
>>> -          || (section->mr->rom_device && section->mr->readable))) {
>>> +          || memory_region_is_romd(section->mr))) {
>>>          return;
>>>      }
>>>      ram_addr = (memory_region_get_ram_addr(section->mr) & TARGET_PAGE_MASK)
>>>
>>
>> Not trivial enough for qemu-trivial, let's open a memory branch for 1.6.
> 
> Great, thanks.
> 
>>
>> Any volunteers for co-maintaining it? :)
> 
> Raising my hand, but not without remarking that I have some bandwidth
> issue ATM. But I will try my best.

Ok, the model we've been using for migration is that there is a pool of
people that send pull requests without being official maintainers---the
contract with Anthony is simply that patches are well reviewed.

For now I've repurposed my iommu branch as the WIP 1.6 memory branch;
It can still be rebased, but the changes should be small at this point.
 I will pass the ball after sending the first 1.6 pull request.

Paolo


