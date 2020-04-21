Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jQhcM-00067a-GD
	for mharc-qemu-trivial@gnu.org; Mon, 20 Apr 2020 21:22:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58554)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <colin.xu@intel.com>) id 1jQhcK-00064o-8t
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 21:22:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <colin.xu@intel.com>) id 1jQhcI-0000Bx-Nf
 for qemu-trivial@nongnu.org; Mon, 20 Apr 2020 21:22:27 -0400
Received: from mga02.intel.com ([134.134.136.20]:25842)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <colin.xu@intel.com>)
 id 1jQhcI-0008Pi-62; Mon, 20 Apr 2020 21:22:26 -0400
IronPort-SDR: EQ/cFIJ9igSoq1PataU4vOtpUSTqBOSv6i90qZveAWLSpYOqm242sTnzf0UqP+T6WRGp4+6MHh
 d/jMQGYDoINw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2020 18:22:18 -0700
IronPort-SDR: QQDVJ7mWGKkyOcx1XjoyfCL/7v+jGEFyO87TssAmhUoMmTgdDJlu5YpwU2LNMXn8z/8yaeYIDM
 /jry2KPXL9pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,408,1580803200"; d="scan'208";a="455898509"
Received: from unknown (HELO coxu-arch-shz) ([10.239.160.21])
 by fmsmga005.fm.intel.com with ESMTP; 20 Apr 2020 18:22:15 -0700
Date: Tue, 21 Apr 2020 09:22:15 +0800 (CST)
From: Colin Xu <colin.xu@intel.com>
X-X-Sender: coxu_arch@coxu-arch-shz
To: BEric Blake <eblake@redhat.com>
cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, peter.maydell@linaro.org, 
 Wenchao Wang <wenchao.wang@intel.com>, Colin Xu <colin.xu@intel.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>, 
 Eduardo Habkost <ehabkost@redhat.com>, 
 "open list:X86 HAXM CPUs" <haxm-team@intel.com>
Subject: Re: [PATCH 1/2] hax: Fix setting of FD_CLOEXEC
In-Reply-To: <20200420175309.75894-2-eblake@redhat.com>
Message-ID: <alpine.LNX.2.22.419.2004210921520.25064@coxu-arch-shz>
References: <20200420175309.75894-1-eblake@redhat.com>
 <20200420175309.75894-2-eblake@redhat.com>
User-Agent: Alpine 2.22 (LNX 419 2020-04-12)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=134.134.136.20; envelope-from=colin.xu@intel.com;
 helo=mga02.intel.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/20 21:22:18
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Received-From: 134.134.136.20
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Apr 2020 01:22:28 -0000

Looks good to me.

Reviewed-by: Colin Xu <colin.xu@intel.com>

--
Best Regards,
Colin Xu

On Tue, 21 Apr 2020, Eric Blake wrote:

> Blindly setting FD_CLOEXEC without a read-modify-write will
> inadvertently clear any other intentionally-set bits, such as a
> proposed new bit for designating a fd that must behave in 32-bit mode.
> Use our wrapper function instead of an incorrect hand-rolled version.
>
> Signed-off-by: Eric Blake <eblake@redhat.com>
> ---
> target/i386/hax-posix.c | 6 +++---
> 1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/target/i386/hax-posix.c b/target/i386/hax-posix.c
> index 3bad89f13337..5f9d1b803dec 100644
> --- a/target/i386/hax-posix.c
> +++ b/target/i386/hax-posix.c
> @@ -23,7 +23,7 @@ hax_fd hax_mod_open(void)
>         fprintf(stderr, "Failed to open the hax module\n");
>     }
>
> -    fcntl(fd, F_SETFD, FD_CLOEXEC);
> +    qemu_set_cloexec(fd);
>
>     return fd;
> }
> @@ -147,7 +147,7 @@ hax_fd hax_host_open_vm(struct hax_state *hax, int vm_id)
>     fd = open(vm_name, O_RDWR);
>     g_free(vm_name);
>
> -    fcntl(fd, F_SETFD, FD_CLOEXEC);
> +    qemu_set_cloexec(fd);
>
>     return fd;
> }
> @@ -200,7 +200,7 @@ hax_fd hax_host_open_vcpu(int vmid, int vcpuid)
>     if (fd < 0) {
>         fprintf(stderr, "Failed to open the vcpu devfs\n");
>     }
> -    fcntl(fd, F_SETFD, FD_CLOEXEC);
> +    qemu_set_cloexec(fd);
>     return fd;
> }
>
> -- 
> 2.26.1
>
>

