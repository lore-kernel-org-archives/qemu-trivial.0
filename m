Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gFmZL-0007UE-6J
	for mharc-qemu-trivial@gnu.org; Thu, 25 Oct 2018 16:49:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49604)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFmZD-0007QV-Vg
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 16:49:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gFmZ3-00039o-5j
	for qemu-trivial@nongnu.org; Thu, 25 Oct 2018 16:49:16 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:41771)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gFmZ2-000391-Hh; Thu, 25 Oct 2018 16:49:09 -0400
Received: from [10.43.15.91] ([94.185.135.34]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.184]) with ESMTPSA (Nemesis) id
	1N8G6I-1fTZi714nA-014BBw; Thu, 25 Oct 2018 22:48:51 +0200
Received: from [10.43.15.91] ([94.185.135.34]) by mrelayeu.kundenserver.de
	(mreue106 [212.227.15.184]) with ESMTPSA (Nemesis) id
	1N8G6I-1fTZi714nA-014BBw; Thu, 25 Oct 2018 22:48:51 +0200
To: "Emilio G. Cota" <cota@braap.org>, qemu-devel@nongnu.org
Cc: Riku Voipio <riku.voipio@iki.fi>, qemu-trivial@nongnu.org
References: <20180811211011.6277-1-cota@braap.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <a101eaea-7605-f9f7-cc2b-762a6539a91c@vivier.eu>
Date: Thu, 25 Oct 2018 21:48:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180811211011.6277-1-cota@braap.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:im3b/4tagLqqfD/6DBz5JHcRJKmA2NLoYmyYt88ru63DuNI41f5
	ecNHA71Go0+0VcGRql31YytGoTc7wZ1wZuuI7n7obIuDKPmxTNcXFEMYcHUn5M9wMU16RwI
	7Ocng1mjYED7SYXmS5RyNMrMoZXbCFyOxg58xTwyjYpEp1sUpC9lfZxtW7eDIxTUDlAC2ta
	DOz19ADcz4BglENH3RFDA==
X-UI-Out-Filterresults: notjunk:1;V01:K0:VEIXhI3reaM=:DrubqdZKQtpnOwbPLZ5c4D
	SzAG8765mUG7h6fwFLZHqz+z+9oO0Sqg0VsmmFLZfZpWh2GBFioFlY1IJSqmNbFB0P1G6uWaQ
	qDTUIKNaKCvv+pSvT6H6w7ktdMJImIzL9TWkO6kQgFO6JZEwKmeXEMS71i1/1s1Gmd2SdevZ6
	s4SzwYyZNFWeFQaadg2Zoo74cdfvDfEc7QFre2RES7tZ6mxSuZHw2urOtXm1WBnXF8umPcyrF
	GYF2a/OgNklZnlGSuSrBevoCmDYEvzyyfEqfEcVimu7g4Zyjfym2LSvQcBaJ6UPxUrDu0A1/i
	K/18ssu3BIOiom7q+KwsPxTfayZBCJXmoyHgNyseuia9rZ8bIMNSKjKqQ9FksUqPvVXSSdbLQ
	KDFUJZZcH0Wd1TiIePVvVpqAdminjsfDJoh8TdAEEeltFgL3uVK23VkGhStbyAL8XXMEoYqTD
	sj7PcO82oe88G/hUh2wsNw0L8s4p5FPriyyKyj6K08xfxi/S56PwfLptyeQYSwtX4G3ZzFtOz
	t/pj5evGnWMA5H+tw/ggo62v2gWubKfijIFB36/aj3mU8YdrXKM1Pm0QHr9Us6PQe3/c+QdVl
	rftxVZnUT/cJiJzWRBt0zRQsNFOk37r9/eM0vgdLBgT1kbGCbeThj9CFL7v+SWXYPf12cnY55
	RZ8muyylbpWO8HAIQwpnSJWU8gzAPq2m+4jlp1V9+UsYc4+YG3ILM325wVeiEWR6lURdHfhay
	j8pGblMN4MWqP7ih
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.24
Subject: Re: [Qemu-trivial] [PATCH] linux-user: fix comment
 s/atomic_write/atomic_set/
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
X-List-Received-Date: Thu, 25 Oct 2018 20:49:24 -0000

On 11/08/2018 22:10, Emilio G. Cota wrote:
> Signed-off-by: Emilio G. Cota <cota@braap.org>
> ---
>  linux-user/qemu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/linux-user/qemu.h b/linux-user/qemu.h
> index b4959e41c6..e6a8bc5867 100644
> --- a/linux-user/qemu.h
> +++ b/linux-user/qemu.h
> @@ -143,7 +143,7 @@ typedef struct TaskState {
>      /* Nonzero if process_pending_signals() needs to do something (either
>       * handle a pending signal or unblock signals).
>       * This flag is written from a signal handler so should be accessed via
> -     * the atomic_read() and atomic_write() functions. (It is not accessed
> +     * the atomic_read() and atomic_set() functions. (It is not accessed
>       * from multiple threads.)
>       */
>      int signal_pending;
> 

Applied

Thanks,
Laurent

