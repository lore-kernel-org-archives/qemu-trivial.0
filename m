Received: from list by lists.gnu.org with archive (Exim 4.86_2)
	id 1hiI2I-00040A-K3
	for mharc-qemu-trivial@gnu.org; Tue, 02 Jul 2019 08:37:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48740)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <laurent@vivier.eu>) id 1hiI2F-0003xp-GQ
 for qemu-trivial@nongnu.org; Tue, 02 Jul 2019 08:37:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1hiI2E-0000dK-JY
 for qemu-trivial@nongnu.org; Tue, 02 Jul 2019 08:37:23 -0400
Received: from mout.kundenserver.de ([212.227.126.131]:59395)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1hiI2C-0000XR-C6; Tue, 02 Jul 2019 08:37:20 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1Macaw-1iErd03xqU-00c6SQ; Tue, 02 Jul 2019 14:37:17 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-trivial@nongnu.org, Amit Shah <amit@kernel.org>
Date: Tue,  2 Jul 2019 14:37:10 +0200
Message-Id: <20190702123713.14396-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:rWVCyKkBuYTSSJprfohFkj8FG89hgMcnmXadjVMUTFvUQ8TN5zt
 n3NVrrwkzbroVIiRrXzh6//TdRv4ZDLxyVZGQMtVYYqxhHGCRAsw6N8a8Fz5PSh5VNDL23u
 C8minrkn8/cx+SEJOmpUyyZhcyW53PTJuW41SVgdo46Sx75QQdZiQ2etD30mbr1AMEI/tt3
 e8V1x8b4PxizCNcaFiVWw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S5ws0Kipkmg=:8p+qFk0t7kKS1k4oDVAzm8
 5XFAAF/e5ZeBrEYZITHaRmvQ16bxyH1L+aVLAvQDqcTnqRJHIA6fvgXep2MKTYMH87XyJpVbv
 hLEbOuIsdH7Js+zDvLrP0h7zKAxKvDVF90ImqUntS3k/sG3J5hg4ui5+P6+Mqgng3s02Lvnh4
 sDbW6u2LpY+UpqxIjFcxUSY0TsvP3PIZcuIsm9EbcinAQQIq66V1mwb4InFgeDdjs8YppHYky
 iKwpFm6vNESPHjaN7fp+BgflFBCRre6ge9ddWCAL6uMmmCM6Ob44x5wfYMQ6GG6PoymwMCfUW
 xkmJ5D6IcxjwveFxxKk8fQPwlr45h67s57j76TpN6qDO7BAsLx6pANSD4eBAHpyA7rTBEGvuf
 eCwBqJOhPaUVDmAOXCN0CAILusqMlEYCX2K6HpcJ531k9GImAXkJwtXjPOJ7sSFcJ0W/AwuKw
 E0WC4fLtHEp2Mf6QY21085x1HYSpukpjY+/F389m197SPR5FwHd7YXEgEkVOnzdvwtlQVMUXf
 CwuY2BGGdyd8TiLdnOfntZwLDGkmiVwzAjbFu7uq0pWmfoMTliSqr4h0rqsLevaPiuYtwOUZ9
 qQ5eOjtjbWTTszjR/pnPAX7HS9gj4/FojpP8Ujq8WuU/DZRv/0QDZecUM+oSAX6nLDpslL/pa
 /vbg4Y8CU0+4YIZNpUqX3NFn18u+K6pQauFp08O6Dfh2BYRiQZRQX7ijVHoiMdeJRGj8Ze4DY
 7xdU1sLxw/S9QVYnNg2RvHa/MYWaXd94g9zmoMspueIpB2X/DhF4rngZUJU=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.126.131
Subject: [Qemu-trivial] [PULL 0/3] Trivial branch patches
X-BeenThere: qemu-trivial@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-trivial.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-trivial>
List-Post: <mailto:qemu-trivial@nongnu.org>
List-Help: <mailto:qemu-trivial-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-trivial>,
 <mailto:qemu-trivial-request@nongnu.org?subject=subscribe>
X-List-Received-Date: Tue, 02 Jul 2019 12:37:25 -0000

The following changes since commit 7d0e02405fc02a181319b1ab8681d2f72246b7c6:

  Merge remote-tracking branch 'remotes/vivier2/tags/trivial-patches-pull-request' into staging (2019-07-01 17:40:32 +0100)

are available in the Git repository at:

  git://github.com/vivier/qemu.git tags/trivial-branch-pull-request

for you to fetch changes up to 7c955080d40ccc7952a0479bc160f2b048c0af53:

  docs/devel/testing: Fix typo in dockerfile path (2019-07-02 10:12:32 +0200)

----------------------------------------------------------------
Fix typo, fix sys_cache_info() on FreeBSD/powerpc,
change virtio-rng default to urandom

----------------------------------------------------------------

Justin Hibbits (1):
  Fix cacheline detection on FreeBSD/powerpc.

Kashyap Chamarthy (1):
  VirtIO-RNG: Update default entropy source to `/dev/urandom`

Liam Merwick (1):
  docs/devel/testing: Fix typo in dockerfile path

 backends/rng-random.c  | 2 +-
 docs/devel/testing.rst | 2 +-
 qemu-options.hx        | 2 +-
 util/cacheinfo.c       | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.21.0


