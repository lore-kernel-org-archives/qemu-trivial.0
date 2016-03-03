Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abRIB-0004GY-Et
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 06:19:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1abRI7-00049z-Ec
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 06:19:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1abRI6-000615-LP
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 06:19:35 -0500
Received: from mx1.redhat.com ([209.132.183.28]:51637)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1abRI4-00060V-P9; Thu, 03 Mar 2016 06:19:32 -0500
Received: from int-mx10.intmail.prod.int.phx2.redhat.com
	(int-mx10.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	by mx1.redhat.com (Postfix) with ESMTPS id 7483085541;
	Thu,  3 Mar 2016 11:19:32 +0000 (UTC)
Received: from [10.36.112.61] (ovpn-112-61.ams2.redhat.com [10.36.112.61])
	by int-mx10.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u23BJS4k013602
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 3 Mar 2016 06:19:31 -0500
To: Gonglei <arei.gonglei@huawei.com>, qemu-devel@nongnu.org
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
	<1456998223-12356-4-git-send-email-arei.gonglei@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56D81DC0.5030302@redhat.com>
Date: Thu, 3 Mar 2016 12:19:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1456998223-12356-4-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.23
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 3/6] spice: fix coverity complains
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
> Remove the unnecessary NULL check.
> 
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  ui/spice-display.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/ui/spice-display.c b/ui/spice-display.c
> index 242ab5f..1ffbec1 100644
> --- a/ui/spice-display.c
> +++ b/ui/spice-display.c
> @@ -769,9 +769,7 @@ static void display_mouse_define(DisplayChangeListener *dcl,
>      SimpleSpiceDisplay *ssd = container_of(dcl, SimpleSpiceDisplay, dcl);
>  
>      qemu_mutex_lock(&ssd->lock);
> -    if (c) {
> -        cursor_get(c);
> -    }
> +    cursor_get(c);
>      cursor_put(ssd->cursor);
>      ssd->cursor = c;
>      ssd->hot_x = c->hot_x;
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

