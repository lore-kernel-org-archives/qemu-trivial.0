Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1mW2ee-0002ci-8L
	for mharc-qemu-trivial@gnu.org; Thu, 30 Sep 2021 16:27:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mW2eW-0002bm-FD
 for qemu-trivial@nongnu.org; Thu, 30 Sep 2021 16:27:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mW2eS-0008KT-Gw
 for qemu-trivial@nongnu.org; Thu, 30 Sep 2021 16:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633033648;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2UeN+Q4jngjtDGGTLe36hdk7lw1cEmcl1Qho0CvtZhY=;
 b=IqT358EYvfxPV6dlcEmabc9yLWkUVCkz9ku1uJSmB0Dwf69+hHtO4Ki2QYIUlPPc7Txi5V
 vyyobv5OBubKR8X1+Vofhml3n5e7UDyvfJ7r0s1MPwYEIxXVa/J5MeiHkN4716oLHDRrIX
 I94hWD/x0IfTdR1Jw+vmHn8gaLgR/FE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-LMzTMkzNPNSCFOAtseKbCQ-1; Thu, 30 Sep 2021 16:27:25 -0400
X-MC-Unique: LMzTMkzNPNSCFOAtseKbCQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1386A362F8;
 Thu, 30 Sep 2021 20:27:24 +0000 (UTC)
Received: from redhat.com (ovpn-113-87.phx2.redhat.com [10.3.113.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 49FF21036B27;
 Thu, 30 Sep 2021 20:27:16 +0000 (UTC)
Date: Thu, 30 Sep 2021 15:27:14 -0500
From: Eric Blake <eblake@redhat.com>
To: Kevin Wolf <kwolf@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 ~farzon <farzon@farzon.org>, thuth@redhat.com,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 jsnow@redhat.com
Subject: Re: [PATCH qemu v2] QEMU coding style mandates spaces for
 indentation. This change replaces TABs in block files.
Message-ID: <20210930202714.y4mbrtcwlk3j665q@redhat.com>
References: <163295635969.12353.14555479457179645848-0@git.sr.ht>
 <YVWHaCOdHUaRbpmc@redhat.com>
 <be93f4d4-6521-a691-fe7a-68b998d5c4df@virtuozzo.com>
 <YVWztO5kIHLlCCZW@redhat.com>
MIME-Version: 1.0
In-Reply-To: <YVWztO5kIHLlCCZW@redhat.com>
User-Agent: NeoMutt/20210205-773-8890a5
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Thu, 30 Sep 2021 20:27:38 -0000

On Thu, Sep 30, 2021 at 02:55:16PM +0200, Kevin Wolf wrote:
> > > When we're changing these lines anyway, let's make sure to have
> > > consistent alignment with the surrounding code. So I would prefer
> > > something like:
> > > 
> > > +    .bdrv_close               = parallels_close,
> > >       .bdrv_child_perm          = bdrv_default_perms,
> > > 
> > > Rather than:
> > > 
> > > +    .bdrv_close     = parallels_close,
> > >       .bdrv_child_perm          = bdrv_default_perms,
> > > 
> > > In most cases, there are already inconsistencies in the BlockDriver
> > > definitions, but let's use the chance to make it a little better.
> > 
> > 
> > Or may be drop alignment around '=' at all, to have
> > 
> >    .bdrv_child_perm = bdrv_default_perms,
> >    .bdrv_co_block_status = parallels_co_block_status,
> >    .bdrv_has_zero_init = bdrv_has_zero_init_1,
> > 
> > ?
> 
> You're right that this would make it easy to keep things consistent, but
> I think it hurts readability a lot, even compared to the current, often
> inconsistent state.

I agree that the alignment adds a bit of readability, but also
understand that it adds a maintenacne burden.  Thus, in code I manage,
I'm fine with either style (no extra spaces, or '=' lined up); and can
live with different styles in different files (which I then will honor
when doing a grunt-work patch that touches all of the block drivers).
But what I don't like is when a single file cannot be consistent with
itself on which of those two styles it is using - a file that uses
aligned '=' really needs to put that '=' far enough to the right that
an added long-named member doesn't cause frequent reindentation of the
rest of the members.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


