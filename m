Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1caRa6-0008CO-EW
	for mharc-qemu-trivial@gnu.org; Sun, 05 Feb 2017 13:30:34 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53357)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1caRa4-0008BR-R6
	for qemu-trivial@nongnu.org; Sun, 05 Feb 2017 13:30:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1caRa4-0003ic-4j
	for qemu-trivial@nongnu.org; Sun, 05 Feb 2017 13:30:32 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:53949)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1caRZx-0003ej-Mu; Sun, 05 Feb 2017 13:30:25 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue003 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0LcTL8-1c8Ubi0JQE-00jmjy; Sun, 05 Feb 2017 19:30:20 +0100
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20170203170729.12399-1-pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <1c3e6016-1a6d-6d97-ce0b-4afb3e9b981b@vivier.eu>
Date: Sun, 5 Feb 2017 19:30:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.6.0
MIME-Version: 1.0
In-Reply-To: <20170203170729.12399-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:gWO3WZTqeLipTr9LzS96r/QH+m9PLFyvNPgdp9cb9zIZnJy1tJT
	X9ulK3XtKZbfqGmnP67ptXgBRYa7OvInVVKegkesXrB+7fkQYIbyFaCY6wTuaaD4ig4p3k6
	WAoipvZcrtLDxkfl9JYeSI8rwjNgQB+vlcpIHAMzfAX8t9M6LmpqewMiKzIfflBNJpDmYkK
	m6IS6OWfkn0inySSnei/w==
X-UI-Out-Filterresults: notjunk:1;V01:K0:knSDCR5ARdA=:tTmdSV/wupS6TzEXqBK6Xd
	4V2xmXe0AEUnr4+G8YvOzfX34aovZO6fJg48uMlIHJ8p9GlXTSm5KXhwxa5/n/MsVVQ6tuw9t
	C25mbdd7zFUuSV+kP5wa32wRxZhapcMuvMHCxm5IyL/cqpEC27Z7H5Q52wAnd7Y1bBGD1+aZZ
	n+r4873Vae2C13SA30/c4vVO169aJOrgppQMwLBseGZBD0THg9plscYKw+epPcVLBY3e7o9+E
	ekQVdlp0XgmTUmRkQgf3+fMA0/cLxRc9DGxzRMgR2LHVrJA9CfBcsk75BO0NJjGZpwUlzF9Wy
	WmI02qg9wPjIS2U1Cu9o3Jm8EX/CjXZQha9tgBkfg7t4Hyn1uZNC8/5Jh76Gn7ALlO0P4p0Gq
	ghYgD1crEFir/OQsQW6tmF3gm42NVV7I48ccvSrCVlfF8DLkB5EYOMIHwB5cQmX87irRebpFp
	/4oo8mccoppcuSWQe/lbcSDbV3XpoShm8GO/Iin1TPZhjLZM0HnA3xpt189i/es7rtPtzN+YO
	eOVUn/GMSUUEfR2Lz1aPXAc7jHKwSSCNvX/WMfs21LOIhE4liNUOKmjQxuM2h6j7Tj9qIUjGX
	H5AF5KwGgstWlKtjgFjE1xQB6BVa9RkR3l6t4+y0MzvlvEFsga/2tv/n5eO8tslFwzLdL49UI
	m/98r3XO2Q9cOtlXTQFsKLwhBVoEmA6VjV3fx/dwrjIu+ghvswrgWJk9ArkAJdnmm6YHduQtn
	cddjOp7Xtes3L0q3
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.187
Subject: Re: [Qemu-trivial] [PATCH] test-vmstate: remove
 yield_until_fd_readable
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Feb 2017 18:30:33 -0000

Le 03/02/2017 à 18:07, Paolo Bonzini a écrit :
> The function is not needed anymore now that migration is built on
> top of QIOChannel.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  tests/test-vmstate.c | 11 -----------
>  1 file changed, 11 deletions(-)
> 
> diff --git a/tests/test-vmstate.c b/tests/test-vmstate.c
> index 9d87faf..0c2af4d 100644
> --- a/tests/test-vmstate.c
> +++ b/tests/test-vmstate.c
> @@ -33,17 +33,6 @@
>  static char temp_file[] = "/tmp/vmst.test.XXXXXX";
>  static int temp_fd;
>  
> -/* Fake yield_until_fd_readable() implementation so we don't have to pull the
> - * coroutine code as dependency.
> - */
> -void yield_until_fd_readable(int fd)
> -{
> -    fd_set fds;
> -    FD_ZERO(&fds);
> -    FD_SET(fd, &fds);
> -    select(fd + 1, &fds, NULL, NULL, NULL);
> -}
> -
>  
>  /* Duplicate temp_fd and seek to the beginning of the file */
>  static QEMUFile *open_test_file(bool write)
> 

Tested-by: Laurent Vivier <laurent@vivier.eu>


