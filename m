Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1abRII-0004UV-I8
	for mharc-qemu-trivial@gnu.org; Thu, 03 Mar 2016 06:19:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40784)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1abRIF-0004Nn-C3
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 06:19:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1abRIE-000643-HJ
	for qemu-trivial@nongnu.org; Thu, 03 Mar 2016 06:19:43 -0500
Received: from mx1.redhat.com ([209.132.183.28]:43530)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1abRI8-00061y-LC; Thu, 03 Mar 2016 06:19:36 -0500
Received: from int-mx11.intmail.prod.int.phx2.redhat.com
	(int-mx11.intmail.prod.int.phx2.redhat.com [10.5.11.24])
	by mx1.redhat.com (Postfix) with ESMTPS id 58A2380518;
	Thu,  3 Mar 2016 11:19:36 +0000 (UTC)
Received: from [10.36.112.61] (ovpn-112-61.ams2.redhat.com [10.36.112.61])
	by int-mx11.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id u23BJXZR008449
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Thu, 3 Mar 2016 06:19:35 -0500
To: Gonglei <arei.gonglei@huawei.com>, qemu-devel@nongnu.org
References: <1456998223-12356-1-git-send-email-arei.gonglei@huawei.com>
	<1456998223-12356-5-git-send-email-arei.gonglei@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <56D81DC5.60709@redhat.com>
Date: Thu, 3 Mar 2016 12:19:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1456998223-12356-5-git-send-email-arei.gonglei@huawei.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.24
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: qemu-trivial@nongnu.org
Subject: Re: [Qemu-trivial] [PATCH 4/6] hostmem-file: fix memory leak
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
X-List-Received-Date: Thu, 03 Mar 2016 11:19:44 -0000



On 03/03/2016 10:43, Gonglei wrote:
> Signed-off-by: Gonglei <arei.gonglei@huawei.com>
> ---
>  backends/hostmem-file.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/backends/hostmem-file.c b/backends/hostmem-file.c
> index fd59482..217f858 100644
> --- a/backends/hostmem-file.c
> +++ b/backends/hostmem-file.c
> @@ -51,11 +51,14 @@ file_backend_memory_alloc(HostMemoryBackend *backend, Error **errp)
>      error_setg(errp, "-mem-path not supported on this host");
>  #else
>      if (!memory_region_size(&backend->mr)) {
> +        gchar *path;
>          backend->force_prealloc = mem_prealloc;
> +        path = object_get_canonical_path(OBJECT(backend));
>          memory_region_init_ram_from_file(&backend->mr, OBJECT(backend),
> -                                 object_get_canonical_path(OBJECT(backend)),
> +                                 path,
>                                   backend->size, fb->share,
>                                   fb->mem_path, errp);
> +        g_free(path);
>      }
>  #endif
>  }
> 

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

