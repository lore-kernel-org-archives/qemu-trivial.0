Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fNasd-0005i7-0W
	for mharc-qemu-trivial@gnu.org; Tue, 29 May 2018 05:25:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47489)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fNasa-0005cs-1E
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 05:25:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1fNasY-00007O-Rv
	for qemu-trivial@nongnu.org; Tue, 29 May 2018 05:25:20 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:58070 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1fNasT-0008R7-3Q; Tue, 29 May 2018 05:25:13 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
	[10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id F0BE9401EF08;
	Tue, 29 May 2018 09:25:11 +0000 (UTC)
Received: from [10.36.118.43] (unknown [10.36.118.43])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0827E2166BB2;
	Tue, 29 May 2018 09:25:10 +0000 (UTC)
To: Tristan Burgess <tburgessdev@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org
References: <20180529030445.177867-1-tburgessdev@gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=pbonzini@redhat.com; prefer-encrypt=mutual; keydata=
	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
Message-ID: <e851ab0a-e019-f410-7356-3dfcd9b3a9d3@redhat.com>
Date: Tue, 29 May 2018 11:25:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180529030445.177867-1-tburgessdev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Tue, 29 May 2018 09:25:12 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Tue, 29 May 2018 09:25:12 +0000 (UTC) for IP:'10.11.54.6'
	DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'pbonzini@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH] memory: bug 1720969: Make operations
 using MemoryRegionIoeventfd struct pass by pointer.
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
X-List-Received-Date: Tue, 29 May 2018 09:25:21 -0000

On 29/05/2018 05:04, Tristan Burgess wrote:
> This changes the functions memory_region_ioeventfd_equal, memory_region_ioeventfd_before, and their callers,
> to pass the MemoryRegionIoeventfd struct via pointer, instead of directly passing the struct. This saves on stack space
> and is considered safe practice.
> 
> Signed-off-by: Tristan Burgess <tburgessdev@gmail.com>
> ---
>  memory.c | 44 ++++++++++++++++++++++----------------------
>  1 file changed, 22 insertions(+), 22 deletions(-)
> 
> diff --git a/memory.c b/memory.c
> index fc7f9b782b..a2b9bb88f3 100644
> --- a/memory.c
> +++ b/memory.c
> @@ -173,38 +173,38 @@ struct MemoryRegionIoeventfd {
>      EventNotifier *e;
>  };
>  
> -static bool memory_region_ioeventfd_before(MemoryRegionIoeventfd a,
> -                                           MemoryRegionIoeventfd b)
> +static bool memory_region_ioeventfd_before(MemoryRegionIoeventfd *a,
> +                                           MemoryRegionIoeventfd *b)
>  {
> -    if (int128_lt(a.addr.start, b.addr.start)) {
> +    if (int128_lt(a->addr.start, b->addr.start)) {
>          return true;
> -    } else if (int128_gt(a.addr.start, b.addr.start)) {
> +    } else if (int128_gt(a->addr.start, b->addr.start)) {
>          return false;
> -    } else if (int128_lt(a.addr.size, b.addr.size)) {
> +    } else if (int128_lt(a->addr.size, b->addr.size)) {
>          return true;
> -    } else if (int128_gt(a.addr.size, b.addr.size)) {
> +    } else if (int128_gt(a->addr.size, b->addr.size)) {
>          return false;
> -    } else if (a.match_data < b.match_data) {
> +    } else if (a->match_data < b->match_data) {
>          return true;
> -    } else  if (a.match_data > b.match_data) {
> +    } else  if (a->match_data > b->match_data) {
>          return false;
> -    } else if (a.match_data) {
> -        if (a.data < b.data) {
> +    } else if (a->match_data) {
> +        if (a->data < b->data) {
>              return true;
> -        } else if (a.data > b.data) {
> +        } else if (a->data > b->data) {
>              return false;
>          }
>      }
> -    if (a.e < b.e) {
> +    if (a->e < b->e) {
>          return true;
> -    } else if (a.e > b.e) {
> +    } else if (a->e > b->e) {
>          return false;
>      }
>      return false;
>  }
>  
> -static bool memory_region_ioeventfd_equal(MemoryRegionIoeventfd a,
> -                                          MemoryRegionIoeventfd b)
> +static bool memory_region_ioeventfd_equal(MemoryRegionIoeventfd *a,
> +                                          MemoryRegionIoeventfd *b)
>  {
>      return !memory_region_ioeventfd_before(a, b)
>          && !memory_region_ioeventfd_before(b, a);
> @@ -791,8 +791,8 @@ static void address_space_add_del_ioeventfds(AddressSpace *as,
>      while (iold < fds_old_nb || inew < fds_new_nb) {
>          if (iold < fds_old_nb
>              && (inew == fds_new_nb
> -                || memory_region_ioeventfd_before(fds_old[iold],
> -                                                  fds_new[inew]))) {
> +                || memory_region_ioeventfd_before(&fds_old[iold],
> +                                                  &fds_new[inew]))) {
>              fd = &fds_old[iold];
>              section = (MemoryRegionSection) {
>                  .fv = address_space_to_flatview(as),
> @@ -804,8 +804,8 @@ static void address_space_add_del_ioeventfds(AddressSpace *as,
>              ++iold;
>          } else if (inew < fds_new_nb
>                     && (iold == fds_old_nb
> -                       || memory_region_ioeventfd_before(fds_new[inew],
> -                                                         fds_old[iold]))) {
> +                       || memory_region_ioeventfd_before(&fds_new[inew],
> +                                                         &fds_old[iold]))) {
>              fd = &fds_new[inew];
>              section = (MemoryRegionSection) {
>                  .fv = address_space_to_flatview(as),
> @@ -1443,7 +1443,7 @@ static bool memory_region_dispatch_write_eventfds(MemoryRegion *mr,
>          ioeventfd.match_data = mr->ioeventfds[i].match_data;
>          ioeventfd.e = mr->ioeventfds[i].e;
>  
> -        if (memory_region_ioeventfd_equal(ioeventfd, mr->ioeventfds[i])) {
> +        if (memory_region_ioeventfd_equal(&ioeventfd, &mr->ioeventfds[i])) {
>              event_notifier_set(ioeventfd.e);
>              return true;
>          }
> @@ -2213,7 +2213,7 @@ void memory_region_add_eventfd(MemoryRegion *mr,
>      }
>      memory_region_transaction_begin();
>      for (i = 0; i < mr->ioeventfd_nb; ++i) {
> -        if (memory_region_ioeventfd_before(mrfd, mr->ioeventfds[i])) {
> +        if (memory_region_ioeventfd_before(&mrfd, &mr->ioeventfds[i])) {
>              break;
>          }
>      }
> @@ -2248,7 +2248,7 @@ void memory_region_del_eventfd(MemoryRegion *mr,
>      }
>      memory_region_transaction_begin();
>      for (i = 0; i < mr->ioeventfd_nb; ++i) {
> -        if (memory_region_ioeventfd_equal(mrfd, mr->ioeventfds[i])) {
> +        if (memory_region_ioeventfd_equal(&mrfd, &mr->ioeventfds[i])) {
>              break;
>          }
>      }
> 

Queued, thanks.

Paolo

