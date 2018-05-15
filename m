Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fIUEp-0007Cn-HH
	for mharc-qemu-trivial@gnu.org; Tue, 15 May 2018 03:19:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48527)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fIUEn-0007B8-Cy
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 03:19:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1fIUEm-0004Gz-Fq
	for qemu-trivial@nongnu.org; Tue, 15 May 2018 03:19:09 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:47348 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1fIUEf-0004ED-VQ; Tue, 15 May 2018 03:19:02 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 6C56C40201A1;
	Tue, 15 May 2018 07:19:01 +0000 (UTC)
Received: from [10.36.116.96] (ovpn-116-96.ams2.redhat.com [10.36.116.96])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 5623D6352A;
	Tue, 15 May 2018 07:18:55 +0000 (UTC)
To: Olaf Hering <olaf@aepfle.de>, qemu-trivial@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <famz@redhat.com>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>,
	Stefan Hajnoczi <stefanha@redhat.com>, qemu-stable@nongnu.org
References: <20180515063128.7040-1-olaf@aepfle.de>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <d17ae62a-03a5-61fa-934a-4cb917d14222@redhat.com>
Date: Tue, 15 May 2018 09:18:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <20180515063128.7040-1-olaf@aepfle.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.6]);
	Tue, 15 May 2018 07:19:01 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.6]);
	Tue, 15 May 2018 07:19:01 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'thuth@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] replace functions which
 are only available in glib-2.24
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
X-List-Received-Date: Tue, 15 May 2018 07:19:10 -0000

On 15.05.2018 08:31, Olaf Hering wrote:
> Currently the minimal supported version of glib is 2.22.
> Since testing is done with a glib that claims to be 2.22, but in fact
> has APIs from newer version of glib, this bug was not caught during
> submit of the patch referenced below.
> 
> Replace g_realloc_n, which is available only since 2.24, with g_renew.
> 
> Fixes commit 418026ca43 ("util: Introduce vfio helpers")
> 
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  This must go into stable-2.12.

In that case please CC: qemu-stable@nongnu.org (done now).

Reviewed-by: Thomas Huth <thuth@redhat.com>

>  util/vfio-helpers.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/util/vfio-helpers.c b/util/vfio-helpers.c
> index 006674c916..1d9272efa4 100644
> --- a/util/vfio-helpers.c
> +++ b/util/vfio-helpers.c
> @@ -522,8 +522,7 @@ static IOVAMapping *qemu_vfio_add_mapping(QEMUVFIOState *s,
>  
>      assert(index >= 0);
>      s->nr_mappings++;
> -    s->mappings = g_realloc_n(s->mappings, sizeof(s->mappings[0]),
> -                              s->nr_mappings);
> +    s->mappings = g_renew(IOVAMapping, s->mappings, s->nr_mappings);
>      insert = &s->mappings[index];
>      shift = s->nr_mappings - index - 1;
>      if (shift) {
> @@ -577,8 +576,7 @@ static void qemu_vfio_undo_mapping(QEMUVFIOState *s, IOVAMapping *mapping,
>      memmove(mapping, &s->mappings[index + 1],
>              sizeof(s->mappings[0]) * (s->nr_mappings - index - 1));
>      s->nr_mappings--;
> -    s->mappings = g_realloc_n(s->mappings, sizeof(s->mappings[0]),
> -                              s->nr_mappings);
> +    s->mappings = g_renew(IOVAMapping, s->mappings, s->nr_mappings);
>  }
>  
>  /* Check if the mapping list is (ascending) ordered. */
> 


