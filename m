Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RSU8Q-000647-38
	for mharc-qemu-trivial@gnu.org; Mon, 21 Nov 2011 08:42:10 -0500
Received: from eggs.gnu.org ([140.186.70.92]:54025)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RSU8M-0005sX-NJ
	for qemu-trivial@nongnu.org; Mon, 21 Nov 2011 08:42:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1RSU8L-000128-Mb
	for qemu-trivial@nongnu.org; Mon, 21 Nov 2011 08:42:06 -0500
Received: from mail-qw0-f52.google.com ([209.85.216.52]:51062)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1RSU89-00010A-J3; Mon, 21 Nov 2011 08:41:53 -0500
Received: by qadz3 with SMTP id z3so102393qad.4
	for <multiple recipients>; Mon, 21 Nov 2011 05:41:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.29.73 with SMTP id p9mr1361237qcc.217.1321882912462; Mon,
	21 Nov 2011 05:41:52 -0800 (PST)
Received: by 10.229.88.68 with HTTP; Mon, 21 Nov 2011 05:41:52 -0800 (PST)
In-Reply-To: <4ECA52E8.6050801@web.de>
References: <1321730319-21498-1-git-send-email-sw@weilnetz.de>
	<4ECA52E8.6050801@web.de>
Date: Mon, 21 Nov 2011 13:41:52 +0000
Message-ID: <CAFEAcA_7ZKmAP9Sb=9Ahe055TCXQPtBwNxEcCQsicy9cTCi8KA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: =?UTF-8?Q?Andreas_F=C3=A4rber?= <andreas.faerber@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.52
Cc: qemu-trivial@nongnu.org, Stefan Weil <sw@weilnetz.de>,
	qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] darwin-user: Fix format
	string in debug message
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
X-List-Received-Date: Mon, 21 Nov 2011 13:42:07 -0000

On 21 November 2011 13:32, Andreas F=C3=A4rber <andreas.faerber@web.de> wro=
te:
> Is the debug output really useful without the information? Maybe rather
> append %p %x %x? What does linux-user do?

linux-user doesn't print any debug output at this point.

Incidentally, I'm increasingly of the opinion that the various minor
foo-user subtrees would be better off merged into a single user tree:
there is a steady stream of minor bugfixes/feature improvements that
go into linux-user that don't get into the others...

-- PMM

