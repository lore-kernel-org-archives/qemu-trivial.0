Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YdkqC-0004PA-3P
	for mharc-qemu-trivial@gnu.org; Thu, 02 Apr 2015 15:31:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37124)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1Ydkq9-0004Ku-JQ
	for qemu-trivial@nongnu.org; Thu, 02 Apr 2015 15:31:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>) id 1Ydkq8-0004bO-KY
	for qemu-trivial@nongnu.org; Thu, 02 Apr 2015 15:31:45 -0400
Received: from mail-ie0-x235.google.com ([2607:f8b0:4001:c03::235]:34972)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <carpeddiem@gmail.com>)
	id 1Ydkq3-0004ah-T1; Thu, 02 Apr 2015 15:31:39 -0400
Received: by ierf6 with SMTP id f6so76818944ier.2;
	Thu, 02 Apr 2015 12:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=kdSjIQb3G0GCRBvmPyci7/n4O/f3cat1moGNnpMOOzc=;
	b=vON8G5tc1h4DrqxZrvAAhZuYecj1hU/L9qOUdxAXIH0+wgeLLUjgo10jgiCowFsrXQ
	L/l15TmpRPXZTqkBLIG0s18voF+7ZjDjSZjY2gSjSUJtag5APikABxw4guP9JRehmiwe
	DJojtDVz3XBnuy8JmsJRqQgfyXAFYD29R8qaNkxefQ6CRE2Q4E5yHPKjBHe5VbTeVIO3
	lILfwEs7nRmszGIWczsL32vx4ZP0cdlM/EKauc0GBgmIZUYbLGorm+dHCa96/uGnSmni
	3j5dRApGvUM+XaCybmCLry5R0ExMA5RmD3FSYz4pW4jBig6AsWj902kiPV81Zyzd7Jdt
	UM+g==
X-Received: by 10.107.13.136 with SMTP id 130mr36704825ion.70.1428003099021;
	Thu, 02 Apr 2015 12:31:39 -0700 (PDT)
MIME-Version: 1.0
Sender: carpeddiem@gmail.com
Received: by 10.107.158.19 with HTTP; Thu, 2 Apr 2015 12:31:18 -0700 (PDT)
In-Reply-To: <CAFEAcA-CLb6WNqgxjsys=kfDoTe9KEeNZ8W-7ax=A1dqBVo0eQ@mail.gmail.com>
References: <1427911244-22565-1-git-send-email-emaste@freebsd.org>
	<551C5DE7.70904@redhat.com> <551C5FAF.7010303@redhat.com>
	<CAFEAcA-CLb6WNqgxjsys=kfDoTe9KEeNZ8W-7ax=A1dqBVo0eQ@mail.gmail.com>
From: Ed Maste <emaste@freebsd.org>
Date: Thu, 2 Apr 2015 15:31:18 -0400
X-Google-Sender-Auth: Sun9NoJ8vzcrPASIvwa_e23162Y
Message-ID: <CAPyFy2B=rTfz+6JyVmufLTOxsddXyJWDD0wAGROqbodeNicUtQ@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4001:c03::235
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
	John Snow <jsnow@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
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
X-List-Received-Date: Thu, 02 Apr 2015 19:31:46 -0000

On 1 April 2015 at 18:45, Peter Maydell <peter.maydell@linaro.org> wrote:
> On 1 April 2015 at 22:14, Paolo Bonzini <pbonzini@redhat.com> wrote:
>> On 01/04/2015 23:06, John Snow wrote:
>>>
>>> if (qemu == NULL) {
>>>   fprintf(stderr, "...");
>>>   g_assert_not_reached();
>>> }
>>>
>>> Though that does read a little strangely. ("Here's a nice error message
>>> for something we are asserting will never happen.")
>>
>> Just "exit(1);" then.  :)
>>
>> Good idea, this is annoying.
>
> Also irritating is the way it silently requires
> the binary to have a name in the shape it was
> expecting, which can catch you out if you were
> trying to set it to a wrapper shell script that
> invokes valgrind or something...

I don't really have enough context to propose a good user-facing
message with a tip for manually executing this, so hopefully someone
else can provide one. I just noticed one other instance that already
had an assertion on getenv("QTEST_QEMU_BINARY") being non-null.

-Ed

