Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1UUDfZ-0004Zq-An
	for mharc-qemu-trivial@gnu.org; Mon, 22 Apr 2013 06:08:21 -0400
Received: from eggs.gnu.org ([208.118.235.92]:42955)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UUDfW-0004Zf-SN
	for qemu-trivial@nongnu.org; Mon, 22 Apr 2013 06:08:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UUDfV-0006xK-L8
	for qemu-trivial@nongnu.org; Mon, 22 Apr 2013 06:08:18 -0400
Received: from mail-pa0-f51.google.com ([209.85.220.51]:38901)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aik@ozlabs.ru>) id 1UUDfV-0006wz-Ec
	for qemu-trivial@nongnu.org; Mon, 22 Apr 2013 06:08:17 -0400
Received: by mail-pa0-f51.google.com with SMTP id jh10so3488258pab.24
	for <qemu-trivial@nongnu.org>; Mon, 22 Apr 2013 03:08:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding:x-gm-message-state;
	bh=sR4So380oc1jf1pc3HIrsG1OsbPdO/W+8nIdiDlqw5I=;
	b=JIuxxq55Fptt6WtfwNg5Xch13n6FXmjdRVt6zQWKgj4gSL66J/pl/zrNGFs1NCNLXT
	9DrYVjMiCWORUjPGTL+V/YIwuuuqiu7i25Mmy9ij8huZYuO3oqc5HhQYvw9kby9pizUm
	Z0VaNYUdaQp2lqdrEXIw4n7ul+Yd2ZiIRvIUP37jUKvNOuBFkn9uOp1oYLnkx0Kat7JA
	iieZcRCuvb0NrI80PSN60rC1V9Lle8/+VNOW3SLo5ReB6eTHjDkjiBPbgBe/SemQyT5I
	cz77cyaDrcauezG8DP8qcoEpbe8ee9ZqY9Z5nxYvMbhYpmk7XQzAmS3fPCoXB6rfDaYM
	HwDA==
X-Received: by 10.66.159.6 with SMTP id wy6mr11751603pab.206.1366625296816;
	Mon, 22 Apr 2013 03:08:16 -0700 (PDT)
Received: from aik.ozlabs.ibm.com (60-242-102-4.tpgi.com.au. [60.242.102.4])
	by mx.google.com with ESMTPS id vb8sm24554109pbc.11.2013.04.22.03.08.13
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Mon, 22 Apr 2013 03:08:15 -0700 (PDT)
Message-ID: <51750C0A.50509@ozlabs.ru>
Date: Mon, 22 Apr 2013 20:08:10 +1000
From: Alexey Kardashevskiy <aik@ozlabs.ru>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130402 Thunderbird/17.0.5
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1366616571-4321-1-git-send-email-aik@ozlabs.ru>
	<CAFEAcA9szMz8X-XfehpR4CZrJ5SaQpPeRHD-5Auja=WMk=GxQg@mail.gmail.com>
	<51750A76.6080504@ozlabs.ru>
	<CAFEAcA8JWnpUb=L97H2qo82H+11oCEvYctUvuYU377xW7BU=Sw@mail.gmail.com>
In-Reply-To: <CAFEAcA8JWnpUb=L97H2qo82H+11oCEvYctUvuYU377xW7BU=Sw@mail.gmail.com>
Content-Type: text/plain; charset=KOI8-R; format=flowed
Content-Transfer-Encoding: 7bit
X-Gm-Message-State: ALoCoQkoClQJ1uC5AZH9h5JAWmJfFxQPnu83JRtYkMTqJVQfVBzxW2209oElorGr8Vsz0+RHjlS8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.220.51
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
X-List-Received-Date: Mon, 22 Apr 2013 10:08:20 -0000

On 04/22/2013 08:03 PM, Peter Maydell wrote:
> On 22 April 2013 11:01, Alexey Kardashevskiy <aik@ozlabs.ru> wrote:
>> On 04/22/2013 07:00 PM, Peter Maydell wrote:
>>> NB that this compile failure only happens if you configure
>>> with --enable-profiler.
>>
>>
>> I also thought I can enable/disable it via ./configure but in fact I cannot:
>>
>> alexey@ka1:~/pcipassthru/qemu-impreza$ ./configure --help | grep prof
>> alexey@ka1:~/pcipassthru/qemu-impreza$
>
> --enable-profiler exists but it is undocumented (ie not mentioned
> in the --help text). In fact I have no idea how you tripped over
> this missing include if you don't know about --enable-profiler,
> since configure's default is to not enable this code.

Ah. Looked closer to my scripts and found --enable-profiler (leftover from 
something). I was confused by the fact that there is no 
"--disable-profiler", the ./configure script prints an error.


-- 
Alexey

