Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1VPSU7-0005bI-Jb
	for mharc-qemu-trivial@gnu.org; Fri, 27 Sep 2013 03:29:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46595)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VPSTz-0005Qt-D8
	for qemu-trivial@nongnu.org; Fri, 27 Sep 2013 03:29:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1VPSTt-0004da-E2
	for qemu-trivial@nongnu.org; Fri, 27 Sep 2013 03:28:59 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56330)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1VPSTg-0004cX-Pt; Fri, 27 Sep 2013 03:28:40 -0400
Received: from int-mx02.intmail.prod.int.phx2.redhat.com
	(int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id r8R7SaMj008924
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 27 Sep 2013 03:28:37 -0400
Received: from yakj.usersys.redhat.com (ovpn-112-42.ams2.redhat.com
	[10.36.112.42])
	by int-mx02.intmail.prod.int.phx2.redhat.com (8.13.8/8.13.8) with ESMTP
	id r8R7SInt002137; Fri, 27 Sep 2013 03:28:26 -0400
Message-ID: <524533A1.6030305@redhat.com>
Date: Fri, 27 Sep 2013 09:28:33 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130805 Thunderbird/17.0.8
MIME-Version: 1.0
To: Amos Kong <akong@redhat.com>
References: <1380245138-9716-1-git-send-email-akong@redhat.com>
In-Reply-To: <1380245138-9716-1-git-send-email-akong@redhat.com>
X-Enigmail-Version: 1.5.2
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.67 on 10.5.11.12
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial <qemu-trivial@nongnu.org>, peter.maydell@linaro.org,
	qemu-devel@nongnu.org, anthony@codemonkey.ws
Subject: Re: [Qemu-trivial] [PATCH] exec: cleanup DEBUG_SUBPAGE
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
X-List-Received-Date: Fri, 27 Sep 2013 07:29:05 -0000

Michael, want to pick this up for -trivial?

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Il 27/09/2013 03:25, Amos Kong ha scritto:
> Touched some error after enabling DEBUG_SUBPAGE.
> 
> Signed-off-by: Amos Kong <akong@redhat.com>
> ---
>  exec.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/exec.c b/exec.c
> index 07aa2c6..5aef833 100644
> --- a/exec.c
> +++ b/exec.c
> @@ -1573,7 +1573,7 @@ static uint64_t subpage_read(void *opaque, hwaddr addr,
>      uint8_t buf[4];
>  
>  #if defined(DEBUG_SUBPAGE)
> -    printf("%s: subpage %p len %d addr " TARGET_FMT_plx "\n", __func__,
> +    printf("%s: subpage %p len %u addr " TARGET_FMT_plx "\n", __func__,
>             subpage, len, addr);
>  #endif
>      address_space_read(subpage->as, addr + subpage->base, buf, len);
> @@ -1596,7 +1596,7 @@ static void subpage_write(void *opaque, hwaddr addr,
>      uint8_t buf[4];
>  
>  #if defined(DEBUG_SUBPAGE)
> -    printf("%s: subpage %p len %d addr " TARGET_FMT_plx
> +    printf("%s: subpage %p len %u addr " TARGET_FMT_plx
>             " value %"PRIx64"\n",
>             __func__, subpage, len, addr, value);
>  #endif
> @@ -1617,16 +1617,16 @@ static void subpage_write(void *opaque, hwaddr addr,
>  }
>  
>  static bool subpage_accepts(void *opaque, hwaddr addr,
> -                            unsigned size, bool is_write)
> +                            unsigned len, bool is_write)
>  {
>      subpage_t *subpage = opaque;
>  #if defined(DEBUG_SUBPAGE)
> -    printf("%s: subpage %p %c len %d addr " TARGET_FMT_plx "\n",
> +    printf("%s: subpage %p %c len %u addr " TARGET_FMT_plx "\n",
>             __func__, subpage, is_write ? 'w' : 'r', len, addr);
>  #endif
>  
>      return address_space_access_valid(subpage->as, addr + subpage->base,
> -                                      size, is_write);
> +                                      len, is_write);
>  }
>  
>  static const MemoryRegionOps subpage_ops = {
> @@ -1646,8 +1646,8 @@ static int subpage_register (subpage_t *mmio, uint32_t start, uint32_t end,
>      idx = SUBPAGE_IDX(start);
>      eidx = SUBPAGE_IDX(end);
>  #if defined(DEBUG_SUBPAGE)
> -    printf("%s: %p start %08x end %08x idx %08x eidx %08x mem %ld\n", __func__,
> -           mmio, start, end, idx, eidx, memory);
> +    printf("%s: %p start %08x end %08x idx %08x eidx %08x section %d\n",
> +           __func__, mmio, start, end, idx, eidx, section);
>  #endif
>      for (; idx <= eidx; idx++) {
>          mmio->sub_section[idx] = section;
> @@ -1668,8 +1668,8 @@ static subpage_t *subpage_init(AddressSpace *as, hwaddr base)
>                            "subpage", TARGET_PAGE_SIZE);
>      mmio->iomem.subpage = true;
>  #if defined(DEBUG_SUBPAGE)
> -    printf("%s: %p base " TARGET_FMT_plx " len %08x %d\n", __func__,
> -           mmio, base, TARGET_PAGE_SIZE, subpage_memory);
> +    printf("%s: %p base " TARGET_FMT_plx " len %08x\n", __func__,
> +           mmio, base, TARGET_PAGE_SIZE);
>  #endif
>      subpage_register(mmio, 0, TARGET_PAGE_SIZE-1, PHYS_SECTION_UNASSIGNED);
>  
> 


