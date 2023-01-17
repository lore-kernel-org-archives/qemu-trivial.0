Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1pHlSq-00085R-1u
	for mharc-qemu-trivial@gnu.org; Tue, 17 Jan 2023 07:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHlSn-000857-7H
 for qemu-trivial@nongnu.org; Tue, 17 Jan 2023 07:53:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pHlSl-0002MK-5F
 for qemu-trivial@nongnu.org; Tue, 17 Jan 2023 07:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673959994;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=VhcJLKwuBxCuv4Oo7bnHNv76JbTzvFLW/c10noHB0fs=;
 b=YM3PZmKyGG1j616PZCUAhkBG81NukAvypwwWqURIWZku0QPSYmTOPM4cOdk4L53zbLP7Ue
 MtrH5o+llOsRJgXPCsxBEUtMawuHI5T4NMmnlB3UI6vphzsM/F5BOuU46iycYGHX1xgZRu
 mm0cwpTCT/TeFIfkQBGy8iQhWTqDtBo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-FoVl8ZrZNqG-2NDfCNM6Fw-1; Tue, 17 Jan 2023 07:53:13 -0500
X-MC-Unique: FoVl8ZrZNqG-2NDfCNM6Fw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DEC4E802BF3;
 Tue, 17 Jan 2023 12:53:11 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.69])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 31B9540C6EC4;
 Tue, 17 Jan 2023 12:53:11 +0000 (UTC)
Date: Tue, 17 Jan 2023 12:53:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: Laurent Vivier <laurent@vivier.eu>,
 Pierre-Yves Ritschard <pyr@spootnik.org>, qemu-devel@nongnu.org,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>
Subject: Re: [PATCH] ui/vnc.c: Allow websocket connections over AF_UNIX sockets
Message-ID: <Y8aaNY8oVZ4z8hTt@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20221202151202.24851-1-pyr@spootnik.org>
 <45ba2636-bf79-560e-e22b-f9b56823658e@vivier.eu>
 <20230117124312.ebe4qpp6p3hjew32@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230117124312.ebe4qpp6p3hjew32@sirius.home.kraxel.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Jan 2023 12:53:17 -0000

On Tue, Jan 17, 2023 at 01:43:12PM +0100, Gerd Hoffmann wrote:
> On Mon, Jan 16, 2023 at 07:15:08PM +0100, Laurent Vivier wrote:
> > Hi Gerd,
> > 
> > If this patch is correct I can queue it via trivial branch.
> 
> proxying tcp websocket connections to a unix socket looks like
> a reasonable use case to me.
> 
> Acked-by: Gerd Hoffmann <kraxel@redhat.com>

Please don't queue, this patch is not correct becasue it is failing
to validate the 'websocket' parameter at all.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


