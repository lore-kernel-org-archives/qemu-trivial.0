Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1W7kEv-0000Ot-AD
	for mharc-qemu-trivial@gnu.org; Mon, 27 Jan 2014 06:20:29 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1W7kEn-0000Og-Uk
	for qemu-trivial@nongnu.org; Mon, 27 Jan 2014 06:20:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>) id 1W7kEh-0003y9-V1
	for qemu-trivial@nongnu.org; Mon, 27 Jan 2014 06:20:21 -0500
Received: from static.88-198-71-155.clients.your-server.de
	([88.198.71.155]:45212 helo=socrates.bennee.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.bennee@linaro.org>)
	id 1W7kEh-0003y5-Ol; Mon, 27 Jan 2014 06:20:15 -0500
Received: from localhost ([127.0.0.1])
	by socrates.bennee.com with esmtp (Exim 4.80)
	(envelope-from <alex.bennee@linaro.org>)
	id 1W7kHe-00051z-Nx; Mon, 27 Jan 2014 12:23:18 +0100
References: <1390811181-21772-1-git-send-email-famz@redhat.com>
User-agent: mu4e 0.9.9.6pre2; emacs 24.3.50.5
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Fam Zheng <famz@redhat.com>
Message-ID: <87wqhl8yep.fsf@linaro.org>
In-reply-to: <1390811181-21772-1-git-send-email-famz@redhat.com>
Date: Mon, 27 Jan 2014 11:20:11 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 127.0.0.1
X-SA-Exim-Mail-From: alex.bennee@linaro.org
X-SA-Exim-Scanned: No (on socrates.bennee.com); SAEximRunCond expanded to false
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 88.198.71.155
Cc: qemu-trivial@nongnu.org, mjt@tls.msk.ru, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] tests/.gitignore:
	Ignoretests/check-qom-interfacee
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
X-List-Received-Date: Mon, 27 Jan 2014 11:20:28 -0000


famz@redhat.com writes:

> Signed-off-by: Fam Zheng <famz@redhat.com>
> ---
>  tests/.gitignore | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/tests/.gitignore b/tests/.gitignore
> index 1aed224..9ba9d96 100644
> --- a/tests/.gitignore
> +++ b/tests/.gitignore
> @@ -4,6 +4,7 @@ check-qint
>  check-qjson
>  check-qlist
>  check-qstring
> +check-qom-interface
>  test-aio
>  test-bitops
>  test-throttle

Are these generated test files? I've been looking at the tcg-tests and
while architecture ones won't clash there are a bunch of generic linux
tests that should probably be built one per target architecture. Should
we just be building all test files in the per-target build directories
like we do with qemu itself?


Cheers,

--
Alex Bennée
QEMU/KVM Hacker for Linaro


