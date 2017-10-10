Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1e23cg-0000Zh-GX
	for mharc-qemu-trivial@gnu.org; Tue, 10 Oct 2017 19:07:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <prvs=449813866=anthony.perard@citrix.com>)
	id 1e23cd-0000YB-PZ
	for qemu-trivial@nongnu.org; Tue, 10 Oct 2017 19:07:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <prvs=449813866=anthony.perard@citrix.com>)
	id 1e23cc-0003KQ-WE
	for qemu-trivial@nongnu.org; Tue, 10 Oct 2017 19:07:35 -0400
Received: from smtp.citrix.com ([66.165.176.89]:55999)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_ARCFOUR_SHA1:16) (Exim 4.71)
	(envelope-from <prvs=449813866=anthony.perard@citrix.com>)
	id 1e23cZ-0003Iy-16; Tue, 10 Oct 2017 19:07:31 -0400
X-IronPort-AV: E=Sophos;i="5.43,359,1503360000"; d="scan'208";a="445261580"
Date: Tue, 10 Oct 2017 16:37:10 +0100
From: Anthony PERARD <anthony.perard@citrix.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
CC: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite
	<crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>,
	"Stefano Stabellini" <sstabellini@kernel.org>,
	Eduardo Habkost <ehabkost@redhat.com>, 
	Marcel Apfelbaum <marcel@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Christian Borntraeger <borntraeger@de.ibm.com>, Alexander Graf
	<agraf@suse.de>, Stafford Horne <shorne@gmail.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>, "Daniel
	P. Berrange" <berrange@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
	<qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <qemu-trivial@nongnu.org>
Message-ID: <20171010153710.GL1771@perard.uk.xensource.com>
References: <20170922154014.29350-1-f4bug@amsat.org>
	<20170922154014.29350-6-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170922154014.29350-6-f4bug@amsat.org>
User-Agent: Mutt/1.9.1 (2017-09-22)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 66.165.176.89
Subject: Re: [Qemu-trivial] [PATCH 05/34] misc: remove duplicated includes
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
X-List-Received-Date: Tue, 10 Oct 2017 23:07:36 -0000

On Fri, Sep 22, 2017 at 12:39:45PM -0300, Philippe Mathieu-Daudé wrote:
> exec: housekeeping (funny since 02d0e095031)
> 
> applied using ./scripts/clean-includes
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  accel/tcg/translate-all.c          | 1 -
>  exec.c                             | 3 ---
>  hw/arm/spitz.c                     | 1 -
>  hw/char/xen_console.c              | 1 -
>  hw/core/machine.c                  | 1 -
>  hw/s390x/css.c                     | 1 -
>  target/openrisc/exception_helper.c | 1 -
>  tests/vhost-user-test.c            | 1 -
>  util/qemu-sockets.c                | 1 -
>  vl.c                               | 1 -
>  10 files changed, 12 deletions(-)
> 

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

-- 
Anthony PERARD

