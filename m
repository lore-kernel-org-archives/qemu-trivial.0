Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kc8fz-0000dm-C7
	for mharc-qemu-trivial@gnu.org; Mon, 09 Nov 2020 10:01:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kc8fp-0000cu-DT
 for qemu-trivial@nongnu.org; Mon, 09 Nov 2020 10:01:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kc8fm-0003cs-HB
 for qemu-trivial@nongnu.org; Mon, 09 Nov 2020 10:01:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604934092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yvFeH3PFQdKDN6hbzCd83YHOQQ78OgP1nRIb7zS3OnA=;
 b=Jh4FdAeSz+TKrSDlHEC1fGDeIZrhkzGxzHkOpeFRFYAITL2Ux3xNRvh8RBJDko27Z8Sz4I
 2putJPQ4tinGXdGJgSfJuM9bhTMyXlPiY/5kmLEN9s/MVwfsb6/K5aXYmMhwacoYw//UiS
 11XLeRyKjL2kdebKpvl7M3sHQ03SF4k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-d3gcNhBsPrqb1RTfPK4VfA-1; Mon, 09 Nov 2020 10:01:30 -0500
X-MC-Unique: d3gcNhBsPrqb1RTfPK4VfA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68547879515;
 Mon,  9 Nov 2020 15:01:28 +0000 (UTC)
Received: from work-vm (ovpn-114-198.ams2.redhat.com [10.36.114.198])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5A7095B4C8;
 Mon,  9 Nov 2020 15:01:22 +0000 (UTC)
Date: Mon, 9 Nov 2020 15:01:19 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 David Gibson <david@gibson.dropbear.id.au>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Dov Murik <dovmurik@linux.vnet.ibm.com>, qemu-trivial@nongnu.org,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: Re: [PATCH-for-5.2 4/4] migration/ram: Fix hexadecimal format string
 specifier
Message-ID: <20201109150119.GJ3024@work-vm>
References: <20201103112558.2554390-1-philmd@redhat.com>
 <20201103112558.2554390-5-philmd@redhat.com>
 <20201103124634.GG3566@work-vm>
 <bb7fecea-3b3d-b87b-7854-7d36e8133e1d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <bb7fecea-3b3d-b87b-7854-7d36e8133e1d@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/09 01:25:23
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 09 Nov 2020 15:01:37 -0000

* Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
> Hi David, Juan.
> 
> On 11/3/20 1:46 PM, Dr. David Alan Gilbert wrote:
> > * Philippe Mathieu-DaudÃ© (philmd@redhat.com) wrote:
> >> The '%u' conversion specifier is for decimal notation.
> >> When prefixing a format with '0x', we want the hexadecimal
> >> specifier ('%x').
> >>
> >> Inspired-by: Dov Murik <dovmurik@linux.vnet.ibm.com>
> >> Signed-off-by: Philippe Mathieu-DaudÃ© <philmd@redhat.com>
> > 
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> As there is no qemu-trivial@ pull request during freeze/rc,
> can you queue this patch via your migration tree?

Yep, will do.

Dave

> Thanks,
> 
> Phil.
> 
> > 
> >> ---
> >>  migration/ram.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/migration/ram.c b/migration/ram.c
> >> index 2da2b622ab2..23dcfb3ac38 100644
> >> --- a/migration/ram.c
> >> +++ b/migration/ram.c
> >> @@ -3729,7 +3729,7 @@ int ram_dirty_bitmap_reload(MigrationState *s, RAMBlock *block)
> >>      }
> >>  
> >>      if (end_mark != RAMBLOCK_RECV_BITMAP_ENDING) {
> >> -        error_report("%s: ramblock '%s' end mark incorrect: 0x%"PRIu64,
> >> +        error_report("%s: ramblock '%s' end mark incorrect: 0x%"PRIx64,
> >>                       __func__, block->idstr, end_mark);
> >>          ret = -EINVAL;
> >>          goto out;
> >> -- 
> >> 2.26.2
> >>
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


