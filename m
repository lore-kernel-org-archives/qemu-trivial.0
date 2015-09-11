Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZaNLG-00078b-N2
	for mharc-qemu-trivial@gnu.org; Fri, 11 Sep 2015 08:22:10 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaNL8-0006tc-E4
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 08:22:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>) id 1ZaNL3-0000WE-Fs
	for qemu-trivial@nongnu.org; Fri, 11 Sep 2015 08:22:02 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:56055)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <mjt@tls.msk.ru>)
	id 1ZaNKs-0000MM-Cq; Fri, 11 Sep 2015 08:21:46 -0400
Received: from tsrv.tls.msk.ru (tsrv.tls.msk.ru [192.168.177.2])
	by isrv.corpit.ru (Postfix) with ESMTP id 36E5F4143D;
	Fri, 11 Sep 2015 15:21:45 +0300 (MSK)
Received: from tls.msk.ru (mjt.vpn.tls.msk.ru [192.168.177.99])
	by tsrv.tls.msk.ru (Postfix) with SMTP id 2CDBCA68;
	Fri, 11 Sep 2015 14:03:53 +0300 (MSK)
Received: (nullmailer pid 22780 invoked by uid 1000);
	Fri, 11 Sep 2015 11:03:51 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Date: Fri, 11 Sep 2015 14:03:38 +0300
Message-Id: <fe646693acc13ac48b98435d14149ab04dc597bc.1441969369.git.mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
References: <cover.1441969369.git.mjt@msgid.tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 86.62.121.231
Cc: qemu-trivial@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?= <DirtY.iCE.hu@gmail.com>
Subject: [Qemu-trivial] [PULL 14/26] opts: produce valid command line in
	qemu_opts_print
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
X-List-Received-Date: Fri, 11 Sep 2015 12:22:08 -0000

From: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <dirty.ice.hu@gmail.com>

This will let us print options in a format that the user would actually
write it on the command line (foo=3Dbar,baz=3Dasd,etc=3Ddef), without
prepending a spurious comma at the beginning of the list, or quoting
values unnecessarily.  This patch provides the following changes:
* write and id=3D, if the option has an id
* do not print separator before the first element
* do not quote string arguments
* properly escape commas (,) for QEMU

Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.com=
>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 block.c                          |  2 +-
 tests/qemu-iotests/017.out       |  2 +-
 tests/qemu-iotests/018.out       |  2 +-
 tests/qemu-iotests/019.out       |  2 +-
 tests/qemu-iotests/020.out       |  2 +-
 tests/qemu-iotests/024.out       |  2 +-
 tests/qemu-iotests/028.out       |  4 ++--
 tests/qemu-iotests/034.out       |  2 +-
 tests/qemu-iotests/037.out       |  2 +-
 tests/qemu-iotests/038.out       |  2 +-
 tests/qemu-iotests/039.out       |  2 +-
 tests/qemu-iotests/043.out       | 12 ++++++------
 tests/qemu-iotests/046.out       |  2 +-
 tests/qemu-iotests/049.out       | 22 +++++++++++-----------
 tests/qemu-iotests/050.out       |  2 +-
 tests/qemu-iotests/051.out       |  2 +-
 tests/qemu-iotests/061.out       | 10 +++++-----
 tests/qemu-iotests/069.out       |  2 +-
 tests/qemu-iotests/073.out       |  2 +-
 tests/qemu-iotests/079.out       | 18 +++++++++---------
 tests/qemu-iotests/082.out       |  4 ++--
 tests/qemu-iotests/085.out       | 38 +++++++++++++++++++---------------=
----
 tests/qemu-iotests/095.out       |  4 ++--
 tests/qemu-iotests/097.out       | 16 ++++++++--------
 tests/qemu-iotests/098.out       |  8 ++++----
 tests/qemu-iotests/110.out       |  4 ++--
 tests/qemu-iotests/112.out       |  4 ++--
 tests/qemu-iotests/114.out       |  2 +-
 tests/qemu-iotests/115.out       |  2 +-
 tests/qemu-iotests/121.out       |  4 ++--
 tests/qemu-iotests/122.out       |  6 +++---
 tests/qemu-iotests/130.out       |  4 ++--
 tests/qemu-iotests/common.filter |  2 +-
 util/qemu-option.c               | 29 ++++++++++++++++++++++++++---
 34 files changed, 123 insertions(+), 100 deletions(-)

diff --git a/block.c b/block.c
index 090923c..cb5d7ae 100644
--- a/block.c
+++ b/block.c
@@ -3869,7 +3869,7 @@ void bdrv_img_create(const char *filename, const ch=
ar *fmt,
     }
=20
     if (!quiet) {
-        printf("Formatting '%s', fmt=3D%s", filename, fmt);
+        printf("Formatting '%s', fmt=3D%s ", filename, fmt);
         qemu_opts_print(opts, " ");
         puts("");
     }
diff --git a/tests/qemu-iotests/017.out b/tests/qemu-iotests/017.out
index 7c409fc..8fc9241 100644
--- a/tests/qemu-iotests/017.out
+++ b/tests/qemu-iotests/017.out
@@ -269,7 +269,7 @@ wrote 65536/65536 bytes at offset 4295032832
 No errors were found on the image.
 Creating test image with backing file
=20
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D6442450944 backing_f=
ile=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D6442450944 backing_f=
ile=3DTEST_DIR/t.IMGFMT.base
 Filling test image
=20
 =3D=3D=3D IO: pattern 1
diff --git a/tests/qemu-iotests/018.out b/tests/qemu-iotests/018.out
index 39a6011..d66bd63 100644
--- a/tests/qemu-iotests/018.out
+++ b/tests/qemu-iotests/018.out
@@ -269,7 +269,7 @@ wrote 65536/65536 bytes at offset 4295032832
 No errors were found on the image.
 Creating test image with backing file
=20
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D6442450944 backing_f=
ile=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D6442450944 backing_f=
ile=3DTEST_DIR/t.IMGFMT.base
 Filling test image
=20
 =3D=3D=3D IO: pattern 1
diff --git a/tests/qemu-iotests/019.out b/tests/qemu-iotests/019.out
index 4695b97..615450a 100644
--- a/tests/qemu-iotests/019.out
+++ b/tests/qemu-iotests/019.out
@@ -269,7 +269,7 @@ wrote 65536/65536 bytes at offset 4296015872
 No errors were found on the image.
 Creating test image with backing file
=20
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D6442450944 backing_f=
ile=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D6442450944 backing_f=
ile=3DTEST_DIR/t.IMGFMT.base
 Filling test image
=20
 =3D=3D=3D IO: pattern 43
diff --git a/tests/qemu-iotests/020.out b/tests/qemu-iotests/020.out
index 71aab1c..134aa29 100644
--- a/tests/qemu-iotests/020.out
+++ b/tests/qemu-iotests/020.out
@@ -269,7 +269,7 @@ wrote 65536/65536 bytes at offset 4295032832
 No errors were found on the image.
 Creating test image with backing file
=20
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D6442450944 backing_f=
ile=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D6442450944 backing_f=
ile=3DTEST_DIR/t.IMGFMT.base
 Filling test image
=20
 =3D=3D=3D IO: pattern 1
diff --git a/tests/qemu-iotests/024.out b/tests/qemu-iotests/024.out
index 521d469..9b9ef3a 100644
--- a/tests/qemu-iotests/024.out
+++ b/tests/qemu-iotests/024.out
@@ -33,7 +33,7 @@ wrote 131072/131072 bytes at offset 786432
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Creating COW image
=20
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824 backing_f=
ile=3D'TEST_DIR/t.IMGFMT.base_old'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D1073741824 backing_f=
ile=3DTEST_DIR/t.IMGFMT.base_old
 =3D=3D=3D IO: pattern 0x33
 wrote 262144/262144 bytes at offset 0
 256 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
diff --git a/tests/qemu-iotests/028.out b/tests/qemu-iotests/028.out
index 5db167c..29c9972 100644
--- a/tests/qemu-iotests/028.out
+++ b/tests/qemu-iotests/028.out
@@ -70,7 +70,7 @@ wrote 512/512 bytes at offset 3221225984
 No errors were found on the image.
 Creating test image with backing file
=20
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294968832 backing_f=
ile=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294968832 backing_f=
ile=3DTEST_DIR/t.IMGFMT.base
 Filling test image
=20
 =3D=3D=3D IO: pattern 196
@@ -468,7 +468,7 @@ No errors were found on the image.
=20
 block-backup
=20
-Formatting 'TEST_DIR/t.IMGFMT.copy', fmt=3DIMGFMT size=3D4294968832 back=
ing_file=3D'TEST_DIR/t.IMGFMT.base' backing_fmt=3D'IMGFMT'
+Formatting 'TEST_DIR/t.IMGFMT.copy', fmt=3DIMGFMT size=3D4294968832 back=
ing_file=3DTEST_DIR/t.IMGFMT.base backing_fmt=3DIMGFMT
 (qemu)
 (qemu) i=1B[K=1B[Din=1B[K=1B[D=1B[Dinf=1B[K=1B[D=1B[D=1B[Dinfo=1B[K=1B[D=
=1B[D=1B[D=1B[Dinfo =1B[K=1B[D=1B[D=1B[D=1B[D=1B[Dinfo b=1B[K=1B[D=1B[D=1B=
[D=1B[D=1B[D=1B[Dinfo bl=1B[K=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[Dinfo blo=1B=
[K=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[Dinfo bloc=1B[K=1B[D=1B[D=1B[D=1B=
[D=1B[D=1B[D=1B[D=1B[D=1B[Dinfo block=1B[K=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B=
[D=1B[D=1B[D=1B[Dinfo block-=1B[K=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=
=1B[D=1B[D=1B[Dinfo block-j=1B[K=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B=
[D=1B[D=1B[D=1B[Dinfo block-jo=1B[K=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B=
[D=1B[D=1B[D=1B[D=1B[D=1B[Dinfo block-job=1B[K=1B[D=1B[D=1B[D=1B[D=1B[D=1B=
[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[Dinfo block-jobs=1B[K
 Type backup, device disk: Completed 0 of 4294968832 bytes, speed limit 0=
 bytes/s
diff --git a/tests/qemu-iotests/034.out b/tests/qemu-iotests/034.out
index d12daf2..34fda80 100644
--- a/tests/qemu-iotests/034.out
+++ b/tests/qemu-iotests/034.out
@@ -4,7 +4,7 @@ QA output created by 034
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728
 wrote 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D6442450944 backing_f=
ile=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D6442450944 backing_f=
ile=3DTEST_DIR/t.IMGFMT.base
=20
 =3D=3D zero write with backing file =3D=3D
 wrote 196608/196608 bytes at offset 65536
diff --git a/tests/qemu-iotests/037.out b/tests/qemu-iotests/037.out
index dc40a02..55b30fd 100644
--- a/tests/qemu-iotests/037.out
+++ b/tests/qemu-iotests/037.out
@@ -514,7 +514,7 @@ wrote 512/512 bytes at offset 130048
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 512/512 bytes at offset 130560
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D6442450944 backing_f=
ile=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D6442450944 backing_f=
ile=3DTEST_DIR/t.IMGFMT.base
=20
 =3D=3D COW in a single cluster =3D=3D
 wrote 2048/2048 bytes at offset 0
diff --git a/tests/qemu-iotests/038.out b/tests/qemu-iotests/038.out
index e1a7e94..ecb656e 100644
--- a/tests/qemu-iotests/038.out
+++ b/tests/qemu-iotests/038.out
@@ -514,7 +514,7 @@ wrote 65536/65536 bytes at offset 16646144
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 65536/65536 bytes at offset 16711680
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D6442450944 backing_f=
ile=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D6442450944 backing_f=
ile=3DTEST_DIR/t.IMGFMT.base
=20
 =3D=3D Some concurrent requests touching the same cluster =3D=3D
 wrote 65536/65536 bytes at offset XXX
diff --git a/tests/qemu-iotests/039.out b/tests/qemu-iotests/039.out
index b055670..d8c5a44 100644
--- a/tests/qemu-iotests/039.out
+++ b/tests/qemu-iotests/039.out
@@ -66,7 +66,7 @@ No errors were found on the image.
=20
 =3D=3D Committing to a backing file with lazy_refcounts=3Don =3D=3D
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D134217728
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3DTEST_DIR/t.IMGFMT.base
 wrote 512/512 bytes at offset 0
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Image committed.
diff --git a/tests/qemu-iotests/043.out b/tests/qemu-iotests/043.out
index 012cc00..33f8cc3 100644
--- a/tests/qemu-iotests/043.out
+++ b/tests/qemu-iotests/043.out
@@ -4,20 +4,20 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134=
217728
 =3D=3D backing file references self =3D=3D
 qemu-img: Backing file 'TEST_DIR/t.IMGFMT' creates an infinite loop.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3DTEST_DIR/t.IMGFMT.base
=20
 =3D=3D parent references self =3D=3D
 qemu-img: Backing file 'TEST_DIR/t.IMGFMT' creates an infinite loop.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3D'TEST_DIR/t.IMGFMT.1.base'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3D'TEST_DIR/t.IMGFMT.2.base'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3D'TEST_DIR/t.IMGFMT.3.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3DTEST_DIR/t.IMGFMT.1.base
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3DTEST_DIR/t.IMGFMT.2.base
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3DTEST_DIR/t.IMGFMT.3.base
=20
 =3D=3D ancestor references another ancestor =3D=3D
 qemu-img: Backing file 'TEST_DIR/t.IMGFMT.2.base' creates an infinite lo=
op.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3D'TEST_DIR/t.IMGFMT.1.base'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3D'TEST_DIR/t.IMGFMT.2.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3DTEST_DIR/t.IMGFMT.1.base
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3DTEST_DIR/t.IMGFMT.2.base
=20
 =3D=3D finite chain of length 3 (human) =3D=3D
 image: TEST_DIR/t.IMGFMT
diff --git a/tests/qemu-iotests/046.out b/tests/qemu-iotests/046.out
index 9d18af5..ca2c740 100644
--- a/tests/qemu-iotests/046.out
+++ b/tests/qemu-iotests/046.out
@@ -66,7 +66,7 @@ wrote 65536/65536 bytes at offset 1966080
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 65536/65536 bytes at offset 2031616
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D6442450944 backing_f=
ile=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D6442450944 backing_f=
ile=3DTEST_DIR/t.IMGFMT.base
=20
 =3D=3D Some concurrent requests touching the same cluster =3D=3D
 blkdebug: Suspended request 'A'
diff --git a/tests/qemu-iotests/049.out b/tests/qemu-iotests/049.out
index 8884543..0425ae0 100644
--- a/tests/qemu-iotests/049.out
+++ b/tests/qemu-iotests/049.out
@@ -155,30 +155,30 @@ Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D6=
7108864 encryption=3Doff cluster_si
 =3D=3D Check compat level option =3D=3D
=20
 qemu-img create -f qcow2 -o compat=3D0.10 TEST_DIR/t.qcow2 64M
-Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 compat=3D'0.1=
0' encryption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bi=
ts=3D16
+Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 compat=3D0.10=
 encryption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=
=3D16
=20
 qemu-img create -f qcow2 -o compat=3D1.1 TEST_DIR/t.qcow2 64M
-Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 compat=3D'1.1=
' encryption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bit=
s=3D16
+Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 compat=3D1.1 =
encryption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D=
16
=20
 qemu-img create -f qcow2 -o compat=3D0.42 TEST_DIR/t.qcow2 64M
 qemu-img: TEST_DIR/t.qcow2: Invalid compatibility level: '0.42'
-Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 compat=3D'0.4=
2' encryption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bi=
ts=3D16
+Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 compat=3D0.42=
 encryption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=
=3D16
=20
 qemu-img create -f qcow2 -o compat=3Dfoobar TEST_DIR/t.qcow2 64M
 qemu-img: TEST_DIR/t.qcow2: Invalid compatibility level: 'foobar'
-Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 compat=3D'foo=
bar' encryption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_=
bits=3D16
+Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 compat=3Dfoob=
ar encryption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bi=
ts=3D16
=20
 =3D=3D Check preallocation option =3D=3D
=20
 qemu-img create -f qcow2 -o preallocation=3Doff TEST_DIR/t.qcow2 64M
-Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 encryption=3D=
off cluster_size=3D65536 preallocation=3D'off' lazy_refcounts=3Doff refco=
unt_bits=3D16
+Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 encryption=3D=
off cluster_size=3D65536 preallocation=3Doff lazy_refcounts=3Doff refcoun=
t_bits=3D16
=20
 qemu-img create -f qcow2 -o preallocation=3Dmetadata TEST_DIR/t.qcow2 64=
M
-Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 encryption=3D=
off cluster_size=3D65536 preallocation=3D'metadata' lazy_refcounts=3Doff =
refcount_bits=3D16
+Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 encryption=3D=
off cluster_size=3D65536 preallocation=3Dmetadata lazy_refcounts=3Doff re=
fcount_bits=3D16
=20
 qemu-img create -f qcow2 -o preallocation=3D1234 TEST_DIR/t.qcow2 64M
 qemu-img: TEST_DIR/t.qcow2: invalid parameter value: 1234
-Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 encryption=3D=
off cluster_size=3D65536 preallocation=3D'1234' lazy_refcounts=3Doff refc=
ount_bits=3D16
+Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 encryption=3D=
off cluster_size=3D65536 preallocation=3D1234 lazy_refcounts=3Doff refcou=
nt_bits=3D16
=20
 =3D=3D Check encryption option =3D=3D
=20
@@ -197,16 +197,16 @@ Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D6=
7108864 encryption=3Don cluster_siz
 =3D=3D Check lazy_refcounts option (only with v3) =3D=3D
=20
 qemu-img create -f qcow2 -o compat=3D1.1,lazy_refcounts=3Doff TEST_DIR/t=
.qcow2 64M
-Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 compat=3D'1.1=
' encryption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bit=
s=3D16
+Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 compat=3D1.1 =
encryption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D=
16
=20
 qemu-img create -f qcow2 -o compat=3D1.1,lazy_refcounts=3Don TEST_DIR/t.=
qcow2 64M
-Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 compat=3D'1.1=
' encryption=3Doff cluster_size=3D65536 lazy_refcounts=3Don refcount_bits=
=3D16
+Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 compat=3D1.1 =
encryption=3Doff cluster_size=3D65536 lazy_refcounts=3Don refcount_bits=3D=
16
=20
 qemu-img create -f qcow2 -o compat=3D0.10,lazy_refcounts=3Doff TEST_DIR/=
t.qcow2 64M
-Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 compat=3D'0.1=
0' encryption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bi=
ts=3D16
+Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 compat=3D0.10=
 encryption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=
=3D16
=20
 qemu-img create -f qcow2 -o compat=3D0.10,lazy_refcounts=3Don TEST_DIR/t=
.qcow2 64M
 qemu-img: TEST_DIR/t.qcow2: Lazy refcounts only supported with compatibi=
lity level 1.1 and above (use compat=3D1.1 or greater)
-Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 compat=3D'0.1=
0' encryption=3Doff cluster_size=3D65536 lazy_refcounts=3Don refcount_bit=
s=3D16
+Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D67108864 compat=3D0.10=
 encryption=3Doff cluster_size=3D65536 lazy_refcounts=3Don refcount_bits=3D=
16
=20
 *** done
diff --git a/tests/qemu-iotests/050.out b/tests/qemu-iotests/050.out
index a6cb2e6..397cf7f 100644
--- a/tests/qemu-iotests/050.out
+++ b/tests/qemu-iotests/050.out
@@ -7,7 +7,7 @@ wrote 1048576/1048576 bytes at offset 0
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D10485760
 wrote 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D10485760 backing_fil=
e=3D'TEST_DIR/t.IMGFMT.old'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D10485760 backing_fil=
e=3DTEST_DIR/t.IMGFMT.old
 wrote 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
=20
diff --git a/tests/qemu-iotests/051.out b/tests/qemu-iotests/051.out
index 23c2823..0429be2 100644
--- a/tests/qemu-iotests/051.out
+++ b/tests/qemu-iotests/051.out
@@ -1,6 +1,6 @@
 QA output created by 051
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3DTEST_DIR/t.IMGFMT.base
=20
 =3D=3D=3D Unknown option =3D=3D=3D
=20
diff --git a/tests/qemu-iotests/061.out b/tests/qemu-iotests/061.out
index 4505376..a683f46 100644
--- a/tests/qemu-iotests/061.out
+++ b/tests/qemu-iotests/061.out
@@ -336,7 +336,7 @@ read 131072/131072 bytes at offset 0
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D67108864
 wrote 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3DTEST_DIR/t.IMGFMT.base
 read 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 65536/65536 bytes at offset 0
@@ -352,7 +352,7 @@ read 65536/65536 bytes at offset 65536
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D67108864
 wrote 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3DTEST_DIR/t.IMGFMT.base
 wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 131072/131072 bytes at offset 0
@@ -371,7 +371,7 @@ read 65536/65536 bytes at offset 65536
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D67108864
 wrote 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3DTEST_DIR/t.IMGFMT.base
 wrote 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 No errors were found on the image.
@@ -395,7 +395,7 @@ read 67108864/67108864 bytes at offset 0
 =3D=3D=3D Testing progress report without snapshot =3D=3D=3D
=20
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D4294967296
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 backing_f=
ile=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 backing_f=
ile=3DTEST_DIR/t.IMGFMT.base
 wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 65536/65536 bytes at offset 1073741824
@@ -410,7 +410,7 @@ No errors were found on the image.
 =3D=3D=3D Testing progress report with snapshot =3D=3D=3D
=20
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D4294967296
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 backing_f=
ile=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 backing_f=
ile=3DTEST_DIR/t.IMGFMT.base
 wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 65536/65536 bytes at offset 1073741824
diff --git a/tests/qemu-iotests/069.out b/tests/qemu-iotests/069.out
index 4d7e63c..c78e8c2 100644
--- a/tests/qemu-iotests/069.out
+++ b/tests/qemu-iotests/069.out
@@ -3,6 +3,6 @@ QA output created by 069
 =3D=3D=3D Creating an image with a backing file and deleting that file =3D=
=3D=3D
=20
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D131072
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D131072 backing_file=3D=
'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D131072 backing_file=3D=
TEST_DIR/t.IMGFMT.base
 qemu-io: can't open device TEST_DIR/t.IMGFMT: Could not open backing fil=
e: Could not open 'TEST_DIR/t.IMGFMT.base': No such file or directory
 *** done
diff --git a/tests/qemu-iotests/073.out b/tests/qemu-iotests/073.out
index 733d79c..de54524 100644
--- a/tests/qemu-iotests/073.out
+++ b/tests/qemu-iotests/073.out
@@ -2,7 +2,7 @@ QA output created by 073
=20
 =3D=3D creating backing file =3D=3D
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D134217728
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134217728 backing_fi=
le=3DTEST_DIR/t.IMGFMT.base
 wrote 134217728/134217728 bytes at offset 0
 128 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
=20
diff --git a/tests/qemu-iotests/079.out b/tests/qemu-iotests/079.out
index 6dc5d57..aab922f 100644
--- a/tests/qemu-iotests/079.out
+++ b/tests/qemu-iotests/079.out
@@ -1,14 +1,14 @@
 QA output created by 079
 =3D=3D=3D Check option preallocation and cluster_size =3D=3D=3D
=20
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 prealloca=
tion=3D'metadata'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 prealloca=
tion=3D'metadata'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 prealloca=
tion=3D'metadata'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 prealloca=
tion=3D'metadata'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 prealloca=
tion=3D'metadata'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 prealloca=
tion=3D'metadata'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 prealloca=
tion=3D'metadata'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 prealloca=
tion=3D'metadata'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 prealloca=
tion=3Dmetadata
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 prealloca=
tion=3Dmetadata
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 prealloca=
tion=3Dmetadata
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 prealloca=
tion=3Dmetadata
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 prealloca=
tion=3Dmetadata
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 prealloca=
tion=3Dmetadata
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 prealloca=
tion=3Dmetadata
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 prealloca=
tion=3Dmetadata
 qemu-img: TEST_DIR/t.IMGFMT: Cluster size must be a power of two between=
 512 and 2048k
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 prealloca=
tion=3D'metadata'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D4294967296 prealloca=
tion=3Dmetadata
 *** done
diff --git a/tests/qemu-iotests/082.out b/tests/qemu-iotests/082.out
index 3a749b8..a952330 100644
--- a/tests/qemu-iotests/082.out
+++ b/tests/qemu-iotests/082.out
@@ -147,10 +147,10 @@ refcount_bits    Width of a reference count entry i=
n bits
 nocow            Turn off copy-on-write (valid only on btrfs)
=20
 Testing: create -f qcow2 -o backing_file=3DTEST_DIR/t.qcow2,,help TEST_D=
IR/t.qcow2 128M
-Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D134217728 backing_file=
=3D'TEST_DIR/t.qcow2,help' encryption=3Doff cluster_size=3D65536 lazy_ref=
counts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D134217728 backing_file=
=3DTEST_DIR/t.qcow2,,help encryption=3Doff cluster_size=3D65536 lazy_refc=
ounts=3Doff refcount_bits=3D16
=20
 Testing: create -f qcow2 -o backing_file=3DTEST_DIR/t.qcow2,,? TEST_DIR/=
t.qcow2 128M
-Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D134217728 backing_file=
=3D'TEST_DIR/t.qcow2,?' encryption=3Doff cluster_size=3D65536 lazy_refcou=
nts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/t.qcow2', fmt=3Dqcow2 size=3D134217728 backing_file=
=3DTEST_DIR/t.qcow2,,? encryption=3Doff cluster_size=3D65536 lazy_refcoun=
ts=3Doff refcount_bits=3D16
=20
 Testing: create -f qcow2 -o backing_file=3DTEST_DIR/t.qcow2, -o help TES=
T_DIR/t.qcow2 128M
 qemu-img: Invalid option list: backing_file=3DTEST_DIR/t.qcow2,
diff --git a/tests/qemu-iotests/085.out b/tests/qemu-iotests/085.out
index 5eb8b94..a6cf19e 100644
--- a/tests/qemu-iotests/085.out
+++ b/tests/qemu-iotests/085.out
@@ -11,7 +11,7 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D134=
217728
=20
 =3D=3D=3D Create a single snapshot on virtio0 =3D=3D=3D
=20
-Formatting 'TEST_DIR/1-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3D'TEST_DIR/t.qcow2.orig' backing_fmt=3D'qcow2' encryption=3D=
off cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/1-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3DTEST_DIR/t.qcow2.orig backing_fmt=3Dqcow2 encryption=3Doff=
 cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
 {"return": {}}
=20
 =3D=3D=3D Invalid command - missing device and nodename =3D=3D=3D
@@ -25,31 +25,31 @@ Formatting 'TEST_DIR/1-snapshot-v0.qcow2', fmt=3Dqcow=
2 size=3D134217728 backing_file
=20
 =3D=3D=3D Create several transactional group snapshots =3D=3D=3D
=20
-Formatting 'TEST_DIR/2-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3D'TEST_DIR/1-snapshot-v0.qcow2' backing_fmt=3D'qcow2' encry=
ption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
-Formatting 'TEST_DIR/2-snapshot-v1.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3D'TEST_DIR/t.qcow2' backing_fmt=3D'qcow2' encryption=3Doff =
cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/2-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3DTEST_DIR/1-snapshot-v0.qcow2 backing_fmt=3Dqcow2 encryptio=
n=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/2-snapshot-v1.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3DTEST_DIR/t.qcow2 backing_fmt=3Dqcow2 encryption=3Doff clus=
ter_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
 {"return": {}}
-Formatting 'TEST_DIR/3-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3D'TEST_DIR/2-snapshot-v0.qcow2' backing_fmt=3D'qcow2' encry=
ption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
-Formatting 'TEST_DIR/3-snapshot-v1.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3D'TEST_DIR/2-snapshot-v1.qcow2' backing_fmt=3D'qcow2' encry=
ption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/3-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3DTEST_DIR/2-snapshot-v0.qcow2 backing_fmt=3Dqcow2 encryptio=
n=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/3-snapshot-v1.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3DTEST_DIR/2-snapshot-v1.qcow2 backing_fmt=3Dqcow2 encryptio=
n=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
 {"return": {}}
-Formatting 'TEST_DIR/4-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3D'TEST_DIR/3-snapshot-v0.qcow2' backing_fmt=3D'qcow2' encry=
ption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
-Formatting 'TEST_DIR/4-snapshot-v1.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3D'TEST_DIR/3-snapshot-v1.qcow2' backing_fmt=3D'qcow2' encry=
ption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/4-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3DTEST_DIR/3-snapshot-v0.qcow2 backing_fmt=3Dqcow2 encryptio=
n=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/4-snapshot-v1.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3DTEST_DIR/3-snapshot-v1.qcow2 backing_fmt=3Dqcow2 encryptio=
n=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
 {"return": {}}
-Formatting 'TEST_DIR/5-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3D'TEST_DIR/4-snapshot-v0.qcow2' backing_fmt=3D'qcow2' encry=
ption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
-Formatting 'TEST_DIR/5-snapshot-v1.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3D'TEST_DIR/4-snapshot-v1.qcow2' backing_fmt=3D'qcow2' encry=
ption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/5-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3DTEST_DIR/4-snapshot-v0.qcow2 backing_fmt=3Dqcow2 encryptio=
n=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/5-snapshot-v1.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3DTEST_DIR/4-snapshot-v1.qcow2 backing_fmt=3Dqcow2 encryptio=
n=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
 {"return": {}}
-Formatting 'TEST_DIR/6-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3D'TEST_DIR/5-snapshot-v0.qcow2' backing_fmt=3D'qcow2' encry=
ption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
-Formatting 'TEST_DIR/6-snapshot-v1.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3D'TEST_DIR/5-snapshot-v1.qcow2' backing_fmt=3D'qcow2' encry=
ption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/6-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3DTEST_DIR/5-snapshot-v0.qcow2 backing_fmt=3Dqcow2 encryptio=
n=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/6-snapshot-v1.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3DTEST_DIR/5-snapshot-v1.qcow2 backing_fmt=3Dqcow2 encryptio=
n=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
 {"return": {}}
-Formatting 'TEST_DIR/7-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3D'TEST_DIR/6-snapshot-v0.qcow2' backing_fmt=3D'qcow2' encry=
ption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
-Formatting 'TEST_DIR/7-snapshot-v1.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3D'TEST_DIR/6-snapshot-v1.qcow2' backing_fmt=3D'qcow2' encry=
ption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/7-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3DTEST_DIR/6-snapshot-v0.qcow2 backing_fmt=3Dqcow2 encryptio=
n=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/7-snapshot-v1.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3DTEST_DIR/6-snapshot-v1.qcow2 backing_fmt=3Dqcow2 encryptio=
n=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
 {"return": {}}
-Formatting 'TEST_DIR/8-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3D'TEST_DIR/7-snapshot-v0.qcow2' backing_fmt=3D'qcow2' encry=
ption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
-Formatting 'TEST_DIR/8-snapshot-v1.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3D'TEST_DIR/7-snapshot-v1.qcow2' backing_fmt=3D'qcow2' encry=
ption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/8-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3DTEST_DIR/7-snapshot-v0.qcow2 backing_fmt=3Dqcow2 encryptio=
n=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/8-snapshot-v1.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3DTEST_DIR/7-snapshot-v1.qcow2 backing_fmt=3Dqcow2 encryptio=
n=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
 {"return": {}}
-Formatting 'TEST_DIR/9-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3D'TEST_DIR/8-snapshot-v0.qcow2' backing_fmt=3D'qcow2' encry=
ption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
-Formatting 'TEST_DIR/9-snapshot-v1.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3D'TEST_DIR/8-snapshot-v1.qcow2' backing_fmt=3D'qcow2' encry=
ption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/9-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3DTEST_DIR/8-snapshot-v0.qcow2 backing_fmt=3Dqcow2 encryptio=
n=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/9-snapshot-v1.qcow2', fmt=3Dqcow2 size=3D134217728 =
backing_file=3DTEST_DIR/8-snapshot-v1.qcow2 backing_fmt=3Dqcow2 encryptio=
n=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
 {"return": {}}
-Formatting 'TEST_DIR/10-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728=
 backing_file=3D'TEST_DIR/9-snapshot-v0.qcow2' backing_fmt=3D'qcow2' encr=
yption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
-Formatting 'TEST_DIR/10-snapshot-v1.qcow2', fmt=3Dqcow2 size=3D134217728=
 backing_file=3D'TEST_DIR/9-snapshot-v1.qcow2' backing_fmt=3D'qcow2' encr=
yption=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/10-snapshot-v0.qcow2', fmt=3Dqcow2 size=3D134217728=
 backing_file=3DTEST_DIR/9-snapshot-v0.qcow2 backing_fmt=3Dqcow2 encrypti=
on=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
+Formatting 'TEST_DIR/10-snapshot-v1.qcow2', fmt=3Dqcow2 size=3D134217728=
 backing_file=3DTEST_DIR/9-snapshot-v1.qcow2 backing_fmt=3Dqcow2 encrypti=
on=3Doff cluster_size=3D65536 lazy_refcounts=3Doff refcount_bits=3D16
 {"return": {}}
 *** done
diff --git a/tests/qemu-iotests/095.out b/tests/qemu-iotests/095.out
index 267c483..2360061 100644
--- a/tests/qemu-iotests/095.out
+++ b/tests/qemu-iotests/095.out
@@ -1,7 +1,7 @@
 QA output created by 095
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D5242880
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D104857600 backing_fi=
le=3D'TEST_DIR/t.IMGFMT.base'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D104857600 backing_fi=
le=3D'TEST_DIR/t.IMGFMT.snp1'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D104857600 backing_fi=
le=3DTEST_DIR/t.IMGFMT.base
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D104857600 backing_fi=
le=3DTEST_DIR/t.IMGFMT.snp1
=20
 =3D=3D=3D Base image info before commit and resize =3D=3D=3D
 image: TEST_DIR/t.IMGFMT.base
diff --git a/tests/qemu-iotests/097.out b/tests/qemu-iotests/097.out
index 81651f4..48abd2e 100644
--- a/tests/qemu-iotests/097.out
+++ b/tests/qemu-iotests/097.out
@@ -3,8 +3,8 @@ QA output created by 097
 =3D=3D=3D Test pass 0 =3D=3D=3D
=20
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D67108864
-Formatting 'TEST_DIR/t.IMGFMT.itmd', fmt=3DIMGFMT size=3D67108864 backin=
g_file=3D'TEST_DIR/t.IMGFMT.base'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D'TEST_DIR/t.IMGFMT.itmd'
+Formatting 'TEST_DIR/t.IMGFMT.itmd', fmt=3DIMGFMT size=3D67108864 backin=
g_file=3DTEST_DIR/t.IMGFMT.base
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3DTEST_DIR/t.IMGFMT.itmd
 wrote 196608/196608 bytes at offset 0
 192 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 131072/131072 bytes at offset 65536
@@ -32,8 +32,8 @@ Offset          Length          File
 =3D=3D=3D Test pass 1 =3D=3D=3D
=20
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D67108864
-Formatting 'TEST_DIR/t.IMGFMT.itmd', fmt=3DIMGFMT size=3D67108864 backin=
g_file=3D'TEST_DIR/t.IMGFMT.base'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D'TEST_DIR/t.IMGFMT.itmd'
+Formatting 'TEST_DIR/t.IMGFMT.itmd', fmt=3DIMGFMT size=3D67108864 backin=
g_file=3DTEST_DIR/t.IMGFMT.base
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3DTEST_DIR/t.IMGFMT.itmd
 wrote 196608/196608 bytes at offset 0
 192 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 131072/131072 bytes at offset 65536
@@ -62,8 +62,8 @@ Offset          Length          File
 =3D=3D=3D Test pass 2 =3D=3D=3D
=20
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D67108864
-Formatting 'TEST_DIR/t.IMGFMT.itmd', fmt=3DIMGFMT size=3D67108864 backin=
g_file=3D'TEST_DIR/t.IMGFMT.base'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D'TEST_DIR/t.IMGFMT.itmd'
+Formatting 'TEST_DIR/t.IMGFMT.itmd', fmt=3DIMGFMT size=3D67108864 backin=
g_file=3DTEST_DIR/t.IMGFMT.base
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3DTEST_DIR/t.IMGFMT.itmd
 wrote 196608/196608 bytes at offset 0
 192 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 131072/131072 bytes at offset 65536
@@ -92,8 +92,8 @@ Offset          Length          File
 =3D=3D=3D Test pass 3 =3D=3D=3D
=20
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D67108864
-Formatting 'TEST_DIR/t.IMGFMT.itmd', fmt=3DIMGFMT size=3D67108864 backin=
g_file=3D'TEST_DIR/t.IMGFMT.base'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D'TEST_DIR/t.IMGFMT.itmd'
+Formatting 'TEST_DIR/t.IMGFMT.itmd', fmt=3DIMGFMT size=3D67108864 backin=
g_file=3DTEST_DIR/t.IMGFMT.base
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3DTEST_DIR/t.IMGFMT.itmd
 wrote 196608/196608 bytes at offset 0
 192 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 131072/131072 bytes at offset 65536
diff --git a/tests/qemu-iotests/098.out b/tests/qemu-iotests/098.out
index e08a189..7634d0e 100644
--- a/tests/qemu-iotests/098.out
+++ b/tests/qemu-iotests/098.out
@@ -3,7 +3,7 @@ QA output created by 098
 =3D=3D=3D l1_update =3D=3D=3D
=20
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D67108864
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3DTEST_DIR/t.IMGFMT.base
 wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 qemu-img: Could not empty blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMG=
FMT: Input/output error
@@ -12,7 +12,7 @@ No errors were found on the image.
 =3D=3D=3D empty_image_prepare =3D=3D=3D
=20
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D67108864
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3DTEST_DIR/t.IMGFMT.base
 wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 qemu-img: Could not empty blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMG=
FMT: Input/output error
@@ -25,7 +25,7 @@ No errors were found on the image.
 =3D=3D=3D reftable_update =3D=3D=3D
=20
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D67108864
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3DTEST_DIR/t.IMGFMT.base
 wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 qemu-img: Could not empty blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMG=
FMT: Input/output error
@@ -39,7 +39,7 @@ No errors were found on the image.
 =3D=3D=3D refblock_alloc =3D=3D=3D
=20
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D67108864
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3DTEST_DIR/t.IMGFMT.base
 wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 qemu-img: Could not empty blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMG=
FMT: Input/output error
diff --git a/tests/qemu-iotests/110.out b/tests/qemu-iotests/110.out
index 152bacf..0270980 100644
--- a/tests/qemu-iotests/110.out
+++ b/tests/qemu-iotests/110.out
@@ -3,7 +3,7 @@ QA output created by 110
 =3D=3D=3D Reconstructable filename =3D=3D=3D
=20
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D67108864
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D't.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3Dt.IMGFMT.base
 image: TEST_DIR/t.IMGFMT
 file format: IMGFMT
 virtual size: 64M (67108864 bytes)
@@ -15,5 +15,5 @@ qemu-img: Cannot use relative backing file names for 'j=
son:{"driver": "IMGFMT",
=20
 =3D=3D=3D Backing name is always relative to the backed image =3D=3D=3D
=20
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D't.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3Dt.IMGFMT.base
 *** done
diff --git a/tests/qemu-iotests/112.out b/tests/qemu-iotests/112.out
index 9a98633..8dd3df0 100644
--- a/tests/qemu-iotests/112.out
+++ b/tests/qemu-iotests/112.out
@@ -21,9 +21,9 @@ refcount bits: 16
=20
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
 refcount bits: 16
-qemu-img: TEST_DIR/t.IMGFMT: Different refcount widths than 16 bits requ=
ire compatibility level 1.1 or above (use compat=3D1.1 or greater)
+qemu-img: TEST_DIR/t.IMGFMT: Different refcount widths than 16 bits requ=
ire compatibility level 1.1 or above (use or greater)
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
-qemu-img: TEST_DIR/t.IMGFMT: Different refcount widths than 16 bits requ=
ire compatibility level 1.1 or above (use compat=3D1.1 or greater)
+qemu-img: TEST_DIR/t.IMGFMT: Different refcount widths than 16 bits requ=
ire compatibility level 1.1 or above (use or greater)
 Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864
=20
 =3D=3D=3D Snapshot limit on refcount_bits=3D1 =3D=3D=3D
diff --git a/tests/qemu-iotests/114.out b/tests/qemu-iotests/114.out
index 6c6b210..6a2c750 100644
--- a/tests/qemu-iotests/114.out
+++ b/tests/qemu-iotests/114.out
@@ -1,6 +1,6 @@
 QA output created by 114
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D67108864=20
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D'TEST_DIR/t.IMGFMT.base'=20
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3DTEST_DIR/t.IMGFMT.base=20
 image: TEST_DIR/t.IMGFMT
 file format: IMGFMT
 virtual size: 64M (67108864 bytes)
diff --git a/tests/qemu-iotests/115.out b/tests/qemu-iotests/115.out
index 7b2c5e0..dbdad17 100644
--- a/tests/qemu-iotests/115.out
+++ b/tests/qemu-iotests/115.out
@@ -2,7 +2,7 @@ QA output created by 115
=20
 =3D=3D=3D Testing large refcount and L1 table =3D=3D=3D
=20
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D268435456 preallocat=
ion=3D'metadata'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D268435456 preallocat=
ion=3Dmetadata
 No errors were found on the image.
 100.00% allocated clusters
 *** done
diff --git a/tests/qemu-iotests/121.out b/tests/qemu-iotests/121.out
index ff18e2c..5961a44 100644
--- a/tests/qemu-iotests/121.out
+++ b/tests/qemu-iotests/121.out
@@ -4,7 +4,7 @@ QA output created by 121
=20
 --- Test 1 ---
=20
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D66060288 preallocati=
on=3D'metadata'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D66060288 preallocati=
on=3Dmetadata
 Image resized.
 wrote 1049600/1049600 bytes at offset 65011712
 1.001 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -14,7 +14,7 @@ No errors were found on the image.
=20
 --- Test 2 ---
=20
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D66061312 preallocati=
on=3D'metadata'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D66061312 preallocati=
on=3Dmetadata
 Image resized.
 wrote 133120/133120 bytes at offset 66060288
 130 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
diff --git a/tests/qemu-iotests/122.out b/tests/qemu-iotests/122.out
index 1f853b9..0068e96 100644
--- a/tests/qemu-iotests/122.out
+++ b/tests/qemu-iotests/122.out
@@ -5,7 +5,7 @@ wrote 67108864/67108864 bytes at offset 0
=20
 =3D=3D=3D Check allocation status regression with -B =3D=3D=3D
=20
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3DTEST_DIR/t.IMGFMT.base
 wrote 3145728/3145728 bytes at offset 0
 3 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Offset          Length          File
@@ -14,7 +14,7 @@ Offset          Length          File
=20
 =3D=3D=3D Check that zero clusters are kept in overlay =3D=3D=3D
=20
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3DTEST_DIR/t.IMGFMT.base
 wrote 3145728/3145728 bytes at offset 0
 3 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 3145728/3145728 bytes at offset 0
@@ -125,7 +125,7 @@ read 63963136/63963136 bytes at offset 3145728
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=3DIMGFMT size=3D67108864
 wrote 33554432/33554432 bytes at offset 0
 32 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D'TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3DTEST_DIR/t.IMGFMT.base
 wrote 3145728/3145728 bytes at offset 0
 3 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
=20
diff --git a/tests/qemu-iotests/130.out b/tests/qemu-iotests/130.out
index 9ec9d2a..ae95b50 100644
--- a/tests/qemu-iotests/130.out
+++ b/tests/qemu-iotests/130.out
@@ -14,7 +14,7 @@ QEMU X.Y.Z monitor - type 'help' for more information
 image: TEST_DIR/t.IMGFMT
 file format: IMGFMT
 virtual size: 64M (67108864 bytes)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D'TEST_DIR/t.IMGFMT.orig' backing_fmt=3D'raw'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3DTEST_DIR/t.IMGFMT.orig backing_fmt=3Draw
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) c=1B[K=1B[Dco=1B[K=1B[D=1B[Dcom=1B[K=1B[D=1B[D=1B[Dcomm=1B[K=1B[D=
=1B[D=1B[D=1B[Dcommi=1B[K=1B[D=1B[D=1B[D=1B[D=1B[Dcommit=1B[K=1B[D=1B[D=1B=
[D=1B[D=1B[D=1B[Dcommit =1B[K=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[Dcommit t=1B=
[K=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[Dcommit te=1B[K=1B[D=1B[D=1B[D=1B=
[D=1B[D=1B[D=1B[D=1B[D=1B[Dcommit tes=1B[K=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B=
[D=1B[D=1B[D=1B[Dcommit test=1B[K=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=
=1B[D=1B[D=1B[Dcommit testd=1B[K=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B=
[D=1B[D=1B[D=1B[Dcommit testdi=1B[K=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B=
[D=1B[D=1B[D=1B[D=1B[D=1B[Dcommit testdis=1B[K=1B[D=1B[D=1B[D=1B[D=1B[D=1B=
[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[D=1B[Dcommit testdisk=1B[K
 (qemu)=20
@@ -32,7 +32,7 @@ wrote 4096/4096 bytes at offset 0
 image: TEST_DIR/t.IMGFMT
 file format: IMGFMT
 virtual size: 64M (67108864 bytes)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3D'TEST_DIR/t.IMGFMT.orig' backing_fmt=3D'raw'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=3DIMGFMT size=3D67108864 backing_fil=
e=3DTEST_DIR/t.IMGFMT.orig backing_fmt=3Draw
 wrote 4096/4096 bytes at offset 0
 4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 image: TEST_DIR/t.IMGFMT
diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common=
.filter
index 012a812..d6d05de 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -182,7 +182,7 @@ _filter_img_create()
         -e "s# encryption=3Doff##g" \
         -e "s# cluster_size=3D[0-9]\\+##g" \
         -e "s# table_size=3D[0-9]\\+##g" \
-        -e "s# compat=3D'[^']*'##g" \
+        -e "s# compat=3D[^ ]*##g" \
         -e "s# compat6=3D\\(on\\|off\\)##g" \
         -e "s# static=3D\\(on\\|off\\)##g" \
         -e "s# zeroed_grain=3D\\(on\\|off\\)##g" \
diff --git a/util/qemu-option.c b/util/qemu-option.c
index efd6f02..b1fb57c 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -735,14 +735,35 @@ void qemu_opts_del(QemuOpts *opts)
     g_free(opts);
 }
=20
-void qemu_opts_print(QemuOpts *opts, const char *sep)
+/* print value, escaping any commas in value */
+static void escaped_print(const char *value)
+{
+    const char *ptr;
+
+    for (ptr =3D value; *ptr; ++ptr) {
+        if (*ptr =3D=3D ',') {
+            putchar(',');
+        }
+        putchar(*ptr);
+    }
+}
+
+void qemu_opts_print(QemuOpts *opts, const char *separator)
 {
     QemuOpt *opt;
     QemuOptDesc *desc =3D opts->list->desc;
+    const char *sep =3D "";
+
+    if (opts->id) {
+        printf("id=3D%s", opts->id); /* passed id_wellformed -> no comma=
s */
+        sep =3D separator;
+    }
=20
     if (desc[0].name =3D=3D NULL) {
         QTAILQ_FOREACH(opt, &opts->head, next) {
-            printf("%s%s=3D\"%s\"", sep, opt->name, opt->str);
+            printf("%s%s=3D", sep, opt->name);
+            escaped_print(opt->str);
+            sep =3D separator;
         }
         return;
     }
@@ -755,13 +776,15 @@ void qemu_opts_print(QemuOpts *opts, const char *se=
p)
             continue;
         }
         if (desc->type =3D=3D QEMU_OPT_STRING) {
-            printf("%s%s=3D'%s'", sep, desc->name, value);
+            printf("%s%s=3D", sep, desc->name);
+            escaped_print(value);
         } else if ((desc->type =3D=3D QEMU_OPT_SIZE ||
                     desc->type =3D=3D QEMU_OPT_NUMBER) && opt) {
             printf("%s%s=3D%" PRId64, sep, desc->name, opt->value.uint);
         } else {
             printf("%s%s=3D%s", sep, desc->name, value);
         }
+        sep =3D separator;
     }
 }
=20
--=20
2.1.4


