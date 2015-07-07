Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1ZCU4l-0001Gw-MT
	for mharc-qemu-trivial@gnu.org; Tue, 07 Jul 2015 10:42:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56763)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>) id 1ZCU4d-00013K-8u
	for qemu-trivial@nongnu.org; Tue, 07 Jul 2015 10:42:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>) id 1ZCU4X-0004uW-Sh
	for qemu-trivial@nongnu.org; Tue, 07 Jul 2015 10:42:15 -0400
Received: from mail-wg0-x236.google.com ([2a00:1450:400c:c00::236]:32899)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <dirty.ice.hu@gmail.com>)
	id 1ZCU4E-0004dl-35; Tue, 07 Jul 2015 10:41:50 -0400
Received: by wgck11 with SMTP id k11so170154760wgc.0;
	Tue, 07 Jul 2015 07:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=kiQxuYchOfE5nM2/pj26E76RdCZA6F+BHY2cdE0VKBQ=;
	b=XjAF3f/kND47wCayedYN2YvOPUd3vJWVwU+Oq+Zli9W0FuQ0DW1aSBZV90n20U4Nmu
	aGQhvDBALwhCkzH6GkXARUZZ18WIj3erFN0fpffjtnIzzMapJW1VlhNUogilAXMoRIOK
	3gQctCTSuQx/uCSDgOSJJwY71a1eYlrF2nuUdHdTrOdiNDcVSSRBpGSvgvOI6+2qFbTC
	PkNEmBFoeJ8+rM862cRYMJzOnC+UtfOqxWs/mJpGPM35ojPDOqJ8mzUO3+kLYRO7iq07
	odAf3mZaPQ9uL6dmNvvTU+Ux5abyWwPCOeVbbfrYAkkQfddaXBAf1lqGZp+IwaQZWy2M
	ohow==
X-Received: by 10.180.73.145 with SMTP id l17mr66268504wiv.39.1436280108396;
	Tue, 07 Jul 2015 07:41:48 -0700 (PDT)
Received: from nullptr.home.dirty-ice.org (217-197-189-102.pool.digikabel.hu.
	[217.197.189.102])
	by mx.google.com with ESMTPSA id qq1sm33701646wjc.0.2015.07.07.07.41.46
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 07 Jul 2015 07:41:47 -0700 (PDT)
From: "=?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?="
	<dirty.ice.hu@gmail.com>
X-Google-Original-From: =?UTF-8?q?K=C5=91v=C3=A1g=C3=B3=2C=20Zolt=C3=A1n?=
	<DirtY.iCE.hu@gmail.com>
To: qemu-devel@nongnu.org
Date: Tue,  7 Jul 2015 16:42:10 +0200
Message-Id: <cff8241a8e30f0d39e0f50a435965cdd130cd5d5.1436279924.git.DirtY.iCE.hu@gmail.com>
X-Mailer: git-send-email 2.4.5
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2a00:1450:400c:c00::236
Cc: qemu-trivial@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>
Subject: [Qemu-trivial] [PATCH v3] opts: produce valid command line in
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
X-List-Received-Date: Tue, 07 Jul 2015 14:42:21 -0000

This will let us print options in a format that the user would actually
write it on the command line (foo=bar,baz=asd,etc=def), without
prepending a spurious comma at the beginning of the list, or quoting
values unnecessarily.  This patch provides the following changes:
* write and id=, if the option has an id
* do not print separator before the first element
* do not quote string arguments
* properly escape commas (,) for QEMU

Signed-off-by: Kővágó, Zoltán <DirtY.iCE.hu@gmail.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>
---
Change from v2:
* fixed qemu-iotests (qemu_opts_print no longer prints apostrophes
  around string arguments)
Change from v1:
* updated escaped_print as suggested by Markus

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
 tests/qemu-iotests/085.out       | 38 +++++++++++++++++++-------------------
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
index 7e130cc..78a5304 100644
--- a/block.c
+++ b/block.c
@@ -3813,7 +3813,7 @@ void bdrv_img_create(const char *filename, const char *fmt,
     }
 
     if (!quiet) {
-        printf("Formatting '%s', fmt=%s", filename, fmt);
+        printf("Formatting '%s', fmt=%s ", filename, fmt);
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
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=6442450944 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=6442450944 backing_file=TEST_DIR/t.IMGFMT.base
 Filling test image
 
 === IO: pattern 1
diff --git a/tests/qemu-iotests/018.out b/tests/qemu-iotests/018.out
index 39a6011..d66bd63 100644
--- a/tests/qemu-iotests/018.out
+++ b/tests/qemu-iotests/018.out
@@ -269,7 +269,7 @@ wrote 65536/65536 bytes at offset 4295032832
 No errors were found on the image.
 Creating test image with backing file
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=6442450944 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=6442450944 backing_file=TEST_DIR/t.IMGFMT.base
 Filling test image
 
 === IO: pattern 1
diff --git a/tests/qemu-iotests/019.out b/tests/qemu-iotests/019.out
index 4695b97..615450a 100644
--- a/tests/qemu-iotests/019.out
+++ b/tests/qemu-iotests/019.out
@@ -269,7 +269,7 @@ wrote 65536/65536 bytes at offset 4296015872
 No errors were found on the image.
 Creating test image with backing file
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=6442450944 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=6442450944 backing_file=TEST_DIR/t.IMGFMT.base
 Filling test image
 
 === IO: pattern 43
diff --git a/tests/qemu-iotests/020.out b/tests/qemu-iotests/020.out
index 71aab1c..134aa29 100644
--- a/tests/qemu-iotests/020.out
+++ b/tests/qemu-iotests/020.out
@@ -269,7 +269,7 @@ wrote 65536/65536 bytes at offset 4295032832
 No errors were found on the image.
 Creating test image with backing file
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=6442450944 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=6442450944 backing_file=TEST_DIR/t.IMGFMT.base
 Filling test image
 
 === IO: pattern 1
diff --git a/tests/qemu-iotests/024.out b/tests/qemu-iotests/024.out
index 521d469..9b9ef3a 100644
--- a/tests/qemu-iotests/024.out
+++ b/tests/qemu-iotests/024.out
@@ -33,7 +33,7 @@ wrote 131072/131072 bytes at offset 786432
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Creating COW image
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824 backing_file='TEST_DIR/t.IMGFMT.base_old'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=1073741824 backing_file=TEST_DIR/t.IMGFMT.base_old
 === IO: pattern 0x33
 wrote 262144/262144 bytes at offset 0
 256 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
diff --git a/tests/qemu-iotests/028.out b/tests/qemu-iotests/028.out
index 5db167c..29c9972 100644
--- a/tests/qemu-iotests/028.out
+++ b/tests/qemu-iotests/028.out
@@ -70,7 +70,7 @@ wrote 512/512 bytes at offset 3221225984
 No errors were found on the image.
 Creating test image with backing file
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294968832 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294968832 backing_file=TEST_DIR/t.IMGFMT.base
 Filling test image
 
 === IO: pattern 196
@@ -468,7 +468,7 @@ No errors were found on the image.
 
 block-backup
 
-Formatting 'TEST_DIR/t.IMGFMT.copy', fmt=IMGFMT size=4294968832 backing_file='TEST_DIR/t.IMGFMT.base' backing_fmt='IMGFMT'
+Formatting 'TEST_DIR/t.IMGFMT.copy', fmt=IMGFMT size=4294968832 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
 (qemu)
 (qemu) i[K[Din[K[D[Dinf[K[D[D[Dinfo[K[D[D[D[Dinfo [K[D[D[D[D[Dinfo b[K[D[D[D[D[D[Dinfo bl[K[D[D[D[D[D[D[Dinfo blo[K[D[D[D[D[D[D[D[Dinfo bloc[K[D[D[D[D[D[D[D[D[Dinfo block[K[D[D[D[D[D[D[D[D[D[Dinfo block-[K[D[D[D[D[D[D[D[D[D[D[Dinfo block-j[K[D[D[D[D[D[D[D[D[D[D[D[Dinfo block-jo[K[D[D[D[D[D[D[D[D[D[D[D[D[Dinfo block-job[K[D[D[D[D[D[D[D[D[D[D[D[D[D[Dinfo block-jobs[K
 Type backup, device disk: Completed 0 of 4294968832 bytes, speed limit 0 bytes/s
diff --git a/tests/qemu-iotests/034.out b/tests/qemu-iotests/034.out
index d12daf2..34fda80 100644
--- a/tests/qemu-iotests/034.out
+++ b/tests/qemu-iotests/034.out
@@ -4,7 +4,7 @@ QA output created by 034
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
 wrote 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=6442450944 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=6442450944 backing_file=TEST_DIR/t.IMGFMT.base
 
 == zero write with backing file ==
 wrote 196608/196608 bytes at offset 65536
diff --git a/tests/qemu-iotests/037.out b/tests/qemu-iotests/037.out
index dc40a02..55b30fd 100644
--- a/tests/qemu-iotests/037.out
+++ b/tests/qemu-iotests/037.out
@@ -514,7 +514,7 @@ wrote 512/512 bytes at offset 130048
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 512/512 bytes at offset 130560
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=6442450944 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=6442450944 backing_file=TEST_DIR/t.IMGFMT.base
 
 == COW in a single cluster ==
 wrote 2048/2048 bytes at offset 0
diff --git a/tests/qemu-iotests/038.out b/tests/qemu-iotests/038.out
index e1a7e94..ecb656e 100644
--- a/tests/qemu-iotests/038.out
+++ b/tests/qemu-iotests/038.out
@@ -514,7 +514,7 @@ wrote 65536/65536 bytes at offset 16646144
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 65536/65536 bytes at offset 16711680
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=6442450944 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=6442450944 backing_file=TEST_DIR/t.IMGFMT.base
 
 == Some concurrent requests touching the same cluster ==
 wrote 65536/65536 bytes at offset XXX
diff --git a/tests/qemu-iotests/039.out b/tests/qemu-iotests/039.out
index d09751f..1ff24b2 100644
--- a/tests/qemu-iotests/039.out
+++ b/tests/qemu-iotests/039.out
@@ -66,7 +66,7 @@ No errors were found on the image.
 
 == Committing to a backing file with lazy_refcounts=on ==
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134217728
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/t.IMGFMT.base
 wrote 512/512 bytes at offset 0
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Image committed.
diff --git a/tests/qemu-iotests/043.out b/tests/qemu-iotests/043.out
index 012cc00..33f8cc3 100644
--- a/tests/qemu-iotests/043.out
+++ b/tests/qemu-iotests/043.out
@@ -4,20 +4,20 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
 == backing file references self ==
 qemu-img: Backing file 'TEST_DIR/t.IMGFMT' creates an infinite loop.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/t.IMGFMT.base
 
 == parent references self ==
 qemu-img: Backing file 'TEST_DIR/t.IMGFMT' creates an infinite loop.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file='TEST_DIR/t.IMGFMT.1.base'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file='TEST_DIR/t.IMGFMT.2.base'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file='TEST_DIR/t.IMGFMT.3.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/t.IMGFMT.1.base
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/t.IMGFMT.2.base
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/t.IMGFMT.3.base
 
 == ancestor references another ancestor ==
 qemu-img: Backing file 'TEST_DIR/t.IMGFMT.2.base' creates an infinite loop.
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file='TEST_DIR/t.IMGFMT.1.base'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file='TEST_DIR/t.IMGFMT.2.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/t.IMGFMT.1.base
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/t.IMGFMT.2.base
 
 == finite chain of length 3 (human) ==
 image: TEST_DIR/t.IMGFMT
diff --git a/tests/qemu-iotests/046.out b/tests/qemu-iotests/046.out
index 9d18af5..ca2c740 100644
--- a/tests/qemu-iotests/046.out
+++ b/tests/qemu-iotests/046.out
@@ -66,7 +66,7 @@ wrote 65536/65536 bytes at offset 1966080
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 65536/65536 bytes at offset 2031616
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=6442450944 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=6442450944 backing_file=TEST_DIR/t.IMGFMT.base
 
 == Some concurrent requests touching the same cluster ==
 blkdebug: Suspended request 'A'
diff --git a/tests/qemu-iotests/049.out b/tests/qemu-iotests/049.out
index 9f93666..cf839f1 100644
--- a/tests/qemu-iotests/049.out
+++ b/tests/qemu-iotests/049.out
@@ -157,30 +157,30 @@ Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 encryption=off cluster_si
 == Check compat level option ==
 
 qemu-img create -f qcow2 -o compat=0.10 TEST_DIR/t.qcow2 64M
-Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 compat='0.10' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 compat=0.10 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
 
 qemu-img create -f qcow2 -o compat=1.1 TEST_DIR/t.qcow2 64M
-Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 compat='1.1' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 compat=1.1 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
 
 qemu-img create -f qcow2 -o compat=0.42 TEST_DIR/t.qcow2 64M
 qemu-img: TEST_DIR/t.qcow2: Invalid compatibility level: '0.42'
-Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 compat='0.42' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 compat=0.42 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
 
 qemu-img create -f qcow2 -o compat=foobar TEST_DIR/t.qcow2 64M
 qemu-img: TEST_DIR/t.qcow2: Invalid compatibility level: 'foobar'
-Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 compat='foobar' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 compat=foobar encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
 
 == Check preallocation option ==
 
 qemu-img create -f qcow2 -o preallocation=off TEST_DIR/t.qcow2 64M
-Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 encryption=off cluster_size=65536 preallocation='off' lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 encryption=off cluster_size=65536 preallocation=off lazy_refcounts=off refcount_bits=16
 
 qemu-img create -f qcow2 -o preallocation=metadata TEST_DIR/t.qcow2 64M
-Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 encryption=off cluster_size=65536 preallocation='metadata' lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 encryption=off cluster_size=65536 preallocation=metadata lazy_refcounts=off refcount_bits=16
 
 qemu-img create -f qcow2 -o preallocation=1234 TEST_DIR/t.qcow2 64M
 qemu-img: TEST_DIR/t.qcow2: invalid parameter value: 1234
-Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 encryption=off cluster_size=65536 preallocation='1234' lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 encryption=off cluster_size=65536 preallocation=1234 lazy_refcounts=off refcount_bits=16
 
 == Check encryption option ==
 
@@ -199,16 +199,16 @@ Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 encryption=on cluster_siz
 == Check lazy_refcounts option (only with v3) ==
 
 qemu-img create -f qcow2 -o compat=1.1,lazy_refcounts=off TEST_DIR/t.qcow2 64M
-Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 compat='1.1' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 compat=1.1 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
 
 qemu-img create -f qcow2 -o compat=1.1,lazy_refcounts=on TEST_DIR/t.qcow2 64M
-Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 compat='1.1' encryption=off cluster_size=65536 lazy_refcounts=on refcount_bits=16
+Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 compat=1.1 encryption=off cluster_size=65536 lazy_refcounts=on refcount_bits=16
 
 qemu-img create -f qcow2 -o compat=0.10,lazy_refcounts=off TEST_DIR/t.qcow2 64M
-Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 compat='0.10' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 compat=0.10 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
 
 qemu-img create -f qcow2 -o compat=0.10,lazy_refcounts=on TEST_DIR/t.qcow2 64M
 qemu-img: TEST_DIR/t.qcow2: Lazy refcounts only supported with compatibility level 1.1 and above (use compat=1.1 or greater)
-Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 compat='0.10' encryption=off cluster_size=65536 lazy_refcounts=on refcount_bits=16
+Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=67108864 compat=0.10 encryption=off cluster_size=65536 lazy_refcounts=on refcount_bits=16
 
 *** done
diff --git a/tests/qemu-iotests/050.out b/tests/qemu-iotests/050.out
index a6cb2e6..397cf7f 100644
--- a/tests/qemu-iotests/050.out
+++ b/tests/qemu-iotests/050.out
@@ -7,7 +7,7 @@ wrote 1048576/1048576 bytes at offset 0
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=10485760
 wrote 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=10485760 backing_file='TEST_DIR/t.IMGFMT.old'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=10485760 backing_file=TEST_DIR/t.IMGFMT.old
 wrote 1048576/1048576 bytes at offset 0
 1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
diff --git a/tests/qemu-iotests/051.out b/tests/qemu-iotests/051.out
index 23c2823..0429be2 100644
--- a/tests/qemu-iotests/051.out
+++ b/tests/qemu-iotests/051.out
@@ -1,6 +1,6 @@
 QA output created by 051
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/t.IMGFMT.base
 
 === Unknown option ===
 
diff --git a/tests/qemu-iotests/061.out b/tests/qemu-iotests/061.out
index 5ec248f..d7c85cb 100644
--- a/tests/qemu-iotests/061.out
+++ b/tests/qemu-iotests/061.out
@@ -334,7 +334,7 @@ read 131072/131072 bytes at offset 0
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
 wrote 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base
 read 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 65536/65536 bytes at offset 0
@@ -350,7 +350,7 @@ read 65536/65536 bytes at offset 65536
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
 wrote 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base
 wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 131072/131072 bytes at offset 0
@@ -369,7 +369,7 @@ read 65536/65536 bytes at offset 65536
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
 wrote 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base
 wrote 131072/131072 bytes at offset 0
 128 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 No errors were found on the image.
@@ -393,7 +393,7 @@ read 67108864/67108864 bytes at offset 0
 === Testing progress report without snapshot ===
 
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=4294967296
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 backing_file=TEST_DIR/t.IMGFMT.base
 wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 65536/65536 bytes at offset 1073741824
@@ -408,7 +408,7 @@ No errors were found on the image.
 === Testing progress report with snapshot ===
 
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=4294967296
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 backing_file=TEST_DIR/t.IMGFMT.base
 wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 65536/65536 bytes at offset 1073741824
diff --git a/tests/qemu-iotests/069.out b/tests/qemu-iotests/069.out
index 4d7e63c..c78e8c2 100644
--- a/tests/qemu-iotests/069.out
+++ b/tests/qemu-iotests/069.out
@@ -3,6 +3,6 @@ QA output created by 069
 === Creating an image with a backing file and deleting that file ===
 
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=131072
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=131072 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=131072 backing_file=TEST_DIR/t.IMGFMT.base
 qemu-io: can't open device TEST_DIR/t.IMGFMT: Could not open backing file: Could not open 'TEST_DIR/t.IMGFMT.base': No such file or directory
 *** done
diff --git a/tests/qemu-iotests/073.out b/tests/qemu-iotests/073.out
index 733d79c..de54524 100644
--- a/tests/qemu-iotests/073.out
+++ b/tests/qemu-iotests/073.out
@@ -2,7 +2,7 @@ QA output created by 073
 
 == creating backing file ==
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=134217728
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728 backing_file=TEST_DIR/t.IMGFMT.base
 wrote 134217728/134217728 bytes at offset 0
 128 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
diff --git a/tests/qemu-iotests/079.out b/tests/qemu-iotests/079.out
index 6dc5d57..aab922f 100644
--- a/tests/qemu-iotests/079.out
+++ b/tests/qemu-iotests/079.out
@@ -1,14 +1,14 @@
 QA output created by 079
 === Check option preallocation and cluster_size ===
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 preallocation='metadata'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 preallocation='metadata'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 preallocation='metadata'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 preallocation='metadata'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 preallocation='metadata'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 preallocation='metadata'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 preallocation='metadata'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 preallocation='metadata'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 preallocation=metadata
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 preallocation=metadata
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 preallocation=metadata
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 preallocation=metadata
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 preallocation=metadata
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 preallocation=metadata
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 preallocation=metadata
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 preallocation=metadata
 qemu-img: TEST_DIR/t.IMGFMT: Cluster size must be a power of two between 512 and 2048k
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 preallocation='metadata'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294967296 preallocation=metadata
 *** done
diff --git a/tests/qemu-iotests/082.out b/tests/qemu-iotests/082.out
index 3a749b8..a952330 100644
--- a/tests/qemu-iotests/082.out
+++ b/tests/qemu-iotests/082.out
@@ -147,10 +147,10 @@ refcount_bits    Width of a reference count entry in bits
 nocow            Turn off copy-on-write (valid only on btrfs)
 
 Testing: create -f qcow2 -o backing_file=TEST_DIR/t.qcow2,,help TEST_DIR/t.qcow2 128M
-Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/t.qcow2,help' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/t.qcow2,,help encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
 
 Testing: create -f qcow2 -o backing_file=TEST_DIR/t.qcow2,,? TEST_DIR/t.qcow2 128M
-Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/t.qcow2,?' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/t.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/t.qcow2,,? encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
 
 Testing: create -f qcow2 -o backing_file=TEST_DIR/t.qcow2, -o help TEST_DIR/t.qcow2 128M
 qemu-img: Invalid option list: backing_file=TEST_DIR/t.qcow2,
diff --git a/tests/qemu-iotests/085.out b/tests/qemu-iotests/085.out
index 5eb8b94..a6cf19e 100644
--- a/tests/qemu-iotests/085.out
+++ b/tests/qemu-iotests/085.out
@@ -11,7 +11,7 @@ Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=134217728
 
 === Create a single snapshot on virtio0 ===
 
-Formatting 'TEST_DIR/1-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/t.qcow2.orig' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/1-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/t.qcow2.orig backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
 {"return": {}}
 
 === Invalid command - missing device and nodename ===
@@ -25,31 +25,31 @@ Formatting 'TEST_DIR/1-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file
 
 === Create several transactional group snapshots ===
 
-Formatting 'TEST_DIR/2-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/1-snapshot-v0.qcow2' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
-Formatting 'TEST_DIR/2-snapshot-v1.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/t.qcow2' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/2-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/1-snapshot-v0.qcow2 backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/2-snapshot-v1.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/t.qcow2 backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
 {"return": {}}
-Formatting 'TEST_DIR/3-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/2-snapshot-v0.qcow2' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
-Formatting 'TEST_DIR/3-snapshot-v1.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/2-snapshot-v1.qcow2' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/3-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/2-snapshot-v0.qcow2 backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/3-snapshot-v1.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/2-snapshot-v1.qcow2 backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
 {"return": {}}
-Formatting 'TEST_DIR/4-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/3-snapshot-v0.qcow2' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
-Formatting 'TEST_DIR/4-snapshot-v1.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/3-snapshot-v1.qcow2' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/4-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/3-snapshot-v0.qcow2 backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/4-snapshot-v1.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/3-snapshot-v1.qcow2 backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
 {"return": {}}
-Formatting 'TEST_DIR/5-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/4-snapshot-v0.qcow2' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
-Formatting 'TEST_DIR/5-snapshot-v1.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/4-snapshot-v1.qcow2' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/5-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/4-snapshot-v0.qcow2 backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/5-snapshot-v1.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/4-snapshot-v1.qcow2 backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
 {"return": {}}
-Formatting 'TEST_DIR/6-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/5-snapshot-v0.qcow2' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
-Formatting 'TEST_DIR/6-snapshot-v1.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/5-snapshot-v1.qcow2' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/6-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/5-snapshot-v0.qcow2 backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/6-snapshot-v1.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/5-snapshot-v1.qcow2 backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
 {"return": {}}
-Formatting 'TEST_DIR/7-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/6-snapshot-v0.qcow2' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
-Formatting 'TEST_DIR/7-snapshot-v1.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/6-snapshot-v1.qcow2' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/7-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/6-snapshot-v0.qcow2 backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/7-snapshot-v1.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/6-snapshot-v1.qcow2 backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
 {"return": {}}
-Formatting 'TEST_DIR/8-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/7-snapshot-v0.qcow2' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
-Formatting 'TEST_DIR/8-snapshot-v1.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/7-snapshot-v1.qcow2' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/8-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/7-snapshot-v0.qcow2 backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/8-snapshot-v1.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/7-snapshot-v1.qcow2 backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
 {"return": {}}
-Formatting 'TEST_DIR/9-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/8-snapshot-v0.qcow2' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
-Formatting 'TEST_DIR/9-snapshot-v1.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/8-snapshot-v1.qcow2' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/9-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/8-snapshot-v0.qcow2 backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/9-snapshot-v1.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/8-snapshot-v1.qcow2 backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
 {"return": {}}
-Formatting 'TEST_DIR/10-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/9-snapshot-v0.qcow2' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
-Formatting 'TEST_DIR/10-snapshot-v1.qcow2', fmt=qcow2 size=134217728 backing_file='TEST_DIR/9-snapshot-v1.qcow2' backing_fmt='qcow2' encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/10-snapshot-v0.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/9-snapshot-v0.qcow2 backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
+Formatting 'TEST_DIR/10-snapshot-v1.qcow2', fmt=qcow2 size=134217728 backing_file=TEST_DIR/9-snapshot-v1.qcow2 backing_fmt=qcow2 encryption=off cluster_size=65536 lazy_refcounts=off refcount_bits=16
 {"return": {}}
 *** done
diff --git a/tests/qemu-iotests/095.out b/tests/qemu-iotests/095.out
index 267c483..2360061 100644
--- a/tests/qemu-iotests/095.out
+++ b/tests/qemu-iotests/095.out
@@ -1,7 +1,7 @@
 QA output created by 095
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=5242880
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=104857600 backing_file='TEST_DIR/t.IMGFMT.base'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=104857600 backing_file='TEST_DIR/t.IMGFMT.snp1'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=104857600 backing_file=TEST_DIR/t.IMGFMT.base
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=104857600 backing_file=TEST_DIR/t.IMGFMT.snp1
 
 === Base image info before commit and resize ===
 image: TEST_DIR/t.IMGFMT.base
diff --git a/tests/qemu-iotests/097.out b/tests/qemu-iotests/097.out
index 81651f4..48abd2e 100644
--- a/tests/qemu-iotests/097.out
+++ b/tests/qemu-iotests/097.out
@@ -3,8 +3,8 @@ QA output created by 097
 === Test pass 0 ===
 
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
-Formatting 'TEST_DIR/t.IMGFMT.itmd', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.base'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.itmd'
+Formatting 'TEST_DIR/t.IMGFMT.itmd', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.itmd
 wrote 196608/196608 bytes at offset 0
 192 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 131072/131072 bytes at offset 65536
@@ -32,8 +32,8 @@ Offset          Length          File
 === Test pass 1 ===
 
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
-Formatting 'TEST_DIR/t.IMGFMT.itmd', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.base'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.itmd'
+Formatting 'TEST_DIR/t.IMGFMT.itmd', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.itmd
 wrote 196608/196608 bytes at offset 0
 192 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 131072/131072 bytes at offset 65536
@@ -62,8 +62,8 @@ Offset          Length          File
 === Test pass 2 ===
 
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
-Formatting 'TEST_DIR/t.IMGFMT.itmd', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.base'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.itmd'
+Formatting 'TEST_DIR/t.IMGFMT.itmd', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.itmd
 wrote 196608/196608 bytes at offset 0
 192 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 131072/131072 bytes at offset 65536
@@ -92,8 +92,8 @@ Offset          Length          File
 === Test pass 3 ===
 
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
-Formatting 'TEST_DIR/t.IMGFMT.itmd', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.base'
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.itmd'
+Formatting 'TEST_DIR/t.IMGFMT.itmd', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.itmd
 wrote 196608/196608 bytes at offset 0
 192 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 131072/131072 bytes at offset 65536
diff --git a/tests/qemu-iotests/098.out b/tests/qemu-iotests/098.out
index e08a189..7634d0e 100644
--- a/tests/qemu-iotests/098.out
+++ b/tests/qemu-iotests/098.out
@@ -3,7 +3,7 @@ QA output created by 098
 === l1_update ===
 
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base
 wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 qemu-img: Could not empty blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMGFMT: Input/output error
@@ -12,7 +12,7 @@ No errors were found on the image.
 === empty_image_prepare ===
 
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base
 wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 qemu-img: Could not empty blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMGFMT: Input/output error
@@ -25,7 +25,7 @@ No errors were found on the image.
 === reftable_update ===
 
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base
 wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 qemu-img: Could not empty blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMGFMT: Input/output error
@@ -39,7 +39,7 @@ No errors were found on the image.
 === refblock_alloc ===
 
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base
 wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 qemu-img: Could not empty blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMGFMT: Input/output error
diff --git a/tests/qemu-iotests/110.out b/tests/qemu-iotests/110.out
index 152bacf..0270980 100644
--- a/tests/qemu-iotests/110.out
+++ b/tests/qemu-iotests/110.out
@@ -3,7 +3,7 @@ QA output created by 110
 === Reconstructable filename ===
 
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=t.IMGFMT.base
 image: TEST_DIR/t.IMGFMT
 file format: IMGFMT
 virtual size: 64M (67108864 bytes)
@@ -15,5 +15,5 @@ qemu-img: Cannot use relative backing file names for 'json:{"driver": "IMGFMT",
 
 === Backing name is always relative to the backed image ===
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=t.IMGFMT.base
 *** done
diff --git a/tests/qemu-iotests/112.out b/tests/qemu-iotests/112.out
index 9a98633..8dd3df0 100644
--- a/tests/qemu-iotests/112.out
+++ b/tests/qemu-iotests/112.out
@@ -21,9 +21,9 @@ refcount bits: 16
 
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 refcount bits: 16
-qemu-img: TEST_DIR/t.IMGFMT: Different refcount widths than 16 bits require compatibility level 1.1 or above (use compat=1.1 or greater)
+qemu-img: TEST_DIR/t.IMGFMT: Different refcount widths than 16 bits require compatibility level 1.1 or above (use or greater)
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
-qemu-img: TEST_DIR/t.IMGFMT: Different refcount widths than 16 bits require compatibility level 1.1 or above (use compat=1.1 or greater)
+qemu-img: TEST_DIR/t.IMGFMT: Different refcount widths than 16 bits require compatibility level 1.1 or above (use or greater)
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 
 === Snapshot limit on refcount_bits=1 ===
diff --git a/tests/qemu-iotests/114.out b/tests/qemu-iotests/114.out
index 6c6b210..6a2c750 100644
--- a/tests/qemu-iotests/114.out
+++ b/tests/qemu-iotests/114.out
@@ -1,6 +1,6 @@
 QA output created by 114
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.base' 
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base 
 image: TEST_DIR/t.IMGFMT
 file format: IMGFMT
 virtual size: 64M (67108864 bytes)
diff --git a/tests/qemu-iotests/115.out b/tests/qemu-iotests/115.out
index 7b2c5e0..dbdad17 100644
--- a/tests/qemu-iotests/115.out
+++ b/tests/qemu-iotests/115.out
@@ -2,7 +2,7 @@ QA output created by 115
 
 === Testing large refcount and L1 table ===
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=268435456 preallocation='metadata'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=268435456 preallocation=metadata
 No errors were found on the image.
 100.00% allocated clusters
 *** done
diff --git a/tests/qemu-iotests/121.out b/tests/qemu-iotests/121.out
index ff18e2c..5961a44 100644
--- a/tests/qemu-iotests/121.out
+++ b/tests/qemu-iotests/121.out
@@ -4,7 +4,7 @@ QA output created by 121
 
 --- Test 1 ---
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=66060288 preallocation='metadata'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=66060288 preallocation=metadata
 Image resized.
 wrote 1049600/1049600 bytes at offset 65011712
 1.001 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
@@ -14,7 +14,7 @@ No errors were found on the image.
 
 --- Test 2 ---
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=66061312 preallocation='metadata'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=66061312 preallocation=metadata
 Image resized.
 wrote 133120/133120 bytes at offset 66060288
 130 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
diff --git a/tests/qemu-iotests/122.out b/tests/qemu-iotests/122.out
index 1f853b9..0068e96 100644
--- a/tests/qemu-iotests/122.out
+++ b/tests/qemu-iotests/122.out
@@ -5,7 +5,7 @@ wrote 67108864/67108864 bytes at offset 0
 
 === Check allocation status regression with -B ===
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base
 wrote 3145728/3145728 bytes at offset 0
 3 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Offset          Length          File
@@ -14,7 +14,7 @@ Offset          Length          File
 
 === Check that zero clusters are kept in overlay ===
 
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base
 wrote 3145728/3145728 bytes at offset 0
 3 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 3145728/3145728 bytes at offset 0
@@ -125,7 +125,7 @@ read 63963136/63963136 bytes at offset 3145728
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
 wrote 33554432/33554432 bytes at offset 0
 32 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.base'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base
 wrote 3145728/3145728 bytes at offset 0
 3 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
diff --git a/tests/qemu-iotests/130.out b/tests/qemu-iotests/130.out
index ea68b5d..3b3cc09 100644
--- a/tests/qemu-iotests/130.out
+++ b/tests/qemu-iotests/130.out
@@ -14,7 +14,7 @@ QEMU X.Y.Z monitor - type 'help' for more information
 image: TEST_DIR/t.IMGFMT
 file format: IMGFMT
 virtual size: 64M (67108864 bytes)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.orig' backing_fmt='raw'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.orig backing_fmt=raw
 QEMU X.Y.Z monitor - type 'help' for more information
 (qemu) c[K[Dco[K[D[Dcom[K[D[D[Dcomm[K[D[D[D[Dcommi[K[D[D[D[D[Dcommit[K[D[D[D[D[D[Dcommit [K[D[D[D[D[D[D[Dcommit i[K[D[D[D[D[D[D[D[Dcommit id[K[D[D[D[D[D[D[D[D[Dcommit ide[K[D[D[D[D[D[D[D[D[D[Dcommit ide0[K[D[D[D[D[D[D[D[D[D[D[Dcommit ide0-[K[D[D[D[D[D[D[D[D[D[D[D[Dcommit ide0-h[K[D[D[D[D[D[D[D[D[D[D[D[D[Dcommit ide0-hd[K[D[D[D[D[D[D[D[D[D[D[D[D[D[Dcommit ide0-hd0[K
 (qemu) 
@@ -32,7 +32,7 @@ wrote 4096/4096 bytes at offset 0
 image: TEST_DIR/t.IMGFMT
 file format: IMGFMT
 virtual size: 64M (67108864 bytes)
-Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file='TEST_DIR/t.IMGFMT.orig' backing_fmt='raw'
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.orig backing_fmt=raw
 wrote 4096/4096 bytes at offset 0
 4 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 image: TEST_DIR/t.IMGFMT
diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index 012a812..d6d05de 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -182,7 +182,7 @@ _filter_img_create()
         -e "s# encryption=off##g" \
         -e "s# cluster_size=[0-9]\\+##g" \
         -e "s# table_size=[0-9]\\+##g" \
-        -e "s# compat='[^']*'##g" \
+        -e "s# compat=[^ ]*##g" \
         -e "s# compat6=\\(on\\|off\\)##g" \
         -e "s# static=\\(on\\|off\\)##g" \
         -e "s# zeroed_grain=\\(on\\|off\\)##g" \
diff --git a/util/qemu-option.c b/util/qemu-option.c
index efe9d27..e54ac0d 100644
--- a/util/qemu-option.c
+++ b/util/qemu-option.c
@@ -730,14 +730,35 @@ void qemu_opts_del(QemuOpts *opts)
     g_free(opts);
 }
 
-void qemu_opts_print(QemuOpts *opts, const char *sep)
+/* print value, escaping any commas in value */
+static void escaped_print(const char *value)
+{
+    const char *ptr;
+
+    for (ptr = value; *ptr; ++ptr) {
+        if (*ptr == ',') {
+            putchar(',');
+        }
+        putchar(*ptr);
+    }
+}
+
+void qemu_opts_print(QemuOpts *opts, const char *separator)
 {
     QemuOpt *opt;
     QemuOptDesc *desc = opts->list->desc;
+    const char *sep = "";
+
+    if (opts->id) {
+        printf("id=%s", opts->id); /* passed id_wellformed -> no commas */
+        sep = separator;
+    }
 
     if (desc[0].name == NULL) {
         QTAILQ_FOREACH(opt, &opts->head, next) {
-            printf("%s%s=\"%s\"", sep, opt->name, opt->str);
+            printf("%s%s=", sep, opt->name);
+            escaped_print(opt->str);
+            sep = separator;
         }
         return;
     }
@@ -750,13 +771,15 @@ void qemu_opts_print(QemuOpts *opts, const char *sep)
             continue;
         }
         if (desc->type == QEMU_OPT_STRING) {
-            printf("%s%s='%s'", sep, desc->name, value);
+            printf("%s%s=", sep, desc->name);
+            escaped_print(value);
         } else if ((desc->type == QEMU_OPT_SIZE ||
                     desc->type == QEMU_OPT_NUMBER) && opt) {
             printf("%s%s=%" PRId64, sep, desc->name, opt->value.uint);
         } else {
             printf("%s%s=%s", sep, desc->name, value);
         }
+        sep = separator;
     }
 }
 
-- 
2.4.5


