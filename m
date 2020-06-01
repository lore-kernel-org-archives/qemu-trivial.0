Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jfgrI-0003C9-4R
	for mharc-qemu-trivial@gnu.org; Mon, 01 Jun 2020 05:35:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jfgrG-0003BN-FT
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 05:35:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36639
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1jfgrF-00078l-4j
 for qemu-trivial@nongnu.org; Mon, 01 Jun 2020 05:35:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591004148;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CtRe7JqBaNd3Ht3Qr5uxXiDTrRL/AI6jyVQFWO/kqhk=;
 b=RvyIw/5vO3ZzdtQXHw6f2VJgqhzy2bN1699kTADz5CdQnotGnHCsV3K+j8n40R5SjESSIf
 QIFPigV6J/ciyg5pknHw3O8htTqFLqFi03mBgfuj15c1IdM7dHxSFMRTMBcEaCgmwcenIR
 dXax+sE77b4Is33mptVpyNMbUHJLxII=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-240-SNhj150DN7mvikHMHZIj7Q-1; Mon, 01 Jun 2020 05:35:44 -0400
X-MC-Unique: SNhj150DN7mvikHMHZIj7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 777DB108594D;
 Mon,  1 Jun 2020 09:35:43 +0000 (UTC)
Received: from work-vm (ovpn-113-144.ams2.redhat.com [10.36.113.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A8795D9C9;
 Mon,  1 Jun 2020 09:35:42 +0000 (UTC)
Date: Mon, 1 Jun 2020 10:35:39 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] migration/vmstate: Remove unnecessary MemoryRegion
 forward declaration
Message-ID: <20200601093539.GD2743@work-vm>
References: <20200530165512.15225-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20200530165512.15225-1-f4bug@amsat.org>
User-Agent: Mutt/1.13.4 (2020-02-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/01 05:35:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, T_HK_NAME_DR=0.01, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Mon, 01 Jun 2020 09:35:50 -0000

* Philippe Mathieu-Daudé (f4bug@amsat.org) wrote:
> "migration/vmstate.h" only uses pointer to MemoryRegion, which
> is already forward declared in "qemu/typedefs.h".
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> CI: https://travis-ci.org/github/philmd/qemu/builds/692879495
> ---
>  include/migration/vmstate.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 30667631bc..eafa39f560 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -1199,7 +1199,6 @@ static inline int vmstate_register(VMStateIf *obj, int instance_id,
>  void vmstate_unregister(VMStateIf *obj, const VMStateDescription *vmsd,
>                          void *opaque);
>  
> -struct MemoryRegion;
>  void vmstate_register_ram(struct MemoryRegion *memory, DeviceState *dev);
>  void vmstate_unregister_ram(struct MemoryRegion *memory, DeviceState *dev);
>  void vmstate_register_ram_global(struct MemoryRegion *memory);

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

and queued.

> -- 
> 2.21.3
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


