Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Wk8hH-0001GS-N9
	for mharc-qemu-trivial@gnu.org; Tue, 13 May 2014 05:08:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48478)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Wk8h9-00012f-IA
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 05:08:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1Wk8h3-0007PP-Ji
	for qemu-trivial@nongnu.org; Tue, 13 May 2014 05:08:19 -0400
Received: from mail-ee0-x235.google.com ([2a00:1450:4013:c00::235]:50111)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1Wk8gq-0007MZ-Ly; Tue, 13 May 2014 05:08:00 -0400
Received: by mail-ee0-f53.google.com with SMTP id c13so164132eek.26
	for <multiple recipients>; Tue, 13 May 2014 02:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ua/qD6RCzNDTBZ8pZhbLiaHYroliegJPkGH3twCGGp4=;
	b=ldvlhtdVIU4ngl0MKJkIAEAQ/IaZj84T4NJLnPhyRc75+6QO0H5QPJpGNFy2SaHXcq
	yxL283TmKu+HU0PFau+0q0v2a8Qbx8plSf1UaLiW989+Y48nyviQm4K2MBznC+Mi6k50
	/i4a5Ny7ioEpv6vF8YvHXH1jgC2pxb6AM2kok7pEKdKCSIhj3ziZOQNfwzafJ4pNUTMR
	rh4xqaKDuitUcumSYxcCzCBXW0f8Qi2zdRbvR5ExTrLACDN5/nseiRt28uWvFLTh75wV
	eqZzSMTxPUtdEPd8TNHecEayt+sBE0/RfRV3eklD+fVAlmLdmJ9GyIoZ2SO0dPLj2o3C
	17uQ==
X-Received: by 10.15.43.77 with SMTP id w53mr39652950eev.10.1399972079764;
	Tue, 13 May 2014 02:07:59 -0700 (PDT)
Received: from yakj.usersys.redhat.com (net-37-117-141-58.cust.vodafonedsl.it.
	[37.117.141.58]) by mx.google.com with ESMTPSA id
	cj41sm38786205eeb.34.2014.05.13.02.07.57 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 13 May 2014 02:07:58 -0700 (PDT)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <5371E0EC.5000406@redhat.com>
Date: Tue, 13 May 2014 11:07:56 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Hani Benhabiles <kroosec@gmail.com>, qemu-devel@nongnu.org
References: <1399937716-6086-1-git-send-email-kroosec@gmail.com>
In-Reply-To: <1399937716-6086-1-git-send-email-kroosec@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:4013:c00::235
Cc: qemu-trivial@nongnu.org, kwolf@redhat.com, stefanha@redhat.com
Subject: Re: [Qemu-trivial] [PATCH 1/2] nbd: Close socket on negotiation
	failure.
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
X-List-Received-Date: Tue, 13 May 2014 09:08:25 -0000

Il 13/05/2014 01:35, Hani Benhabiles ha scritto:
> Otherwise, the nbd client may hang waiting for the server response.
>
> Signed-off-by: Hani Benhabiles <hani@linux.com>
> ---
>
> Quick method to trigger such behaviour:
>
> (qemu) nbd_server_start localhost:10809
> (qemu) nbd_server_add sd0
> $ nbd-client localhost 10809 -name AAAA /dev/nbd0
> Negotiation: ..
>
> (Client will hang indefinitely.)
>
>  blockdev-nbd.c | 4 ++--
>  qemu-nbd.c     | 4 +++-
>  2 files changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/blockdev-nbd.c b/blockdev-nbd.c
> index 922cf56..b60b66d 100644
> --- a/blockdev-nbd.c
> +++ b/blockdev-nbd.c
> @@ -27,8 +27,8 @@ static void nbd_accept(void *opaque)
>      socklen_t addr_len = sizeof(addr);
>
>      int fd = accept(server_fd, (struct sockaddr *)&addr, &addr_len);
> -    if (fd >= 0) {
> -        nbd_client_new(NULL, fd, nbd_client_put);
> +    if (fd >= 0 && !nbd_client_new(NULL, fd, nbd_client_put)) {
> +        close(fd);
>      }
>  }
>
> diff --git a/qemu-nbd.c b/qemu-nbd.c
> index eed79fa..f70e4b0 100644
> --- a/qemu-nbd.c
> +++ b/qemu-nbd.c
> @@ -369,8 +369,10 @@ static void nbd_accept(void *opaque)
>          return;
>      }
>
> -    if (fd >= 0 && nbd_client_new(exp, fd, nbd_client_closed)) {
> +    if (nbd_client_new(exp, fd, nbd_client_closed)) {
>          nb_fds++;
> +    } else {
> +        close(fd);
>      }
>  }
>
>

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Michael, can you queue this yourself?

Paolo

