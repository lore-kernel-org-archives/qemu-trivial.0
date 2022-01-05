Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1n514A-0007uJ-40
	for mharc-qemu-trivial@gnu.org; Wed, 05 Jan 2022 02:50:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n513v-0007rT-9x
 for qemu-trivial@nongnu.org; Wed, 05 Jan 2022 02:50:23 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:44075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n513s-0004gi-0m
 for qemu-trivial@nongnu.org; Wed, 05 Jan 2022 02:50:22 -0500
Received: from [192.168.100.1] ([82.142.30.62]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MuluN-1mEZ1u2wOR-00rrgt; Wed, 05 Jan 2022 08:50:09 +0100
Message-ID: <833ec4a8-58df-ca13-2d42-cb89d4d6e0ef@vivier.eu>
Date: Wed, 5 Jan 2022 08:50:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] linux-user/syscall.c: malloc to g_try_malloc
Content-Language: fr
To: Ahmed Abouzied <email@aabouzied.com>, qemu-trivial@nongnu.org
References: <20220104144602.25300-1-email@aabouzied.com>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220104144602.25300-1-email@aabouzied.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:u7c6jjxGENwUv+GhezdofWks5yBg4ntYABqQ8+2Q1LJ5z7pdxBv
 cx2LSu7KSAudcBIg0TJJxvwyMWSYqCKQsgG+n6woVCnZwetJ0FmpiboMMjKzSzuhsUWfOzc
 c/2f9K8O4JQbzauPVPrgvTmxZv6jqeU2Ny966j8cCjndixsb4rRhpICZWdNx3mIuf3CENYq
 1QzjPRGQtTA8KgB1WAhrQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:MN3zBPcrplM=:iN4x6Qd4kYipC7eNt9p1O3
 hIa7IGJ7GrUryvIgC1NGNXkK3iONrrcP+lfJlXY//IJaCfgCYwwKCq8Xzvt29OAQnSh9Cx3Vr
 uAuY3zwUGVrsdqfbB54H5Z0yhn0VioGz2NO+y5Rz6nbM5QOrTzQW6pXfkB6WKg1n2676YLP3q
 nC63yj0m6tUiI/cs33BICdFqjovZFGEvONu/F4JJEXHLf2JekkMcW5170K208SVuL7FCNWugJ
 LV2IsVHaLYCNphI6TWT7K4II9WY712jeOIjeiPrfABkfG7N5PK6O2U1Y3WImiFoUrovcxUcEW
 YZgsokxWyjv9t73xRM8DdQgZZLS2udhMXEAlOrnm4hJNEYsRcJIln0DgzqTohDJa4US/2AZp/
 2O9/KfxJesloQJ93AZ1ilLAowrIiST7bAfFCOEE46ZgwSrB/2TA6Zz3VmHrPtzR5VPdJMmIiL
 QNvxpzkqlC9V+BrcfmlXqtHneVhv7uZeFztScPijNw2Mij++wXeCntj1g4CNUcZIVCR1x7pbP
 v16qeihLuZdmDbIYOM+afF071vh1QxWCJG8j5M/WDmdGFkAPRQb2+G/2xW5PSHZ8NqPQLqkp/
 0BIPiW4eGmjUn43E4P0MB+Odadk5tPV0SAl24f19BwR0GMMJVrEMZC0+h7JUUOR5DDePMmBq9
 4Huvyl3IXGh8zdcOHEbKrrWuQhAeqUkQ2ztCcaIYBW3jxmTJOaBMJuNas3kkKPL1mB9w=
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.057,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Jan 2022 07:50:23 -0000

Le 04/01/2022 à 15:46, Ahmed Abouzied a écrit :
> Use g_try_malloc instead of malloc to alocate the target ifconfig.
> Also replace the corresponding free with g_free.
> 
> Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
> ---
> 
> Hello,
> 
> I noticed that there was a `malloc` call in this file. It seems that it
> was added by the commit 22e4a267 (3 years ago) which was after the commit
> 0e173b24 (6 years ago) that replaced malloc calls with glib alternative calls.
> 
> There is no issue for this on Gitlab. Should I have created an issue
> first?
> 
> Best regards,
> 
>   linux-user/syscall.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/linux-user/syscall.c b/linux-user/syscall.c
> index 56a3e17183..715f9430e1 100644
> --- a/linux-user/syscall.c
> +++ b/linux-user/syscall.c
> @@ -4867,7 +4867,7 @@ static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
>                * We can't fit all the extents into the fixed size buffer.
>                * Allocate one that is large enough and use it instead.
>                */
> -            host_ifconf = malloc(outbufsz);
> +            host_ifconf = g_try_malloc(outbufsz);
>               if (!host_ifconf) {
>                   return -TARGET_ENOMEM;
>               }
> @@ -4915,7 +4915,7 @@ static abi_long do_ioctl_ifconf(const IOCTLEntry *ie, uint8_t *buf_temp,
>       }
>   
>       if (free_buf) {
> -        free(host_ifconf);
> +        g_free(host_ifconf);
>       }
>   
>       return ret;

Reviewed-by: Laurent Vivier <laurent@vivier.eu>

