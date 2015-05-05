Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1Ypa69-0001BH-MW
	for mharc-qemu-trivial@gnu.org; Tue, 05 May 2015 06:29:09 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38080)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Ypa66-00014U-BY
	for qemu-trivial@nongnu.org; Tue, 05 May 2015 06:29:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1Ypa65-0004v6-BB
	for qemu-trivial@nongnu.org; Tue, 05 May 2015 06:29:06 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39596)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>)
	id 1Ypa65-0004up-3K; Tue, 05 May 2015 06:29:05 -0400
Received: from int-mx09.intmail.prod.int.phx2.redhat.com
	(int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	by mx1.redhat.com (8.14.4/8.14.4) with ESMTP id t45AT0OE027919
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=FAIL); Tue, 5 May 2015 06:29:01 -0400
Received: from [10.36.112.84] (ovpn-112-84.ams2.redhat.com [10.36.112.84])
	by int-mx09.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP
	id t45ASuIR016753
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 5 May 2015 06:28:58 -0400
Message-ID: <55489B67.1070007@redhat.com>
Date: Tue, 05 May 2015 12:28:55 +0200
From: Paolo Bonzini <pbonzini@redhat.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Emilio G. Cota" <cota@braap.org>, Peter Maydell <peter.maydell@linaro.org>
References: <20150430222138.GA9389@flamenco>
In-Reply-To: <20150430222138.GA9389@flamenco>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.68 on 10.5.11.22
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 209.132.183.28
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Stefan Weil <sw@weilnetz.de>,
	Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Tokarev <mjt@tls.msk.ru>, QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-trivial] [PATCH] tests: consolidate common includes under
	libqtest.h
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
	<mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 05 May 2015 10:29:07 -0000

On 01/05/2015 00:21, Emilio G. Cota wrote:
> Something like the appended?
> 
> Cheers,
> 
> 		Emilio

Pretty good, but I wouldn't use qemu-common.h, at least not until all
the function and macro declarations are moved to separate headers (some
of them may indeed move to osdep.h, in fact).

Paolo

> commit eb415d0695bb49d9df78aedaf4ed3c7083a1a574
> Author: Emilio G. Cota <cota@braap.org>
> Date:   Thu Apr 30 18:00:01 2015 -0400
> 
>     tests: consolidate common includes under libqtest.h
>     
>     Source files in tests/ include very common headers,
>     such as glib.h or qemu/osdep.h.
>     
>     Consolidate these includes by including qemu-common.h from
>     libqtest.h, which is a common include in tests/.
>     
>     Two things worth mentioning:
>     
>     - i440fx-test drops its ARRAY_SIZE definition, which comes now
>       from osdep.h via qemu-common.h.
>     
>     - vhost-user-test.c does keep its include of glib.h, since
>       it has to do some contortions to support old glib versions.
>       See commit "bd95939f qtest: fix qtest for vhost-user".
>     
>     Signed-off-by: Emilio G. Cota <cota@braap.org>

