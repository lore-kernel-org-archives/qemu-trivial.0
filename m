Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1RFhSm-0007Al-Oe
	for mharc-qemu-trivial@gnu.org; Mon, 17 Oct 2011 03:18:20 -0400
Received: from eggs.gnu.org ([140.186.70.92]:47078)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <raywang@linux.vnet.ibm.com>) id 1RFhSk-00071n-5X
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 03:18:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <raywang@linux.vnet.ibm.com>) id 1RFhSi-0006l1-VG
	for qemu-trivial@nongnu.org; Mon, 17 Oct 2011 03:18:18 -0400
Received: from e28smtp03.in.ibm.com ([122.248.162.3]:45175)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <raywang@linux.vnet.ibm.com>)
	id 1RFhSf-0006ji-31; Mon, 17 Oct 2011 03:18:13 -0400
Received: from d28relay03.in.ibm.com (d28relay03.in.ibm.com [9.184.220.60])
	by e28smtp03.in.ibm.com (8.14.4/8.13.1) with ESMTP id p9H7I6Ls022241;
	Mon, 17 Oct 2011 12:48:06 +0530
Received: from d28av04.in.ibm.com (d28av04.in.ibm.com [9.184.220.66])
	by d28relay03.in.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id
	p9H7I4214223166; Mon, 17 Oct 2011 12:48:06 +0530
Received: from d28av04.in.ibm.com (loopback [127.0.0.1])
	by d28av04.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id
	p9H7I4IP023646; Mon, 17 Oct 2011 18:18:04 +1100
Received: from [9.115.116.13] ([9.115.116.13])
	by d28av04.in.ibm.com (8.14.4/8.13.1/NCO v10.0 AVin) with ESMTP id
	p9H7I3YG022524; Mon, 17 Oct 2011 18:18:03 +1100
Message-ID: <4E9BD68E.2090304@linux.vnet.ibm.com>
Date: Mon, 17 Oct 2011 15:17:34 +0800
From: Ray Wang <raywang@linux.vnet.ibm.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Stefan Weil <sw@weilnetz.de>
References: <1318788646-29069-1-git-send-email-sw@weilnetz.de>
In-Reply-To: <1318788646-29069-1-git-send-email-sw@weilnetz.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6, seldom 2.4 (older,
	4)
X-Received-From: 122.248.162.3
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target_sparc: Fix use of
 free() instead of g_free()
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
X-List-Received-Date: Mon, 17 Oct 2011 07:18:19 -0000

On 10/17/2011 02:10 AM, Stefan Weil wrote:
> This error was reported by cppcheck.
>
> Signed-off-by: Stefan Weil<sw@weilnetz.de>
> ---
>   target-sparc/helper.c |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target-sparc/helper.c b/target-sparc/helper.c
> index c80531a..ca9bf6b 100644
> --- a/target-sparc/helper.c
> +++ b/target-sparc/helper.c
> @@ -1200,8 +1200,8 @@ static int cpu_sparc_register(CPUSPARCState *env, const char *cpu_model)
>
>   static void cpu_sparc_close(CPUSPARCState *env)
>   {
> -    free(env->def);
> -    free(env);
> +    g_free(env->def);
> +    g_free(env);
>   }
>
>   CPUSPARCState *cpu_sparc_init(const char *cpu_model)
Reviewed-by: Ray Wang<raywang@linux.vnet.ibm.com>

-- 
Regards,

Ray Wang


