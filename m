Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dvSIP-0006F0-A2
	for mharc-qemu-trivial@gnu.org; Fri, 22 Sep 2017 14:03:25 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48284)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1dvSIN-0006DI-0H
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 14:03:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jsnow@redhat.com>) id 1dvSIM-0008NG-7Q
	for qemu-trivial@nongnu.org; Fri, 22 Sep 2017 14:03:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55804)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jsnow@redhat.com>)
	id 1dvSIF-0008L5-Vv; Fri, 22 Sep 2017 14:03:16 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
	[10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 4B7FA2AD63;
	Fri, 22 Sep 2017 18:03:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mx1.redhat.com 4B7FA2AD63
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	dmarc=none (p=none dis=none) header.from=redhat.com
Authentication-Results: ext-mx10.extmail.prod.ext.phx2.redhat.com;
	spf=fail smtp.mailfrom=jsnow@redhat.com
Received: from [10.18.17.130] (dhcp-17-130.bos.redhat.com [10.18.17.130])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5645063F76;
	Fri, 22 Sep 2017 18:03:13 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-trivial@nongnu.org, qemu-block@nongnu.org, qemu-devel@nongnu.org
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-14-f4bug@amsat.org>
From: John Snow <jsnow@redhat.com>
Message-ID: <b2b308a2-f32c-b200-dfb6-404d7f143b8d@redhat.com>
Date: Fri, 22 Sep 2017 14:03:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170922154014.29350-14-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Fri, 22 Sep 2017 18:03:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH 13/34] hw/ide: remove old
 i386 dependency
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
X-List-Received-Date: Fri, 22 Sep 2017 18:03:24 -0000



On 09/22/2017 11:39 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> and remove a duplicated include
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Acked-by: John Snow <jsnow@redhat.com>

