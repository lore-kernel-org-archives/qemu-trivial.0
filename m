Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1kPSbb-0003Cj-AW
	for mharc-qemu-trivial@gnu.org; Mon, 05 Oct 2020 11:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kPSbZ-0003Ao-Sf
 for qemu-trivial@nongnu.org; Mon, 05 Oct 2020 11:40:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kPSbU-0007fL-5s
 for qemu-trivial@nongnu.org; Mon, 05 Oct 2020 11:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601912443;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gVKFetoNc5U7j7QeRNTUMw4P3rarv9nDnrl96XJ7r+w=;
 b=SpARF+emOEvpz18FN+Abt2IEBoT5I5RO/pzOPFH95e5fjFDu0nzceZFvAebl22nN8MhdRi
 9pq6SjkxRQu9z177ALR1OQCginVSQoum5lPHI7oc08XrE8LRlrFPYYPlrkBcT+hQdjHr0u
 XA0U7dM+/hLzjE3Kw6rWJ2qQiyad2Sw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-gWrQAVBCNa-Q7CWQX9QPiQ-1; Mon, 05 Oct 2020 11:40:36 -0400
X-MC-Unique: gWrQAVBCNa-Q7CWQX9QPiQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 18C4080BCC1;
 Mon,  5 Oct 2020 15:40:24 +0000 (UTC)
Received: from redhat.com (ovpn-114-250.ams2.redhat.com [10.36.114.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC65D60E1C;
 Mon,  5 Oct 2020 15:40:21 +0000 (UTC)
Date: Mon, 5 Oct 2020 16:40:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Cc: qemu-level <qemu-devel@nongnu.org>, QEMU Trivial <qemu-trivial@nongnu.org>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v7 0/4] Fixes curses on msys2/mingw
Message-ID: <20201005154019.GT2385272@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20201002180838.2047-1-luoyonggang@gmail.com>
 <20201005082254.GE2385272@redhat.com>
 <CAE2XoE9Ss7K0Q-sgQ268Ww7X1wmgmSRMk3-4byChn5_4GVYARA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE2XoE9Ss7K0Q-sgQ268Ww7X1wmgmSRMk3-4byChn5_4GVYARA@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/05 02:11:31
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.733,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
X-List-Received-Date: Mon, 05 Oct 2020 15:40:50 -0000

On Mon, Oct 05, 2020 at 11:31:28PM +0800, 罗勇刚(Yonggang Luo) wrote:
> On Mon, Oct 5, 2020 at 4:23 PM Daniel P. Berrangé <berrange@redhat.com>
> wrote:
> >
> > Only one of the 4 patches in this series appears to have been sent.
> All other are revied and preserve the same, I prefer not disturb by re
> sending same patches as other contributor suggested

I don't know where that is suggested, but I think that is very
unhelpful.

It breaks any kind of automation around fetching patch series.

I don't want to have to fetch some patches from version 6 and
some patches from version 7 to test the combined work.

Every patch series posted should be complete, so contributors
arent left wondering which are the correct versions for each
patch.

> >
> > On Sat, Oct 03, 2020 at 02:08:37AM +0800, Yonggang Luo wrote:
> > > V6-V7
> > > Update the configure script for
> > > * curses: Fixes compiler error that complain don't have langinfo.h on
> msys2/m=
> > > ingw
> > >
> > > V5-V6
> > > Dropping configure: Fixes ncursesw detection under msys2/mingw by
> convert the=
> > > m to meson first.
> > > That need the meson 0.56 upstream to fixes the curses detection.
> > > Add
> > > * configure: fixes indent of $meson setup
> > >
> > > Yonggang Luo (4):
> > >   configure: fixes indent of $meson setup
> > >   curses: Fixes compiler error that complain don't have langinfo.h on
> > >     msys2/mingw
> > >   curses: Fixes curses compiling errors.
> > >   win32: Simplify gmtime_r detection not depends on if  _POSIX_C_SOURCE
> > >     are defined on msys2/mingw
> > >
> > >  configure                 | 47 +++++----------------------------------
> > >  include/sysemu/os-win32.h |  4 ++--
> > >  ui/curses.c               | 14 ++++++------
> > >  util/oslib-win32.c        |  4 ++--
> > >  4 files changed, 16 insertions(+), 53 deletions(-)
> > >
> > > --=20
> > > 2.28.0.windows.1
> > >
> > >
> >
> > Regards,
> > Daniel
> > --
> > |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> > |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> > |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
> >
> 
> 
> --
>          此致
> 礼
> 罗勇刚
> Yours
>     sincerely,
> Yonggang Luo

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


