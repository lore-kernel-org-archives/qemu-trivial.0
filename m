Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1daaWI-0004xN-HT
	for mharc-qemu-trivial@gnu.org; Thu, 27 Jul 2017 00:35:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daaWG-0004wN-47
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 00:35:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daaWF-00065P-AA
	for qemu-trivial@nongnu.org; Thu, 27 Jul 2017 00:35:28 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:36630)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1daaW9-00061N-GX; Thu, 27 Jul 2017 00:35:21 -0400
Received: by mail-qt0-x243.google.com with SMTP id c15so3641347qta.3;
	Wed, 26 Jul 2017 21:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=CBeWXhPoUgEE2cG2cSOb1640F20vdBd1DBOifQZfmQ4=;
	b=F30OKnQWu4zdJZpX+VtgOOlzYZAo8C5cHCMREbdp740AQPZ3ZZyKBgqiR2vpWf/LSp
	eA/OmGir4Z+TqRDZVq0nNmgsZ+tLzhfYU0go/mtO0507jYSvFVRBCitBDJuKIw2RJ8vY
	tFClSkcFQXhV+TDQSiVTlkwFwhtNGDZsQ5ESoekTYRdZeZsOmhT5V3BT682W43cW40dc
	/jhw3haKJyKPXQ5Ul7/GWtGV04Ylbe79/ptbH99nOVr/u63vlWs+l0b4QK8hKKPmt9Jg
	WcHL51w6T8AFhyeP7VNuJi30tJowZT9PNzSqJjlCS9cen8I3zAjmklWUSn/Hg+KDlTjn
	UtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=CBeWXhPoUgEE2cG2cSOb1640F20vdBd1DBOifQZfmQ4=;
	b=RM3YAKF2EMY75xrc21jeiCZ9ubwc6pDn2Knkoyk1/Yu85YJdt14Qjf5Vh2sqo4HSs3
	UY8BEIA9awRN05+A6mwnSiH+z467qUKcLdGuEwnIMG3CwSi49CmAmbY9pwaCENNq7gJp
	1Uo7d5BPGoFHeKU0yC6L61SmC4IReMHeGIFhTXxKp35NAomEx8sL69r8ZUCsP3UDY7st
	xjUkEiMAjp5x0pIjGT6Qv5aI3WSjXNfgEnQcM5GBq1L8PyTsrGEbacAbFoxDUFA6jvgo
	ONOxtUbwmPIL9i8L8sfTLBvVjOEbE8SU+0kOeZiP8EADKMItYhs2gIisd5n0mmIZKdRC
	QHww==
X-Gm-Message-State: AIVw112RtFLws0RYGZu3I0QWs9LCyAd1bVftAyvrd1X65Z+zyaabJEG4
	ycYnFNHKL6k2zuGqoHNTpA==
X-Received: by 10.237.37.244 with SMTP id y49mr4087319qtc.313.1501130120373;
	Wed, 26 Jul 2017 21:35:20 -0700 (PDT)
Received: from [192.168.1.10] ([138.117.48.223])
	by smtp.gmail.com with ESMTPSA id
	v66sm15137051qkg.72.2017.07.26.21.35.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 26 Jul 2017 21:35:18 -0700 (PDT)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
	<philippe.mathieu.daude@gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
	Alexander Graf <agraf@suse.de>, qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org, qemu-ppc@nongnu.org
References: <20170727024224.22900-1-f4bug@amsat.org>
	<20170727024224.22900-19-f4bug@amsat.org>
	<20170727034304.GJ8978@umbus.fritz.box>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <299bd55b-5192-69d8-f15f-c55518fdeefe@amsat.org>
Date: Thu, 27 Jul 2017 01:35:14 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170727034304.GJ8978@umbus.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [PATCH for 2.10 v2 19/20] spapr_vio: fix
 overflow of qdevs in spapr_dt_vdevice()
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
X-List-Received-Date: Thu, 27 Jul 2017 04:35:29 -0000

On 07/27/2017 12:43 AM, David Gibson wrote:
> On Wed, Jul 26, 2017 at 11:42:23PM -0300, Philippe Mathieu-Daudé wrote:
>> sizeof(ptr) was used instead of sizeof(struct)...
>>
>> also use g_malloc_n() which take care of possible type overflow.
>>
>> hw/ppc/spapr_vio.c:641:22: warning: The code calls sizeof() on a pointer type. This can produce an unexpected result
>>      qdevs = g_malloc(sizeof(qdev) * num);
>>                       ^     ~~~~~~
>> hw/ppc/spapr_vio.c:648:23: warning: The code calls sizeof() on a pointer type. This can produce an unexpected result
>>      qsort(qdevs, num, sizeof(qdev), compare_reg);
>>                        ^     ~~~~~~
>>
>> Reported-by: Clang Static Analyzer
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Nack.
> 
> Have a closer look, what's going in the array really is pointers, not
> structures.  This is a false warning from clang, we need to find a
> different way to suppress it.

Something was bothering me with that patch, wondering why it never 
explode previously, now I see/understand.

>> ---
>>   hw/ppc/spapr_vio.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/ppc/spapr_vio.c b/hw/ppc/spapr_vio.c
>> index ea3bc8bd9e..9991b44c9f 100644
>> --- a/hw/ppc/spapr_vio.c
>> +++ b/hw/ppc/spapr_vio.c
>> @@ -638,14 +638,14 @@ void spapr_dt_vdevice(VIOsPAPRBus *bus, void *fdt)
>>       }
>>   
>>       /* Copy out into an array of pointers */

/ashamed the comment was in front of me...

Thank you David for the review!

Phil.

>> -    qdevs = g_malloc(sizeof(qdev) * num);
>> +    qdevs = g_malloc_n(num, sizeof(*qdev));
>>       num = 0;
>>       QTAILQ_FOREACH(kid, &bus->bus.children, sibling) {
>>           qdevs[num++] = kid->child;
>>       }
>>   
>>       /* Sort the array */
>> -    qsort(qdevs, num, sizeof(qdev), compare_reg);
>> +    qsort(qdevs, num, sizeof(*qdev), compare_reg);
>>   
>>       /* Hack alert. Give the devices to libfdt in reverse order, we happen
>>        * to know that will mean they are in forward order in the tree. */
> 

