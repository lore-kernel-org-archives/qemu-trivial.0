Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WIns9-0005S0-Je
	for mharc-qemu-trivial@gnu.org; Wed, 26 Feb 2014 18:26:41 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49682)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WIns2-0005Qm-Be
	for qemu-trivial@nongnu.org; Wed, 26 Feb 2014 18:26:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WInrw-0006ou-BW
	for qemu-trivial@nongnu.org; Wed, 26 Feb 2014 18:26:34 -0500
Received: from mail-la0-f54.google.com ([209.85.215.54]:56499)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WInrw-0006oe-41
	for qemu-trivial@nongnu.org; Wed, 26 Feb 2014 18:26:28 -0500
Received: by mail-la0-f54.google.com with SMTP id mc6so1160243lab.13
	for <qemu-trivial@nongnu.org>; Wed, 26 Feb 2014 15:26:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3ZJrHAja2OSVdZ+8EEcJqJf9DaW9cbwx9GNubB1oIL4=;
	b=DKt3AjzhgJcGELRZaBxEVi/9ejrXsoB4cUCg30XhUyyiSpRhJ/hTVjArBAcRcYF6Gn
	P3NHgSuYu+quX1xJxiNhCjXRfDUVsW3u1Fx+YhkoTyE8XefC8nc+1iMQQ59Og1mimQRV
	Q82hYMvm5cHsKNrXdFahxaxULgYFvNmeiabkFtK3R/f09uNS7ESIu7uV1yy9q8XrEbot
	5ZJ74lWtXXZq08DWwoEap7iNd3Zldq3o2MiAuxHJ7rh1XVLDH3D/4NzRWUCCRJAoQUo6
	c5uqg/n3ojJ8cECmRtv8nvMvj/DNOhUWRVWiVlClpQ/U+BrGFhsJMDhNzVkQgOOTRXmN
	g1Mw==
X-Gm-Message-State: ALoCoQk5Jr7Maaa61MY9Z3MLbbTuJHSExg8LPNSefOPmvCyaTkmX1+zFEC/Y0pBAVInjqkXrm7pg
X-Received: by 10.152.43.130 with SMTP id w2mr4235640lal.18.1393457186906;
	Wed, 26 Feb 2014 15:26:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.118.34 with HTTP; Wed, 26 Feb 2014 15:26:06 -0800 (PST)
In-Reply-To: <530E7189.7060205@redhat.com>
References: <1393454861-24705-1-git-send-email-peter.maydell@linaro.org>
	<530E7189.7060205@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 26 Feb 2014 23:26:06 +0000
Message-ID: <CAFEAcA9gor2zxg6fXzQ-aR+so=bH8brEib8xp3y8fD37XRt4+Q@mail.gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.54
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <andreas.faerber@web.de>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-trivial] [PATCH] tests/Makefile: Suppress format-security
	warnings on JSON tests
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
X-List-Received-Date: Wed, 26 Feb 2014 23:26:40 -0000

On 26 February 2014 22:58, Paolo Bonzini <pbonzini@redhat.com> wrote:
> Il 26/02/2014 23:47, Peter Maydell ha scritto:
>
>> Some of our test binaries programmatically generate JSON format
>> strings to feed to qobject_from_json(). Since that function is
>> marked with GCC_FMT_ATTR(), clang complains about this:
>>  tests/test-qmp-input-visitor.c:76:35: warning: format string is not a
>>  string literal (potentially insecure) [-Wformat-security]
>>     data->obj = qobject_from_json(json_string);
>>                                   ^~~~~~~~~~~
>
>
> qobject_from_json shouldn't have a GCC_FMT_ATTR marker, only
> qobject_from_jsonf and qobject_from_jsonv.
>
> qobject_from_json passes a NULL va_list*, and then parse_escape in
> qobject/json-parser.c returns NULL before calling va_arg.  Ultimately this
> produces a parse error.

That's a nicer way to fix this :-)  I was assuming the attribute marking
was correct...

-- PMM

