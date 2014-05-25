Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WoLvw-0004jk-2J
	for mharc-qemu-trivial@gnu.org; Sat, 24 May 2014 20:05:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51728)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WoLvp-0004W0-SG
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 20:04:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WoLvg-00035y-N0
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 20:04:53 -0400
Received: from mail-la0-f51.google.com ([209.85.215.51]:43325)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1WoLvg-000344-G0
	for qemu-trivial@nongnu.org; Sat, 24 May 2014 20:04:44 -0400
Received: by mail-la0-f51.google.com with SMTP id gf5so4948322lab.24
	for <qemu-trivial@nongnu.org>; Sat, 24 May 2014 17:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vqJkccc3dPwR28pO5mU6n591CmXtNY3DVyUuUvKwnVI=;
	b=BT/bd0+0BwHH3+jfVTCAInOuQ3Mnqmpbn4+GIx1+BCNnkEtQZMQiGwUN2DtCjbZ+/c
	+lo3hH/I9W1ue8vZ09IZxGEkrLvrdUzNT1OAJmWl1eZY+upuUU7anb37sF3MtVTNR2eN
	sEzb0oFLUPVaZiBGPivS4mo/w59ufDmQxvtI/C0MdQ+DaL5QHDQ//duTHn7zR1GMsFOS
	GrNRg4kI6I/ugImRCVjp9bbyOFAk4DQyVi9rKBxLa9udpzOidH7SkcnvWhj/P+OnPz0Z
	ocTrsc+0MKObZbmDbTHN+5V6iZWBjXPT9lqu4jH4GNco5BwKGJjVQ/Yqf3LwTRRa/s7J
	V7Ng==
X-Gm-Message-State: ALoCoQntdT1Td7WNA/ApzOOz09vuneZ7gYNI03U7Vax3b768pSr2SZ4Zro9tGAKLqnYRnAFcj7ZY
X-Received: by 10.112.50.2 with SMTP id y2mr232163lbn.66.1400976282976; Sat,
	24 May 2014 17:04:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.112.158.228 with HTTP; Sat, 24 May 2014 17:04:22 -0700 (PDT)
In-Reply-To: <20140524232950.GH1904@beta.private.mielke.cc>
References: <20140524232950.GH1904@beta.private.mielke.cc>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 25 May 2014 01:04:22 +0100
Message-ID: <CAFEAcA9HtdLbXXF9RSXw_K8P-PNZ8ZOrFE9zJ6J2mGjVM=EFKg@mail.gmail.com>
To: Dave Mielke <dave@mielke.cc>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.215.51
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [Qemu-devel] patch: add delay=<msecs> suboption
	to -display curses
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
X-List-Received-Date: Sun, 25 May 2014 00:04:58 -0000

On 25 May 2014 00:29, Dave Mielke <dave@mielke.cc> wrote:
> The attached patch (qemu-curses-delay-1.patch) allows the user to specify that
> he needs -display curses to insert a delay in between key events. The current
> behaviour is that it inserts key events immediately, one right after another,
> which has proven to be too fast for some applications. Please let me know if
> there are any improvements you'd like me to make to this patch, with the goal
> that I'm hoping you'll accept it. A more detailed description of this patch is
> as follows:
>
> Add support for the "-display curses" option to accept suboptions (-display
> curses[,option...), and add the "delay=<msecs>" suboption. This suboption
> causes a millisecond-based delay to be inserted in between key events so that
> they won't be inserted immediately one after another. The delay is performed
> using a qemu virtual clock timer. If the "delay" option isn't specified, or if
> "delay=0" is specified, then the timer isn't used, thus making the default be
> the original behaviour. The "=<msecs>" operand is optional - if it isn't
> specified then 20 is assumed.

Why is this a problem only for the curses UI frontend, and not for
any of the other UIs which might send key events?

thanks
-- PMM

