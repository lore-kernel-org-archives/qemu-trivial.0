Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fLunC-0008N0-05
	for mharc-qemu-trivial@gnu.org; Thu, 24 May 2018 14:16:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36028)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fLun8-0008Kd-0X
	for qemu-trivial@nongnu.org; Thu, 24 May 2018 14:16:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1fLun3-00050n-Th
	for qemu-trivial@nongnu.org; Thu, 24 May 2018 14:16:45 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:39227)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1fLun3-0004zw-Ja; Thu, 24 May 2018 14:16:41 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue103 [212.227.15.183]) with ESMTPSA (Nemesis) id
	0LrZ6L-1gMaXu1PEj-013JUd; Thu, 24 May 2018 20:16:27 +0200
To: Steve Mcpolin <smcpolin@vmware.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, riku.voipio@iki.fi
References: <20180516152708.9ECB1A5D5F2@smcpolin-M01.vmware.com>
From: Laurent Vivier <laurent@vivier.eu>
Openpgp: preference=signencrypt
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
	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
Message-ID: <e5573e4b-51d4-ddd0-5b12-31b5da1cdb5c@vivier.eu>
Date: Thu, 24 May 2018 20:16:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180516152708.9ECB1A5D5F2@smcpolin-M01.vmware.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:IPj/H86mv7zxzr2M/5kxIB5lC3VaXwZCwiOsb9DMNKCVFoiUBtq
	DgtmPo1p5nsTpMvNnIIu6OuJBINjcx5bBqKPOGWLFghC3udZ6fDBkD0VEaQkJIfwfUY+IPI
	OBae7b2hbAn3Ww0lx5QJRFk6id2U2BN9WMNgQuaYs5y5bxVwSfI/SbVMrk14YoRvuU5HQzf
	zw94OynAoPQmkHSoqxLDQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:QGJTOM4mUC4=:XFx5azwDPot0R0pQgfO7IT
	dV804h2s/irWD/7K+62nBBFI8MnB6s/dOTT+SHiq3ToUYArknmSoJZnYU1WtwR9YG5e8gL0j2
	EaZQh3CsYGZ1dYyq279XuBVcJT4nTlwiLz7G4eMb50e3oLDzPMJIBRGsBK28157DjvqF+0n7o
	CT/8qxOwDRLZJBlNLsqJzxOKlOIMcEwSM2e4q3TO6iMKJeEtSUM8KewKfci5fi1K8OKAKmNaO
	Bz2dG+BITmR+mltG7v/luiwBcEL/AeONUTCeX+gIySoET62ytt1K4izFN383DtLcsIe9Q0Ill
	I30OxljSYv5x7OgOPMUvXWZTTvJtaXHX83chHQRvcv/34bTKWLSrl4QqmIXsUFuEtKfJs1RwA
	awXiY+wFUL6Z55v8s6uGQ4lz7EqPZHiIGzGgRqROW563mSBgWCL2qtEzdGsf7Eiknzpa3poqB
	VCRD8NEn6onLmzPxeq8wadChvI1jwZTw5SWsS1G68BffihQaulcwMQBEJX55J/u/lVedlozei
	giOkdB+oOb+6mvyM1KB03ortqg+azg+sWBxEvAEHDzI2X2ZvCBUgpW5KSxZ+nrRNBiaYlPbVt
	Dnv8NwkUWU06eTocD38ihkl9FhCDUX0u65wcKGPxFyfvZCH1527J0txeBkHVB6HchtSUJaLC9
	lZfoxV6I6twepHMz7ZEtc1Ec0OYDWQirWgn0GZ5rz1ity6gwddEWEm+EvQbFPPtP2/cfZ0RaK
	TaVenvNX2u9vW8RC
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.17.13
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] linux-user: Remove extra
 mapping
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
X-List-Received-Date: Thu, 24 May 2018 18:16:49 -0000

Le 16/05/2018 à 16:47, Steve Mcpolin a écrit :
> When a guest mmap()'d a file, a transient MAP_ANONYMOUS mapping was
> created, which required the kernel to reserve this memory, then
> subsequently released by applying a mapping with just the requested
> flags and fd.
> This transient mapping causes spurious failures when the available
> memory is smaller than the mapping.  This patch avoids this transient
> mapping.
> 
> Signed-off-by: Steve Mcpolin <smcpolin@vmware.com>
> ---
>  linux-user/mmap.c | 31 +++++++++++++++++++------------
>  1 file changed, 19 insertions(+), 12 deletions(-)
> 
> diff --git a/linux-user/mmap.c b/linux-user/mmap.c
> index 9168a20..f91841f 100644
> --- a/linux-user/mmap.c
> +++ b/linux-user/mmap.c
> @@ -453,21 +453,28 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
>          /* Note: we prefer to control the mapping address. It is
>             especially important if qemu_host_page_size >
>             qemu_real_host_page_size */
> -        p = mmap(g2h(start), host_len, prot,
> -                 flags | MAP_FIXED | MAP_ANONYMOUS, -1, 0);
> -        if (p == MAP_FAILED)
> -            goto fail;
> -        /* update start so that it points to the file position at 'offset' */
> -        host_start = (unsigned long)p;
> -        if (!(flags & MAP_ANONYMOUS)) {
> -            p = mmap(g2h(start), len, prot,
> +        if (flags & MAP_ANONYMOUS) {
> +            offset = 0;
> +            host_offset = 0;
> +            fd = -1;
> +        }
> +        p = mmap(g2h(start), len, prot,
>                       flags | MAP_FIXED, fd, host_offset);
> -            if (p == MAP_FAILED) {
> -                munmap(g2h(start), host_len);
> -                goto fail;
> +        host_start = (uintptr_t)p;
> +        if (p != MAP_FAILED && host_len > HOST_PAGE_ALIGN(len)) {
> +            void *q;
> +            q = mmap(g2h(start + len), host_len - HOST_PAGE_ALIGN(len),

I think you should use REAL_HOST_PAGE_ALIGN(len) above.

This is the page size used by the host mmap() (it comes from
getpagesize()), whereas HOST_PAGE_ALIGN() can come from the command line
arguments.

Thanks,
Laurent

