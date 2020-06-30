Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jqJWI-0003ke-EW
	for mharc-qemu-trivial@gnu.org; Tue, 30 Jun 2020 12:54:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqJWG-0003jZ-5u
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2020 12:54:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24866
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jqJWE-0000LJ-L3
 for qemu-trivial@nongnu.org; Tue, 30 Jun 2020 12:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593536041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vJSruWLVjaaC73UPwEY++g4X186kLY1YJk3gSfzrbSc=;
 b=Vp00+r/TpfJwS8Tdn1aU5Nd3JXx9Z/fnochZUl00VHzSDqfTMV80TeZpMeybE0Tzo9hXuB
 V05asWgiJzSX40qJqQSBxfJxUT/6H3Ud5TY3kIFRaCE6U8DGZIFXJiZxSEK88MOa9FSyKL
 OJoGQyrasnSxmecy7vax2YAtT91JYTE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-TmSaAU2mNz-Byg2juoJzaQ-1; Tue, 30 Jun 2020 12:53:59 -0400
X-MC-Unique: TmSaAU2mNz-Byg2juoJzaQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 984D08F4E8;
 Tue, 30 Jun 2020 16:53:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-62.ams2.redhat.com
 [10.36.112.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32D5B7BEDE;
 Tue, 30 Jun 2020 16:53:57 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 0C1EC17444; Tue, 30 Jun 2020 18:53:56 +0200 (CEST)
Date: Tue, 30 Jun 2020 18:53:56 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>, David CARLIER <devnexen@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>
Subject: Re: [PATC 7/9] Skipping drm build, unsupported
Message-ID: <20200630165356.2ka2ltwmrfjb5msn@sirius.home.kraxel.org>
References: <CA+XhMqzjjrfxXeSENBQuHzTe4TRMWV5GOdqPkD3bo17T3ufR1A@mail.gmail.com>
 <1058ccbd-b4bb-9413-abc5-ae89076a58e1@redhat.com>
 <20200630082301.6vybzwmg4pviuwob@sirius.home.kraxel.org>
 <CAFEAcA8jkzf8+d5AyAVH2HJ544TyHsM4xP5tpWsKiJbJtWMjKw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8jkzf8+d5AyAVH2HJ544TyHsM4xP5tpWsKiJbJtWMjKw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kraxel@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/30 03:55:26
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
X-List-Received-Date: Tue, 30 Jun 2020 16:54:04 -0000

> > > > -util-obj-$(CONFIG_POSIX) += drm.o
> > > > +util-obj-$(CONFIG_LINUX) += drm.o
> >
> > Can't see anything linux-specific there.  Also note that FreeBSD (and
> > possibly other *BSDs too) have drm support.  So CONFIG_POSIX looks
> > correct to me.
> 
> This change was my suggestion; I assumed that "open /dev/dri/whatever"
> was Linux-specific. The specific thing that doesn't work on
> Haiku, or on Solaris for that matter, is that the code uses
> DT_CHR, which isn't in POSIX but is a Linux-and-BSDism.

Ah, that is the problem.  Yes, DT_CHR is an non-posix optimization which
allows to get the file type directly, without another round-trip to the
kernel.  If that isn't available you can stat() the file and check
((st_mode & S_IFMT) == S_IFCHR) instead.

take care,
  Gerd


