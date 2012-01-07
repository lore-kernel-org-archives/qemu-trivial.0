Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Rjck5-0000ve-Oy
	for mharc-qemu-trivial@gnu.org; Sat, 07 Jan 2012 15:19:53 -0500
Received: from eggs.gnu.org ([140.186.70.92]:57883)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Rjck3-0000re-Rj
	for qemu-trivial@nongnu.org; Sat, 07 Jan 2012 15:19:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1Rjck2-0002qd-VA
	for qemu-trivial@nongnu.org; Sat, 07 Jan 2012 15:19:51 -0500
Received: from mail-qy0-f173.google.com ([209.85.216.173]:60418)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1Rjck0-0002qK-IH; Sat, 07 Jan 2012 15:19:48 -0500
Received: by qcsd15 with SMTP id d15so1596372qcs.4
	for <multiple recipients>; Sat, 07 Jan 2012 12:19:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.69.79 with SMTP id y15mr4067588qci.73.1325967587856; Sat,
	07 Jan 2012 12:19:47 -0800 (PST)
Received: by 10.229.39.134 with HTTP; Sat, 7 Jan 2012 12:19:47 -0800 (PST)
In-Reply-To: <1325966426-475-1-git-send-email-aurelien@aurel32.net>
References: <1325966426-475-1-git-send-email-aurelien@aurel32.net>
Date: Sat, 7 Jan 2012 20:19:47 +0000
Message-ID: <CAFEAcA_i+VbHZBcArsL2OycPxo=QsyngLe_cMcSkVs0XLCQDpw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.216.173
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tcg-arm: fix a typo in
	comments
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
X-List-Received-Date: Sat, 07 Jan 2012 20:19:52 -0000

On 7 January 2012 20:00, Aurelien Jarno <aurelien@aurel32.net> wrote:
> ARM still doesn't support 16GB buffers in 32-bit modes, replace the
> 16GB by 16MB in the comment.
>
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM

