Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e2w13-0006ZU-VE
	for mharc-qemu-trivial@gnu.org; Fri, 13 Oct 2017 05:12:26 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40485)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <atar4qemu@gmail.com>) id 1e2w11-0006Y2-MT
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 05:12:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <atar4qemu@gmail.com>) id 1e2w10-0005fn-Pr
	for qemu-trivial@nongnu.org; Fri, 13 Oct 2017 05:12:23 -0400
Received: from mail-it0-x244.google.com ([2607:f8b0:4001:c0b::244]:49506)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <atar4qemu@gmail.com>)
	id 1e2w0y-0005by-JJ; Fri, 13 Oct 2017 05:12:20 -0400
Received: by mail-it0-x244.google.com with SMTP id y15so10503071ita.4;
	Fri, 13 Oct 2017 02:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=e2dPphCnn1/cFFS+ODzbQ2XyXGQj6FLS7VEWbKwTuNU=;
	b=bJO9EmypdUeQH3ZBUiAx4irU4N4Ea1vNoSkrAIb1Vf3T7CFwu8CDi/NcPKC3wLqjQl
	VLYprtrzA1ZuS0ZyRpJA+N/N362LIFemDaEiUr7ZMeFxBIDzghpX78H94+WyGqVH8bpz
	YRrfhR2V3wM+szEUqMCq6M8iGzV4KG0Kd6xJ2op3EpXo+syULSQi+cUqrjZ5yGL0/Kfw
	AJYWPjSosYIO+SLqKIs7yFRiLiX/jtJ4+U7pg0qHnVOl0EFeO0PHN6l6aCtvIskPc4xc
	fYIT1oNr+jXyGCRP6D+D7IboVoDlyj79oZv2Rssg0KMWKfPk/jigU4yddUY8hgffy9wp
	sZYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=e2dPphCnn1/cFFS+ODzbQ2XyXGQj6FLS7VEWbKwTuNU=;
	b=ugTW9mpQS3ehYcSmFQWCZOyLllAZ/wg/rtEeX1PW5+FnAb/bXbV2ylv6KdEUWFXFup
	MqP4iKUU6dQcjye2n/LMQc5fqSRnyXnTBccIiyWVt7UeiNPGh7QDX40HNYj7DRDkUvVU
	fQIbrOoPgHzm11voMu5vfUfw+Wg1m63E3yIMDFshQzPfEe0z860YJdLaimkoN1xHRUn7
	hRrZWCPbQTSVN4pV9n7tT8x1yHkQROWP/hVKWJL5cOSqzjzvFM/fz0Z6h/0wEjUUMOx3
	n2JXV3Sptu+FSanw4j5IR3h6LUwshLXk+C7IrL7oM8xZqFBkpTCmFrApzNGWXusqDPsr
	6MaA==
X-Gm-Message-State: AMCzsaWJtNSjpi2F7mqi3rfkWCAcySQM0CvrQuNYT0pq2qRmTVHvWnsD
	LvzyWNNuxbvwkK4tayEMJwa7HTLFToyfNAFwU0M=
X-Google-Smtp-Source: ABhQp+Qecn5H0heHJlFMbL9+LSiwlugP6BsoIyDvaG9jX3rgnqUx2nlILF0YiH8vQp8nyN0EWGyV7tWB9c0snxcHRSY=
X-Received: by 10.36.67.75 with SMTP id s72mr1373837itb.12.1507885940024; Fri,
	13 Oct 2017 02:12:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.5.73 with HTTP; Fri, 13 Oct 2017 02:11:59 -0700 (PDT)
In-Reply-To: <00b58d8d-11d2-894a-6e87-f65585435a0b@redhat.com>
References: <20171013085355.7563-1-famz@redhat.com>
	<20171013085355.7563-3-famz@redhat.com>
	<00b58d8d-11d2-894a-6e87-f65585435a0b@redhat.com>
From: Artyom Tarasenko <atar4qemu@gmail.com>
Date: Fri, 13 Oct 2017 11:11:59 +0200
Message-ID: <CACXAS8B7kf8Y4hQu0+ZXXz=b0TLnzPkerC1B7fhVVxXg8nR4cA@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Fam Zheng <famz@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
	qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c0b::244
Subject: Re: [Qemu-trivial] [PATCH v2 2/3] MAINTAINERS: Fix Sun4v file
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
X-List-Received-Date: Fri, 13 Oct 2017 09:12:24 -0000

On Fri, Oct 13, 2017 at 10:58 AM, Thomas Huth <thuth@redhat.com> wrote:
> On 13.10.2017 10:53, Fam Zheng wrote:
>> Suggested-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Fam Zheng <famz@redhat.com>
>> ---
>>  MAINTAINERS | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 18ddaf4070..3938ccbf8a 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -778,7 +778,7 @@ F: pc-bios/openbios-sparc64
>>  Sun4v
>>  M: Artyom Tarasenko <atar4qemu@gmail.com>
>>  S: Maintained
>> -F: hw/sparc64/sun4v.c
>> +F: hw/sparc64/niagara.c
>>  F: hw/timer/sun4v-rtc.c
>>  F: include/hw/timer/sun4v-rtc.h
>>
>>
>
> Reviewed-by: Thomas Huth <thuth@redhat.com>

 Acked-By: Artyom Tarasenko <atar4qemu@gmail.com>

-- 
Regards,
Artyom Tarasenko

SPARC and PPC PReP under qemu blog: http://tyom.blogspot.com/search/label/qemu

