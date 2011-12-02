Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RWRCM-0002WJ-3j
	for mharc-qemu-trivial@gnu.org; Fri, 02 Dec 2011 06:22:34 -0500
Received: from eggs.gnu.org ([140.186.70.92]:45475)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RWRCF-0002Bz-T4
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 06:22:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RWRCE-0001zK-Kp
	for qemu-trivial@nongnu.org; Fri, 02 Dec 2011 06:22:27 -0500
Received: from mail-qy0-f173.google.com ([209.85.216.173]:38884)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1RWRC4-0001yY-9a; Fri, 02 Dec 2011 06:22:16 -0500
Received: by qcsd15 with SMTP id d15so210664qcs.4
	for <multiple recipients>; Fri, 02 Dec 2011 03:22:15 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.212.7 with SMTP id gq7mr2191104qcb.195.1322824935421; Fri,
	02 Dec 2011 03:22:15 -0800 (PST)
Received: by 10.229.226.211 with HTTP; Fri, 2 Dec 2011 03:22:15 -0800 (PST)
In-Reply-To: <1322818241-18137-1-git-send-email-sw@weilnetz.de>
References: <1322818241-18137-1-git-send-email-sw@weilnetz.de>
Date: Fri, 2 Dec 2011 11:22:15 +0000
Message-ID: <CAFEAcA9LfOWWhtE239H623MUBWiJFJHMcNaKh0kMcCzT1bz4qA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Stefan Weil <sw@weilnetz.de>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org,
	=?UTF-8?Q?Herv=C3=A9_Poussineau?= <hpoussin@reactos.org>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] Convert source files to
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
X-List-Received-Date: Fri, 02 Dec 2011 11:22:32 -0000

On 2 December 2011 09:30, Stefan Weil <sw@weilnetz.de> wrote:
> Most QEMU files either are pure ASCII or use UTF-8.
> Convert some files which still used ISO-8859-1 to UTF-8.

Looks good. It looks like with these done there are only
two more files which have non-UTF-8 in them:
./linux-user/cpu-uname.c
./linux-user/arm/nwfpe/fpopcode.h

We can deal with those in separate patches I guess.

(I checked with this command:

for f in $(find . -name '*.[ch]'); do iconv -f UTF-8 -t UTF-8 -o
/dev/null "$f" 2>/dev/null || echo "$f"; done

)

-- PMM

