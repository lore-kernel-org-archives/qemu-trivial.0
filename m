Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dTNms-0006FT-Cv
	for mharc-qemu-trivial@gnu.org; Fri, 07 Jul 2017 03:34:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59839)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1dTNmp-0006E2-Tg
	for qemu-trivial@nongnu.org; Fri, 07 Jul 2017 03:34:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>) id 1dTNml-0002VP-0z
	for qemu-trivial@nongnu.org; Fri, 07 Jul 2017 03:34:47 -0400
Received: from roura.ac.upc.es ([147.83.33.10]:43465)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <vilanova@ac.upc.edu>)
	id 1dTNmk-0002UE-L7; Fri, 07 Jul 2017 03:34:42 -0400
Received: from correu-2.ac.upc.es (correu-2.ac.upc.es [147.83.30.92])
	by roura.ac.upc.es (8.13.8/8.13.8) with ESMTP id v677YZnv012731;
	Fri, 7 Jul 2017 09:34:35 +0200
Received: from localhost (63.red-83-51-187.dynamicip.rima-tde.net
	[83.51.187.63])
	by correu-2.ac.upc.es (Postfix) with ESMTPSA id 085AF948;
	Fri,  7 Jul 2017 09:34:29 +0200 (CEST)
From: =?utf-8?Q?Llu=C3=ADs_Vilanova?= <vilanova@ac.upc.edu>
To: Eric Blake <eblake@redhat.com>
Cc: qemu-devel@nongnu.org, "Emilio G. Cota" <cota@braap.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Michael Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>,
	"open list\:Trivial patches" <qemu-trivial@nongnu.org>
References: <149915701334.6295.1724301929524364123.stgit@frigg.lan>
	<149915849243.6295.4484103824675839071.stgit@frigg.lan>
	<d1a9d3b0-96a3-60e0-270b-3e9ef82cafac@redhat.com>
Mail-Followup-To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
	"Emilio G. Cota" <cota@braap.org>, Eduardo Habkost
	<ehabkost@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, Michael
	Tokarev <mjt@tls.msk.ru>, Laurent Vivier <laurent@vivier.eu>, "open
	list\:Trivial patches" <qemu-trivial@nongnu.org>
Date: Fri, 07 Jul 2017 09:34:24 +0200
In-Reply-To: <d1a9d3b0-96a3-60e0-270b-3e9ef82cafac@redhat.com> (Eric Blake's
	message of "Wed, 5 Jul 2017 16:14:10 -0500")
Message-ID: <87tw2og0ov.fsf@frigg.lan>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/25.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.6.x [fuzzy]
X-Received-From: 147.83.33.10
Subject: Re: [Qemu-trivial] [PATCH v11 6/6] trace: [trivial] Statically
 enable all guest events
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
X-List-Received-Date: Fri, 07 Jul 2017 07:34:48 -0000

Eric Blake writes:

> On 07/04/2017 03:54 AM, Llu=C3=ADs Vilanova wrote:
>> The existing optimizations makes it feasible to have them available on a=
ll
>> builds.

> While this change may feel trivial, I think it is a misnomer to include
> "[trivial]" in the subject line, and I also think it should not go in
> through qemu-trivial.  The ideal trivial patch is one that can be
> applied in isolation, but your patch can only be applied as part of a
> series that includes the earlier optimizations that made this one possibl=
e.

Ok. Does this mean I should send a new series without the trivial tag?


Cheers,
  Lluis

