Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1V19jT-0001X7-18
	for mharc-qemu-trivial@gnu.org; Mon, 22 Jul 2013 02:36:31 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53455)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1V19jR-0001VA-Hz
	for qemu-trivial@nongnu.org; Mon, 22 Jul 2013 02:36:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1V19jQ-0005Dg-EO
	for qemu-trivial@nongnu.org; Mon, 22 Jul 2013 02:36:29 -0400
Received: from goliath.siemens.de ([192.35.17.28]:32435)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>)
	id 1V19jO-0005DN-7r; Mon, 22 Jul 2013 02:36:26 -0400
Received: from mail1.siemens.de (localhost [127.0.0.1])
	by goliath.siemens.de (8.13.6/8.13.6) with ESMTP id r6M6aJCL016802;
	Mon, 22 Jul 2013 08:36:19 +0200
Received: from mchn199C.mchp.siemens.de ([146.254.78.2])
	by mail1.siemens.de (8.13.6/8.13.6) with SMTP id r6M6aIqj011947;
	Mon, 22 Jul 2013 08:36:18 +0200
Message-ID: <51ECD2E2.2070000@siemens.com>
Date: Mon, 22 Jul 2013 08:36:18 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de;
	rv:1.8.1.12) Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12
	Mnenhy/0.7.5.666
MIME-Version: 1.0
To: Liu Ping Fan <qemulist@gmail.com>
References: <1374396185-10870-1-git-send-email-pingfank@linux.vnet.ibm.com>
	<1374396185-10870-4-git-send-email-pingfank@linux.vnet.ibm.com>
In-Reply-To: <1374396185-10870-4-git-send-email-pingfank@linux.vnet.ibm.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x
X-Received-From: 192.35.17.28
Cc: Kevin Wolf <kwolf@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org,
	Alex Bligh <alex@alex.org.uk>, Anthony Liguori <anthony@codemonkey.ws>,
	Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [Qemu-trivial] [RFC 3/8] timer: make timers_state static
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
X-List-Received-Date: Mon, 22 Jul 2013 06:36:30 -0000

On 2013-07-21 10:43, Liu Ping Fan wrote:
> Signed-off-by: Liu Ping Fan <pingfank@linux.vnet.ibm.com>
> ---
>  cpus.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/cpus.c b/cpus.c
> index 61e86a8..4254ca9 100644
> --- a/cpus.c
> +++ b/cpus.c
> @@ -112,7 +112,7 @@ typedef struct TimersState {
>      int64_t dummy;
>  } TimersState;
>  
> -TimersState timers_state;
> +static TimersState timers_state;
>  
>  /* Return the virtual CPU time, based on the instruction counter.  */
>  int64_t cpu_get_icount(void)
> 

Could go in directly via trivial IMHO.

Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>

-- 
Siemens AG, Corporate Technology, CT RTC ITP SES-DE
Corporate Competence Center Embedded Linux

