Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1lKQ3h-0000oy-Ip
	for mharc-qemu-trivial@gnu.org; Thu, 11 Mar 2021 13:29:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lKQ3f-0000no-D2
 for qemu-trivial@nongnu.org; Thu, 11 Mar 2021 13:29:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lKQ3a-0003tu-2O
 for qemu-trivial@nongnu.org; Thu, 11 Mar 2021 13:29:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615487346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Krq+JyQNtwrTnECSYNvI/8vGLITw7wKdKrxzYHJUZMs=;
 b=g2nOTKEOBgi1IPprTrT8Lg4qjcChenaW5BDb68wsqrG1ugUEbUlH1ScW7WMRieBWRJRamG
 OnNbGwKG/ixj8KQlV3+A8siEw1yAnZEffN8wrx7nKNCMPGBuEuA9yPlmqhxUFIYxbtIsA3
 mqEUXZITiakcyYnOrCrVlKmHcQ4pLT0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-Pi_Z-hGuPLOsjcSm1ZE8UQ-1; Thu, 11 Mar 2021 13:29:04 -0500
X-MC-Unique: Pi_Z-hGuPLOsjcSm1ZE8UQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5BAF51923761;
 Thu, 11 Mar 2021 18:29:03 +0000 (UTC)
Received: from work-vm (ovpn-115-29.ams2.redhat.com [10.36.115.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A63295C1C5;
 Thu, 11 Mar 2021 18:29:00 +0000 (UTC)
Date: Thu, 11 Mar 2021 18:28:57 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Thomas Huth <thuth@redhat.com>, Brad Smith <brad@comstyle.com>,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>,
 Juan Quintela <quintela@redhat.com>
Subject: Re: [PATCH] migration: Remove time_t cast for OpenBSD
Message-ID: <YEphaTV6uzhDEY7R@work-vm>
References: <YDNdAiOkEYOfmbhT@humpty.home.comstyle.com>
 <7eaad721-9d2a-83ed-00fc-80c8ee37e156@redhat.com>
 <26c9c34a-3872-c044-4b01-06d2eb4bfbb1@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <26c9c34a-3872-c044-4b01-06d2eb4bfbb1@vivier.eu>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 11 Mar 2021 18:29:15 -0000

* Laurent Vivier (laurent@vivier.eu) wrote:
> Le 08/03/2021 à 12:46, Thomas Huth a écrit :
> > On 22/02/2021 08.28, Brad Smith wrote:
> >> OpenBSD has supported 64-bit time_t across all archs since 5.5 released in 2014.
> >>
> >> Remove a time_t cast that is no longer necessary.
> >>
> >>
> >> Signed-off-by: Brad Smith <brad@comstyle.com>
> >>
> >> diff --git a/migration/savevm.c b/migration/savevm.c
> >> index 52e2d72e4b..9557f85ba9 100644
> >> --- a/migration/savevm.c
> >> +++ b/migration/savevm.c
> >> @@ -2849,8 +2849,7 @@ bool save_snapshot(const char *name, bool overwrite, const char *vmstate,
> >>       if (name) {
> >>           pstrcpy(sn->name, sizeof(sn->name), name);
> >>       } else {
> >> -        /* cast below needed for OpenBSD where tv_sec is still 'long' */
> >> -        localtime_r((const time_t *)&tv.tv_sec, &tm);
> >> +        localtime_r(&tv.tv_sec, &tm);
> >>           strftime(sn->name, sizeof(sn->name), "vm-%Y%m%d%H%M%S", &tm);
> >>       }
> > 
> 
> but the qemu_timeval from "include/sysemu/os-win32.h" still uses a long: is this file compiled for
> win32?

Yep this fails for me when built with x86_64-w64-mingw32- (it's fine
with i686-w64-mingw32- )

Dave

> Thanks,
> Laurent
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


