Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jq3Aj-0000Dr-Dn
	for mharc-qemu-trivial@gnu.org; Mon, 29 Jun 2020 19:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jq3Ah-0000Dj-Qd
 for qemu-trivial@nongnu.org; Mon, 29 Jun 2020 19:26:43 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:54599
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jq3Af-0005uA-8W
 for qemu-trivial@nongnu.org; Mon, 29 Jun 2020 19:26:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593473199;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wRBxNXZQd5hzfCPOwFk94wS55sAADrerShYncLtA0LM=;
 b=WNyW7gda99o7vfDmp4OtIsUUxI6L8xJKnGpS+oROcei3Y56VCxjIX0g6I2w2I2LDZrvO0e
 srQ1PAT+5vCw6mNsMuUcDSxZu4MqSzCtsWY9V5FMKOzR0Jw1uQu08XFppjChjRBlsIKeLI
 NekaIdTAo72dBRsRvY480CgaxLMRVfA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-H0kQoUphPQqmVS67fJ4SHQ-1; Mon, 29 Jun 2020 19:26:33 -0400
X-MC-Unique: H0kQoUphPQqmVS67fJ4SHQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2738D1800D42;
 Mon, 29 Jun 2020 23:26:32 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5868F7BEA3;
 Mon, 29 Jun 2020 23:26:23 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 1786059CC; Tue, 30 Jun 2020 01:26:22 +0200 (CEST)
Date: Tue, 30 Jun 2020 01:26:22 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Christophe de Dinechin <dinechin@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-trivial@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Laurent Vivier <laurent@vivier.eu>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH 05/10] build: Avoid build failure when building drivers
 as modules
Message-ID: <20200629232622.jnop64vnugp3wexa@sirius.home.kraxel.org>
References: <20200626164307.3327380-1-dinechin@redhat.com>
 <20200626164307.3327380-6-dinechin@redhat.com>
 <20200626172300.GM1028934@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200626172300.GM1028934@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 19:26:39
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
X-List-Received-Date: Mon, 29 Jun 2020 23:26:44 -0000

  Hi,

> > +#
> > +# common-obj-m has some crap here, probably as side effect from
> > +# filling obj-y.  Clear it.  Fixes suspicious dependency errors when
> > +# building devices as modules.
> > +#
> > +common-obj-m :=
> 
> This comment doesn't fill me with confidence - makes it feel like there's
> some more important root cause that needs addressing instead.

It's my fault, see also
  https://patchwork.ozlabs.org/project/qemu-devel/patch/20200624131045.14512-5-kraxel@redhat.com/

I think the underlying problem is that the functions building *-m
variables do not properly handle per-target objects.  Which has no bad
side effects as long as we never recurse into hw/, but if we want build
devices as modules we have to ...

Unless we want build per-target code as module the above should do the
trick I think.

Better suggestions are welcome of course.

take care,
  Gerd


