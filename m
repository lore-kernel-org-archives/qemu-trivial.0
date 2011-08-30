Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1QyML7-0003rk-Au
	for mharc-qemu-trivial@gnu.org; Tue, 30 Aug 2011 07:18:45 -0400
Received: from eggs.gnu.org ([140.186.70.92]:44526)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1QyML4-0003gf-FX
	for qemu-trivial@nongnu.org; Tue, 30 Aug 2011 07:18:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1QyML1-0004Ar-TR
	for qemu-trivial@nongnu.org; Tue, 30 Aug 2011 07:18:42 -0400
Received: from mail-pz0-f42.google.com ([209.85.210.42]:46357)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>)
	id 1QyMKz-00049l-J5; Tue, 30 Aug 2011 07:18:37 -0400
Received: by pzk37 with SMTP id 37so12271879pzk.29
	for <multiple recipients>; Tue, 30 Aug 2011 04:18:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.142.178.15 with SMTP id a15mr2999202wff.170.1314703115031;
	Tue, 30 Aug 2011 04:18:35 -0700 (PDT)
Received: by 10.143.82.12 with HTTP; Tue, 30 Aug 2011 04:18:35 -0700 (PDT)
In-Reply-To: <4e5c8d01.05cbe30a.22c4.ffffe8ac@mx.google.com>
References: <4e5c8d01.05cbe30a.22c4.ffffe8ac@mx.google.com>
Date: Tue, 30 Aug 2011 12:18:35 +0100
Message-ID: <CAFEAcA9bDrOPybSZX6pYzb8dwJJVymfThcaJSgZhNKG9+4=2OA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
To: Boris Figovsky <boris.figovsky@ravellosystems.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6 (newer, 2)
X-Received-From: 209.85.210.42
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] x86: fix daa opcode for al
 register values higher than 0xf9
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
X-List-Received-Date: Tue, 30 Aug 2011 11:18:43 -0000

On 30 August 2011 08:00, Boris Figovsky
<boris.figovsky@ravellosystems.com> wrote:
> The second if statement should consider the original al register value,
> and not the new one.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(It took me some time to convince myself that the line
   CF <- old_CF or (Carry from AL <- AL + 6)
in the Intel architecture manual is actually redundant; the
AMD docs are much clearer here...)

-- PMM

