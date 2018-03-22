Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ez30g-0002Ve-Tj
	for mharc-qemu-trivial@gnu.org; Thu, 22 Mar 2018 12:24:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1ez30a-0002KF-8Z
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 12:24:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1ez30Z-0000Jy-6D
	for qemu-trivial@nongnu.org; Thu, 22 Mar 2018 12:24:08 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:46396 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>)
	id 1ez30L-0000CV-C0; Thu, 22 Mar 2018 12:23:53 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
	[10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 56381406FA25;
	Thu, 22 Mar 2018 16:23:52 +0000 (UTC)
Received: from work-vm (ovpn-117-132.ams2.redhat.com [10.36.117.132])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 047417C34;
	Thu, 22 Mar 2018 16:23:43 +0000 (UTC)
Date: Thu, 22 Mar 2018 16:23:41 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>, Richard Henderson <rth@twiddle.net>,
	qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
	Jason Wang <jasowang@redhat.com>, Max Reitz <mreitz@redhat.com>,
	Fam Zheng <famz@redhat.com>, qemu-trivial@nongnu.org,
	Alexander Graf <agraf@suse.de>, qemu-ppc@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>,
	Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, Yongbok Kim <yongbok.kim@mips.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Eduardo Habkost <ehabkost@redhat.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Markus Armbruster <armbru@redhat.com>
Message-ID: <20180322162341.GC3205@work-vm>
References: <20180322161226.29796-1-lvivier@redhat.com>
	<20180322161226.29796-4-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180322161226.29796-4-lvivier@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.5]);
	Thu, 22 Mar 2018 16:23:52 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]);
	Thu, 22 Mar 2018 16:23:52 +0000 (UTC) for IP:'10.11.54.5'
	DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'dgilbert@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: Re: [Qemu-trivial] [PATCH 3/4] qdict: remove useless cast
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
X-List-Received-Date: Thu, 22 Mar 2018 16:24:13 -0000

* Laurent Vivier (lvivier@redhat.com) wrote:
> Re-run Coccinelle script scripts/coccinelle/qobject.cocci
> 
> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
> ---
>  block/nvme.c | 11 +++++------
>  monitor.c    |  2 +-
>  2 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/block/nvme.c b/block/nvme.c
> index 8bca57aae6..c4f3a7bc94 100644
> --- a/block/nvme.c
> +++ b/block/nvme.c
> @@ -695,12 +695,11 @@ static void nvme_parse_filename(const char *filename, QDict *options,
>          unsigned long ns;
>          const char *slash = strchr(tmp, '/');
>          if (!slash) {
> -            qdict_put(options, NVME_BLOCK_OPT_DEVICE,
> -                      qstring_from_str(tmp));
> +            qdict_put_str(options, NVME_BLOCK_OPT_DEVICE, tmp);
>              return;
>          }
>          device = g_strndup(tmp, slash - tmp);
> -        qdict_put(options, NVME_BLOCK_OPT_DEVICE, qstring_from_str(device));
> +        qdict_put_str(options, NVME_BLOCK_OPT_DEVICE, device);
>          g_free(device);
>          namespace = slash + 1;
>          if (*namespace && qemu_strtoul(namespace, NULL, 10, &ns)) {
> @@ -708,8 +707,8 @@ static void nvme_parse_filename(const char *filename, QDict *options,
>                         namespace);
>              return;
>          }
> -        qdict_put(options, NVME_BLOCK_OPT_NAMESPACE,
> -                  qstring_from_str(*namespace ? namespace : "1"));
> +        qdict_put_str(options, NVME_BLOCK_OPT_NAMESPACE,
> +                      *namespace ? namespace : "1");
>      }
>  }
>  
> @@ -1082,7 +1081,7 @@ static void nvme_refresh_filename(BlockDriverState *bs, QDict *opts)
>                   bs->drv->format_name);
>      }
>  
> -    qdict_put(opts, "driver", qstring_from_str(bs->drv->format_name));
> +    qdict_put_str(opts, "driver", bs->drv->format_name);
>      bs->full_open_options = opts;
>  }
>  
> diff --git a/monitor.c b/monitor.c
> index 6ccd2fc089..6e7667d82f 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -4316,7 +4316,7 @@ static QObject *get_qmp_greeting(Monitor *mon)
>              /* Monitors that are not using IOThread won't support OOB */
>              continue;
>          }
> -        qlist_append(cap_list, qstring_from_str(QMPCapability_str(cap)));
> +        qlist_append_str(cap_list, QMPCapability_str(cap));
>      }
>  
>      return qobject_from_jsonf("{'QMP': {'version': %p, 'capabilities': %p}}",

For monitor:

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> -- 
> 2.14.3
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

