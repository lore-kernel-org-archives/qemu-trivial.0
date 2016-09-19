Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1blwQM-0002Jz-Uc
	for mharc-qemu-trivial@gnu.org; Mon, 19 Sep 2016 07:07:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:36829)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1blwQG-0002Dh-I3
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 07:07:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1blwQC-00044o-7F
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 07:07:39 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:58698
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cornelia.huck@de.ibm.com>) id 1blwQC-00044h-1R
	for qemu-trivial@nongnu.org; Mon, 19 Sep 2016 07:07:36 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id
	u8JB4P2t052381
	for <qemu-trivial@nongnu.org>; Mon, 19 Sep 2016 07:07:35 -0400
Received: from e06smtp13.uk.ibm.com (e06smtp13.uk.ibm.com [195.75.94.109])
	by mx0b-001b2d01.pphosted.com with ESMTP id 25h1ykwa4y-1
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=NOT)
	for <qemu-trivial@nongnu.org>; Mon, 19 Sep 2016 07:07:35 -0400
Received: from localhost
	by e06smtp13.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-trivial@nongnu.org> from <cornelia.huck@de.ibm.com>;
	Mon, 19 Sep 2016 12:07:32 +0100
Received: from d06dlp03.portsmouth.uk.ibm.com (9.149.20.15)
	by e06smtp13.uk.ibm.com (192.168.101.143) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	Mon, 19 Sep 2016 12:07:30 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com
	(d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by d06dlp03.portsmouth.uk.ibm.com (Postfix) with ESMTP id 078671B08061; 
	Mon, 19 Sep 2016 12:09:21 +0100 (BST)
Received: from d06av03.portsmouth.uk.ibm.com (d06av03.portsmouth.uk.ibm.com
	[9.149.37.213])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id u8JB7Uwd14942620; Mon, 19 Sep 2016 11:07:30 GMT
Received: from d06av03.portsmouth.uk.ibm.com (localhost [127.0.0.1])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with
	ESMTP id u8JB7Trb031579; Mon, 19 Sep 2016 05:07:29 -0600
Received: from gondolin (dyn-9-152-224-137.boeblingen.de.ibm.com
	[9.152.224.137])
	by d06av03.portsmouth.uk.ibm.com (8.14.4/8.14.4/NCO v10.0 AVin) with
	ESMTP id u8JB7S6q031536; Mon, 19 Sep 2016 05:07:29 -0600
Date: Mon, 19 Sep 2016 13:07:26 +0200
From: Cornelia Huck <cornelia.huck@de.ibm.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
In-Reply-To: <1474034177-17663-17-git-send-email-lvivier@redhat.com>
References: <1474034177-17663-1-git-send-email-lvivier@redhat.com>
	<1474034177-17663-17-git-send-email-lvivier@redhat.com>
Organization: IBM Deutschland Research & Development GmbH Vorsitzende des
	Aufsichtsrats: Martina Koederitz
	=?UTF-8?B?R2VzY2jDpGZ0c2bDvGhydW5nOg==?=
	Dirk Wittkopp Sitz der Gesellschaft: =?UTF-8?B?QsO2Ymxpbmdlbg==?=
	Registergericht: Amtsgericht Stuttgart, HRB 243294
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.23; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-MML: disable
X-Content-Scanned: Fidelis XPS MAILER
x-cbid: 16091911-0012-0000-0000-0000045FAEC3
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 16091911-0013-0000-0000-0000157E7674
Message-Id: <20160919130726.63b5cb24.cornelia.huck@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-09-19_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	spamscore=0 suspectscore=0
	malwarescore=0 phishscore=0 adultscore=0 bulkscore=0 classifier=spam
	adjust=0 reason=mlx scancount=1 engine=8.0.1-1609020000
	definitions=main-1609190155
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-trivial] [PATCH 16/26] s390: use exit(EXIT_SUCCESS) and
 exit(EXIT_FAILURE)
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
X-List-Received-Date: Mon, 19 Sep 2016 11:07:45 -0000

On Fri, 16 Sep 2016 15:56:07 +0200
Laurent Vivier <lvivier@redhat.com> wrote:

> This patch is the result of coccinelle script
> scripts/coccinelle/exit.cocci

As stated in my other reply, I'm not convinced that this conversion is
useful, but I did take a look at the exit()s we have in here:

> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> CC: Cornelia Huck <cornelia.huck@de.ibm.com>
> ---
>  target-s390x/cpu.c        |  2 +-
>  target-s390x/kvm.c        | 18 +++++++++---------
>  target-s390x/mmu_helper.c |  2 +-
>  3 files changed, 11 insertions(+), 11 deletions(-)
> 
> diff --git a/target-s390x/cpu.c b/target-s390x/cpu.c
> index 2f3c8e2..d4ca6af 100644
> --- a/target-s390x/cpu.c
> +++ b/target-s390x/cpu.c
> @@ -385,7 +385,7 @@ unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
>      default:
>          error_report("Requested CPU state is not a valid S390 CPU state: %u",
>                       cpu_state);
> -        exit(1);

Can only be hit via programming error in qemu and exiting is the only
thing that really makes sense.

> +        exit(EXIT_FAILURE);
>      }
>      if (kvm_enabled() && cpu->env.cpu_state != cpu_state) {
>          kvm_s390_set_cpu_state(cpu, cpu_state);
> diff --git a/target-s390x/kvm.c b/target-s390x/kvm.c
> index dfaf1ca..2b1b908 100644
> --- a/target-s390x/kvm.c
> +++ b/target-s390x/kvm.c
> @@ -920,13 +920,13 @@ static void inject_vcpu_irq_legacy(CPUState *cs, struct kvm_s390_irq *irq)
>      r = s390_kvm_irq_to_interrupt(irq, &kvmint);
>      if (r < 0) {
>          fprintf(stderr, "%s called with bogus interrupt\n", __func__);
> -        exit(1);

Dito, but we probably should convert the fprintf to error_report().

> +        exit(EXIT_FAILURE);
>      }
> 
>      r = kvm_vcpu_ioctl(cs, KVM_S390_INTERRUPT, &kvmint);
>      if (r < 0) {
>          fprintf(stderr, "KVM failed to inject interrupt\n");
> -        exit(1);

There's several reasons why we could hit this:
- qemu programming error
- the kvm module can't get memory... we're probably already dead
- we've hit some internal limit in the kvm module... should not happen
  and is probably a follow-on of a programming error in qemu as well
So I think the exit is fine, but we should still convert to
error_report().

> +        exit(EXIT_FAILURE);
>      }
>  }
> 
> @@ -941,7 +941,7 @@ void kvm_s390_vcpu_interrupt(S390CPU *cpu, struct kvm_s390_irq *irq)
>              return;
>          }
>          error_report("KVM failed to inject interrupt %llx", irq->type);
> -        exit(1);

Dito as for the old injection interface.

> +        exit(EXIT_FAILURE);
>      }
> 
>      inject_vcpu_irq_legacy(cs, irq);
> @@ -955,13 +955,13 @@ static void __kvm_s390_floating_interrupt(struct kvm_s390_irq *irq)
>      r = s390_kvm_irq_to_interrupt(irq, &kvmint);
>      if (r < 0) {
>          fprintf(stderr, "%s called with bogus interrupt\n", __func__);
> -        exit(1);

Same as for vcpu interrupts.

> +        exit(EXIT_FAILURE);
>      }
> 
>      r = kvm_vm_ioctl(kvm_state, KVM_S390_INTERRUPT, &kvmint);
>      if (r < 0) {
>          fprintf(stderr, "KVM failed to inject interrupt\n");
> -        exit(1);

And here as well.

> +        exit(EXIT_FAILURE);
>      }
>  }
> 
> @@ -1905,15 +1905,15 @@ static int handle_intercept(S390CPU *cpu)
>              break;
>          case ICPT_SOFT_INTERCEPT:
>              fprintf(stderr, "KVM unimplemented icpt SOFT\n");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>              break;
>          case ICPT_IO:
>              fprintf(stderr, "KVM unimplemented icpt IO\n");
> -            exit(1);
> +            exit(EXIT_FAILURE);
>              break;
>          default:
>              fprintf(stderr, "Unknown intercept code: %d\n", icpt_code);
> -            exit(1);
> +            exit(EXIT_FAILURE);

What happened here is that we intercepted with an intercept that we
either don't expect to get or we don't know about. In either case, this
is something the kvm module should have avoided/handled and exit()ing
is probably the best thing to do here as well (or implement support for
an intercept). But this should probably use error_report() as well.

>              break;
>      }
> 
> @@ -2222,7 +2222,7 @@ int kvm_s390_set_cpu_state(S390CPU *cpu, uint8_t cpu_state)
>      default:
>          error_report("Requested CPU state is not a valid S390 CPU state: %u",
>                       cpu_state);
> -        exit(1);

qemu programming error

> +        exit(EXIT_FAILURE);
>      }
> 
>      ret = kvm_vcpu_ioctl(CPU(cpu), KVM_SET_MP_STATE, &mp_state);
> diff --git a/target-s390x/mmu_helper.c b/target-s390x/mmu_helper.c
> index b11a027..dc9960a 100644
> --- a/target-s390x/mmu_helper.c
> +++ b/target-s390x/mmu_helper.c
> @@ -414,7 +414,7 @@ static bool lowprot_enabled(const CPUS390XState *env)
>      default:
>          /* We don't support access register mode */
>          error_report("unsupported addressing mode");
> -        exit(1);

Not implemented - until someone does implement it, exit() looks like
the best way out.

> +        exit(EXIT_FAILURE);
>      }
>  }
> 

All in all, I think our usage of exit() is fine, but some more
error_report() conversions should be done. On the todo list.


