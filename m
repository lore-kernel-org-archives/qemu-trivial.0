Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e9Eq7-00080O-96
	for mharc-qemu-trivial@gnu.org; Mon, 30 Oct 2017 14:31:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45634)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1e9Eq4-0007yz-UH
	for qemu-trivial@nongnu.org; Mon, 30 Oct 2017 14:31:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dgilbert@redhat.com>) id 1e9Eq1-0001DK-QC
	for qemu-trivial@nongnu.org; Mon, 30 Oct 2017 14:31:08 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37894)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1e9Eq1-0001Cu-Gf
	for qemu-trivial@nongnu.org; Mon, 30 Oct 2017 14:31:05 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B3A1B61D0E;
	Mon, 30 Oct 2017 18:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com B3A1B61D0E
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=dgilbert@redhat.com
Received: from work-vm (ovpn-117-209.ams2.redhat.com [10.36.117.209])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EAFD45D754;
	Mon, 30 Oct 2017 18:31:02 +0000 (UTC)
Date: Mon, 30 Oct 2017 18:31:00 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: ZhiPeng Lu <lu.zhipeng@zte.com.cn>
Cc: qemu-trivial@nongnu.org
Message-ID: <20171030183059.GA24825@work-vm>
References: <1508411793-22868-1-git-send-email-lu.zhipeng@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1508411793-22868-1-git-send-email-lu.zhipeng@zte.com.cn>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 30 Oct 2017 18:31:04 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH] hmp: Replace error_report_err
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
X-List-Received-Date: Mon, 30 Oct 2017 18:31:10 -0000

* ZhiPeng Lu (lu.zhipeng@zte.com.cn) wrote:
> Use hmp_handle_error instend of error_report_err to set error.
> 
> Signed-off-by: ZhiPeng Lu <lu.zhipeng@zte.com.cn>
> Reviewed-by: Jiyun Fan <fan.jiyun@zte.com.cn>

Queued for HMP

Dave

> ---
>  hmp.c | 26 ++++++++------------------
>  1 file changed, 8 insertions(+), 18 deletions(-)
> 
> diff --git a/hmp.c b/hmp.c
> index ec61329..a03bd03 100644
> --- a/hmp.c
> +++ b/hmp.c
> @@ -667,7 +667,7 @@ void hmp_info_vnc(Monitor *mon, const QDict *qdict)
>  
>      info2l = qmp_query_vnc_servers(&err);
>      if (err) {
> -        error_report_err(err);
> +        hmp_handle_error(mon, &err);
>          return;
>      }
>      if (!info2l) {
> @@ -782,7 +782,7 @@ void hmp_info_balloon(Monitor *mon, const QDict *qdict)
>  
>      info = qmp_query_balloon(&err);
>      if (err) {
> -        error_report_err(err);
> +        hmp_handle_error(mon, &err);
>          return;
>      }
>  
> @@ -1125,7 +1125,7 @@ void hmp_ringbuf_read(Monitor *mon, const QDict *qdict)
>  
>      data = qmp_ringbuf_read(chardev, size, false, 0, &err);
>      if (err) {
> -        error_report_err(err);
> +        hmp_handle_error(mon, &err);
>          return;
>      }
>  
> @@ -1192,9 +1192,7 @@ void hmp_balloon(Monitor *mon, const QDict *qdict)
>      Error *err = NULL;
>  
>      qmp_balloon(value, &err);
> -    if (err) {
> -        error_report_err(err);
> -    }
> +    hmp_handle_error(mon, &err);
>  }
>  
>  void hmp_block_resize(Monitor *mon, const QDict *qdict)
> @@ -1518,10 +1516,7 @@ void hmp_migrate_set_cache_size(Monitor *mon, const QDict *qdict)
>      Error *err = NULL;
>  
>      qmp_migrate_set_cache_size(value, &err);
> -    if (err) {
> -        error_report_err(err);
> -        return;
> -    }
> +    hmp_handle_error(mon, &err);
>  }
>  
>  /* Kept for backwards compatibility */
> @@ -1552,10 +1547,7 @@ void hmp_migrate_set_capability(Monitor *mon, const QDict *qdict)
>  
>  end:
>      qapi_free_MigrationCapabilityStatusList(caps);
> -
> -    if (err) {
> -        error_report_err(err);
> -    }
> +    hmp_handle_error(mon, &err);
>  }
>  
>  void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
> @@ -1653,9 +1645,7 @@ void hmp_migrate_set_parameter(Monitor *mon, const QDict *qdict)
>   cleanup:
>      qapi_free_MigrateSetParameters(p);
>      visit_free(v);
> -    if (err) {
> -        error_report_err(err);
> -    }
> +    hmp_handle_error(mon, &err);
>  }
>  
>  void hmp_client_migrate_info(Monitor *mon, const QDict *qdict)
> @@ -1909,7 +1899,7 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
>  
>      qmp_migrate(uri, !!blk, blk, !!inc, inc, false, false, &err);
>      if (err) {
> -        error_report_err(err);
> +        hmp_handle_error(mon, &err);
>          return;
>      }
>  
> -- 
> 1.8.3.1
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

