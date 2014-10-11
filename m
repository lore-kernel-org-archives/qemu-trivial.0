Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Xd4BJ-0001au-UI
	for mharc-qemu-trivial@gnu.org; Sat, 11 Oct 2014 17:26:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58909)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Xd4BC-0000x0-Ef
	for qemu-trivial@nongnu.org; Sat, 11 Oct 2014 17:26:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Xd4B5-0006G7-5k
	for qemu-trivial@nongnu.org; Sat, 11 Oct 2014 17:26:22 -0400
Received: from mail-lb0-f173.google.com ([209.85.217.173]:43292)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Xd4B4-0006Fx-VV
	for qemu-trivial@nongnu.org; Sat, 11 Oct 2014 17:26:15 -0400
Received: by mail-lb0-f173.google.com with SMTP id 10so4792323lbg.32
	for <qemu-trivial@nongnu.org>; Sat, 11 Oct 2014 14:26:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=R8otoQ0QkPac32ckmRuhjrAm9ELBczT0jRbFL4j4m+U=;
	b=jTR2i02m0lGmpokEkjVQpISN3JpYxC1eo51ujw2OySoo10It5zqYTZ46e/gpgWRsBb
	BDG9qJfqqtwqwoH+Huxl+V1yOfI8jHgVwNjXyrU1uklibsV3qPXqG34ktZJ2uk3WaYPo
	mlsiOCG8qwbadvjceSVOlAEwIe7QzvWVNDZ/4N1NyIpxeEvkS/M6fzqlCjBJbPHOy4FY
	B9UZIagqwhRWmGhhcDTLx9uTCsIIcveGNWkjB6oHLdIQmFwwa3gdnTOXENwaqwHiM7Mv
	gX+TC1zvAWuO0S/e5LwyNO23sTQe0Aa/mSqc6D5SHfFWVqsVoUii4IJLK4H+/GO0ld4w
	QuKw==
X-Gm-Message-State: ALoCoQn85Ao5bmIOd0CYDl+j7mHajnUj3tkqLjBWei8+0xPRH029ycOXkKYBN80gZfh7sC3GrYSt
X-Received: by 10.112.173.134 with SMTP id bk6mr13970183lbc.36.1413062773694; 
	Sat, 11 Oct 2014 14:26:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.130.161 with HTTP; Sat, 11 Oct 2014 14:25:53 -0700 (PDT)
In-Reply-To: <54393AF0.1010708@gmail.com>
References: <5439399D.4020004@gmail.com> <54393AF0.1010708@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 11 Oct 2014 22:25:53 +0100
Message-ID: <CAFEAcA_c7FE93J_7ZTqZaMG3V6Xx+EW6kAYF6XBqO9YL28+1mg@mail.gmail.com>
To: Chen Gang <gang.chen.5i5j@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.217.173
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Eric Blake <eblake@redhat.com>,
	qemu-devel <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
Subject: Re: [Qemu-trivial] [PATCH v2] libvixl: a64: Skip
 "-Wunused-variable" for gcc 5.0.0 or higher
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
X-List-Received-Date: Sat, 11 Oct 2014 21:26:28 -0000

On 11 October 2014 15:13, Chen Gang <gang.chen.5i5j@gmail.com> wrote:

MJT: please don't put this in -trivial, it will clash with
the update to libvixl 1.6 currently on the list.


> On 10/11/14 22:07, Chen Gang wrote:
>> 'instructions-a64.h' has unused variables for qemu which can be found by
>> gcc 5.0.0 or higher. and qemu needs "-Werror", and cause building break.
>> But they may be used by another projects (not qemu).
>>
>> So for gcc 5.0.0 or higher, need still keep them, but ignore diagnostic
>> (still print warning, but not break building). The related warnings:
>>
>>     CXX   disas/arm-a64.o
>>   In file included from /upstream/qemu/disas/libvixl/a64/disasm-a64.h:32:0,
>>                    from disas/arm-a64.cc:20:
>>   disas/libvixl/a64/instructions-a64.h:98:13: error: 'vixl::kFP32PositiveInfinity' defined but not used [-Werror=unused-variable]
>>    const float kFP32PositiveInfinity = rawbits_to_float(0x7f800000);
>>                ^
>>   disas/libvixl/a64/instructions-a64.h:99:13: error: 'vixl::kFP32NegativeInfinity' defined but not used [-Werror=unused-variable]

So, several questions here:

(1) Does anybody know how the header in question should be
providing constant floats and doubles to its users in a way
that doesn't cause gcc to complain? If so, I can pass the
answer along so at least the next version of the library
is OK...

(2) Bonus question, anybody know why gcc is perfectly happy
with the unused integer constants in the .h file but doesn't
like the float and doubles?

(3) Does gcc 5 emit these warnings for all the .cc files
that pull in this header, or only for the arm-a64.cc one?

Some other approaches to this that would confine the
fix to the makefiles rather than requiring us to modify
the vixl source itself:
 a) add a -Wno- option for the affected .o files
 b) use -isystem rather than -I to include the libvixl
    directory on the include path

(a)'s probably better I guess.

thanks
-- PMM

