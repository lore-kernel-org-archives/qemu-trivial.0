Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1dWpy0-0003Dp-FS
	for mharc-qemu-trivial@gnu.org; Sun, 16 Jul 2017 16:16:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44001)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <amit@kernel.org>) id 1dWpUN-0006XM-4P
	for qemu-trivial@nongnu.org; Sun, 16 Jul 2017 15:46:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <amit@kernel.org>) id 1dWpUM-00058g-CU
	for qemu-trivial@nongnu.org; Sun, 16 Jul 2017 15:45:59 -0400
Received: from relay2-d.mail.gandi.net ([2001:4b98:c:538::194]:50455)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <amit@kernel.org>)
	id 1dWpUK-00054V-3G; Sun, 16 Jul 2017 15:45:56 -0400
Received: from localhost (unknown
	[IPv6:2a02:810a:8c00:5f45:b976:413b:5d97:c951])
	(Authenticated sender: amit@amitshah.net)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 8133FC5A44;
	Sun, 16 Jul 2017 21:45:51 +0200 (CEST)
Date: Sun, 16 Jul 2017 21:45:50 +0200
From: Amit Shah <amit@kernel.org>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org,
	peter.maydell@linaro.org, Amit Shah <amit@kernel.org>,
	"Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20170716194550.GB2964@grmbl.mre>
References: <20170713163219.9024-1-marcandre.lureau@redhat.com>
	<20170713163219.9024-18-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170713163219.9024-18-marcandre.lureau@redhat.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2001:4b98:c:538::194
X-Mailman-Approved-At: Sun, 16 Jul 2017 16:16:35 -0400
Subject: Re: [Qemu-trivial] [PATCH v2 17/29] virtio-serial: use DIV_ROUND_UP
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
X-List-Received-Date: Sun, 16 Jul 2017 19:46:00 -0000

On (Thu) 13 Jul 2017 [18:32:07], Marc-André Lureau wrote:
> I used the clang-tidy qemu-round check to generate the fix:
> https://github.com/elmarco/clang-tools-extra
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: Amit Shah <amit@kernel.org>

		Amit
-- 
http://log.amitshah.net/

