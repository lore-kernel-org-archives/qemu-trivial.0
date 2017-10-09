Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e1YwB-00080a-RZ
	for mharc-qemu-trivial@gnu.org; Mon, 09 Oct 2017 10:21:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54459)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1e1Yw9-0007yX-Go
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 10:21:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <gsomlo@gmail.com>) id 1e1Yw8-0004KZ-KJ
	for qemu-trivial@nongnu.org; Mon, 09 Oct 2017 10:21:41 -0400
Received: from mail-io0-x241.google.com ([2607:f8b0:4001:c06::241]:37286)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <gsomlo@gmail.com>)
	id 1e1Yw3-0004Ia-Us; Mon, 09 Oct 2017 10:21:36 -0400
Received: by mail-io0-x241.google.com with SMTP id h70so1931411ioi.4;
	Mon, 09 Oct 2017 07:21:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:content-transfer-encoding:in-reply-to
	:user-agent; bh=9N6JmWtAIvW0sy7/1Wsu4abNjeNGNU+RJcVdbZhlW0A=;
	b=AYANgAKJuXAloTnWnH9KvgubebB8C6bAnt6qtJ5IStfvGqvK5a/ZQhEk4Z0vdgI5eN
	aI1oujFSsanjvzrRcatgn0VDxVeEZXSaSXZPql/YmFBNGM1YBaLwC6PFLbDtLZIjnL4J
	RbcLNbqwhj7QdmNzdkBDPAEFeolBAK9hJGCJqEPmAYdm4AWujmldZ+Lwp3RigWD/MgES
	kM9tUkONgRuBUSCh4rmzoQEUE+5rxKiUzan9nEcYCUNDnjFAHhMcL8YU2QECaKij0FOK
	nK+jPl9YIfR29ITd5unDE43kmwCjpEMHxK4b8YqRlA8k7Q1qRwY9vTKIy7AL14NUSw2t
	FD+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	bh=9N6JmWtAIvW0sy7/1Wsu4abNjeNGNU+RJcVdbZhlW0A=;
	b=jRKlpaJ4mKewQLsP0Y8XUvPdcbmjZPDd0bBpXb+jHPdzLHGl0j6X3WWL0qQ4e+MUHS
	xDgzfgl//I3y3qt1mxvoKGv+qC0KeZ1lOniNFZTbvD/re8ZQMimvE2oYsGfxnK2vVNDD
	KxeNDvlD4b65uNF7c/Y2FhYYiFBg2zZH2FlCmoOvfaXwJyB5XQz0OfHrjTJ3J2ci1+Aw
	7+IYpB+qtunajzXorXiXyyjnAR7r9ndNv+0SCZUCZ8i2IXshqg+RsCrJUvxUxg4gyTKR
	SwanulC2LvHBe3nNJCdDjb3WBrXoTcw5WhqBYybQPYmzA8asy1tBatwrGHI4Etp/swoS
	q8OA==
X-Gm-Message-State: AMCzsaWLqi6oJ/N3+lILq3MgfCyAPSZlywk7H22RW/2rS+8JQD/8SZfl
	sA23Cx9jxhz4JfuRfkDXxJk=
X-Google-Smtp-Source: AOwi7QCW78c/kmwHWcbdbJ46L1lRtVbn0vQBzLeFhjVzrXAQXDREZ5XwkquBq3+Goas//23MpeQHJg==
X-Received: by 10.107.162.67 with SMTP id l64mr774370ioe.278.1507558895364;
	Mon, 09 Oct 2017 07:21:35 -0700 (PDT)
Received: from hedwig.ini.cmu.edu (HEDWIG.INI.CMU.EDU. [128.2.16.51])
	by smtp.gmail.com with ESMTPSA id
	q82sm4052870itb.22.2017.10.09.07.21.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 09 Oct 2017 07:21:34 -0700 (PDT)
Date: Mon, 9 Oct 2017 10:21:32 -0400
From: "Gabriel L. Somlo" <gsomlo@gmail.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eric Blake <eblake@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	qemu trival <qemu-trivial@nongnu.org>
Message-ID: <20171009142130.GE8968@hedwig.ini.cmu.edu>
References: <20171006235023.11952-1-f4bug@amsat.org>
	<20171006235023.11952-55-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20171006235023.11952-55-f4bug@amsat.org>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4001:c06::241
Subject: Re: [Qemu-trivial] [PATCH 54/88] KVM: use g_new() family of
 functions
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
X-List-Received-Date: Mon, 09 Oct 2017 14:21:42 -0000

Reviewed-by: Gabriel Somlo <gsomlo@gmail.com>

On Fri, Oct 06, 2017 at 08:49:49PM -0300, Philippe Mathieu-Daudé wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> [PMD: more changes]
> ---
>  accel/kvm/kvm-all.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 90c88b517d..12568d703c 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -278,7 +278,7 @@ int kvm_destroy_vcpu(CPUState *cpu)
>          goto err;
>      }
>  
> -    vcpu = g_malloc0(sizeof(*vcpu));
> +    vcpu = g_new0(struct KVMParkedVcpu, 1);
>      vcpu->vcpu_id = kvm_arch_vcpu_id(cpu);
>      vcpu->kvm_fd = cpu->kvm_fd;
>      QLIST_INSERT_HEAD(&kvm_state->kvm_parked_vcpus, vcpu, node);
> @@ -865,7 +865,7 @@ void kvm_memory_listener_register(KVMState *s, KVMMemoryListener *kml,
>  {
>      int i;
>  
> -    kml->slots = g_malloc0(s->nr_slots * sizeof(KVMSlot));
> +    kml->slots = g_new0(KVMSlot, s->nr_slots);
>      kml->as_id = as_id;
>  
>      for (i = 0; i < s->nr_slots; i++) {
> @@ -1129,7 +1129,7 @@ int kvm_irqchip_send_msi(KVMState *s, MSIMessage msg)
>              return virq;
>          }
>  
> -        route = g_malloc0(sizeof(KVMMSIRoute));
> +        route = g_new0(KVMMSIRoute, 1);
>          route->kroute.gsi = virq;
>          route->kroute.type = KVM_IRQ_ROUTING_MSI;
>          route->kroute.flags = 0;
> @@ -2243,7 +2243,7 @@ int kvm_insert_breakpoint(CPUState *cpu, target_ulong addr,
>              return 0;
>          }
>  
> -        bp = g_malloc(sizeof(struct kvm_sw_breakpoint));
> +        bp = g_new(struct kvm_sw_breakpoint, 1);
>          bp->pc = addr;
>          bp->use_count = 1;
>          err = kvm_arch_insert_sw_breakpoint(cpu, bp);
> -- 
> 2.14.2
> 

