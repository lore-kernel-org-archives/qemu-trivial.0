Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lshza-0003cm-HB
	for mharc-qemu-trivial@gnu.org; Mon, 14 Jun 2021 04:30:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lshzX-0003Yq-Di
 for qemu-trivial@nongnu.org; Mon, 14 Jun 2021 04:30:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lshzV-0006T7-C5
 for qemu-trivial@nongnu.org; Mon, 14 Jun 2021 04:30:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623659440;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eZwIlYZWXOp5Rd/yX/OtVQ9Ot0plMM0zOAOaGzF8R9c=;
 b=FkQg59Hr8Merki2psH5C1upNMjGPowbOzc27sdk1tYk5/iMH8/AH1YAPVskeiuFOXWFa4m
 U++VAh63PVfnO+k+aXOrtnqWmy0lI5wIDQXGx3SI7nxrOtKb5VuSBmelPk0VyTRokpF98B
 H7Rv/YXLjyrrRA1g26qQBFgXAr3CeEE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-223-acE7d2EWP7KCw7VbwiI9cg-1; Mon, 14 Jun 2021 04:30:38 -0400
X-MC-Unique: acE7d2EWP7KCw7VbwiI9cg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 90428EC1A7;
 Mon, 14 Jun 2021 08:30:36 +0000 (UTC)
Received: from redhat.com (ovpn-115-55.ams2.redhat.com [10.36.115.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 15EE360C4A;
 Mon, 14 Jun 2021 08:30:30 +0000 (UTC)
Date: Mon, 14 Jun 2021 09:30:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Lukas Straub <lukasstraub2@web.de>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Leonardo Bras <leobras.c@gmail.com>, Stefan Weil <sw@weilnetz.de>
Subject: Re: [RFC PATCH] migration: Add missing dependency on GNUTLS
Message-ID: <YMcTpO2SlVSc/HCR@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210614052623.1657103-1-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210614052623.1657103-1-f4bug@amsat.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Mon, 14 Jun 2021 08:30:45 -0000

On Mon, Jun 14, 2021 at 07:26:23AM +0200, Philippe Mathieu-Daudé wrote:
> Commit 7de2e856533 made migration/qemu-file-channel.c include
> "io/channel-tls.h" but forgot to add the new GNUTLS dependency
> on Meson, leading to build failure on OSX:
> 
>   [2/35] Compiling C object libmigration.fa.p/migration_qemu-file-channel.c.o
>   FAILED: libmigration.fa.p/migration_qemu-file-channel.c.o
>   cc -Ilibmigration.fa.p -I. -I.. -Iqapi [ ... ] -o libmigration.fa.p/migration_qemu-file-channel.c.o -c ../migration/qemu-file-channel.c
>   In file included from ../migration/qemu-file-channel.c:29:
>   In file included from include/io/channel-tls.h:26:
>   In file included from include/crypto/tlssession.h:24:
>   include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file not found
>   #include <gnutls/gnutls.h>
>            ^~~~~~~~~~~~~~~~~
>   1 error generated.
> 
> Reported-by: Stefan Weil <sw@weilnetz.de>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/407
> Fixes: 7de2e856533 ("yank: Unregister function when using TLS migration")
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
> RFC: Not tested on OSX. Stefan, do you know why this isn't covered
>      on Cirrus-CI?  https://cirrus-ci.com/build/4876003651616768
> ---
>  migration/meson.build | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


