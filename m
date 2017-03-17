Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1cow7S-0004vl-AO
	for mharc-qemu-trivial@gnu.org; Fri, 17 Mar 2017 13:56:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45788)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cow7Q-0004v8-74
	for qemu-trivial@nongnu.org; Fri, 17 Mar 2017 13:56:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cow7P-0005rL-Fm
	for qemu-trivial@nongnu.org; Fri, 17 Mar 2017 13:56:52 -0400
Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236]:33497)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cow7P-0005qT-9q
	for qemu-trivial@nongnu.org; Fri, 17 Mar 2017 13:56:51 -0400
Received: by mail-wr0-x236.google.com with SMTP id u48so56800804wrc.0
	for <qemu-trivial@nongnu.org>; Fri, 17 Mar 2017 10:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Ps5bFZo7hJiQA51rBcFlUNRsFH8+JVq0U0EeFfjAn2U=;
	b=brav7akYkIaC+m9NiVsYl4lIrgczXAlGu6S7Sg2Nw+1QLwKBaMnhS7BRKYIjrCb3IB
	TbusER8IENX7wloKm1vx2aA8YzZI4A9VZ6JP252hGAGHWlXtxSD1n1J8ebLToCkJKjhI
	klUwYGoG3Ca58A8aRm8b+C5U1ylKkucytNnLA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Ps5bFZo7hJiQA51rBcFlUNRsFH8+JVq0U0EeFfjAn2U=;
	b=dHzrIzHv6KOVC4wCS6OMCYKF1w0W7xs/1VnkSkKLtHxV6VjKhl1ynxXzVUSbpXdFTq
	vKR0VSZWZhHBhZGZV23jhzHrEPstVfw0lx6vz8d4PxEyXP7Yg9+YnG3t4jJTCJUh+/nk
	BCQ0lLMKPAxQNmfIjyrguqDBmrDM3zu8xmtVxeVWYICRDvmk496ix+pz2YE49SMqOJjc
	oHilamoTrOO5mT0arbmzIXSYzAeHH2RIHvm+8P1KLgN7kehy51Ochfy8PDs4ftZzsaN0
	3c4kOIXGogzb43T0fntPlAcGS3jmAmU+oecSfrDLwwjgdQsLV25YcI+zhILds6o3abnr
	g6BQ==
X-Gm-Message-State: AFeK/H3MtbEozEPHQnCqxcVX4a1zvEqdlGQi/U4aJWjG6Wa/i/X7cU86WmGuk4AKjvjNOgw+CDgZT8CQ0M9MXjkf
X-Received: by 10.223.150.205 with SMTP id u71mr14137182wrb.195.1489773409914; 
	Fri, 17 Mar 2017 10:56:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.33 with HTTP; Fri, 17 Mar 2017 10:56:29 -0700 (PDT)
In-Reply-To: <86a22787-b3d0-dd32-9925-61f94de4ad33@weilnetz.de>
References: <20170317160811.28370-1-pbonzini@redhat.com>
	<86a22787-b3d0-dd32-9925-61f94de4ad33@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 17 Mar 2017 17:56:29 +0000
Message-ID: <CAFEAcA_EzhCt1trWAiqof-wPLcp_exWB-V=KiCzzKKpeM8anzA@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, 
	Thomas Huth <thuth@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::236
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH for 2.9 v2] configure:
 remove Cygwin
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
X-List-Received-Date: Fri, 17 Mar 2017 17:56:53 -0000

On 17 March 2017 at 17:52, Stefan Weil <sw@weilnetz.de> wrote:
> Am 17.03.2017 um 17:08 schrieb Paolo Bonzini:
>>
>> The Cygwin target is really compiling for native Win32 with -mno-cygwin.
>> Except, GCC 4.7.0 has finally removed the long deprecated -mno-cygwin
>> option, and that happened about five years ago.
>>
>> Let it rest in peace.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>
>
> Reviewed-by: Stefan Weil <sw@weilnetz.de>
>
> CC'ing qemu-trivial for the pull request.
>
> I only wonder whether we should raise an error if people
> try building QEMU with native Cygwin (not Cygwin / Mingw-w64).

I think the "warn about deprecated hosts" patch that I posted
earlier today will effectively end up doing that, because it
changes the case $targetos from "default to assuming Linux" to
"explicitly check for Linux, and default to an error message".

thanks
-- PMM

