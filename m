Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RWmva-0004B5-V5
	for mharc-qemu-trivial@gnu.org; Sat, 03 Dec 2011 05:34:42 -0500
Received: from eggs.gnu.org ([140.186.70.92]:35228)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RWmvY-00044U-Lz
	for qemu-trivial@nongnu.org; Sat, 03 Dec 2011 05:34:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RWmvX-0005ZJ-Vj
	for qemu-trivial@nongnu.org; Sat, 03 Dec 2011 05:34:40 -0500
Received: from mail-qw0-f52.google.com ([209.85.216.52]:35112)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1RWmvV-0005Yh-V0; Sat, 03 Dec 2011 05:34:38 -0500
Received: by qan41 with SMTP id 41so2415728qan.4
	for <multiple recipients>; Sat, 03 Dec 2011 02:34:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.186.72 with SMTP id cr8mr1474075qab.95.1322908477006; Sat,
	03 Dec 2011 02:34:37 -0800 (PST)
Received: by 10.229.226.211 with HTTP; Sat, 3 Dec 2011 02:34:36 -0800 (PST)
In-Reply-To: <1322905525-354-1-git-send-email-sw@weilnetz.de>
References: <1322905525-354-1-git-send-email-sw@weilnetz.de>
Date: Sat, 3 Dec 2011 10:34:36 +0000
Message-ID: <CAFEAcA-GOGj88y2PPPntgUopixkNOh_A_EAgDGtXVH2RQvRL6Q@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.52
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Convert keymap file to
	UTF-8 encoding
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
X-List-Received-Date: Sat, 03 Dec 2011 10:34:41 -0000

On 3 December 2011 09:45, Stefan Weil <sw@weilnetz.de> wrote:
> Most QEMU files either are pure ASCII or use UTF-8.
> Convert this keymap file which still used ISO-8859-1 to UTF-8.

Good catch -- I'd assumed the keymap files were binary :-)

-- PMM

