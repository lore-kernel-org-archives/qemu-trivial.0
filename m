Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YdROp-0005Ub-PB
	for mharc-qemu-trivial@gnu.org; Wed, 01 Apr 2015 18:46:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34302)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YdROm-0005QD-Ml
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 18:46:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YdROj-0007ig-E2
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 18:46:12 -0400
Received: from mail-ie0-f181.google.com ([209.85.223.181]:33257)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1YdROj-0007iL-39
	for qemu-trivial@nongnu.org; Wed, 01 Apr 2015 18:46:09 -0400
Received: by iebmp1 with SMTP id mp1so48749542ieb.0
	for <qemu-trivial@nongnu.org>; Wed, 01 Apr 2015 15:46:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uqMlw2Kg3nqlq3Z5oHRqDdwvgH3Ftd8otp3W8pHtvjE=;
	b=P9UXBmOqpNEEvrxOw9wfnMDwYyDDUVjucVMSmDtVW5k1Bz3JY0jGGnPUwFxFzE2M5k
	35JN6SwdAl0GbiAQ5j25gOirC6HcHndgIZypaalrGsDcubnFe/FhU+VFgr9YoHOFsXlX
	rCcOpNTNukUtQM/U8zVJpdZ8lF5huxd/NeHi8JLqxnNYWmbg9keWkxF1beAfxkPQsDyW
	Vo6Zx/wVnAF2hdVb/gng0X0qtjEH2hLZgGIodjkP1yGjxOHL8IsL3p0Y/S4taHW44/0k
	jA6S4GGARu/cxzZgkCf+aanc+FK9RkNFEo+IlloOW+UO3XTlneCOOzmveQoY7qoIegUJ
	04uQ==
X-Gm-Message-State: ALoCoQklpr//Cy4e+QbQG5tm/IqJ7TGlTN3WIZsfdZVpInXk8pcRgzKtjSI/5SmyETcV+kNCEX1W
X-Received: by 10.50.43.197 with SMTP id y5mr9800001igl.14.1427928368392; Wed,
	01 Apr 2015 15:46:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.51.201 with HTTP; Wed, 1 Apr 2015 15:45:48 -0700 (PDT)
In-Reply-To: <551C5FAF.7010303@redhat.com>
References: <1427911244-22565-1-git-send-email-emaste@freebsd.org>
	<551C5DE7.70904@redhat.com> <551C5FAF.7010303@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Apr 2015 23:45:48 +0100
Message-ID: <CAFEAcA-CLb6WNqgxjsys=kfDoTe9KEeNZ8W-7ax=A1dqBVo0eQ@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.223.181
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, John Snow <jsnow@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] qtest: Add assertion that
 required environment variable is set
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
X-List-Received-Date: Wed, 01 Apr 2015 22:46:13 -0000

On 1 April 2015 at 22:14, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
>
> On 01/04/2015 23:06, John Snow wrote:
>>
>> if (qemu == NULL) {
>>   fprintf(stderr, "...");
>>   g_assert_not_reached();
>> }
>>
>> Though that does read a little strangely. ("Here's a nice error message
>> for something we are asserting will never happen.")
>
> Just "exit(1);" then.  :)
>
> Good idea, this is annoying.

Also irritating is the way it silently requires
the binary to have a name in the shape it was
expecting, which can catch you out if you were
trying to set it to a wrapper shell script that
invokes valgrind or something...

-- PMM

