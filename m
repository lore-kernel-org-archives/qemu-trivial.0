Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XdgvZ-0004IA-DB
	for mharc-qemu-trivial@gnu.org; Mon, 13 Oct 2014 10:48:49 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55583)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1XdgvQ-00046k-3U
	for qemu-trivial@nongnu.org; Mon, 13 Oct 2014 10:48:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <agraf@suse.de>) id 1XdgvI-0006pZ-Lc
	for qemu-trivial@nongnu.org; Mon, 13 Oct 2014 10:48:40 -0400
Received: from cantor2.suse.de ([195.135.220.15]:38518 helo=mx2.suse.de)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <agraf@suse.de>)
	id 1Xdgun-0006iV-HZ; Mon, 13 Oct 2014 10:48:01 -0400
Received: from relay2.suse.de (charybdis-ext.suse.de [195.135.220.254])
	by mx2.suse.de (Postfix) with ESMTP id 749EAAB07;
	Mon, 13 Oct 2014 14:48:00 +0000 (UTC)
Message-ID: <543BE616.1000707@suse.de>
Date: Mon, 13 Oct 2014 16:47:50 +0200
From: Alexander Graf <agraf@suse.de>
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: Chen Gang <gang.chen.5i5j@gmail.com>, pbonzini@redhat.com
References: <543BE352.3080609@gmail.com>
In-Reply-To: <543BE352.3080609@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic]
X-Received-From: 195.135.220.15
Cc: qemu-trivial@nongnu.org, qemu-ppc@nongnu.org,
	qemu-devel <qemu-devel@nongnu.org>, kvm@vger.kernel.org
Subject: Re: [Qemu-trivial] [PATCH] target-ppc: kvm: Fix memory overflow
	issue about strncat()
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
X-List-Received-Date: Mon, 13 Oct 2014 14:48:47 -0000



On 13.10.14 16:36, Chen Gang wrote:
> strncat() will append additional '\0' to destination buffer, so need
> additional 1 byte for it, or may cause memory overflow, just like other
> area within QEMU have done.
> 
> Signed-off-by: Chen Gang <gang.chen.5i5j@gmail.com>

I agree with this patch. However, the code is pretty ugly - I'm sure it
must've been me who wrote it :).

Could you please instead rewrite it to use g_strdup_printf() rather than
strncat()s? That way we resolve all string pitfalls automatically - and
this code is not the fast path, so doing an extra memory allocation is ok.


Alex

> ---
>  target-ppc/kvm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/target-ppc/kvm.c b/target-ppc/kvm.c
> index 9c23c6b..66e7ce5 100644
> --- a/target-ppc/kvm.c
> +++ b/target-ppc/kvm.c
> @@ -1794,8 +1794,8 @@ static uint64_t kvmppc_read_int_cpu_dt(const char *propname)
>          return -1;
>      }
>  
> -    strncat(buf, "/", sizeof(buf) - strlen(buf));
> -    strncat(buf, propname, sizeof(buf) - strlen(buf));
> +    strncat(buf, "/", sizeof(buf) - strlen(buf) - 1);
> +    strncat(buf, propname, sizeof(buf) - strlen(buf) - 1);
>  
>      f = fopen(buf, "rb");
>      if (!f) {
> 

