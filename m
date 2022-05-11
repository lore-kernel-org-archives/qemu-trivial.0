Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1nokRE-0003sQ-4m
	for mharc-qemu-trivial@gnu.org; Wed, 11 May 2022 07:23:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nokR7-0003qV-2X
 for qemu-trivial@nongnu.org; Wed, 11 May 2022 07:23:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nokR4-0005CD-6l
 for qemu-trivial@nongnu.org; Wed, 11 May 2022 07:23:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652268197;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=HWmx8NZxneGjFDWiGB3HW2NAKbUqB2UMj74GGBSbBn0=;
 b=NJIXRk6pgJCf5frajtdl21DJZ7W3iltw1/WNlxgzzGrwNr9SkZt17nJ99CDDB5SN8pXmLp
 eSu9Q1A7u/JI6R3VNDPzj/X3p+AZFR4ozfHGLGD536Ksb2Fkd/PO/iijBZ3QxfBsJo8OKo
 MU8OK/IaOPiRo6XKwUUZNt+OEFSHUpE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-2r2tAAm-O3SymibvEnfFwQ-1; Wed, 11 May 2022 07:23:16 -0400
X-MC-Unique: 2r2tAAm-O3SymibvEnfFwQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 973D2101AA45;
 Wed, 11 May 2022 11:23:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EFAC52026D64;
 Wed, 11 May 2022 11:23:00 +0000 (UTC)
Date: Wed, 11 May 2022 12:22:58 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 kraxel@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-trivial@nongnu.org
Subject: Re: [PATCH] meson.build: Bump minimum supported version of pixman to
 0.34.0
Message-ID: <Ynucki8ZXwZgCETK@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220511094758.794946-1-thuth@redhat.com>
 <CAFEAcA9bUires+a-dc8v-oDDKg5WJRf4vVR8jKady5QgjMJTZA@mail.gmail.com>
 <b819e229-4aff-6381-a686-664aa97712a3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <b819e229-4aff-6381-a686-664aa97712a3@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-List-Received-Date: Wed, 11 May 2022 11:23:26 -0000

On Wed, May 11, 2022 at 12:56:45PM +0200, Thomas Huth wrote:
> On 11/05/2022 12.28, Peter Maydell wrote:
> > On Wed, 11 May 2022 at 10:50, Thomas Huth <thuth@redhat.com> wrote:
> > > 
> > > We haven't revisited the minimum required versions of pixman
> > > since quite a while. Let's check whether we can rule out some
> > > old versions that nobody tests anymore...
> > > 
> > > For pixman, per repology.org, currently shipping versions are:
> > > 
> > >       CentOS 8 / RHEL-8 : 0.38.4
> > >                Fedora 34: 0.40.0
> > >               Debian 10 : 0.36.0
> > >        Ubuntu LTS 20.04 : 0.38.4
> > >      openSUSE Leap 15.3 : 0.34.0
> > >             MSYS2 MinGW : 0.40.0
> > >           FreeBSD Ports : 0.34.0 / 0.40.0
> > >            NetBSD pksrc : 0.40.0
> > > 
> > > OpenBSD 7.1 seems to use 0.40.0 when running tests/vm/openbsd.
> > > 
> > > So it seems to be fine to bump the minimum version to 0.34.0 now.
> > 
> > This seems to be missing the rationale for why bumping
> > the minimum version is worth doing. What new feature that
> > we need is this enabling, or what now-unnecessary bug
> > workarounds does this permit us to drop?
> 
> We simply don't test such old versions anymore. Thus what happens if someone
> tries to use such a version and runs into a problem (especially if it is
> non-obvious and would need a lot of debugging)? Are you still willing to fix
> it? Or would you then rather bump the version after hours of debugging the
> problem? ... IMHO it's better to set the expectations right from the start.
> If we do not test and support it anymore, we should not give the impression
> that QEMU can still be compiled with this.

Support for QEMU is not such a clearly defined boundary, there are many
levels of support.  Our CI testing determines our "top tier" platforms
where we expect everything to be functional at all times, but it doesn't
mean that all other platforms are entirely unsupported. It merely means
we can't offer the same level of assurance that it will be perfect out
of the box.

If someone reports an issue we have freedom to decide how much effort
to put in. If they're using a pixman that's very old compared to what
we've tested, we don't have to spend time on that ourselves. We can
easily tell the reporter to reproduce with something newer first if
desired.

The platform support matrix is a way to determine:

 - what platforms we should focus our testing resources on

   For this, we can unambiguously bump our tsting envs
   on each release. It merely means the old version is
   no longer top tier, it is second tier in terms of
   what quality users can expect.

 - whether it is reasonable to bump a package minimum version

   Admittedly we never expressed whether the min version bumps
   are justifiable just for the sake of it, or whether version
   bumps are expected as a means to access new functionality /
   drop back compat code. Nearly all the bumps we've done have
   had some code benefit in the past.

   In practice when we bump the minimum glib2 version this has
   a clear code benefit, and once you bump min glib2, this defacto
   eliminates old versions of many other libraries. The only
   exception would be distros that are fast at rebasing glib, but
   slow at rebasing other deps we have. This is pretty uncommon
   for any mainstream distro.

IOW, I would suggest that in each release our first focus should
be on glib, gcc/clang versions, as those historically bring us
clear benefits. If glib bumps, then there's little point in
keeping any other deps with older min versions, so many other
bits can be a fairly straightforward decision.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


