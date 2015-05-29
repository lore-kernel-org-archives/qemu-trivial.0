Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YyFD6-0006sr-47
	for mharc-qemu-trivial@gnu.org; Fri, 29 May 2015 04:00:08 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41745)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YyFD3-0006o5-Qj
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 04:00:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1YyFD0-0003pQ-0U
	for qemu-trivial@nongnu.org; Fri, 29 May 2015 04:00:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59051)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>)
	id 1YyFCu-0003j6-Aj; Fri, 29 May 2015 03:59:56 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (Postfix) with ESMTPS id A4CD519CBE7;
	Fri, 29 May 2015 07:59:55 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-52.ams2.redhat.com
	[10.36.116.52])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t4T7xr9B022289
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Fri, 29 May 2015 03:59:54 -0400
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 81B59303F809; Fri, 29 May 2015 09:59:52 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
References: <1432816784-12436-1-git-send-email-zhaoshenglong@huawei.com>
	<1432816784-12436-2-git-send-email-zhaoshenglong@huawei.com>
Date: Fri, 29 May 2015 09:59:52 +0200
In-Reply-To: <1432816784-12436-2-git-send-email-zhaoshenglong@huawei.com>
	(Shannon Zhao's message of "Thu, 28 May 2015 20:39:41 +0800")
Message-ID: <87oal3n79j.fsf@blackfin.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: peter.maydell@linaro.org, qemu-trivial@nongnu.org, mjt@tls.msk.ru,
	qemu-devel@nongnu.org, shannon.zhao@linaro.org, pbonzini@redhat.com
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2 1/4] hw/display/cg3.c:
	Fix memory leak
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
X-List-Received-Date: Fri, 29 May 2015 08:00:06 -0000

Shannon Zhao <zhaoshenglong@huawei.com> writes:

> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>

Suffering an identity crisis?  ;)

> ---
>  hw/display/cg3.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/hw/display/cg3.c b/hw/display/cg3.c
> index 1e6ff2b..186d544 100644
> --- a/hw/display/cg3.c
> +++ b/hw/display/cg3.c
> @@ -303,8 +303,9 @@ static void cg3_realizefn(DeviceState *dev, Error **errp)
>          ret = load_image_targphys(fcode_filename, s->prom_addr,
>                                    FCODE_MAX_ROM_SIZE);
>          if (ret < 0 || ret > FCODE_MAX_ROM_SIZE) {
> -            error_report("cg3: could not load prom '%s'", CG3_ROM_FILE);
> +            error_report("cg3: could not load prom '%s'", fcode_filename);
>          }
> +        g_free(fcode_filename);
>      }
>  
>      memory_region_init_ram(&s->vram_mem, NULL, "cg3.vram", s->vram_size,

You're also improving an error message.  Mentioning that in the commit
message wouldn't hurt.

