Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1R7uHu-0006Hg-UY
	for mharc-qemu-trivial@gnu.org; Sun, 25 Sep 2011 15:22:54 -0400
Received: from eggs.gnu.org ([140.186.70.92]:44804)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1R7uHs-00069k-VY
	for qemu-trivial@nongnu.org; Sun, 25 Sep 2011 15:22:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1R7uHr-0007AL-Tv
	for qemu-trivial@nongnu.org; Sun, 25 Sep 2011 15:22:52 -0400
Received: from mail-pz0-f43.google.com ([209.85.210.43]:59593)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1R7uHp-00079r-Oi; Sun, 25 Sep 2011 15:22:49 -0400
Received: by pzd13 with SMTP id 13so13288006pzd.2
	for <multiple recipients>; Sun, 25 Sep 2011 12:22:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.15.71 with SMTP id v7mr24564826pbc.111.1316978567867; Sun,
	25 Sep 2011 12:22:47 -0700 (PDT)
Received: by 10.143.82.20 with HTTP; Sun, 25 Sep 2011 12:22:47 -0700 (PDT)
In-Reply-To: <1316974483-16947-1-git-send-email-antonynpavlov@gmail.com>
References: <1316974483-16947-1-git-send-email-antonynpavlov@gmail.com>
Date: Sun, 25 Sep 2011 20:22:47 +0100
Message-ID: <CAFEAcA8w644h4YCYOyoj79xNPNQFHjAORi=n5ka5sg1gm9kYoQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Antony Pavlov <antonynpavlov@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.43
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 1/2] gt64xxx.c: fix length
 modifier in DPRINTF format string
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
X-List-Received-Date: Sun, 25 Sep 2011 19:22:54 -0000

On 25 September 2011 19:14, Antony Pavlov <antonynpavlov@gmail.com> wrote:
> The commit fc2bf44972349b078d8310466c3866615500e67f
> changed the type of val argument of the function gt64120_writel()
> from uint32_t to uint64_t, so we need to change the corresponding
> length modifier from '%x' to '%llx'.

For a uint64_t you need to use PRIx64 -- '%llx' won't work on
systems where uint64_t isn't typedefed as 'long long'.

-- PMM

