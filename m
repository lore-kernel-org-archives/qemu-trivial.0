Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1chydQ-0003bG-Hk
	for mharc-qemu-trivial@gnu.org; Sun, 26 Feb 2017 08:13:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37237)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1chydO-0003ZZ-Bt
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2017 08:13:07 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1chydN-0006kx-B8
	for qemu-trivial@nongnu.org; Sun, 26 Feb 2017 08:13:06 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:50973)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1chydH-0006i6-A8; Sun, 26 Feb 2017 08:12:59 -0500
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
	(mreue002 [212.227.15.167]) with ESMTPSA (Nemesis) id
	0LfsQF-1bxOgE0x3L-00pfhC; Sun, 26 Feb 2017 14:12:41 +0100
To: Franklin Snaipe Mathieu <snaipe@diacritic.io>, qemu-devel@nongnu.org
References: <20170216085857.23501-1-snaipe@diacritic.io>
	<20170217085800.28873-1-snaipe@diacritic.io>
	<20170217085800.28873-2-snaipe@diacritic.io>
Cc: qemu-trivial@nongnu.org, snaipe@arista.com,
	Riku Voipio <riku.voipio@linaro.org>, Aurelien Jarno <aurelien@aurel32.net>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <00cd6802-c213-3212-5f29-ebef0a4dfa5e@vivier.eu>
Date: Sun, 26 Feb 2017 14:12:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.0
MIME-Version: 1.0
In-Reply-To: <20170217085800.28873-2-snaipe@diacritic.io>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K0:ezg9TO+QgxwcB1ExapC9lbCWbL5vChJnh65N3XgNGOhlWEvNiXI
	OoNO10zin+NrxcuNAiH6O9uusMsLhSu5JmBmafT+umAjwTpZHY5WYzt86T4LJesTmX2cvzm
	BvJiy/rr272U2oETxrUm2SFaXLy1QxVIZGTIV2+a0/PPHskc5TksrGUp8Tbe7kZ4OhHauN6
	zvYkfOMeBEHXuZ3Gd+2vQ==
X-UI-Out-Filterresults: notjunk:1;V01:K0:RquZaw7VEYY=:G9cFonzEG2Lo1ojU3ptuk0
	flAXhgsfO1uLMxbCnTyaBsNZthYyOTS6OWi52MztEAa9ERJ6u87hm7JbyKDX9GDuRzcDnBKrR
	8f9YHbB7v/xgeEkQ46hUsqPGmijoP95UVf9RdDqfWIjrXLZo0b9GQSrw5BQj3L9OImrUhSuTv
	tAoRnu6AVKo4arWpVLs5JPounIet3OTzPZEJz8bBi3eo+q2J68I7ajZ4khHN2/y4piF8BWnzl
	6jAdukd19Y64RarWbzp9y5ImEkZlpME+n27pA43P5IX2oOFEHiakODOpxTcoc8PTirmhr6zwH
	A0zE2wgeirhDQslAconAKGqAyYlNDNjiAsOQpoOt+XnVhenOihGHIppLAaLscz+ShETFoMTaP
	UEb7E1HKEBKXoxre1oO6QngUQ4A4TqYsl2MgBQjYsSo8OpLP/oWYq6zx2d+b24vH1xj66iE6z
	D//9up/OhUhR8qcJQ9AuNgIR+4dF08mwtkhy5U/hnOdpY8BsNHedzuHNbDPbN4BdxNYqSuO9d
	KJT3/M5u8rBsUmOFr0DHMCQkVgKc09YwpHIxq3RzGZvcpeq6Tp9gsz29wvjQNa1NeypxJ9a9W
	vNDLyRRvlt1i8SEP8k72EZouGk5MBt6+IpVLVzgDdgCkAId896qqlx0uODFl764uslFN3+6OF
	HK/88GuaAOYAWUgtInF4bazYvkZrE4OBh9jKp9uvmhQmp57OKA/g6L9JVcWqDRk5Tcr2a55jH
	1tLPURKMnJq+Sm3b
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.227.126.135
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] syscall: fixed
 mincore(2) not failing with ENOMEM
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
X-List-Received-Date: Sun, 26 Feb 2017 13:13:07 -0000

Le 17/02/2017 à 09:58, Franklin Snaipe Mathieu a écrit :
> From: "Franklin \"Snaipe\" Mathieu" <snaipe@diacritic.io>
> 
> The current implementation of the mincore(2) syscall sets errno to
> EFAULT when the region identified by the first two parameters is
> invalid.
> 
> This goes against the man page specification, where mincore(2) should
> only fail with EFAULT when the third parameter is an invalid address;
> and fail with ENOMEM when the checked region does not point to mapped
> memory.
> 
> Signed-off-by: Franklin "Snaipe" Mathieu <snaipe@diacritic.io>
> Cc: Riku Voipio <riku.voipio@linaro.org>
> Cc: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  linux-user/syscall.c | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 9be8e9530e..733e0009e1 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -11061,11 +11061,16 @@ abi_long do_syscall(void *cpu_env, int num, abi_long arg1,
>      case TARGET_NR_mincore:
>          {
>              void *a;
> +            ret = -TARGET_ENOMEM;
> +            a = lock_user(VERIFY_READ, arg1, arg2, 0);
> +            if (!a) {
> +                goto fail;
> +            }
>              ret = -TARGET_EFAULT;
> -            if (!(a = lock_user(VERIFY_READ, arg1,arg2, 0)))
> -                goto efault;
> -            if (!(p = lock_user_string(arg3)))
> +            p = lock_user_string(arg3);
> +            if (!p) {
>                  goto mincore_fail;
> +            }
>              ret = get_errno(mincore(a, arg2, p));
>              unlock_user(p, arg3, ret);
>              mincore_fail:
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>



