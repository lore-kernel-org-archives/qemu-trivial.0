Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VBlw3-0000TT-UU
	for mharc-qemu-trivial@gnu.org; Tue, 20 Aug 2013 09:25:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <proljc@gmail.com>) id 1VBlvw-0000J4-Tq
	for qemu-trivial@nongnu.org; Tue, 20 Aug 2013 09:25:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <proljc@gmail.com>) id 1VBlvr-00040r-8G
	for qemu-trivial@nongnu.org; Tue, 20 Aug 2013 09:25:16 -0400
Received: from mail-wi0-x235.google.com ([2a00:1450:400c:c05::235]:37600)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <proljc@gmail.com>)
	id 1VBlvg-0003h7-AX; Tue, 20 Aug 2013 09:25:00 -0400
Received: by mail-wi0-f181.google.com with SMTP id en1so403047wid.2
	for <multiple recipients>; Tue, 20 Aug 2013 06:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=LQRmbyzg22raVVG+mAe1KBV139DSVjE7PprlHgs3F8I=;
	b=StnDu1B1/EWNsIZxbalYcbIWOfIkJrfCJUpsHq561lomuu5p7X6IJ8muu2KZyOljcB
	QAoJYkR2GOEjKNHUhzEykeKUNOF/tVDdMdUkK/IzIRym0DS+qbmn3gsfKyMER5691nJP
	wuZkoVcB+ZGmuYQvEY5DyAaxH/jQKl4noiNBZbCCO4HktBQuwk6cdKANj60ptPzX81yx
	dfEhegaj1Gcq/XO4XMdK3LMnWFs6bH/NBKZD84h4BQqnqv4CpR1ZTvOaXac4lFhcsmAn
	+Yr2YwS0M/o1IXnyj2IXJLS0kgsSVD8dULP2cvYVClSGpJk0E6NSEKyjw5nvg3T2X89w
	TMtw==
MIME-Version: 1.0
X-Received: by 10.195.13.45 with SMTP id ev13mr1388984wjd.20.1377005099043;
	Tue, 20 Aug 2013 06:24:59 -0700 (PDT)
Received: by 10.194.138.40 with HTTP; Tue, 20 Aug 2013 06:24:58 -0700 (PDT)
In-Reply-To: <CAFEAcA9TN+DwcjRtAC0n7iipdPtdqR60VxH5L2Oyu8e73iiFMw@mail.gmail.com>
References: <1375727067-22126-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA9TN+DwcjRtAC0n7iipdPtdqR60VxH5L2Oyu8e73iiFMw@mail.gmail.com>
Date: Tue, 20 Aug 2013 21:24:58 +0800
Message-ID: <CAJBMM-uKSy2a-mJdUeBLV33LcJAZGJ+oY3hUauy9+f_30+11nQ@mail.gmail.com>
From: Jia Liu <proljc@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=ISO-8859-1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c05::235
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] hw/openrisc/openrisc_sim:
 Avoid using uninitialised variable 'entry'
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
X-List-Received-Date: Tue, 20 Aug 2013 13:25:22 -0000

Hi Peter,

On Tue, Aug 20, 2013 at 9:00 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
> Ping for qemu-trivial now 1.7 is open.

Thank you, I'll send a PULL very soon.

>
> thanks
> -- PMM
>
> On 5 August 2013 19:24, Peter Maydell <peter.maydell@linaro.org> wrote:
>> clang warns that cpu_openrisc_load_kernel() can use 'entry' uninitialized:
>>
>> hw/openrisc/openrisc_sim.c:69:9: error: variable 'entry' is used
>>       uninitialized whenever '&&' condition is false [-Werror,-Wsometimes-uninitialized]
>>     if (kernel_filename && !qtest_enabled()) {
>>         ^~~~~~~~~~~~~~~
>> hw/openrisc/openrisc_sim.c:91:19: note: uninitialized use occurs here
>>     cpu->env.pc = entry;
>>                   ^~~~~
>>
>> Fix this by not attempting to change the CPU's starting PC unless
>> we actually loaded a kernel.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>>  hw/openrisc/openrisc_sim.c |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
>> index a08f27c..4595fa9 100644
>> --- a/hw/openrisc/openrisc_sim.c
>> +++ b/hw/openrisc/openrisc_sim.c
>> @@ -86,9 +86,9 @@ static void cpu_openrisc_load_kernel(ram_addr_t ram_size,
>>                      kernel_filename);
>>              exit(1);
>>          }
>> -    }
>>
>> -    cpu->env.pc = entry;
>> +        cpu->env.pc = entry;
>> +    }
>>  }
>>
>>  static void openrisc_sim_init(QEMUMachineInitArgs *args)
>> --
>> 1.7.9.5
>>
>>

Regards,
Jia

