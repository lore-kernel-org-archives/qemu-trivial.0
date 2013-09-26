Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VPDUr-00010y-EH
	for mharc-qemu-trivial@gnu.org; Thu, 26 Sep 2013 11:28:53 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VPDUl-0000zy-Mh
	for qemu-trivial@nongnu.org; Thu, 26 Sep 2013 11:28:52 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VPDUh-0005FQ-28
	for qemu-trivial@nongnu.org; Thu, 26 Sep 2013 11:28:47 -0400
Received: from mail-la0-f50.google.com ([209.85.215.50]:50100)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VPDUg-0005FG-R2
	for qemu-trivial@nongnu.org; Thu, 26 Sep 2013 11:28:42 -0400
Received: by mail-la0-f50.google.com with SMTP id gx14so1073108lab.23
	for <qemu-trivial@nongnu.org>; Thu, 26 Sep 2013 08:28:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=MZT4ejiecVEhswZU5ZIrS3o/SQpwI31MJbHEtL9iFRg=;
	b=aAeIdoyzHMhjnXVcg1vIdrLkCW49/q5JPINg9zn+WkA0J3btJ7W5iWOOJp24tbWa6C
	2gNZA7bxfwJY/y3/3sjmBYgSZRf1098cQKlH3qujwz4CJVYSV4vXw+nTWJg2O02qmQU7
	CCC3fni+TK81piHOEe3cvMwZECkl4q1kczrG6Pym3tJDZbsigdTHNsAMnIywSGH07xUp
	xzsuX1x4mSgJpd6cMJ4+wjfp9+9x/lswPcSggjTwbjVe+h0wTzNO4jBNHWFK5kKTqyeO
	4QZJhWdFrL+9eHQYxUdEWapHZs7tFWkCHmVpeehsWwQDE2WaSigS/uzXrmratoIBRWfY
	nJMA==
X-Gm-Message-State: ALoCoQnlvbuOTBnlEF2G9FQpAyd/3otsTPtx0cjtg4LV7wOnWhIV7jFdfOF5nnYkQ0qVXxrkWAgY
X-Received: by 10.152.87.143 with SMTP id ay15mr1196386lab.2.1380209321865;
	Thu, 26 Sep 2013 08:28:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.161.232 with HTTP; Thu, 26 Sep 2013 08:28:21 -0700 (PDT)
In-Reply-To: <524449CA.5080706@adacore.com>
References: <1380041161-13266-1-git-send-email-chouteau@adacore.com>
	<1380041161-13266-4-git-send-email-chouteau@adacore.com>
	<CAFEAcA9A1JD7hPqZ5Y5d4UDFSa4DqJZOz_yTrjH92B7h8N-Lug@mail.gmail.com>
	<5243035D.4080200@adacore.com>
	<CAFEAcA-4hahHS57XM8Pb+SMdjNnJO9f45HRhWYtpx5Xg7dBLqQ@mail.gmail.com>
	<52430F79.6050202@adacore.com>
	<CAFEAcA8EfFnyvXyqUVcQNz3NR-sf9dgtEiiK92p4Be0nUbd_7g@mail.gmail.com>
	<524449CA.5080706@adacore.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Sep 2013 00:28:21 +0900
Message-ID: <CAFEAcA8zEbV5gnKGB_qA16PP+0kXrVD4Jcs8QkkRj_OsqHwS+A@mail.gmail.com>
To: Fabien Chouteau <chouteau@adacore.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.50
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	Luiz Capitulino <lcapitulino@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 3/3] Add ARM registers
	definitions in Monitor commands
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
X-List-Received-Date: Thu, 26 Sep 2013 15:28:52 -0000

On 26 September 2013 23:50, Fabien Chouteau <chouteau@adacore.com> wrote:
> On 09/26/2013 02:05 AM, Peter Maydell wrote:
>> On 26 September 2013 01:29, Fabien Chouteau <chouteau@adacore.com> wrote:
>>> I think that's what I did. I think the problem was to include
>>> 'monitor.h' in 'target-*/cpu.c'.
>>
>> Why doesn't that work?
>
> The problem is use of 'target_long' in 'monitor.h'.

Oh, right, the problem isn't including monitor.h from cpu.c,
it's that some target-independent source files include
monitor.h so you can't put target-dependent types like
target_long in it. There are two fixes for this that spring
to mind:

(1) lazy approach, wrap the MonitorDef structure
definition in #ifdef NEED_CPU_H/#endif.

(2) the "remove target-specificisms from what should
be generic code" approach:
 * make MonitorDef use uint64_t rather than target_long
   for the getter function return type
 * propagate that type change into functions like
   get_monitor_def and its callsite in expr_unary
 * make the types recognized by get_monitor_def be
   MD_I32 or MD_I64, and not MD_TLONG
 * make the per-target MonitorDef array entries which
   currently implicitly use MD_TLONG instead either
   (a) use MD_I32 or MD_I64 if they're targets which
   really only have one width or (b) use a locally #defined
   MD_TLONG if they're accessing CPU struct fields which
   really are target_long and the CPU comes in both 32
   and 64 bit variants.

-- PMM

