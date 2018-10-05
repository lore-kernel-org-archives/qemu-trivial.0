Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g8Umm-0005h1-IT
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2018 14:25:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45230)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1g8Umg-0005Ys-ME
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 14:25:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1g8UiY-0002zH-4g
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 14:20:54 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50460)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eblake@redhat.com>)
	id 1g8Uhp-0001xN-G9; Fri, 05 Oct 2018 14:20:05 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 274CF81103;
	Fri,  5 Oct 2018 18:20:04 +0000 (UTC)
Received: from [10.10.126.73] (ovpn-126-73.rdu2.redhat.com [10.10.126.73])
	by smtp.corp.redhat.com (Postfix) with ESMTP id ABE8F105705F;
	Fri,  5 Oct 2018 18:19:54 +0000 (UTC)
To: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
	<philmd@redhat.com>, qemu-devel@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-4-crosa@redhat.com>
	<4ebd6e33-e1e7-962f-3ca8-4bae7b7ce425@redhat.com>
	<c33abf23-46c6-3939-f781-61662714acc5@redhat.com>
	<2b62d615-615b-a128-9c22-7d37df052abb@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b40dca25-2a3c-2e4b-53ad-8f2f1d13143b@redhat.com>
Date: Fri, 5 Oct 2018 13:19:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <2b62d615-615b-a128-9c22-7d37df052abb@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Fri, 05 Oct 2018 18:20:04 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 03/10] qemu-iotests: make
 218 executable
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
X-List-Received-Date: Fri, 05 Oct 2018 18:25:11 -0000

On 10/5/18 1:02 PM, Eric Blake wrote:
> On 10/5/18 12:49 PM, Cleber Rosa wrote:
>=20
>>>
>>> We could add a git pre-commit hook grep'ing for "^#!\
>>> *(/usr/bin/env|/bin/(b?a)?sh)" in the 1st line and then checking the
>>> file perms.
>>>
>>
>> Good idea.=C2=A0 Probably better to send that as a different patch, ri=
ght?
>=20
> Yes, separate patch. For that matter, "^#!/" is probably a sufficient=20
> pattern to catch any file that intends to be run via an interpreter, an=
d=20
> therefore wants to be executable, rather than limiting to just env and=20
> specific shells.

Also, many maintainers already have scripts/checkpatch.pl as a git=20
pre-commit hook, and putting the check in checkpatch.pl means that=20
patchew would also flag the issue.

--=20
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org

