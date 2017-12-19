Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eRP5R-0002V3-KP
	for mharc-qemu-trivial@gnu.org; Tue, 19 Dec 2017 16:06:05 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32777)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1eRP5P-0002Sm-Bz
	for qemu-trivial@nongnu.org; Tue, 19 Dec 2017 16:06:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sw@weilnetz.de>) id 1eRP5O-0007yG-JF
	for qemu-trivial@nongnu.org; Tue, 19 Dec 2017 16:06:03 -0500
Received: from mail.weilnetz.de ([37.120.169.71]:32988
	helo=v2201612906741603.powersrv.de)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sw@weilnetz.de>)
	id 1eRP5K-0007uH-NZ; Tue, 19 Dec 2017 16:05:58 -0500
Received: from localhost (localhost [127.0.0.1])
	by v2201612906741603.powersrv.de (Postfix) with ESMTP id 97A10DA9D49;
	Tue, 19 Dec 2017 22:05:56 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at v2201612906741603.powersrv.de
Received: from v2201612906741603.powersrv.de ([127.0.0.1])
	by localhost (v2201612906741603.powersrv.de [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id GSY7mlCV3Tyr; Tue, 19 Dec 2017 22:05:55 +0100 (CET)
Received: from edv32.bib.uni-mannheim.de (pD9E01653.dip0.t-ipconnect.de
	[217.224.22.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by v2201612906741603.powersrv.de (Postfix) with ESMTPSA id A03B5DA9D43; 
	Tue, 19 Dec 2017 22:05:55 +0100 (CET)
To: Thomas Huth <thuth@redhat.com>, "Daniel P. Berrange" <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-trivial@nongnu.org
References: <1513700253-10045-1-git-send-email-thuth@redhat.com>
	<20171219162157.GD3567@redhat.com>
	<7d919cca-4dc1-6591-1a01-4143d3fe2b3b@redhat.com>
From: Stefan Weil <sw@weilnetz.de>
Message-ID: <2114e43c-e755-523c-9035-6bd1bafbaae9@weilnetz.de>
Date: Tue, 19 Dec 2017 22:05:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <7d919cca-4dc1-6591-1a01-4143d3fe2b3b@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 37.120.169.71
Subject: Re: [Qemu-trivial] [PATCH] monitor: Remove legacy "-mon default=on"
 parameter
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial/>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Dec 2017 21:06:04 -0000

Am 19.12.2017 um 17:34 schrieb Thomas Huth:
> No, as far as I know, the online qemu-doc is only updated for release
> candidates and releases, so the current information will stay there a
> little bit longer.

It's normally updated when I create new QEMU installers for Windows.
I can update it when needed, and it is also possible to provide
additional qemu-doc for releases (https://qemu.weilnetz.de/doc/).

Regards,
Stefan

