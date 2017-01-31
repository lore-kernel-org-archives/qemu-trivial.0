Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cYcjT-0001wU-Pj
	for mharc-qemu-trivial@gnu.org; Tue, 31 Jan 2017 13:00:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43040)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cYcjQ-0001uB-NO
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 13:00:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cYcjK-0000aM-OS
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 13:00:40 -0500
Received: from mail-vk0-x235.google.com ([2607:f8b0:400c:c05::235]:36849)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cYcjK-0000a8-IX
	for qemu-trivial@nongnu.org; Tue, 31 Jan 2017 13:00:34 -0500
Received: by mail-vk0-x235.google.com with SMTP id t8so242658472vke.3
	for <qemu-trivial@nongnu.org>; Tue, 31 Jan 2017 10:00:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=JlRE2eXGCA6Vk/r8HFnwCFikbVDGfQQOtCg6dGk8+vE=;
	b=g/lAJahoRzucrmQo/vx4BfvSX/0f9Fe+ydmWoYQnP9Cd5cIS6UYP6T4QKm7R/fN/L7
	Jwf4szHsUqDJmhk1yTdltHx2QbquYFCwNl7xgVaXv0nMYN+0UY/eT/A7M4bSBjJxcxDa
	Ai4EpKe75UyVTYYDBbPONuxr+03IX4Lnn8zLo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=JlRE2eXGCA6Vk/r8HFnwCFikbVDGfQQOtCg6dGk8+vE=;
	b=ecpkr4dww8yBXQv3J6ChyKl2Zo4lKGSlsu06JRYsv8GBFnOEAH2X56Qher0iDjudtT
	dlI1tx34CUElmN5U/rOCBzNkJIq7CFernstG/kUS8QritOt9PfD2d+6r5wWtwcY+BRDM
	1EpRn3AhoisiYcTAhV1yJbJLJs2BP46v5a/4HM5oggXA6fejwrv6k4aajkrByxsoG/xe
	/nvEs5zLpSjQDp82McAq02Zol6Un67n3Bavc+UpDdLhIQlz+ORFH4M8ImTPu6y+cAt/w
	30NQTlMUaUdx8oq7MyVHDpC13BXtVLJ205n3iWk8D+fEuL3PDo12YO8h6epjyffMVrK5
	6v8Q==
X-Gm-Message-State: AIkVDXKg3RqKpX1/bFVYzPuhCWJqkwHQZ7OqIQwmioJ3FxYEHToy9nAJ6zW8MJC/LfOORLx5WwkY9AfRjJzjCXkH
X-Received: by 10.31.165.82 with SMTP id o79mr13676450vke.95.1485885633639;
	Tue, 31 Jan 2017 10:00:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.205.2 with HTTP; Tue, 31 Jan 2017 10:00:13 -0800 (PST)
In-Reply-To: <87wpdbw2ki.fsf@dusky.pond.sub.org>
References: <1485879287-12548-1-git-send-email-peter.maydell@linaro.org>
	<87wpdbw2ki.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 Jan 2017 18:00:13 +0000
Message-ID: <CAFEAcA-Ggv2VGszZg0Ld3-1wm=hVe8w=4ZcQ7TDRHf5Puq88ug@mail.gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
	QEMU Trivial <qemu-trivial@nongnu.org>, 
	Paolo Bonzini <pbonzini@redhat.com>,
	"patches@linaro.org" <patches@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::235
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Drop QEMU_GNUC_PREREQ()
 checks for gcc older than 4.1
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
X-List-Received-Date: Tue, 31 Jan 2017 18:00:42 -0000

On 31 January 2017 at 17:40, Markus Armbruster <armbru@redhat.com> wrote:
> Peter Maydell <peter.maydell@linaro.org> writes:
>
>> We already require gcc 4.1 or newer (for the atomic
>> support), so the fallback codepaths for older gcc
>> versions than that are now dead code and we can
>> just delete them.
>>
>> NB: clang reports itself as gcc 4.2 (regardless of
>> clang version), so clang won't be using the fallbacks
>> either.
>>
>> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>> ---
>> For compatibility with clang we should probably try to avoid
>> using QEMU_GNUC_PREREQ() and instead have something in
>> compiler.h that abstracts away whether the test for "does
>> the compiler support feature foo" is via a GCC version
>> check or a clang __has_feature or whatever.
>
> Yes, testing for feature is better than testing a version.
>
> This patch reduces use of QEMU_GNUC_PREREQ roughly by half.  Good.
>
>>
>>
>>  include/qemu/compiler.h   |   8 ---
>>  include/qemu/host-utils.h | 121 ----------------------------------------------
>>  tcg/arm/tcg-target.h      |   7 ---
>>  3 files changed, 136 deletions(-)
>>
>> diff --git a/include/qemu/compiler.h b/include/qemu/compiler.h
>> index 157698b..fc12e49 100644
>> --- a/include/qemu/compiler.h
>> +++ b/include/qemu/compiler.h
>> @@ -24,17 +24,9 @@
>>
>>  #define QEMU_NORETURN __attribute__ ((__noreturn__))
>>
>> -#if QEMU_GNUC_PREREQ(3, 4)
>>  #define QEMU_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
>> -#else
>> -#define QEMU_WARN_UNUSED_RESULT
>> -#endif
>
> Should we inline this macro?

We have attributes which we wrap in QEMU_ macros already
even though they always expand to the same thing:
QEMU_NORETURN and QEMU_ALIGNED. I'm happy to leave these
to follow that pattern. (If you wanted to send a patch
series that uninlined all of those then I wouldn't hugely
object to it, but I think it touches enough files that it's
a separate thing from removing the #if guards that this
patch does.)

thanks
-- PMM

