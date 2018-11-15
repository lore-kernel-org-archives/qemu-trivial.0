Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gNHlY-00023G-WD
	for mharc-qemu-trivial@gnu.org; Thu, 15 Nov 2018 08:33:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44245)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gNHlR-00020i-5y
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 08:33:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1gNHlP-0004HZ-6V
	for qemu-trivial@nongnu.org; Thu, 15 Nov 2018 08:32:57 -0500
Received: from mx1.redhat.com ([209.132.183.28]:35976)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>)
	id 1gNHl9-00047f-6a; Thu, 15 Nov 2018 08:32:41 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D2B3086673;
	Thu, 15 Nov 2018 13:32:29 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-34.ams2.redhat.com
	[10.36.117.34])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8A47460BF6;
	Thu, 15 Nov 2018 13:32:29 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 1A1B911385F2; Thu, 15 Nov 2018 14:32:28 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Li Qiang <liq3ea@gmail.com>,
Cc: pbonzini@redhat.com, rth@twiddle.net, ehabkost@redhat.com,
	laurent@vivier.eu, qemu-trivial@nongnu.org, qemu-devel@nongnu.org
References: <1542261614-2606-1-git-send-email-root@localhost.localdomain>
Date: Thu, 15 Nov 2018 14:32:28 +0100
In-Reply-To: <1542261614-2606-1-git-send-email-root@localhost.localdomain>
	(root's message of "Wed, 14 Nov 2018 22:00:14 -0800")
Message-ID: <877eheh3f7.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.26]);
	Thu, 15 Nov 2018 13:32:29 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] target: hax: replace
 g_malloc with g_malloc0
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
X-List-Received-Date: Thu, 15 Nov 2018 13:33:00 -0000

Your e-mail From: header is messed up.  Please fix.

root <root@localhost.localdomain> writes:

> From: Li Qiang <liq3ea@gmail.com>
>
> And also the g_malloc doesn't need check return value,
> remove it.
>
> Cc: qemu-trivial@nongnu.org
>
> Signed-off-by: Li Qiang <liq3ea@gmail.com>
> ---
>  target/i386/hax-all.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/target/i386/hax-all.c b/target/i386/hax-all.c
> index d2e512856b..a460c605af 100644
> --- a/target/i386/hax-all.c
> +++ b/target/i386/hax-all.c
> @@ -154,13 +154,7 @@ int hax_vcpu_create(int id)
>          return 0;
>      }
>  
> -    vcpu = g_malloc(sizeof(struct hax_vcpu_state));
> -    if (!vcpu) {
> -        fprintf(stderr, "Failed to alloc vcpu state\n");
> -        return -ENOMEM;
> -    }
> -
> -    memset(vcpu, 0, sizeof(struct hax_vcpu_state));
> +    vcpu = g_malloc0(sizeof(struct hax_vcpu_state));

Make that g_new0(struct hax_vcpu_state).

>  
>      ret = hax_host_create_vcpu(hax_global.vm->fd, id);
>      if (ret) {
> @@ -250,11 +244,8 @@ struct hax_vm *hax_vm_create(struct hax_state *hax)
>          return hax->vm;
>      }
>  
> -    vm = g_malloc(sizeof(struct hax_vm));
> -    if (!vm) {
> -        return NULL;
> -    }
> -    memset(vm, 0, sizeof(struct hax_vm));
> +    vm = g_malloc0(sizeof(struct hax_vm));

Likewise.

> +
>      ret = hax_host_create_vm(hax, &vm_id);
>      if (ret) {
>          fprintf(stderr, "Failed to create vm %x\n", ret);

With those two changes:
Reviewed-by: Markus Armbruster <armbru@redhat.com>

