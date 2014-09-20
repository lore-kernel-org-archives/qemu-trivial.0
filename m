Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1XVL6z-0004oU-Ma
	for mharc-qemu-trivial@gnu.org; Sat, 20 Sep 2014 09:54:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47739)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVL6s-0004cj-0s
	for qemu-trivial@nongnu.org; Sat, 20 Sep 2014 09:54:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1XVL6l-0002Mo-SW
	for qemu-trivial@nongnu.org; Sat, 20 Sep 2014 09:53:57 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:38081)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1XVL6Z-0002JG-5Z; Sat, 20 Sep 2014 09:53:39 -0400
Received: from [192.168.88.2] (mjt.vpn.tls.msk.ru [192.168.177.99])
	by isrv.corpit.ru (Postfix) with ESMTP id 9DC8945930;
	Sat, 20 Sep 2014 17:53:32 +0400 (MSK)
Message-ID: <541D86DC.9060701@msgid.tls.msk.ru>
Date: Sat, 20 Sep 2014 17:53:32 +0400
From: Michael Tokarev <mjt@tls.msk.ru>
Organization: Telecom Service, JSC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Icedove/24.7.0
MIME-Version: 1.0
To: Adelina Tuvenie <adelinatuvenie@gmail.com>, qemu-trivial@nongnu.org
References: <1411053464-12666-1-git-send-email-atuvenie@cloudbasesolutions.com>
	<1411053464-12666-2-git-send-email-atuvenie@cloudbasesolutions.com>
In-Reply-To: <1411053464-12666-2-git-send-email-atuvenie@cloudbasesolutions.com>
X-Enigmail-Version: 1.6
OpenPGP: id=804465C5
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 86.62.121.231
Cc: Kevin Wolf <kwolf@redhat.com>,
	Adelina Tuvenie <atuvenie@cloudbasesolutions.com>,
	qemu-devel <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [Qemu-trivial] [PATCH 1/1] qemu-img: Cannot create fixed vhdx
	image
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
X-List-Received-Date: Sat, 20 Sep 2014 13:54:04 -0000

18.09.2014 19:17, Adelina Tuvenie wrote:
> 
> When trying to create a fixed vhd image qemu-img will return the
> following error:
> 
> qemu-img: test.vhdx: Could not create image: Cannot allocate memory
> 
> This happens because of a incorrect check in vhdx.c. Specifficaly,
> in vhdx_create_bat(), after allocating memory for the BAT entry,
> there is a check to determine if the allocation was unsuccsessful.
> The error comes from the fact that it checks if s->bat isn't NULL,
> which is true in case of succsessful allocation,  and exits with
> error ENOMEM.

Applying to -trivial, as it is an obvious trivial one-liner, hopefully
it's okay for kwolf@ and stefanha@.  But please,

 - Cc qemu-devel and the subsystem maintainers (Cc'ed)
 - do not send an "intro" email for single patches
 - do not attach the patch, place it inline if possible

(Since the original patch was in an attachment, I copy it here for
completness:

diff --git a/block/vhdx.c b/block/vhdx.c
index 796b7bd..5bf292e 100644
--- a/block/vhdx.c
+++ b/block/vhdx.c
@@ -1593,7 +1593,7 @@ static int vhdx_create_bat(BlockDriverState *bs, BDRVVHDXState *s,
                 bdrv_has_zero_init(bs) == 0) {
         /* for a fixed file, the default BAT entry is not zero */
         s->bat = g_try_malloc0(length);
-        if (length && s->bat != NULL) {
+        if (length && s->bat == NULL) {
             ret = -ENOMEM;
             goto exit;
         }
)

I also modified the subject line, to read:

  block: allow creation of fixed vhdx images

Thanks,

/mjt

