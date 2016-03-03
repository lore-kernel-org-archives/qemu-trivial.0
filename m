Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abRI9-0004CI-5m
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 06:19:37 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40662)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1abRI6-000490-TS
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 06:19:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1abRI3-00060F-0p
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 06:19:34 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51625)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1abRI0-0005z7-7y; Thu, 03 Mar 2016 06:19:28 -0500
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
	(int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
	by mx1.redhat.com (Postfix) with ESMTPS id E625C8F4FE;
	Thu,  3 Mar 2016 11:19:27 +0000 (UTC)
Received: from [10.36.112.61] (ovpn-112-61.ams2.redhat.com [10.36.112.61])
	by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u23BJOoG010518
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 3 Mar 2016 06:19:26 -0500
To: Gonglei <arei.gonglei@huawei.com>, qemu-devel@nongnu.org
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
	<1456998223-12356-2-git-send-email-arei.gonglei@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56D81DBC.3040304@redhat.com>
Date: Thu, 3 Mar 2016 12:19:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1456998223-12356-2-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.26
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 1/6] egl-helpers: fix possible resource
	leak
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
X-List-Received-Date: Thu, 03 Mar 2016 11:19:36 -0000



On 03/03/2016 10:43, Gonglei wrote:
> CID 1352419, using g_strdup_printf instead of asprintf.
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  ui/egl-helpers.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/ui/egl-helpers.c b/ui/egl-helpers.c
> index 54be44c..2da1930 100644
> --- a/ui/egl-helpers.c
> +++ b/ui/egl-helpers.c
> @@ -50,18 +50,15 @@ int qemu_egl_rendernode_open(void)
>              continue;
>          }
>  
> -        r = asprintf(&p, "/dev/dri/%s", e->d_name);
> -        if (r < 0) {
> -            return -1;
> -        }
> +        p = g_strdup_printf("/dev/dri/%s", e->d_name);
>  
>          r = open(p, O_RDWR | O_CLOEXEC | O_NOCTTY | O_NONBLOCK);
>          if (r < 0) {
> -            free(p);
> +            g_free(p);
>              continue;
>          }
>          fd = r;
> -        free(p);
> +        g_free(p);
>          break;
>      }
>  
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

