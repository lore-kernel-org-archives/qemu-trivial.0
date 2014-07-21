Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1X9AI0-0003kw-IU
	for mharc-qemu-trivial@gnu.org; Mon, 21 Jul 2014 05:53:48 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51288)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1X9AHr-0003Yc-7i
	for qemu-trivial@nongnu.org; Mon, 21 Jul 2014 05:53:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1X9AHj-0002sP-Nn
	for qemu-trivial@nongnu.org; Mon, 21 Jul 2014 05:53:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50128)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1X9AHT-0002oj-Gj; Mon, 21 Jul 2014 05:53:15 -0400
Received: from int-mx14.intmail.prod.int.phx2.redhat.com
	(int-mx14.intmail.prod.int.phx2.redhat.com [10.5.11.27])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s6L9rBQR001275
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 21 Jul 2014 05:53:12 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-61.ams2.redhat.com
	[10.36.112.61])
	by int-mx14.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s6L9r7Gh002159; Mon, 21 Jul 2014 05:53:08 -0400
Message-ID: <53CCE302.5090904@redhat.com>
Date: Mon, 21 Jul 2014 11:53:06 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>, Michael Tokarev <mjt@tls.msk.ru>
References: <53C9C82A.2060003@gmail.com>
In-Reply-To: <53C9C82A.2060003@gmail.com>
X-Enigmail-Version: 1.6
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.27
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: Re: [Qemu-trivial] [PATCH] kvm-all: Use 'tmpcpu' instead of 'cpu'
 in sub-looping to avoid 'cpu' be NULL
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
X-List-Received-Date: Mon, 21 Jul 2014 09:53:46 -0000

Il 19/07/2014 03:21, Chen Gang ha scritto:
> If kvm_arch_remove_sw_breakpoint() in CPU_FOREACH() always be fail, it
> will let 'cpu' NULL. And the next kvm_arch_remove_sw_breakpoint() in
> QTAILQ_FOREACH_SAFE() will get NULL parameter for 'cpu'.
> 
> And kvm_arch_remove_sw_breakpoint() can assumes 'cpu' must never be NULL,
> so need define additional temporary variable for 'cpu' to avoid the case.
> 
> 
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>
> ---
>  kvm-all.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/kvm-all.c b/kvm-all.c
> index 3ae30ee..1402f4f 100644
> --- a/kvm-all.c
> +++ b/kvm-all.c
> @@ -2077,12 +2077,13 @@ void kvm_remove_all_breakpoints(CPUState *cpu)
>  {
>      struct kvm_sw_breakpoint *bp, *next;
>      KVMState *s = cpu->kvm_state;
> +    CPUState *tmpcpu;
>  
>      QTAILQ_FOREACH_SAFE(bp, &s->kvm_sw_breakpoints, entry, next) {
>          if (kvm_arch_remove_sw_breakpoint(cpu, bp) != 0) {
>              /* Try harder to find a CPU that currently sees the breakpoint. */
> -            CPU_FOREACH(cpu) {
> -                if (kvm_arch_remove_sw_breakpoint(cpu, bp) == 0) {
> +            CPU_FOREACH(tmpcpu) {
> +                if (kvm_arch_remove_sw_breakpoint(tmpcpu, bp) == 0) {
>                      break;
>                  }
>              }
> 

Applying to uq/master, thanks.

Paolo

