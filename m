Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jos4X-0008GQ-LB
	for mharc-qemu-trivial@gnu.org; Fri, 26 Jun 2020 13:23:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jos4V-0008EZ-V6
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 13:23:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22241
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1jos4U-0006f9-1z
 for qemu-trivial@nongnu.org; Fri, 26 Jun 2020 13:23:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593192205;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ybar/Tn1pDoD+UCne3nngn7lJ+TgwJmIczkU21x5N94=;
 b=TOm2ljnBX/jzh2CJU/7rR7kyAsESZ/qnpjAvlrw02pzG8vpTn0ymN930pWVwpOlyjh+n25
 U3BBzs7Zv/9sKyfCJ0n4b9I+TmuQ7y0rLn8ipC/MsOsJ2aX3EUvvbVvn392bDkiBcokqSN
 A6VsnN76/C7wROiA8blZpzI4Z5xKy2g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-14-IzWI2cMaMyuRjpgIq5BqwA-1; Fri, 26 Jun 2020 13:23:21 -0400
X-MC-Unique: IzWI2cMaMyuRjpgIq5BqwA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D064A108597A;
 Fri, 26 Jun 2020 17:23:19 +0000 (UTC)
Received: from redhat.com (unknown [10.36.110.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C22D65C1B2;
 Fri, 26 Jun 2020 17:23:03 +0000 (UTC)
Date: Fri, 26 Jun 2020 18:23:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Christophe de Dinechin <dinechin@redhat.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 05/10] build: Avoid build failure when building drivers
 as modules
Message-ID: <20200626172300.GM1028934@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20200626164307.3327380-1-dinechin@redhat.com>
 <20200626164307.3327380-6-dinechin@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200626164307.3327380-6-dinechin@redhat.com>
User-Agent: Mutt/1.14.0 (2020-05-02)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=berrange@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/26 01:55:55
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Fri, 26 Jun 2020 17:23:28 -0000

On Fri, Jun 26, 2020 at 06:43:02PM +0200, Christophe de Dinechin wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
> ---
>  Makefile.objs    | 1 +
>  Makefile.target  | 7 +++++++
>  hw/Makefile.objs | 1 +
>  3 files changed, 9 insertions(+)
> 
> diff --git a/Makefile.objs b/Makefile.objs
> index e38768c8d5..6703353493 100644
> --- a/Makefile.objs
> +++ b/Makefile.objs
> @@ -86,6 +86,7 @@ endif # CONFIG_SOFTMMU
>  # Target-independent parts used in system and user emulation
>  common-obj-y += cpus-common.o
>  common-obj-y += hw/
> +common-obj-m += hw/
>  common-obj-y += qom/
>  common-obj-y += disas/
>  
> diff --git a/Makefile.target b/Makefile.target
> index 8ed1eba95b..3f3b5ee058 100644
> --- a/Makefile.target
> +++ b/Makefile.target
> @@ -179,6 +179,13 @@ endif # CONFIG_SOFTMMU
>  dummy := $(call unnest-vars,,obj-y)
>  all-obj-y := $(obj-y)
>  
> +#
> +# common-obj-m has some crap here, probably as side effect from
> +# filling obj-y.  Clear it.  Fixes suspicious dependency errors when
> +# building devices as modules.
> +#
> +common-obj-m :=

This comment doesn't fill me with confidence - makes it feel like there's
some more important root cause that needs addressing instead.

>  include $(SRC_PATH)/Makefile.objs
>  dummy := $(call unnest-vars,.., \
>                 authz-obj-y \
> diff --git a/hw/Makefile.objs b/hw/Makefile.objs
> index 4cbe5e4e57..d6d387b74b 100644
> --- a/hw/Makefile.objs
> +++ b/hw/Makefile.objs
> @@ -43,4 +43,5 @@ devices-dirs-y += smbios/
>  endif
>  
>  common-obj-y += $(devices-dirs-y)
> +common-obj-m := display/
>  obj-y += $(devices-dirs-y)
> -- 
> 2.26.2
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


