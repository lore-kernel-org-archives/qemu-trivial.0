Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1T0QkA-0002Pv-G5
	for mharc-qemu-trivial@gnu.org; Sun, 12 Aug 2012 01:29:42 -0400
Received: from eggs.gnu.org ([208.118.235.92]:53884)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1T0Qk7-0002HD-K8
	for qemu-trivial@nongnu.org; Sun, 12 Aug 2012 01:29:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1T0Qk6-0000vq-Ol
	for qemu-trivial@nongnu.org; Sun, 12 Aug 2012 01:29:39 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:60508)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1T0Qk2-0000vC-6G; Sun, 12 Aug 2012 01:29:34 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id ACF6BA0AB1;
	Sun, 12 Aug 2012 09:29:21 +0400 (MSK)
Message-ID: <50273F30.5080905@msgid.tls.msk.ru>
Date: Sun, 12 Aug 2012 09:29:20 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: Peter Maydell <peter.maydell@linaro.org>
References: <1344720275-26744-1-git-send-email-peter.maydell@linaro.org>
In-Reply-To: <1344720275-26744-1-git-send-email-peter.maydell@linaro.org>
X-Enigmail-Version: 1.4.1
OpenPGP: id=804465C5
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, patches@linaro.org
Subject: Re: [Qemu-trivial] [PATCH] iov_send_recv(): Handle zero bytes case
 even if OS does not
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
X-List-Received-Date: Sun, 12 Aug 2012 05:29:40 -0000

On 12.08.2012 01:24, Peter Maydell wrote:
> POSIX allows sendmsg() and recvmsg() to fail EMSGSIZE if passed a zero
> msg.msg_iovlen (in particular the MacOS X implementation will do this).

> Handle the case where iov_send_recv() is passed a zero byte count
> explicitly, to avoid accidentally depending on the OS to treat zero
> msg_iovlen as a no-op.

> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is what was causing 'make check' to fail on MacOS X.
> The other option was to declare that a zero bytecount was illegal, I guess.

I don't think sending/receiving zero bytes is a good idea in the
first place.  Which test were failed on MacOS?  Was it failing at
test-iov "random I/O"?

I thought I ensured that the test does not call any i/o function
with zero "count" argument.  Might be I was wrong, and in that
case THAT place should be fixed instead.

Can you provide a bit more details please?

The whole thing is actually interesting: this is indeed a system-
dependent corner case which should be handled in the code to make
the routine consistent.  But how to fix this is an open question
I think.  Your approach seems to be best, but we as well may
print a warning there...

Thank you!

/mjt

>  iov.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/iov.c b/iov.c
> index b333061..60705c7 100644
> --- a/iov.c
> +++ b/iov.c
> @@ -146,6 +146,13 @@ ssize_t iov_send_recv(int sockfd, struct iovec *iov, unsigned iov_cnt,
>  {
>      ssize_t ret;
>      unsigned si, ei;            /* start and end indexes */
> +    if (bytes == 0) {
> +        /* Catch the do-nothing case early, as otherwise we will pass an
> +         * empty iovec to sendmsg/recvmsg(), and not all implementations
> +         * accept this.
> +         */
> +        return 0;
> +    }
>  
>      /* Find the start position, skipping `offset' bytes:
>       * first, skip all full-sized vector elements, */


