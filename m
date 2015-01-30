Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YHASN-00033b-Nz
	for mharc-qemu-trivial@gnu.org; Fri, 30 Jan 2015 07:13:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YHASK-0002zY-TE
	for qemu-trivial@nongnu.org; Fri, 30 Jan 2015 07:13:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>) id 1YHASJ-0002OA-RM
	for qemu-trivial@nongnu.org; Fri, 30 Jan 2015 07:13:48 -0500
Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a]:51201)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <paolo.bonzini@gmail.com>)
	id 1YHASF-0002Mg-Cl; Fri, 30 Jan 2015 07:13:43 -0500
Received: by mail-wg0-f42.google.com with SMTP id x13so26629688wgg.1;
	Fri, 30 Jan 2015 04:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=EZGB1iwguUb3dBR0rksA5sW9cam/vgO73IhYW03QnHE=;
	b=K4lQwcUGKY0owwtv02fiQiYoj/ORF9DaI8q+xexVWOxRKBxlQ6j2YwuoWXh0QNJbQQ
	FyjxkAJ/K9CJ2uhJ8b72DLIOdCrFWuYRGAnu7/Bhg438Y3zQq1SfaXvHpMcm08tTRnW2
	piM2fupM1mA5dOELpMw80NcUDrff4aWgWeP0KM5sYA1kH1C9pjgTHHHBweEDDE3EZxNl
	IXr2qgBxQQ3UDYDRA5BKf6/Ah2RO8Ar3UtJ6ogwzDkykrglqjGFQDR/Zo04xPXoEe0Jl
	/EvDZ9NNyffsNA454LVx/vDAAXOI+oNDkuizU8EwtMO7d2LBdRV52AoPLN2LkBDMsYp6
	1Eww==
X-Received: by 10.194.143.12 with SMTP id sa12mr11455649wjb.101.1422620022823; 
	Fri, 30 Jan 2015 04:13:42 -0800 (PST)
Received: from [192.168.10.165] (net-93-66-105-136.cust.vodafonedsl.it.
	[93.66.105.136]) by mx.google.com with ESMTPSA id
	fi10sm6663414wib.13.2015.01.30.04.13.40
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jan 2015 04:13:41 -0800 (PST)
Sender: Paolo Bonzini <paolo.bonzini@gmail.com>
Message-ID: <54CB7573.2040607@redhat.com>
Date: Fri, 30 Jan 2015 13:13:39 +0100
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Richard W.M. Jones" <rjones@redhat.com>, qemu-trivial@nongnu.org
References: <1422618777-8832-1-git-send-email-rjones@redhat.com>
In-Reply-To: <1422618777-8832-1-git-send-email-rjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::22a
Cc: lersek@redhat.com, qemu-devel@nongnu.org, dgilbert@redhat.com
Subject: Re: [Qemu-trivial] [PATCH] Fix comparisons between implicit
	booleans and integers.
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
X-List-Received-Date: Fri, 30 Jan 2015 12:13:50 -0000



On 30/01/2015 12:52, Richard W.M. Jones wrote:
> In GCC 5 there is a new warning (-Wlogical-not-parentheses) which
> prevents you from writing:
> 
>   if (<some implicitly boolean expression> == <an int>) ...
> 
> A typical error would be:
> 
> kvm-all.c: In function ‘kvm_set_migration_log’:
> kvm-all.c:383:54: error: logical not is only applied to the left hand side of comparison [-Werror=logical-not-parentheses]
>          if (!!(mem->flags & KVM_MEM_LOG_DIRTY_PAGES) == enable) {
> 
> Fix a few places where the build is now broken in GCC 5.
> 
> The warning isn't even consistent, as with the place in
> hw/net/virtio-net.c where I had to cast an obviously boolean
> expression to bool.

The other two places are fine cleanups, but really I would just suppress
the warning in configure...

Paolo

> Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
> ---
>  hw/net/virtio-net.c | 2 +-
>  kvm-all.c           | 2 +-
>  qemu-img.c          | 3 ++-
>  3 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 45da34a..ba6afb8 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -121,7 +121,7 @@ static void virtio_net_vhost_status(VirtIONet *n, uint8_t status)
>      }
>  
>      if (!!n->vhost_started ==
> -        (virtio_net_started(n, status) && !nc->peer->link_down)) {
> +        (bool) (virtio_net_started(n, status) && !nc->peer->link_down)) {
>          return;
>      }
>      if (!n->vhost_started) {
> diff --git a/kvm-all.c b/kvm-all.c
> index 2f21a4e..b6d4387 100644
> --- a/kvm-all.c
> +++ b/kvm-all.c
> @@ -366,7 +366,7 @@ static void kvm_log_stop(MemoryListener *listener,
>      }
>  }
>  
> -static int kvm_set_migration_log(int enable)
> +static int kvm_set_migration_log(bool enable)
>  {
>      KVMState *s = kvm_state;
>      KVMSlot *mem;
> diff --git a/qemu-img.c b/qemu-img.c
> index 4e9a7f5..acf70fa 100644
> --- a/qemu-img.c
> +++ b/qemu-img.c
> @@ -977,7 +977,8 @@ static int is_allocated_sectors_min(const uint8_t *buf, int n, int *pnum,
>  static int compare_sectors(const uint8_t *buf1, const uint8_t *buf2, int n,
>      int *pnum)
>  {
> -    int res, i;
> +    bool res;
> +    int i;
>  
>      if (n <= 0) {
>          *pnum = 0;
> 

