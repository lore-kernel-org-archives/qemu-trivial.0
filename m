Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1gmeS8-0000xQ-Sa
	for mharc-qemu-trivial@gnu.org; Thu, 24 Jan 2019 07:49:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44126)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gmeS5-0000vX-Dj
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 07:49:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1gmeRz-0000qR-Mk
	for qemu-trivial@nongnu.org; Thu, 24 Jan 2019 07:49:45 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:51709)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>)
	id 1gmeRv-0000nM-5d; Thu, 24 Jan 2019 07:49:39 -0500
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1N3bCH-1hDE1M2ccd-010ZJK; Thu, 24 Jan 2019 13:49:27 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, qemu-trivial@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Date: Thu, 24 Jan 2019 13:49:01 +0100
Message-Id: <20190124124906.16653-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+nnfhH4jxdvUi6kq1hO/OZygSejVPDO+QLy5ZEhHDr0mfCOB2EO
	JneGn9dyhclpqo/tg9QYAf3tRX8gzyD6iKcSiygdmK3s8GjSoDv2Z9iDZ/++Ukqs0bGsuYU
	lRrR127wnxaCqFeaKNBm8a9EeMLvNdi0gxiw3k5KSqSbAv/NqE6eq6s/io2JyTZvB17G1yN
	9lXDOYda5ewbp02QtAEnQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t3BhWdZoKkQ=:dtcyCJagILSCcpmYW/a2kU
	xKiE6LFsFd3hFtxcOSnWK2as1zRMz0AMJFz+14X1B7hT4MLDVUB6SfsVCYumWICC7m6i9WC2h
	M2Pe/8vFmLmklqiZaGSctcWxREqCYKQvKzGsW6Hy+TAOUpULQ7hihsd2z+V+hv8ZO6TyAT+2c
	g7A9yV6g0jj8S9dfXRe2zsR83/qPu9SM5jO5LC9mUTeVM4MS+eD/PlG6mUWLkwFgOeTg1lbxW
	ipBv10zExd+GBoPRopLcCZhZQcvimRME0Sh+YtxyxfUVaCjodNfEKAjIDJd+y4F2dpYxNapKh
	K3RUhZJj6pl7Rdh2V813mcsSf8GdzTTwHHjwd6fgkuoMdHWmz1tmVQFdDjp6J3n96FDNtFl5+
	tgr5D/hJrOMRKH4DHgJ8tp+uk7YkIPcKRIvzdmMimaqcwPi/wWPxul8xuHYzsjVWl/asWv60U
	GMI4dpSRtBSEg4bz07eb5zVXGK57//GSHfhkUhbajMbKkKWajPzJF2aNVCNcm+cFV9/SaMZ22
	9+xLT/rex0HyFP5p1vJ4T/0N3zF/wBZSQGxcsLKivhO78tZ73mr1Ka65aHHre8irsE0iF1inQ
	XdVfdTxY5qEOrOwMgdQHXdgVpi5JRE/c3qtS3uUaUanHXY+q4JIvj6woYZ5cGGL3aA8E5TecA
	E6Jsbo8GhlRQVRN0S5LKCs0kZpTrc2IG1HoRmBbqbLrbgnqXFgmwrfn5iSIv1MFrZUpVSEwhv
	iVhpgqBH8BgnLrhwOEymo5ReRS8kSWnAm2m4TJLv0yWFHTZL9IQF0XzPRF4=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.10
Subject: [Qemu-trivial] [PULL 0/5] Trivial patches patches
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
X-List-Received-Date: Thu, 24 Jan 2019 12:49:50 -0000

The following changes since commit 6d809e7da943bb4b95b408fbf3d80d097c0f7d38:

  Merge remote-tracking branch 'remotes/xtensa/tags/20190122-xtensa' into staging (2019-01-23 21:50:49 +0000)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-patches-pull-request

for you to fetch changes up to 285816d76f37c412f391fa14a2b28a35b7cb134e:

  hw/i386/pc.c: fix one typo in function name (2019-01-24 13:34:20 +0100)

----------------------------------------------------------------
- Some typo and UTF-8 fixes
- a ppc e6500 fix to remove duplicate SPR registering

----------------------------------------------------------------

Jon Diekema (1):
  ppc: e6500 registers SPR 604 twice

Philippe Mathieu-Daudé (3):
  MAINTAINERS: Fix utf-8 mangling
  contrib/gitdm: Fix a typo
  virtio-net: Fix a typo

Wei Yang (1):
  hw/i386/pc.c: fix one typo in function name

 MAINTAINERS                     | 2 +-
 contrib/gitdm/filetypes.txt     | 2 +-
 hw/i386/pc.c                    | 4 ++--
 include/hw/virtio/virtio-net.h  | 2 +-
 target/ppc/translate_init.inc.c | 8 --------
 5 files changed, 5 insertions(+), 13 deletions(-)

-- 
2.20.1


