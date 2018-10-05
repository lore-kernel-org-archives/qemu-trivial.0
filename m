Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1g8UIl-00016X-0D
	for mharc-qemu-trivial@gnu.org; Fri, 05 Oct 2018 13:54:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1g8UIb-00011g-SK
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 13:54:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosa@redhat.com>) id 1g8UFS-00082B-S4
	for qemu-trivial@nongnu.org; Fri, 05 Oct 2018 13:50:47 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41648)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <crosa@redhat.com>)
	id 1g8UFL-0007l3-7F; Fri, 05 Oct 2018 13:50:40 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 69C4631676B0;
	Fri,  5 Oct 2018 17:50:35 +0000 (UTC)
Received: from localhost.localdomain (ovpn-120-82.rdu2.redhat.com
	[10.10.120.82])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D6E65D962;
	Fri,  5 Oct 2018 17:49:58 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Eric Blake <eblake@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
	qemu-block@nongnu.org, qemu-trivial@nongnu.org,
	Riku Voipio <riku.voipio@iki.fi>, Michael Tokarev <mjt@tls.msk.ru>,
	Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>
References: <20181004161852.11673-1-crosa@redhat.com>
	<20181004161852.11673-4-crosa@redhat.com>
	<4ebd6e33-e1e7-962f-3ca8-4bae7b7ce425@redhat.com>
From: Cleber Rosa <crosa@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <c33abf23-46c6-3939-f781-61662714acc5@redhat.com>
Date: Fri, 5 Oct 2018 13:49:57 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <4ebd6e33-e1e7-962f-3ca8-4bae7b7ce425@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 05 Oct 2018 17:50:36 +0000 (UTC)
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
X-List-Received-Date: Fri, 05 Oct 2018 17:54:06 -0000



On 10/5/18 9:36 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> On 04/10/2018 18:18, Cleber Rosa wrote:
>> Commit 990dc39c made all tests executable at the time, but 218 came in
>> later, and missing those permissions.
>>
>> Signed-off-by: Cleber Rosa <crosa@redhat.com>
>> ---
>>  tests/qemu-iotests/218 | 0
>>  1 file changed, 0 insertions(+), 0 deletions(-)
>>  mode change 100644 =3D> 100755 tests/qemu-iotests/218
>>
>> diff --git a/tests/qemu-iotests/218 b/tests/qemu-iotests/218
>> old mode 100644
>> new mode 100755
>=20
> We could add a git pre-commit hook grep'ing for "^#!\
> *(/usr/bin/env|/bin/(b?a)?sh)" in the 1st line and then checking the
> file perms.
>=20

Good idea.  Probably better to send that as a different patch, right?

