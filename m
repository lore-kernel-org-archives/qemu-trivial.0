Received: from list by lists.gnu.org with archive (Exim 4.71)
	id 1aygW0-0007TH-QC
	for mharc-qemu-trivial@gnu.org; Fri, 06 May 2016 10:14:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>) id 1aybOs-0007r0-LU
	for qemu-trivial@nongnu.org; Fri, 06 May 2016 04:46:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>) id 1aybOf-0004ET-TM
	for qemu-trivial@nongnu.org; Fri, 06 May 2016 04:46:12 -0400
Received: from userp1040.oracle.com ([156.151.31.81]:20678)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <quentin.casasnovas@oracle.com>)
	id 1aybOf-0003yM-IJ; Fri, 06 May 2016 04:46:05 -0400
Received: from aserv0021.oracle.com (aserv0021.oracle.com [141.146.126.233])
	by userp1040.oracle.com (Sentrion-MTA-4.3.2/Sentrion-MTA-4.3.2) with
	ESMTP id u468jFCk017958
	(version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 6 May 2016 08:45:15 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
	by aserv0021.oracle.com (8.13.8/8.13.8) with ESMTP id u468jEsx023870
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK);
	Fri, 6 May 2016 08:45:14 GMT
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
	by aserv0122.oracle.com (8.13.8/8.13.8) with ESMTP id u468jCSd019756;
	Fri, 6 May 2016 08:45:13 GMT
Received: from chrystal.uk.oracle.com (/10.175.231.58)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Fri, 06 May 2016 01:45:11 -0700
From: Quentin Casasnovas <quentin.casasnovas@oracle.com>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Quentin Casasnovas <quentin.casasnovas@oracle.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-stable@nongnu.org,
	qemu-trivial@nongnu.org
Date: Fri,  6 May 2016 10:45:02 +0200
Message-Id: <1462524302-15558-1-git-send-email-quentin.casasnovas@oracle.com>
X-Mailer: git-send-email 2.8.1
X-Source-IP: aserv0021.oracle.com [141.146.126.233]
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.4.x-2.6.x [generic]
X-Received-From: 156.151.31.81
X-Mailman-Approved-At: Fri, 06 May 2016 10:13:59 -0400
Subject: [Qemu-trivial] [PATCH] nbd: fix trim/discard commands with a length
 bigger than NBD_MAX_BUFFER_SIZE
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
X-List-Received-Date: Fri, 06 May 2016 08:46:25 -0000

When running fstrim on a filesystem mounted through qemu-nbd with
--discard=on, fstrim would fail with I/O errors:

  $ fstrim /k/spl/ice/
  fstrim: /k/spl/ice/: FITRIM ioctl failed: Input/output error

and qemu-nbd was spitting these:

  nbd.c:nbd_co_receive_request():L1232: len (94621696) is larger than max len (33554432)

Enabling debug output on the NBD driver in the Linux kernel showed the
request length field sent was the one received and that qemu-nbd returned
22 (EINVAL) as error code:

  EXT4-fs (nbd0p1): mounted filesystem with ordered data mode. Opts: discard
  block nbd0: request ffff880094c0cc18: dequeued (flags=1)
  block nbd0: request ffff880094c0cc18: sending control (read@5255168,4096B)
  block nbd0: request ffff880094c0cc18: got reply
  block nbd0: request ffff880094c0cc18: got 4096 bytes data
  block nbd0: request ffff880094c0cc18: done
  block nbd0: request ffff8801728796d8: dequeued (flags=1)
  block nbd0: request ffff8801728796d8: sending control (trim/discard@39464960,45056B)
  block nbd0: request ffff8801728796d8: got reply
  block nbd0: request ffff8801728796d8: done
  block nbd0: request ffff880172879ae0: dequeued (flags=1)
  block nbd0: request ffff880172879ae0: sending control (trim/discard@39653376,16384B)
  block nbd0: request ffff880172879ae0: got reply
  block nbd0: request ffff880172879ae0: done
  block nbd0: request ffff880172879d90: dequeued (flags=1)
  block nbd0: request ffff880172879d90: sending control (trim/discard@40644608,94621696B)
                                                                               ^^^^^^^^
  block nbd0: Other side returned error (22)
                                         ^^

The length of the request seems huge but this is really just the filesystem
telling the block device driver that "this length should be trimmed", and,
unlike for a NBD_CMD_READ or NBD_CMD_WRITE, we'll not try to read/write
that amount of data from/to the NBD socket.  It is thus safe to remove the
length check for a NBD_CMD_TRIM.

I've confirmed this with both the protocol documentation at:

 https://github.com/yoe/nbd/blob/master/doc/proto.md

and looking at the kernel side implementation of the nbd device
(drivers/block/nbd.c) where it only sends the request header with no data
for a NBD_CMD_TRIM.

With this fix in, I am now able to run fstrim on my qcow2 images and keep
them small (or at least keep their size proportional to the amount of data
present on them).

Signed-off-by: Quentin Casasnovas <quentin.casasnovas@oracle.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: <qemu-devel@nongnu.org>
CC: <qemu-stable@nongnu.org>
CC: <qemu-trivial@nongnu.org>
---
 nbd.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/nbd.c b/nbd.c
index b3d9654..e733669 100644
--- a/nbd.c
+++ b/nbd.c
@@ -1209,6 +1209,11 @@ static ssize_t nbd_co_send_reply(NBDRequest *req, struct nbd_reply *reply,
     return rc;
 }
 
+static bool nbd_should_check_request_size(const struct nbd_request *request)
+{
+        return (request->type & NBD_CMD_MASK_COMMAND) != NBD_CMD_TRIM;
+}
+
 static ssize_t nbd_co_receive_request(NBDRequest *req, struct nbd_request *request)
 {
     NBDClient *client = req->client;
@@ -1227,7 +1232,8 @@ static ssize_t nbd_co_receive_request(NBDRequest *req, struct nbd_request *reque
         goto out;
     }
 
-    if (request->len > NBD_MAX_BUFFER_SIZE) {
+    if (nbd_should_check_request_size(request) &&
+        request->len > NBD_MAX_BUFFER_SIZE) {
         LOG("len (%u) is larger than max len (%u)",
             request->len, NBD_MAX_BUFFER_SIZE);
         rc = -EINVAL;
-- 
2.8.1


