Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jBdKx-0005Yz-UN
	for mharc-qemu-trivial@gnu.org; Tue, 10 Mar 2020 07:46:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42254)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kwolf@redhat.com>) id 1jBdKv-0005Vp-I3
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 07:46:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kwolf@redhat.com>) id 1jBdKt-0006OG-CB
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 07:46:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39578
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kwolf@redhat.com>) id 1jBdKp-0006LA-Fc
 for qemu-trivial@nongnu.org; Tue, 10 Mar 2020 07:46:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1583840767;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZGqiBJ0CZ5WpkyFas6I7eUP/AIVUqtGGfpTG+U12qXY=;
 b=iyNQiMF1boAl46pDHJn6uPQnKpjBadV4OI9N3EO/hp2PzGnFfBktDpbx09j2hDKQ0ub/mB
 acriOFiZHWR0qRz8VDInfgGf4oHfXLcc3ogvPb550uXHJ8EY3hZg2zRTdlQRJetH6do2z8
 BVOtW8wUnVEKx/nmXzOupUjhs0n0lqs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-Sc4CF4rQPUqcyMlVXzSYDQ-1; Tue, 10 Mar 2020 07:46:05 -0400
X-MC-Unique: Sc4CF4rQPUqcyMlVXzSYDQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2CCA108442C;
 Tue, 10 Mar 2020 11:46:02 +0000 (UTC)
Received: from linux.fritz.box (unknown [10.36.118.104])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 74EEA10013A1;
 Tue, 10 Mar 2020 11:45:49 +0000 (UTC)
Date: Tue, 10 Mar 2020 12:45:48 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <rth@twiddle.net>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Max Reitz <mreitz@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Fam Zheng <fam@euphon.net>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Andrzej Zaborowski <balrogg@gmail.com>,
 Helge Deller <deller@gmx.de>, qemu-trivial@nongnu.org,
 Aurelien Jarno <aurelien@aurel32.net>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 00/33] Trivial branch patches
Message-ID: <20200310114548.GA6926@linux.fritz.box>
References: <20200309150837.3193387-1-laurent@vivier.eu>
 <20200309151621-mutt-send-email-mst@kernel.org>
 <8db36062-b45d-6c2e-c7d8-98dd2b9db06f@redhat.com>
 <0bb2eac1-74ab-bee8-e8d0-bac542562cdd@vivier.eu>
MIME-Version: 1.0
In-Reply-To: <0bb2eac1-74ab-bee8-e8d0-bac542562cdd@vivier.eu>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
X-List-Received-Date: Tue, 10 Mar 2020 11:46:14 -0000

Am 10.03.2020 um 09:02 hat Laurent Vivier geschrieben:
> Le 09/03/2020 =E0 20:30, Philippe Mathieu-Daud=E9 a =E9crit=A0:
> > On 3/9/20 8:17 PM, Michael S. Tsirkin wrote:
> >> On Mon, Mar 09, 2020 at 04:08:04PM +0100, Laurent Vivier wrote:
> >>> The following changes since commit
> >>> 7a5853cec479a448edae0fb2aaf4e2f78c9c774d:
> >>>
> >>> =A0=A0 Merge remote-tracking branch 'remotes/mst/tags/for_upstream' i=
nto
> >>> staging (2020-03-09 10:32:53 +0000)
> >>>
> >>> are available in the Git repository at:
> >>>
> >>> =A0=A0 git://github.com/vivier/qemu.git tags/trivial-branch-pull-requ=
est
> >>>
> >>> for you to fetch changes up to 916c92503bd5348a33e561db600d8894bde636=
bb:
> >>>
> >>> =A0=A0 monitor/hmp-cmds: Remove redundant statement in
> >>> hmp_rocker_of_dpa_groups() (2020-03-09 15:59:31 +0100)
> >>
> >>
> >> Could you avoid CC everyone involved on the whole PULL req?
> >> I was involved in a patch or two and don't really need to see
> >> the whole series. Just the cover and the relevant patches
> >> would be enough - if I do want it there's always lore.
> >=20
> > I suppose Laurent used git-publish, which has this limitation.
> >=20
>=20
> Yes, I use git publish and CC are automatically added.
>=20
> Philippe, you told me some time ago you have a patch to fix this
> behaviour and only CC people on a patch base. Is it available?

Actually, I don't think it's even necessary to CC anyone at all (except
the relevant lists) for pull requests. These patches were already
reviewed.

Kevin


