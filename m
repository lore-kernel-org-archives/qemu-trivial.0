Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UUDZF-000291-A8
	for mharc-qemu-trivial@gnu.org; Mon, 22 Apr 2013 06:01:49 -0400
Received: from eggs.gnu.org ([208.118.235.92]:41710)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UUDZ9-0001zJ-HO
	for qemu-trivial@nongnu.org; Mon, 22 Apr 2013 06:01:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UUDYz-00054K-Ny
	for qemu-trivial@nongnu.org; Mon, 22 Apr 2013 06:01:43 -0400
Received: from mail-pd0-f182.google.com ([209.85.192.182]:60928)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UUDYz-00053y-Ha
	for qemu-trivial@nongnu.org; Mon, 22 Apr 2013 06:01:33 -0400
Received: by mail-pd0-f182.google.com with SMTP id 3so3462284pdj.27
	for <qemu-trivial@nongnu.org>; Mon, 22 Apr 2013 03:01:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=R47CGyeUDFJ06KnRh9YrBlCrXUscRemrvuQv1zROv7w=;
	b=KNJtiwazVFNnBYIHyjYZB2gloE5bConN/39FjEce6AQQ4S4sDMK9VXYdj40/7egdYj
	Y3/AFoHWSKpgAbhcugHiau7sMOA1GZTWy98znM2w5xG881f1RnirEYYrVzvObQ8Ainf6
	4cQvDaIorHzZ5e+MQ0yUrCyvC7Q8kucLN+SEmomq5l8CYdC9d3a3FebomjSq5JNjcqAE
	ySXxeEUvNjghRso6iPYxPsg+iakbrFV3OVxZX68hzLEwnYp4+ZE21s0KocOGimT3e3jJ
	y1qG8pd7yjaCXROOJVz86oRFY935K64zpjjGZxcrqG14+i3m7DaNlTJ9S9xuKCy3Osih
	zXeA==
X-Received: by 10.68.51.39 with SMTP id h7mr31925283pbo.155.1366624892510;
	Mon, 22 Apr 2013 03:01:32 -0700 (PDT)
Received: from aik.ozlabs.ibm.com (60-242-102-4.tpgi.com.au. [60.242.102.4])
	by mx.google.com with ESMTPS id sa6sm24508947pbb.26.2013.04.22.03.01.29
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 22 Apr 2013 03:01:31 -0700 (PDT)
Message-ID: <51750A76.6080504@ozlabs.ru>
Date: Mon, 22 Apr 2013 20:01:26 +1000
From: Alexey Kardashevskiy <aik@ozlabs.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130402 Thunderbird/17.0.5
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1366616571-4321-1-git-send-email-aik@ozlabs.ru>
	<CAFEAcA9szMz8X-XfehpR4CZrJ5SaQpPeRHD-5Auja=WMk=GxQg@mail.gmail.com>
In-Reply-To: <CAFEAcA9szMz8X-XfehpR4CZrJ5SaQpPeRHD-5Auja=WMk=GxQg@mail.gmail.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
X-Gm-Message-State: ALoCoQmHLRRJWkQOslGIyhROHjQVEsfKuH/6J0z3QPFScBdocjJvJXxZ7SJgWHJlhrfF8WuP0BIP
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.192.182
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] translate-all: fix compiler
 warning and linked error
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
X-List-Received-Date: Mon, 22 Apr 2013 10:01:48 -0000

On 04/22/2013 07:00 PM, Peter Maydell wrote:
> On 22 April 2013 08:42, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>> The code did use profile_getclock() but did not include
>> include/qemu/timer.h where this function is defined. The patch fixes this.
>>
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>
> NB that this compile failure only happens if you configure
> with --enable-profiler.

I also thought I can enable/disable it via ./configure but in fact I cannot:

alexey@ka1:~/pcipassthru/qemu-impreza$ ./configure --help | grep prof
alexey@ka1:~/pcipassthru/qemu-impreza$


-- 
Alexey

