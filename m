Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1YsBpz-0008Sk-5O
	for mharc-qemu-trivial@gnu.org; Tue, 12 May 2015 11:11:15 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YsBpu-0008PR-VY
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 11:11:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YsBpq-0005qH-IG
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 11:11:10 -0400
Received: from resqmta-po-05v.sys.comcast.net ([96.114.154.164]:57792)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eblake@redhat.com>) id 1YsBpq-0005q0-DD
	for qemu-trivial@nongnu.org; Tue, 12 May 2015 11:11:06 -0400
Received: from resomta-po-07v.sys.comcast.net ([96.114.154.231])
	by resqmta-po-05v.sys.comcast.net with comcast
	id T3Ar1q0084zp9eg013B4mp; Tue, 12 May 2015 15:11:04 +0000
Received: from red.redhat.com ([24.10.254.122])
	by resomta-po-07v.sys.comcast.net with comcast
	id T3Ax1q0052fD5rL013B2uK; Tue, 12 May 2015 15:11:03 +0000
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-trivial@nongnu.org
Date: Tue, 12 May 2015 09:10:56 -0600
Message-Id: <1431443456-21605-1-git-send-email-eblake@redhat.com>
X-Mailer: git-send-email 2.1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=comcast.net;
	s=q20140121; t=1431443464;
	bh=0HaQeHrBihCpzepcKDXh1zxtBjFO8LyeDTZva82sI/U=;
	h=Received:Received:From:To:Subject:Date:Message-Id;
	b=ZvShqBZC7eycFciPDu6KJTp0Cn63iXCbODLlf00DcWZc25VEcbRxzdh8rf6n+hLuk
	uWnp/w9MekmW1LLVgIJ+1qXdo84Jlq9RVA9uyAzeMvrMAYEzNfMERPjgR2iYCONLjT
	gHTtMgRbA2ouQ+Ti4HLPrsBtUemDj9Qdgzuj+q+3OB1Bimsc4ZFfzLMlsraTXFdh1k
	ByPL1jxPmIr/7rz3wljDr4OMovHWecv1yZ7hvogDGB+3EW8HAdOKU8KjRKoLwTQfFw
	sz4qOcqme99Ep7hCg2NIN0QTD3E0Xo7OeJ0jDqOy17vDCSj8/cKg1u0TUOJ2IrbdDo
	5Nvi2f53+tszg==
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 96.114.154.164
Cc: kwolf@redhat.com, qemu-block@nongnu.org
Subject: [Qemu-trivial] [PATCH] qemu-io: Use getopt() correctly
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
X-List-Received-Date: Tue, 12 May 2015 15:11:12 -0000

POSIX says getopt() returns -1 on completion.  While Linux happens
to define EOF as -1, this definition is not required by POSIX, and
there may be platforms where checking for EOF instead of -1 would
lead to an infinite loop.

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 qemu-io-cmds.c | 16 ++++++++--------
 qemu-io.c      |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 1afcfc0..52dc611 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -646,7 +646,7 @@ static int read_f(BlockBackend *blk, int argc, char **argv)
     int total = 0;
     int pattern = 0, pattern_offset = 0, pattern_count = 0;

-    while ((c = getopt(argc, argv, "bCl:pP:qs:v")) != EOF) {
+    while ((c = getopt(argc, argv, "bCl:pP:qs:v")) != -1) {
         switch (c) {
         case 'b':
             bflag = 1;
@@ -830,7 +830,7 @@ static int readv_f(BlockBackend *blk, int argc, char **argv)
     int pattern = 0;
     int Pflag = 0;

-    while ((c = getopt(argc, argv, "CP:qv")) != EOF) {
+    while ((c = getopt(argc, argv, "CP:qv")) != -1) {
         switch (c) {
         case 'C':
             Cflag = 1;
@@ -961,7 +961,7 @@ static int write_f(BlockBackend *blk, int argc, char **argv)
     int total = 0;
     int pattern = 0xcd;

-    while ((c = getopt(argc, argv, "bcCpP:qz")) != EOF) {
+    while ((c = getopt(argc, argv, "bcCpP:qz")) != -1) {
         switch (c) {
         case 'b':
             bflag = 1;
@@ -1116,7 +1116,7 @@ static int writev_f(BlockBackend *blk, int argc, char **argv)
     int pattern = 0xcd;
     QEMUIOVector qiov;

-    while ((c = getopt(argc, argv, "CqP:")) != EOF) {
+    while ((c = getopt(argc, argv, "CqP:")) != -1) {
         switch (c) {
         case 'C':
             Cflag = 1;
@@ -1228,7 +1228,7 @@ static int multiwrite_f(BlockBackend *blk, int argc, char **argv)
     int i;
     BlockRequest *reqs;

-    while ((c = getopt(argc, argv, "CqP:")) != EOF) {
+    while ((c = getopt(argc, argv, "CqP:")) != -1) {
         switch (c) {
         case 'C':
             Cflag = 1;
@@ -1463,7 +1463,7 @@ static int aio_read_f(BlockBackend *blk, int argc, char **argv)
     struct aio_ctx *ctx = g_new0(struct aio_ctx, 1);

     ctx->blk = blk;
-    while ((c = getopt(argc, argv, "CP:qv")) != EOF) {
+    while ((c = getopt(argc, argv, "CP:qv")) != -1) {
         switch (c) {
         case 'C':
             ctx->Cflag = 1;
@@ -1562,7 +1562,7 @@ static int aio_write_f(BlockBackend *blk, int argc, char **argv)
     struct aio_ctx *ctx = g_new0(struct aio_ctx, 1);

     ctx->blk = blk;
-    while ((c = getopt(argc, argv, "CqP:")) != EOF) {
+    while ((c = getopt(argc, argv, "CqP:")) != -1) {
         switch (c) {
         case 'C':
             ctx->Cflag = 1;
@@ -1779,7 +1779,7 @@ static int discard_f(BlockBackend *blk, int argc, char **argv)
     int64_t offset;
     int count;

-    while ((c = getopt(argc, argv, "Cq")) != EOF) {
+    while ((c = getopt(argc, argv, "Cq")) != -1) {
         switch (c) {
         case 'C':
             Cflag = 1;
diff --git a/qemu-io.c b/qemu-io.c
index 8e41080..ae5e274 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -120,7 +120,7 @@ static int open_f(BlockBackend *blk, int argc, char **argv)
     QemuOpts *qopts;
     QDict *opts;

-    while ((c = getopt(argc, argv, "snrgo:")) != EOF) {
+    while ((c = getopt(argc, argv, "snrgo:")) != -1) {
         switch (c) {
         case 's':
             flags |= BDRV_O_SNAPSHOT;
-- 
2.1.0


