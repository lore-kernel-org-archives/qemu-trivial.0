Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1d8B70-0001ow-4X
	for mharc-qemu-trivial@gnu.org; Tue, 09 May 2017 15:47:58 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59185)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1d8B6v-0001lC-TQ
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 15:47:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@gmail.com>) id 1d8B6u-000372-9S
	for qemu-trivial@nongnu.org; Tue, 09 May 2017 15:47:53 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:35814)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <stefanha@gmail.com>)
	id 1d8B6o-0002zD-RL; Tue, 09 May 2017 15:47:46 -0400
Received: by mail-qt0-x243.google.com with SMTP id r58so1359427qtb.2;
	Tue, 09 May 2017 12:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+qtPmwZB/SEj0GNzyHr7dLM01z5cvBc8Ssc9p8w/OSY=;
	b=gjTKcyTFs4+1Zj08qUNDMdeXdMjYl7jP7uS0forVd8CZRkCSE0dNph2D9Vy/DSXqzP
	JAJnVDlSdsZymvBkzUzjH/OOOlwJFBJGZE1yV3BmbAISrcrt5J43bKgmhoO0PjVim+yh
	3cAMGsMpesXPYoi6K/MK9JeNyd249qqQZbWFJaI/Cr4pafpud9IDrXHu/ybt+Yu0wX2d
	49FAai1yfsEfHVaQQi3fh2Pm8QN/299iG4kAyirMDEUrj/bJ8FsYY1YgA4TttrnCBtZ6
	0EjradTjPr6wpqIT86xY8sDi2rbcchc4JgDkhDkM4QMLobrJhiWg/NsEt0wg2gVAcKe9
	IzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+qtPmwZB/SEj0GNzyHr7dLM01z5cvBc8Ssc9p8w/OSY=;
	b=mwWXWkA1qvTf51OhPEPEXCLgJxBr2fe/ZTx8GvtROtVYKY/e73LxLggdJQYE7R3juQ
	phWSyzBgbXPIs5SfnrRl56cpSQi9XIPBERYH1NnoQ8pMWUJ7KlOS0Q4irjUWclDHG+nG
	YCZMC55HXT0RUK1sTktbzypZQXD5kpVfLDwJ4GM1yW/9wgde/Le+lYZ1Xxsvqa1uw3id
	5gy/ZtdulxvYeubibUhCHhi6TxfHNV4G1fK2ltTqB4RVbD6mQiRVEbC34pzGBbhR/6rI
	SSCwf6Epey8xcnzC2XGuz7HBcBMRn5lJQQo7zvlPQQnsS92v+a7q2fDcrI4CvIWMfv8k
	jtGA==
X-Gm-Message-State: AODbwcCEySI5yC5hhvBLaml3/5gfF/xTRNWyZAXtxJatEdL0jmJKXcac
	oCASYkIPKZTVrDHs+xE=
X-Received: by 10.237.53.205 with SMTP id d13mr1965959qte.149.1494359265672;
	Tue, 09 May 2017 12:47:45 -0700 (PDT)
Received: from localhost (nat-pool-bos-t.redhat.com. [66.187.233.206])
	by smtp.gmail.com with ESMTPSA id j14sm623009qtj.51.2017.05.09.12.47.44
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 09 May 2017 12:47:44 -0700 (PDT)
Date: Tue, 9 May 2017 15:47:43 -0400
From: Stefan Hajnoczi <stefanha@gmail.com>
To: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org
Message-ID: <20170509194743.GB3444@stefanha-x1.localdomain>
References: <cover.1494140527.git.mjt@msgid.tls.msk.ru>
	<20170508173031.GK22428@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="1LKvkjL3sHcu1TtY"
Content-Disposition: inline
In-Reply-To: <20170508173031.GK22428@stefanha-x1.localdomain>
User-Agent: Mutt/1.8.0 (2017-02-23)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: Re: [Qemu-trivial] [Qemu-devel] [PULL 00/23] Trivial patches for
 2017-05-07
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
X-List-Received-Date: Tue, 09 May 2017 19:47:55 -0000


--1LKvkjL3sHcu1TtY
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2017 at 01:30:31PM -0400, Stefan Hajnoczi wrote:
> On Sun, May 07, 2017 at 10:02:03AM +0300, Michael Tokarev wrote:
> > The following changes since commit 12a95f320a36ef66f724a49bb05e4fb553ac=
5dbe:
> >=20
> >   Merge remote-tracking branch 'kwolf/tags/for-upstream' into staging (=
2017-05-04 13:44:32 +0100)
> >=20
> > are available in the git repository at:
> >=20
> >   git://git.corpit.ru/qemu.git tags/trivial-patches-fetch
> >=20
> > for you to fetch changes up to 311875781e549af91a3216d34c6ef40420bab435:
> >=20
> >   tests: Remove redundant assignment (2017-05-07 09:57:51 +0300)
> >=20
> > ----------------------------------------------------------------
> > trivial patches for 2017-05-07
> >=20
> > ----------------------------------------------------------------
> > Andreas Grapentin (1):
> >       use _Static_assert in QEMU_BUILD_BUG_ON
> >=20
> > Chris Webb (1):
> >       virtfs: allow a device id to be specified in the -virtfs option
> >=20
> > Craig Jellick (1):
> >       Add 'none' as type for drive's if option
> >=20
> > Eric Blake (2):
> >       tests: Ignore more test executables
> >       tests: Ignore another built executable (test-hmp)
> >=20
> > Fam Zheng (3):
> >       block: Make 'replication_state' an enum
> >       virtio-blk: Remove useless condition around g_free()
> >       tests: Remove redundant assignment
> >=20
> > Ishani Chugh (1):
> >       Remove reduntant qemu: from error functions
> >=20
> > KONRAD Frederic (1):
> >       ppc_booke: drop useless assignment
> >=20
> > Kamil Rytarowski (2):
> >       scripts/qemu-binfmt-conf.sh: Fix shell portability issue
> >       scripts: Switch to more portable Perl shebang
> >=20
> > Marc-Andr=E9 Lureau (1):
> >       doc: fix function spelling
> >=20
> > Paolo Bonzini (3):
> >       jazz_led: fix bad snprintf
> >       MAINTAINERS: Update paths for main loop
> >       MAINTAINERS: Update paths for AioContext implementation
> >=20
> > Philippe Mathieu-Daud=E9 (3):
> >       usb-ccid: make ccid_write_data_block() cope with null buffers
> >       device_tree: fix compiler warnings (clang 5)
> >       qga: fix compiler warnings (clang 5)
> >=20
> > Saurav Sachidanand (1):
> >       util: Use g_malloc/g_free in envlist.c
> >=20
> > Thomas Huth (2):
> >       qemu-doc: Fix broken URLs of amnhltm.zip and dosidle210.zip
> >       hw/core/generic-loader: Fix crash when running without CPU
> >=20
> > sochin.jiang fix wrong parameter comments in channel-file.h (1):
> >       channel-file: fix wrong parameter comments
> >=20
> >  MAINTAINERS                     |  8 +++----
> >  block/replication.c             | 44 +++++++++++++++++++--------------=
-----
> >  bsd-user/main.c                 | 14 ++++--------
> >  configure                       | 18 ++++++++++++++++
> >  device_tree.c                   |  1 +
> >  hw/block/virtio-blk.c           |  4 +---
> >  hw/core/generic-loader.c        |  9 ++++----
> >  hw/display/jazz_led.c           |  4 ++--
> >  hw/microblaze/boot.c            |  2 +-
> >  hw/nios2/boot.c                 |  2 +-
> >  hw/ppc/pnv.c                    |  2 +-
> >  hw/ppc/ppc_booke.c              |  1 -
> >  hw/s390x/sclp.c                 |  4 ++--
> >  hw/tricore/tricore_testboard.c  |  2 +-
> >  hw/usb/dev-smartcard-reader.c   |  5 ++++-
> >  include/io/channel-file.h       |  2 +-
> >  include/io/channel.h            |  2 +-
> >  include/qemu/compiler.h         |  4 +++-
> >  linux-user/main.c               |  9 +++-----
> >  numa.c                          |  4 ++--
> >  qemu-doc.texi                   | 10 ++++-----
> >  qemu-options.hx                 |  4 ++--
> >  qga/commands-posix.c            |  8 ++++---
> >  scripts/checkpatch.pl           |  3 ++-
> >  scripts/clean-header-guards.pl  |  3 ++-
> >  scripts/cleanup-trace-events.pl |  2 +-
> >  scripts/disas-objdump.pl        |  4 +++-
> >  scripts/get_maintainer.pl       |  3 ++-
> >  scripts/qemu-binfmt-conf.sh     |  4 ++--
> >  scripts/shaderinclude.pl        |  2 +-
> >  scripts/switch-timer-api        |  2 +-
> >  scripts/texi2pod.pl             |  4 +++-
> >  tests/.gitignore                |  4 ++++
> >  tests/postcopy-test.c           |  2 +-
> >  util/envlist.c                  | 47 +++++++++++++++++----------------=
--------
> >  vl.c                            |  5 +++--
> >  36 files changed, 133 insertions(+), 115 deletions(-)
> >=20
>=20
> Thanks, applied to my staging tree:
> https://github.com/stefanha/qemu/commits/staging

Dropped for now, please see my reply to "channel-file: fix wrong parameter =
comments".

--1LKvkjL3sHcu1TtY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEcBAEBAgAGBQJZEhzfAAoJEJykq7OBq3PI1QUIAIDVWdKKPmFPUEJNU3I/FHYM
3U1nffhboQR+G78Bpovc+7YbeAoRgTQipjUPov6Ld8WsyALrEMouCBqOHLABHw5d
OWqt2S1emv/oMsW0T1QY37HPESZ8vs+28VEbMlFFvgCgkvvqDntuiCkE9jSilgrx
wRQ/ZRD18uhgkUHRMqNHWunr88oLPO2y92c14I3Dun/2oycji5P6vEkZnpSaEc1B
gtplh9XACKHvbNqTRk67rVxsPRnvuqGbW1kbNcTK2AtY1ORmeAlSvocfo8xuSZ61
r317n2Ue8yCBw8moLVWo9DNXVSnEcfJRxUubZ2SwdnZmCrpiSCLGxkxXZO5trJk=
=bm1z
-----END PGP SIGNATURE-----

--1LKvkjL3sHcu1TtY--

