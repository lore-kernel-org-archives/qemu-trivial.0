Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kZvi8-0001k6-HW
	for mharc-qemu-trivial@gnu.org; Tue, 03 Nov 2020 07:46:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kZvi7-0001gt-3R
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 07:46:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kZvi3-0000WW-TQ
 for qemu-trivial@nongnu.org; Tue, 03 Nov 2020 07:46:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604407607;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JkqF5xkJlSgNXNCJ01s7hDAx4a3PISAb1rGO645d2uU=;
 b=MD9zgNdf59pQXPzBs0fDOFh/nUE0ZuAwPYWTBwn4cL98XAhNdj0BPVewPjMdy1+h+lXUH6
 9lWnhQIbPowE7sGhbQ9NHHXTUzEVYFKj/KE22cB/Clgvd4TzGhEsMsXARukCziSHPbXf+s
 04wQAjPhh3lRuRsuZ69/vzpuqsv2OLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-589-kDvc3BMxOc6qN8M2QQDRWA-1; Tue, 03 Nov 2020 07:46:43 -0500
X-MC-Unique: kDvc3BMxOc6qN8M2QQDRWA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 471CECE646;
 Tue,  3 Nov 2020 12:46:42 +0000 (UTC)
Received: from work-vm (ovpn-115-84.ams2.redhat.com [10.36.115.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1E29F6CE52;
 Tue,  3 Nov 2020 12:46:36 +0000 (UTC)
Date: Tue, 3 Nov 2020 12:46:34 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH-for-5.2 4/4] migration/ram: Fix hexadecimal format string
 specifier
Message-ID: <20201103124634.GG3566@work-vm>
References: <20201103112558.2554390-1-philmd@redhat.com>
 <20201103112558.2554390-5-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201103112558.2554390-5-philmd@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 00:03:41
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Tue, 03 Nov 2020 12:46:51 -0000

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> The '%u' conversion specifier is for decimal notation.
> When prefixing a format with '0x', we want the hexadecimal
> specifier ('%x').
> 
> Inspired-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  migration/ram.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/migration/ram.c b/migration/ram.c
> index 2da2b622ab2..23dcfb3ac38 100644
> --- a/migration/ram.c
> +++ b/migration/ram.c
> @@ -3729,7 +3729,7 @@ int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *block)
>      }
>  
>      if (end_mark != RAMBLOCK_RECV_BITMAP_ENDING) {
> -        error_report("%s: ramblock '%s' end mark incorrect: 0x%"PRIu64,
> +        error_report("%s: ramblock '%s' end mark incorrect: 0x%"PRIx64,
>                       __func__, block->idstr, end_mark);
>          ret = -EINVAL;
>          goto out;
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


