Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W3kmo-0001GS-Nr
	for mharc-qemu-trivial@gnu.org; Thu, 16 Jan 2014 06:06:58 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39554)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W3kmh-000148-E1
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 06:06:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W3kma-0004C1-9X
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 06:06:51 -0500
Received: from mail-la0-f45.google.com ([209.85.215.45]:50369)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1W3kma-0004Bk-1X
	for qemu-trivial@nongnu.org; Thu, 16 Jan 2014 06:06:44 -0500
Received: by mail-la0-f45.google.com with SMTP id b8so2387700lan.18
	for <qemu-trivial@nongnu.org>; Thu, 16 Jan 2014 03:06:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=/zMn0o9qGWkpq0sfFT0DM+UhXvB/cLADUMZa6LmrRrw=;
	b=ArspYTkUFiYfzcNHOhDDbp4uFo3PfAxoASWyoRneVC4jbYxi3B8dg39qZIcAhU/MqB
	voeVPHqK+oHsaCrES9jWlfJC7WgAD+4Z7jUk2bFWyWjh+TD7uj6EjZdyagK8IRJMsZOM
	FyjDDNcXPsBEaHpCfXHy7u0ovtVdMLcEYMynoh9sPxYcKHvFm8d7lrH/m/rZwfFWEg5c
	eP+4tTfOcvkEqFgeeSFR8e6JTSNkseDtHiewDDYpQ1UExejJYLztVuSVyqyxUcnyzd1M
	siPsj+ooJhLR+anczyzfDxJrHaw86yGuw2Se+x0TTJqy9zhweF55KZX1zaQlQ0Lg22pf
	ko5g==
X-Gm-Message-State: ALoCoQllZiu+PCiWd20GUb5Ey/pglpGNwBawUo1qpsvwxyaZpsnql/ydaRn5RFRrIUmXxn5F3wgW
X-Received: by 10.152.87.5 with SMTP id t5mr110744laz.43.1389870403050; Thu,
	16 Jan 2014 03:06:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.112.125.3 with HTTP; Thu, 16 Jan 2014 03:06:22 -0800 (PST)
In-Reply-To: <52D7B975.9050507@msgid.tls.msk.ru>
References: <1388486168-2532-1-git-send-email-keweihk@gmail.com>
	<52D7B975.9050507@msgid.tls.msk.ru>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Jan 2014 11:06:22 +0000
Message-ID: <CAFEAcA9UNDB3zPk46uTECePb3eqqe2utk-9G5_mJc0Hq2XgwZw@mail.gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.45
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/1] Add a blank space
 between the variable and '='
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
X-List-Received-Date: Thu, 16 Jan 2014 11:06:56 -0000

On 16 January 2014 10:50, Michael Tokarev <mjt@tls.msk.ru> wrote:
> Thanks, applied.

Can you fix the subject line in your tree to have a
prefix indicating which area of the codebase it affects,
please?

thanks
-- PMM

