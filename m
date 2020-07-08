Received: from list by lists.gnu.org with archive (Exim 4.90_1)
	id 1jtKw2-0006wN-IB
	for mharc-qemu-trivial@gnu.org; Wed, 08 Jul 2020 21:01:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jtKvx-0006v6-Qi
 for qemu-trivial@nongnu.org; Wed, 08 Jul 2020 21:01:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43109
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jtKvv-0003qx-79
 for qemu-trivial@nongnu.org; Wed, 08 Jul 2020 21:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594256462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=smbKjRsU5i3KhKg3QbXzYi2KAz29ytP0Ea1NEY02NP8=;
 b=YAAGcmDWuVrJowkMtV3D5IYbN+aKY2j7sVY1vDMSIVI/FGTjf/FgFc220jHKGgxlaz0nRm
 h7+TUQ6VsaWMK1OuFQp015gJZ5scbyq3bh/TWBqZyhBDD2V2pItVthSKdq6dJcE6iJCsjG
 ICIL7js3qii6wvkpB1MPprhYX3AJfsI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-Pw-148vnOlaI8JRnwwDe1w-1; Wed, 08 Jul 2020 00:57:53 -0400
X-MC-Unique: Pw-148vnOlaI8JRnwwDe1w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C50A11005510;
 Wed,  8 Jul 2020 04:57:48 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 676E271678;
 Wed,  8 Jul 2020 04:57:34 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B747E1132FD2; Wed,  8 Jul 2020 06:57:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Daniel P. =?utf-8?Q?Berrang=C3=A9?= <berrange@redhat.com>
Cc: Christophe de Dinechin <dinechin@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,  Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,  qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>,  Max Filippov
 <jcmvbkbc@gmail.com>,  Gerd Hoffmann <kraxel@redhat.com>,  "Edgar E.
 Iglesias" <edgar.iglesias@gmail.com>,  Max Reitz <mreitz@redhat.com>,
 Marek Vasut <marex@denx.de>,  Stefano Stabellini
 <sstabellini@kernel.org>,  qemu-block@nongnu.org,
 qemu-trivial@nongnu.org,  Paul Durrant <paul@xen.org>,  Magnus Damm
 <magnus.damm@gmail.com>,  =?utf-8?Q?Herv=C3=A9?= Poussineau
 <hpoussin@reactos.org>,
 Anthony Perard <anthony.perard@citrix.com>,  =?utf-8?Q?Marc-Andr=C3=A9?=
 Lureau <marcandre.lureau@redhat.com>,  Richard Henderson <rth@twiddle.net>,
 Artyom Tarasenko <atar4qemu@gmail.com>,  Alistair Francis
 <alistair@alistair23.me>,  Eduardo Habkost <ehabkost@redhat.com>,  Michael
 Tokarev <mjt@tls.msk.ru>,  Riku Voipio <riku.voipio@iki.fi>,  Peter Lieven
 <pl@kamp.de>,  "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Roman
 Bolshakov <r.bolshakov@yadro.com>,  qemu-arm@nongnu.org,  Peter Chubb
 <peter.chubb@nicta.com.au>,  Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 xen-devel@lists.xenproject.org,  Alex =?utf-8?Q?Benn=C3=A9e?=
 <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,  Kevin Wolf
 <kwolf@redhat.com>,  Yoshinori Sato <ysato@users.sourceforge.jp>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,  Chris Wulff
 <crwulff@gmail.com>,  Laurent Vivier <laurent@vivier.eu>,  Jean-Christophe
 Dubois <jcd@tribudubois.net>,  qemu-ppc@nongnu.org,  Paolo Bonzini
 <pbonzini@redhat.com>
Subject: Re: [PATCH] trivial: Remove trailing whitespaces
References: <20200706162300.1084753-1-dinechin@redhat.com>
 <20200707102510.GF2649462@redhat.com>
Date: Wed, 08 Jul 2020 06:57:32 +0200
In-Reply-To: <20200707102510.GF2649462@redhat.com> ("Daniel P. =?utf-8?Q?B?=
 =?utf-8?Q?errang=C3=A9=22's?=
 message of "Tue, 7 Jul 2020 11:25:10 +0100")
Message-ID: <878sfu4n9f.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 17:25:11
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=unavailable autolearn_force=no
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
X-List-Received-Date: Thu, 09 Jul 2020 01:01:07 -0000

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:

> On Mon, Jul 06, 2020 at 06:23:00PM +0200, Christophe de Dinechin wrote:
>> There are a number of unnecessary trailing whitespaces that have
>> accumulated over time in the source code. They cause stray changes
>> in patches if you use tools that automatically remove them.
>>=20
>> Tested by doing a `git diff -w` after the change.
>>=20
>> This could probably be turned into a pre-commit hook.

See .git/hooks/pre-commit.sample.

Expected test output is prone to flunk the whitespace test.  One
solution is to strip trailing whitespace from test output.

> scripts/checkpatch.pl ought to be made to check it.
>
>>=20
>> Signed-off-by: Christophe de Dinechin <dinechin@redhat.com>
>> ---
[...]
>>  78 files changed, 440 insertions(+), 440 deletions(-)
>
> The cleanup is a good idea, however, I think it is probably better to
> split the patch approx into subsystems. That will make it much easier
> to cherry-pick for people doing backports.

I doubt that's worth the trouble.

Acked-by: Markus Armbruster <armbru@redhat.com>


