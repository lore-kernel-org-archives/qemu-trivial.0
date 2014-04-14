Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1WZd3L-0006YT-7P
	for mharc-qemu-trivial@gnu.org; Mon, 14 Apr 2014 05:19:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41516)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1WZd3D-0006YG-66
	for qemu-trivial@nongnu.org; Mon, 14 Apr 2014 05:19:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1WZd35-0002JT-Aq
	for qemu-trivial@nongnu.org; Mon, 14 Apr 2014 05:19:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59891)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>)
	id 1WZd35-0002JL-2b; Mon, 14 Apr 2014 05:19:31 -0400
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id s3E9JRBo024377
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Mon, 14 Apr 2014 05:19:28 -0400
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-116-52.ams2.redhat.com
	[10.36.116.52])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id s3E9JOtb009487; Mon, 14 Apr 2014 05:19:25 -0400
Message-ID: <534BA81C.9060807@redhat.com>
Date: Mon, 14 Apr 2014 11:19:24 +0200
From: Laszlo Ersek <lersek@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: Amos Kong <akong@redhat.com>, qemu-trivial@nongnu.org
References: <1397442420-25626-1-git-send-email-akong@redhat.com>
In-Reply-To: <1397442420-25626-1-git-send-email-akong@redhat.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: yamahata@private.email.ne.jp, mjt@tls.msk.ru, qemu-devel@nongnu.org,
	"Michael R. Hines" <mrhines@us.ibm.com>
Subject: Re: [Qemu-trivial] [PATCH] arch_init.c: remove duplicate function
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
X-List-Received-Date: Mon, 14 Apr 2014 09:19:45 -0000

On 04/14/14 04:27, Amos Kong wrote:
> We already have a function buffer_is_zero() in util/cutils.c
> 
> Signed-off-by: Amos Kong <akong@redhat.com>
> ---
>  arch_init.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
> 
> diff --git a/arch_init.c b/arch_init.c
> index 60c975d..342e5dc 100644
> --- a/arch_init.c
> +++ b/arch_init.c
> @@ -152,11 +152,6 @@ int qemu_read_default_config_files(bool userconfig)
>      return 0;
>  }
>  
> -static inline bool is_zero_range(uint8_t *p, uint64_t size)
> -{
> -    return buffer_find_nonzero_offset(p, size) == size;
> -}
> -
>  /* struct contains XBZRLE cache and a static page
>     used by the compression */
>  static struct {
> @@ -587,7 +582,7 @@ static int ram_save_block(QEMUFile *f, bool last_stage)
>                          acct_info.dup_pages++;
>                      }
>                  }
> -            } else if (is_zero_range(p, TARGET_PAGE_SIZE)) {
> +            } else if (buffer_is_zero(p, TARGET_PAGE_SIZE)) {
>                  acct_info.dup_pages++;
>                  bytes_sent = save_block_hdr(f, block, offset, cont,
>                                              RAM_SAVE_FLAG_COMPRESS);
> @@ -983,7 +978,7 @@ static inline void *host_from_stream_offset(QEMUFile *f,
>   */
>  void ram_handle_compressed(void *host, uint8_t ch, uint64_t size)
>  {
> -    if (ch != 0 || !is_zero_range(host, size)) {
> +    if (ch != 0 || !buffer_is_zero(host, size)) {
>          memset(host, ch, size);
>      }
>  }
> 

This seems to be correct, functionally -- apparently buffer_is_zero()
has laxer size requirements than buffer_find_nonzero_offset(). However,
I think the latter might be faster.

For ram_save_block() I guess the difference is negligible. But
ram_handle_compressed() is also called from "migration-rdma.c", where I
can't even guess if a little bit of slowdown would count.

I'm OK with the patch if Michael (CC'd) is.

Thanks
Laszlo

