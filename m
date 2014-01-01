Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VyNkl-0003J7-4U
	for mharc-qemu-trivial@gnu.org; Wed, 01 Jan 2014 10:30:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49648)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VyNke-0003E7-Hm
	for qemu-trivial@nongnu.org; Wed, 01 Jan 2014 10:30:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VyNkT-0007Iq-3v
	for qemu-trivial@nongnu.org; Wed, 01 Jan 2014 10:30:32 -0500
Received: from mail-la0-f52.google.com ([209.85.215.52]:41981)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1VyNkS-0007Id-Sv
	for qemu-trivial@nongnu.org; Wed, 01 Jan 2014 10:30:21 -0500
Received: by mail-la0-f52.google.com with SMTP id y1so6860567lam.11
	for <qemu-trivial@nongnu.org>; Wed, 01 Jan 2014 07:30:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=g3br3mEzWP7FgpZhDKhorppbNhiSuXbgeMspRIb0tfI=;
	b=BlFsuFIXv7zERNT22cQYj4LKdJIYNsRqZ0aKp7KjHL64T7Alq9KQbMvcgPgd8mFsab
	ynof5hjtPy55MQliEnc6bcONjKVPy9iZrlK5uZ3c3apDlt9wjZX+2kLc+Dx8oJymkn7C
	8lXLW5p+ryQBGGqzCW3wI6ZAM8YlV7LjrY5AgPyqZJ4aK7zwKGyNKaN6FtrUduINRf+i
	DvDlrO5cWzX+JlMpXcUBOaBjm3tiUuQj0Kz+VakBzffa7b+LDxXyYgNgGZ3nmoucEUYc
	Q4OBktKTPwXdXqwYmLsl4Ik2rqQNb+XAsojUbwHFpRepP60Hfopx7mswURzHeOug9pfL
	rfgg==
X-Gm-Message-State: ALoCoQkKIsqVsdgWPVOxqP7mNfKRANolrKODrOH0Mn8lpQnHzrDucTpxMyfEtUWc5gEbxZaM6eMX
X-Received: by 10.152.4.230 with SMTP id n6mr32130211lan.1.1388590219763; Wed,
	01 Jan 2014 07:30:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.125.3 with HTTP; Wed, 1 Jan 2014 07:29:59 -0800 (PST)
In-Reply-To: <52C41E9B.40704@weilnetz.de>
References: <1388182050-10270-1-git-send-email-mjt@msgid.tls.msk.ru>
	<1388182050-10270-11-git-send-email-mjt@msgid.tls.msk.ru>
	<52C41E9B.40704@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 1 Jan 2014 15:29:59 +0000
Message-ID: <CAFEAcA8Bks5WGHMXWR8RZfqPxbHtva7LZVKwo4S43bGemv7y9A@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.52
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Anthony Liguori <aliguori@amazon.com>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 10/17] target-m68k: Replace
	qemu_assert by hw_error
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
X-List-Received-Date: Wed, 01 Jan 2014 15:30:37 -0000

On 1 January 2014 13:56, Stefan Weil <sw@weilnetz.de> wrote:
> hw_error is not available for user mode, so this patch fixes Darwin
> (which only provides system emulation), but it breaks linking of
> m68k-linux-user on Linux hosts.

Maybe we need to come up with some better guidelines
about when to use the various choices of API we have
for fatal and otherwise unexpected errors:
 * hw_error
 * qemu_log_mask(LOG_UNIMP, ...) and continue
 * assert
 * g_assert and friends
 * error*
 * qerror*
 * abort
 * tcg_abort
 * probably others I forget about...

At the moment there's a bit of a mix in existing code, and I don't
really know what the "best practices" are for when I'm reviewing
new code.

PS: does anybody actually find the full register dump hw_error()
spits out useful?

thanks
-- PMM

