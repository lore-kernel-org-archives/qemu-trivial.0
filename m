Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dfk43-00047h-7N
	for mharc-qemu-trivial@gnu.org; Thu, 10 Aug 2017 05:47:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58258)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dfk40-00045p-LZ
	for qemu-trivial@nongnu.org; Thu, 10 Aug 2017 05:47:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1dfk3z-0002b3-Fb
	for qemu-trivial@nongnu.org; Thu, 10 Aug 2017 05:47:36 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38128)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>)
	id 1dfk3u-0002YX-KY; Thu, 10 Aug 2017 05:47:30 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
	[10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4ECB340253;
	Thu, 10 Aug 2017 09:47:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4ECB340253
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx01.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=pbonzini@redhat.com
Received: from [10.36.117.162] (ovpn-117-162.ams2.redhat.com [10.36.117.162])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 08186A0D39;
	Thu, 10 Aug 2017 09:47:23 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	Eric Blake <eblake@redhat.com>, Fam Zheng <famz@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, Richard Henderson <rth@twiddle.net>, 
	QEMU Trivial <qemu-trivial@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20170728053610.15770-1-f4bug@amsat.org>
	<20170728053610.15770-19-f4bug@amsat.org> <87mv7aumav.fsf@linaro.org>
	<8e2e3aa5-4459-76ba-3309-af6b30220346@amsat.org>
	<87fud0vmak.fsf@linaro.org>
	<3e66742f-04c5-51b7-de3a-f692c0637bc5@amsat.org>
	<CAFEAcA80HQXTgLUUb4LjM+Vw=7ZTj09rbCsiyvC07GN+NywM_g@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <91e62cd2-947b-5c7b-3371-b1d116710fc7@redhat.com>
Date: Thu, 10 Aug 2017 11:47:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA80HQXTgLUUb4LjM+Vw=7ZTj09rbCsiyvC07GN+NywM_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 10 Aug 2017 09:47:29 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 18/47] MAINTAINERS: add
 missing TCG entry
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
X-List-Received-Date: Thu, 10 Aug 2017 09:47:38 -0000

On 10/08/2017 11:35, Peter Maydell wrote:
>> actual default for un-matched: "recent contributors" + qemu-devel@
>>
>>   $ ./scripts/get_maintainer.pl -f disas.c
>>   get_maintainer.pl: No maintainers found, printing recent contributor=
s.
>>   get_maintainer.pl: Do not blindly cc: them on patches!  Use common s=
ense.
>>   Peter Maydell <peter.maydell@linaro.org> (commit_signer:2/3=3D67%)
>>   Richard Henderson <rth@twiddle.net> (commit_signer:1/3=3D33%)
>>   Thomas Huth <thuth@redhat.com> (commit_signer:1/3=3D33%)
>>   Michael Tokarev <mjt@tls.msk.ru> (commit_signer:1/3=3D33%)
>>   Julian Brown <julian@codesourcery.com> (commit_signer:1/3=3D33%)
>>   qemu-devel@nongnu.org (open list:All patches CC here)
>>
>> I find the un-matched "recent contributors" list often confuse, due to=
 files
>> being moved, header updated, checkpatch indented.
>=20
> Yes, the recent-contributors list is often unhelpful, which
> is partly why the script warns about them. We might perhaps
> switch the default to --no-git-fallback".

Note that if a patch touches both maintained and unmaintained files, the
recent contributors list is omitted:

    $ scripts/get_maintainer.pl -f util/cutils.c hw/ide/core.c
    John Snow <jsnow@redhat.com> (supporter:IDE)
    qemu-devel@nongnu.org (open list:All patches CC here)
    qemu-block@nongnu.org (open list:IDE)

"--no-git-fallback" is probably the right thing to do when sending a
patch series.  The maintainer that shepherds the series will take care
of unmaintained files too.

However, when sending a single patch to an unmaintained file the
contributors list usually does get the patch to the inbox of a
maintainer.  This increases the odds of getting someone's attention.
Because inexperienced contributors usually don't send large series, my
feeling is that overall "--git-fallback"'s advantage are more than the
disadvantages, especially with the above logic that was introduced in
commit c6561586f0 ("get_maintainer.pl: restrict cases where it falls
back to --git", 2014-10-23).

Paolo

