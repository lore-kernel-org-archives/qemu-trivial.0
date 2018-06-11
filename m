Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1fSQ0h-00072C-HJ
	for mharc-qemu-trivial@gnu.org; Mon, 11 Jun 2018 12:49:39 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45353)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1fSQ0g-00070z-3c
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 12:49:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alex.williamson@redhat.com>) id 1fSQ0f-0005BJ-CJ
	for qemu-trivial@nongnu.org; Mon, 11 Jun 2018 12:49:38 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47210)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <alex.williamson@redhat.com>)
	id 1fSQ0X-00051T-Br; Mon, 11 Jun 2018 12:49:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 45DE55F7A6;
	Mon, 11 Jun 2018 16:49:28 +0000 (UTC)
Received: from w520.home (ovpn-116-135.phx2.redhat.com [10.3.116.135])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 67D7B1813F;
	Mon, 11 Jun 2018 16:49:13 +0000 (UTC)
Date: Mon, 11 Jun 2018 10:49:12 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, QEMU Trivial
	<qemu-trivial@nongnu.org>, "patches@linaro.org" <patches@linaro.org>,
	Richard Henderson <rth@twiddle.net>, John Snow <jsnow@redhat.com>, Philippe
	=?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>, Thomas Huth
	<thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>, Markus Armbruster
	<armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf
	<kwolf@redhat.com>
Message-ID: <20180611104912.2f23fed0@w520.home>
In-Reply-To: <CAFEAcA_Y5zkoiSyHfuvnhSUPOc44fpGj7j373Rz2+Gf0yGF6sQ@mail.gmail.com>
References: <20180611141716.3813-1-peter.maydell@linaro.org>
	<20180611101551.2f656715@w520.home>
	<CAFEAcA_Y5zkoiSyHfuvnhSUPOc44fpGj7j373Rz2+Gf0yGF6sQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 11 Jun 2018 16:49:28 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-trivial] [PATCH v2] CODING_STYLE: Define our preferred
 form for multiline comments
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
X-List-Received-Date: Mon, 11 Jun 2018 16:49:39 -0000

On Mon, 11 Jun 2018 17:40:35 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On 11 June 2018 at 17:15, Alex Williamson <alex.williamson@redhat.com> wrote:
> > Much preferred, thanks  (tabs next? ;)  
> 
> CODING_STYLE already mandates spaces-only, no-tabs...

That was a joke, note the smiley.  I know, I just don't like it.
Thanks,

Alex

