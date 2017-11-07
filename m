Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1eCA8x-0001gY-Ty
	for mharc-qemu-trivial@gnu.org; Tue, 07 Nov 2017 15:06:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51128)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <voipio@kos.to>) id 1eCA8v-0001f6-AA
	for qemu-trivial@nongnu.org; Tue, 07 Nov 2017 15:06:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <voipio@kos.to>) id 1eCA8u-00034h-EX
	for qemu-trivial@nongnu.org; Tue, 07 Nov 2017 15:06:41 -0500
Received: from jessie.kos.to ([212.47.231.226]:58024 helo=pilvi.kos.to)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <voipio@kos.to>)
	id 1eCA8q-000336-23; Tue, 07 Nov 2017 15:06:36 -0500
Received: from kos.to (jessie.kos.to [212.47.231.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by pilvi.kos.to (Postfix) with ESMTPSA id 8FDC52C19A4;
	Tue,  7 Nov 2017 20:06:34 +0000 (UTC)
Received: (nullmailer pid 27933 invoked by uid 1000);
	Tue, 07 Nov 2017 20:06:34 -0000
Date: Tue, 7 Nov 2017 20:06:34 +0000
From: Riku Voipio <riku.voipio@iki.fi>
To: Zach Riggle <zachriggle@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Eric Blake <eblake@redhat.com>,
	QEMU Trivial <qemu-trivial@nongnu.org>, Laurent Vivier <laurent@vivier.eu>,
	"open list:All patches CC here" <qemu-devel@nongnu.org>
Message-ID: <20171107200634.GB27631@kos.to>
References: <20171024230758.31779-1-riggle@google.com>
	<20171025033442.44872-1-zachriggle@gmail.com>
	<CAMP9c5=whCgR4qkOPDRKZ+adpWEPiVM=BwZp_r7qCAR7UAsWAQ@mail.gmail.com>
	<20171027093600.GA29513@kos.to>
	<CAMP9c5mm7icy06goXr3iiOEgqPbzyaWDt775+9+L=oxnqwRhpA@mail.gmail.com>
	<CAMP9c5kTQmKd7GVE8DZzvY8tTtWV=tLsgV1ptWPKhEAh=J-maQ@mail.gmail.com>
	<2251f54e-4c55-7495-8f60-af40cdd80594@redhat.com>
	<CAFEAcA-r-KxNDkHFJEdQDVnNXf4N-8zptjQK9a-uPixnSMsg+w@mail.gmail.com>
	<CAMP9c5krrvH-TpH0mM1D3Fm8=E+C7nYHU8h3b5CwU1Nb2HxN-A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMP9c5krrvH-TpH0mM1D3Fm8=E+C7nYHU8h3b5CwU1Nb2HxN-A@mail.gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 212.47.231.226
Subject: Re: [Qemu-trivial] [Qemu-devel] [PATCH v2] linux-user: fix
 is_proc_myself to check the paths via realpath
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
X-List-Received-Date: Tue, 07 Nov 2017 20:06:42 -0000

Hi,

On Mon, Nov 06, 2017 at 08:17:44PM +0000, Zach Riggle wrote:
> Ping! What needs to be done to move this forward? My current implementation
> is compatible with musl.

I'll have a look at it soon.

Riku

> On Thu, Nov 2, 2017 at 12:36 PM Peter Maydell <peter.maydell@linaro.org>
> wrote:
> 
> > On 28 October 2017 at 06:14, Eric Blake <eblake@redhat.com> wrote:
> > > By definition, in linux-user, we ARE using glibc; therefore, you are
> > > free to use all GNU extensions.
> >
> > Don't we also support musl libc? I forget...
> >
> > thanks
> > -- PMM
> >

