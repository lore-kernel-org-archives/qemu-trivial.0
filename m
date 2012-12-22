Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1TmP3N-0006ny-SF
	for mharc-qemu-trivial@gnu.org; Sat, 22 Dec 2012 08:23:49 -0500
Received: from eggs.gnu.org ([208.118.235.92]:55467)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TmP3J-0006nV-Dc
	for qemu-trivial@nongnu.org; Sat, 22 Dec 2012 08:23:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TmP3H-0001PQ-NT
	for qemu-trivial@nongnu.org; Sat, 22 Dec 2012 08:23:45 -0500
Received: from mail-la0-f43.google.com ([209.85.215.43]:45389)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1TmP3H-0001PC-Fj
	for qemu-trivial@nongnu.org; Sat, 22 Dec 2012 08:23:43 -0500
Received: by mail-la0-f43.google.com with SMTP id z14so6650992lag.30
	for <qemu-trivial@nongnu.org>; Sat, 22 Dec 2012 05:23:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=n5PEZD9D8ADH/ibq6UDy+OCZdRP1zwGLhmwANX/6kwA=;
	b=CjP2+r/rXPF5xHPNUW38Xy+zZzWKHxQQ3+TlAmc3u8jDAcO3QN9tBVElTltkGQBrkl
	vmnEJpx60vFLylI+CI8ZN5RUCeMBJxoARVSP5ypQ/ms356KsFATh4mwkuAwg6KhCDB9Y
	P3Gb5IjuRwIg2dB42bb5WZk2YaDhoYkyAE2R6yEk0Hk090s2JFumy6Lk0iOVwzHVYJRR
	2uZLZMVnJENCJEOOfBM2WSSU1lnr6NpZipcynA4ZJSxJqFXlDSihahE6jqNnm9FaKgHS
	p7MEWEfSyiei09JxGUUoNqZQg6vyaLDxabKlU3zMJxE7zgVIn+O5GYOd1XrBPD7MvwKd
	KzMA==
Received: by 10.152.45.229 with SMTP id q5mr15185403lam.34.1356182621590; Sat,
	22 Dec 2012 05:23:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.55.176 with HTTP; Sat, 22 Dec 2012 05:23:20 -0800 (PST)
In-Reply-To: <1356179899-1268-1-git-send-email-sw@weilnetz.de>
References: <1356179899-1268-1-git-send-email-sw@weilnetz.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 22 Dec 2012 13:23:20 +0000
Message-ID: <CAFEAcA87c6URVh_K4AhLSeFPQPPrcBwd0Gxy9yX6PYvqE5BO6w@mail.gmail.com>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-Gm-Message-State: ALoCoQlGr0B6j7klxI975sBJz+QAjf0FZoVoUMSajAOrwkOBzBg4Fnyuh9pyn8Iv/PFItz6ULFYu
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 209.85.215.43
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target-mips: Remove
	semicolon from macro definition
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
X-List-Received-Date: Sat, 22 Dec 2012 13:23:48 -0000

On 22 December 2012 12:38, Stefan Weil <sw@weilnetz.de> wrote:
> Macro RESTORE_FLUSH_MODE is similar to RESTORE_ROUNDING_MODE
> but included a semicolon.
>
> The code which uses that macro also includes a semicolon,
> so the result was an empty statement.
>
> Remove the superfluous semicolon from the macro definition.
>
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

FWIW I think it would be better to just turn these two macros into
static inline functions which took a CPUMIPSState *env argument.
Macros which don't take arguments but silently use variables from
their caller are a bit ugly, and in this case there's no need to do it
that way.

-- PMM

