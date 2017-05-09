Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d7tQf-0007Jq-Pe
	for mharc-qemu-trivial@gnu.org; Mon, 08 May 2017 20:55:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36094)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7tQd-0007IR-8r
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 20:55:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7tQa-0008Uv-7v
	for qemu-trivial@nongnu.org; Mon, 08 May 2017 20:55:03 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:33971)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d7tQa-0008TL-3f; Mon, 08 May 2017 20:55:00 -0400
Received: by mail-qt0-x243.google.com with SMTP id l39so11857274qtb.1;
	Mon, 08 May 2017 17:54:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding;
	bh=WWVAuczsDVAbBxU6oM74PVKPyFZ6+f0OELfiu7DcM90=;
	b=NLpkTLh/tvH6KAsll+exlYo+7rxhY2+qDmRWtaow97q5BHWfVihETZrg0VRL+C9kxC
	QogCAa8JnTJWftYkqPgYqJU6JjI3x9UAqOsHJhScKrQX91IMLkeCof9pVZlIObPeiVBU
	jVo+AajHUC/RmAlXym1THdtEh/gKrKjC8rTYBSwRN96T8iKpfhltbgju+F/7wsUvYKhx
	e/TMfmxC31Wuvp0qiBjT9ETIoNUalUf2ViofODWkDQJj7PwBXN5P8fWnsOOKLOED9Dy4
	tjAUAZLCR0Fn8C/6yPIUBrwc5sdHPCEPSiOpT98p1XSmAvQfpv6Lc8KB7OdLWoye2zRF
	LalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding;
	bh=WWVAuczsDVAbBxU6oM74PVKPyFZ6+f0OELfiu7DcM90=;
	b=pWDJ1iVdwoOmrIuL2AqaB/irEhi3nr3iWYYywOPM4olkClAA+cLzVOzWjDdrRXCnz0
	mmmF9d4+o73UAzObylkt1tO9vqAZgBI56XEWQUswgH/KkLUo6VTu0Q2aCcKIl4KOZ/nv
	KUkiX4vieZv6C1eyX47pManhBb5i6GvEkShwNptNvQYuLIfPRalY7OaoYqJOhT82Y29n
	sGP/XrazmcYKbtU7JrFyyA3zZk2YGwgpS0o/C+X8jHwgb/BbbRkWfjcmXqiuzO8dNYgX
	85AtIkgvHf6HSiIIf3T4DaSjQvB6OVr6XQIImSPvN0c0jnEznGmaFUczVZoX9mXSPcFY
	P3Pg==
X-Gm-Message-State: AODbwcDtHch8zSwfsMqjmvIuCIwyhv5pUCcduZo0tjkaLJvSrUUpaF7o
	7KcWu2F9lQk8gA==
X-Received: by 10.237.44.129 with SMTP id g1mr17934907qtd.212.1494291299391;
	Mon, 08 May 2017 17:54:59 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	x27sm8071835qtb.54.2017.05.08.17.54.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 May 2017 17:54:58 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
	Artyom Tarasenko <atar4qemu@gmail.com>
References: <20170508233918.9043-1-f4bug@amsat.org>
	<20170508233918.9043-10-f4bug@amsat.org>
	<b0c4d068-3bc1-3611-df36-0f76b7717856@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4eea3d1f-c7f9-1465-4287-196bdcc90e40@amsat.org>
Date: Mon, 8 May 2017 21:54:56 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <b0c4d068-3bc1-3611-df36-0f76b7717856@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 09/11] target/sparc: fix
 DEBUG_MMU DPRINTF() arguments
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
X-List-Received-Date: Tue, 09 May 2017 00:55:04 -0000

On 05/08/2017 09:00 PM, Eric Blake wrote:
> On 05/08/2017 06:39 PM, Philippe Mathieu-Daudé wrote:
>> invalid since 96df2bc99f9
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>  target/sparc/ldst_helper.c | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/sparc/ldst_helper.c b/target/sparc/ldst_helper.c
>> index 57968d9143..aa83a49a88 100644
>> --- a/target/sparc/ldst_helper.c
>> +++ b/target/sparc/ldst_helper.c
>> @@ -1631,7 +1631,7 @@ void helper_st_asi(CPUSPARCState *env, target_ulong addr, target_ulong val,
>>
>>              if (oldreg != env->immu.mmuregs[reg]) {
>>                  DPRINTF_MMU("immu change reg[%d]: 0x%016" PRIx64 " -> 0x%016"
>> -                            PRIx64 "\n", reg, oldreg, env->immuregs[reg]);
>> +                            PRIx64 "\n", reg, oldreg, env->immu.mmuregs[reg]);
>
> Please take this opportunity to fix the broken definitions of
> DPRINTF_MMU() and friends so that they don't bit-rot when not defined.
> There are plenty of other examples of re-writing broken #defines to
> instead favor an if (0) { printf(...) } to benefit from -Wformat
> checking even when the debugging is disabled.

Sure, will do it.


