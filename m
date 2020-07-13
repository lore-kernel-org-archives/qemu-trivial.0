Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1juurK-0000Ea-5m
	for mharc-qemu-trivial@gnu.org; Mon, 13 Jul 2020 05:34:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juurI-00008s-2O
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2020 05:34:48 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:41819
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1juurG-0007D4-Jx
 for qemu-trivial@nongnu.org; Mon, 13 Jul 2020 05:34:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594632885;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=MYL0rpYErYKNnnurq5el9LA0qvgxnajs6i4wBbiilZ8=;
 b=cbMzOU8VStvzRWWOMeqsSfEUlW/RkdLQ87jda2bNaMTf35gUfyfYbNTUjuS4/Th3gERqDH
 KiZhNzR6AuFtsjPGRBt41rSs1LksgIGv6B28bQvpRCXgVHB9W4NKORzyiqBDkJtDyiS+Pi
 aoGW1GEeWr6+HbbXCbZ5/dbjTxDWtV8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-gjiOkhn-Mw-sXlijqPriEg-1; Mon, 13 Jul 2020 05:34:42 -0400
X-MC-Unique: gjiOkhn-Mw-sXlijqPriEg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C5BE88015F3;
 Mon, 13 Jul 2020 09:34:40 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-125.ams2.redhat.com [10.36.112.125])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1415A60BEC;
 Mon, 13 Jul 2020 09:34:38 +0000 (UTC)
Subject: Re: [PATCH 06/12] migration/migration.c: Remove superfluous breaks
To: Yi Wang <wang.yi59@zte.com.cn>, qemu-devel@nongnu.org
Cc: Liao Pingfang <liao.pingfang@zte.com.cn>, wang.liang82@zte.com.cn,
 xue.zhihong@zte.com.cn, QEMU Trivial <qemu-trivial@nongnu.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <1594631078-36453-1-git-send-email-wang.yi59@zte.com.cn>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <246b77fd-00d9-4299-203c-0657c184e5de@redhat.com>
Date: Mon, 13 Jul 2020 11:34:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1594631078-36453-1-git-send-email-wang.yi59@zte.com.cn>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/13 02:19:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Mon, 13 Jul 2020 09:34:48 -0000

On 13/07/2020 11.04, Yi Wang wrote:
> From: Liao Pingfang <liao.pingfang@zte.com.cn>
> 
> Remove superfluous breaks, as there is a "return" before them.
> 
> Signed-off-by: Liao Pingfang <liao.pingfang@zte.com.cn>
> Signed-off-by: Yi Wang <wang.yi59@zte.com.cn>
> Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  migration/migration.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/migration/migration.c b/migration/migration.c
> index 92e44e0..2fd5fbb 100644
> --- a/migration/migration.c
> +++ b/migration/migration.c
> @@ -985,7 +985,6 @@ static void fill_source_migration_info(MigrationInfo *info)
>          /* no migration has happened ever */
>          /* do not overwrite destination migration status */
>          return;
> -        break;
>      case MIGRATION_STATUS_SETUP:
>          info->has_status = true;
>          info->has_total_time = false;
> @@ -1104,7 +1103,6 @@ static void fill_destination_migration_info(MigrationInfo *info)
>      switch (mis->state) {
>      case MIGRATION_STATUS_NONE:
>          return;
> -        break;
>      case MIGRATION_STATUS_SETUP:
>      case MIGRATION_STATUS_CANCELLING:
>      case MIGRATION_STATUS_CANCELLED:
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


