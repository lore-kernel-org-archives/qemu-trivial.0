Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1hAGuV-0006jT-Iv
	for mharc-qemu-trivial@gnu.org; Sat, 30 Mar 2019 12:32:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60031)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hAGuT-0006iL-DS
	for qemu-trivial@nongnu.org; Sat, 30 Mar 2019 12:32:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1hAGuG-0003I4-Rq
	for qemu-trivial@nongnu.org; Sat, 30 Mar 2019 12:32:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45110)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1hAGtl-0001nx-Vi; Sat, 30 Mar 2019 12:32:07 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 461D781DF4;
	Sat, 30 Mar 2019 16:30:50 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-57.ams2.redhat.com [10.36.116.57])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 039CB28575;
	Sat, 30 Mar 2019 16:30:43 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	qemu-devel@nongnu.org
Cc: Michael Roth <mdroth@linux.vnet.ibm.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>
References: <20181126105125.30973-1-marcandre.lureau@redhat.com>
	<7c5bc3fe-116e-f29c-977d-cac890bdfa93@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <1d019621-50b2-1118-a477-e7fffc8147ff@redhat.com>
Date: Sat, 30 Mar 2019 17:30:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <7c5bc3fe-116e-f29c-977d-cac890bdfa93@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Sat, 30 Mar 2019 16:30:50 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH] doc: fix the configuration
 path
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
X-List-Received-Date: Sat, 30 Mar 2019 16:32:46 -0000

On 07/02/2019 17.31, Philippe Mathieu-Daud=C3=A9 wrote:
> On 11/26/18 11:51 AM, Marc-Andr=C3=A9 Lureau wrote:
>> Use a CONFDIR variable to show the configured sysconf path in the
>> generated documentations (html, man pages etc).
>>
>> Related to:
>> https://bugzilla.redhat.com/show_bug.cgi?id=3D1644985
>>
>> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>=20
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>=20
>> ---
>>  Makefile     | 9 ++++++---
>>  qemu-ga.texi | 4 ++--
>>  2 files changed, 8 insertions(+), 5 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 9cc4dae1a6..a39c231d1c 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -932,11 +932,14 @@ ui/shader.o: $(SRC_PATH)/ui/shader.c \
>>  MAKEINFO=3Dmakeinfo
>>  MAKEINFOINCLUDES=3D -I docs -I $(<D) -I $(@D)
>>  MAKEINFOFLAGS=3D--no-split --number-sections $(MAKEINFOINCLUDES)
>> -TEXI2PODFLAGS=3D$(MAKEINFOINCLUDES) "-DVERSION=3D$(VERSION)"
>> +TEXI2PODFLAGS=3D$(MAKEINFOINCLUDES) -DVERSION=3D"$(VERSION)" -DCONFDI=
R=3D"$(qemu_confdir)"
>>  TEXI2PDFFLAGS=3D$(if $(V),,--quiet) -I $(SRC_PATH) $(MAKEINFOINCLUDES=
)
>> =20
>> -docs/version.texi: $(SRC_PATH)/VERSION
>> -	$(call quiet-command,echo "@set VERSION $(VERSION)" > $@,"GEN","$@")
>> +docs/version.texi: $(SRC_PATH)/VERSION config-host.mak
>> +	$(call quiet-command,(\
>> +		echo "@set VERSION $(VERSION)" && \
>> +		echo "@set CONFDIR $(qemu_confdir)" \
>> +	)> $@,"GEN","$@")
>> =20
>>  %.html: %.texi docs/version.texi
>>  	$(call quiet-command,LC_ALL=3DC $(MAKEINFO) $(MAKEINFOFLAGS) --no-he=
aders \
>> diff --git a/qemu-ga.texi b/qemu-ga.texi
>> index 4c7a8fd163..f00ad830f2 100644
>> --- a/qemu-ga.texi
>> +++ b/qemu-ga.texi
>> @@ -30,7 +30,7 @@ set user's password
>>  @end itemize
>> =20
>>  qemu-ga will read a system configuration file on startup (located at
>> -@file{/etc/qemu/qemu-ga.conf} by default), then parse remaining
>> +@file{@value{CONFDIR}/qemu-ga.conf} by default), then parse remaining
>>  configuration options on the command line. For the same key, the last
>>  option wins, but the lists accumulate (see below for configuration
>>  file format).
>> @@ -58,7 +58,7 @@ file format).
>>    Enable fsfreeze hook. Accepts an optional argument that specifies
>>    script to run on freeze/thaw. Script will be called with
>>    'freeze'/'thaw' arguments accordingly (default is
>> -  @samp{/etc/qemu/fsfreeze-hook}). If using -F with an argument, do
>> +  @samp{@value{CONFDIR}/fsfreeze-hook}). If using -F with an argument=
, do
>>    not follow -F with a space (for example:
>>    @samp{-F/var/run/fsfreezehook.sh}).

Ping^2

I think this could also go via qemu-trivial...?

 Thomas

